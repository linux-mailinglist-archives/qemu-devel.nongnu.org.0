Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18222B0683
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 14:34:01 +0100 (CET)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdCjh-0004RP-2u
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 08:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdChW-0003BL-Jw
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:31:46 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdChU-0004HM-QJ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:31:46 -0500
Received: by mail-ed1-x535.google.com with SMTP id cq7so6159387edb.4
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 05:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UkYVisUC9HtBjFyLrm5V0YFKz7aS1vTzkqbQIE0I3aQ=;
 b=D82zQPEAv6CHu0go8ELG6cF+DHqL2OxWX7hDKEEFRgRoOJyM6oKrwAIEJHxNw3QFcx
 4Z41MpdtcnQCwsL+f2u9n4M4kAeam6rLlrIZDIt+ZC3gSOww0yocoO4bDj4K/bpx9FiS
 F6/I7s4u5e4LrM4rgmZvnvJTEcqugMKimgUSTXqX54Z2VLLbh1ZstKRkBqp6ahn99/L+
 DUA7RWS/0igDHwye3teSIR9s8w+b0imaM8GvQ3VEaOX5GtgdHL0uChW+UU9B0mQqvVIx
 l5DBCJryOfYyvoh/xuZWxe3xM2eodlfaIzQRK/zkOu9XbPyJBFDaJxwW70owQ5dDRPk8
 nv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UkYVisUC9HtBjFyLrm5V0YFKz7aS1vTzkqbQIE0I3aQ=;
 b=BlS9WGS6xSvmiULjVuR4ovypDMulP20xUPjY/Ad74bfkwVRB+AR6esEN+N/J4ickND
 mHIzTOvGqSllAavmZHbJ8CPHrTtQevh2quf520OoKRiuZDF5SlVD+IXq0ocJFkU/EYYK
 l7gGxw9rIYaVzcDEWMt3C9qXbWx+2DxP06wQG7ubPA31RWyevJFqlhL1Ku0ugp7VjRbA
 D7WU/AAio8KaBFuOVf/p1OvvKHTwkT1YVn/LJ2vAT2gj0lx0b1VRmOk6tNSH7STfK1aU
 CX+pt8NxBpmJ/R49plf04AXS+48572JHzn/50GWAKWkhGbKExc/oplk/MdMLgoXrQkST
 AQYQ==
X-Gm-Message-State: AOAM533mDlhv8rzZ87URNA3BykvCjLxZguFkeB8ZdTk0L4EcTdDRn+Ya
 uTpBOdZPCkRL9nU+sX0Ziz/KndLB+NtrJ1KANVkIBw==
X-Google-Smtp-Source: ABdhPJyFY1JUN+oBxgrBifMwP3gpBXelRpWx8yZKonU2q3t9yWhkSauuANbjcMQsl9z71DRdLcdYng4qNMAgNiALFfA=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr5015643edr.44.1605187903261; 
 Thu, 12 Nov 2020 05:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20201112095620.27372-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20201112095620.27372-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 13:31:32 +0000
Message-ID: <CAFEAcA-UhO8ndUC5_KJrBnWLVMPVQkvq2GhumpxfF=pqyQPe6A@mail.gmail.com>
Subject: Re: [PULL 0/1] qemu-macppc queue 20201112
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Nov 2020 at 09:56, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit a4c141dca466ed3e9451f147efe6304b1b659ff5:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2020-11-11 19:53:15 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-macppc-20201112
>
> for you to fetch changes up to 6bfa035ec31f4f5a14499f17e08f62e8f14760cc:
>
>   macio: set user_creatable to false in macio_class_init() (2020-11-12 09:26:20 +0000)
>
> ----------------------------------------------------------------
> qemu-macppc fix for 5.2
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

