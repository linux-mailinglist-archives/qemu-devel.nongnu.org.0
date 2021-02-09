Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA6314BDE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:40:18 +0100 (CET)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9PVI-0001w6-VD
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9PTA-0000os-E9
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:38:04 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9PT8-00079N-Um
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:38:04 -0500
Received: by mail-ed1-x535.google.com with SMTP id y8so22604113ede.6
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 01:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZnDJb/m9gi6J60lg7GclecaT++tMsr1y+Oetxhlhp+s=;
 b=vQgYet2i0E051zGXcyQD+E0zq0JnYQ4QevMkOtLlWtFf+5n1zPk5EqReCCWyHd/mHY
 9z47PH0rtx6SBJhqAOnLwuvfqnRuvKw80FkrCmDtMx+xT63ywFY9m3zaOUjD1Z4L6X8Z
 AK7fgcoPAdQXrHeL1Vu3VQDUVWC8BC/0FhYApLmkISYJAtVqNie/8tHGVpb1Jf3SZZyn
 xscXBYIIwMsLvaPvhKBys9P8ae4vFUf0wYfWKDFcHOlapsG1iHOQSU+T4+BlDMWbk4ZP
 /NT2evdxD1tbI/Y02rHLdufsv0zcQAG/YBa3urkE6ORgq/6AhJZOfeI3j8FJf+L6p1pv
 lPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZnDJb/m9gi6J60lg7GclecaT++tMsr1y+Oetxhlhp+s=;
 b=XUXM4IS8oQg1n6j5PT8uYQEVxs83aopdS+c4cOGoxMdvJvRDJvpOwluQJ3Jw+B9Ev1
 8SKNJ4rzziJ7y4vIWvuypqCRYis8ne7zfplQRpdEUX+DAzHaPPSs6HRNdG6JOxGpxY8H
 PTUTR0mHG4OQhFocBP1mK5qmGnP0nbnMsHOYgU7ySthxAJtB1g4WUnAPIfUZdEpHIi65
 Yu9QijyvV7EIXmtagGbi0YOzE5APnyMga53atynQOLb6fTfm15hwgNYMgGu1NX8y3lwk
 ilhIQ56CAdXpY+cS4xPp/xNWigac/NoHWy+Orz9xmXPUBzvlWV81RAkW0MiZWrxzcDhL
 4awg==
X-Gm-Message-State: AOAM5300Ri0WCt/d1uSntVHALMORyNgINfMhRi7YsxVmgC38XgUkqbPz
 4MbQc/Mhy+BTuRHiOSkGywD9j6Nm0SnoRY/507/mJw==
X-Google-Smtp-Source: ABdhPJyc/USkhNDGhTx59PJX2fSwbX4AfqlDR5d9KUuwwp7VznYtmut74teVOY/jgbdE8sg/yihEgNkuKyb0a0GOSo0=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr20210908ede.44.1612863481381; 
 Tue, 09 Feb 2021 01:38:01 -0800 (PST)
MIME-Version: 1.0
References: <20210208065700.19454-1-rebecca@nuviainc.com>
In-Reply-To: <20210208065700.19454-1-rebecca@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 09:37:48 +0000
Message-ID: <CAFEAcA-SskFBQwRrr49mF6CDBh4eJ8D5a5cHB-J-9h=qWZrZNw@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] target/arm: Add support for FEAT_DIT, Data
 Independent Timing
To: Rebecca Cran <rebecca@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 06:57, Rebecca Cran <rebecca@nuviainc.com> wrote:
>
> Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
> feature for ARMv8.4.
>
> Changes from v4 to v5:
>
> o Addressed review feedback.

Applied to target-arm.next, thanks.

-- PMM

