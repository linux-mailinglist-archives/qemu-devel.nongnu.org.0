Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4444BB904
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 13:21:37 +0100 (CET)
Received: from localhost ([::1]:50570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL2GW-00043w-Gc
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 07:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL2E1-0003HP-30
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:19:01 -0500
Received: from [2607:f8b0:4864:20::b29] (port=35613
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL2Dz-00065I-5T
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:19:00 -0500
Received: by mail-yb1-xb29.google.com with SMTP id bt13so19216534ybb.2
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zMYsH26BjEm/QuhFvKKK95hdIRsmM+DiqXtzmAJnrnc=;
 b=YmAyhGQMRmfoeabTWTNRCc6Rlf38B57F1IoZl4c0QznoQ8S/G+CZf374fjtXR8BKdr
 NIh1BCkGvLMan6deTie5/p0yPJzAZiIMprLz2pqw6AC+WsKGdaXe5CN2KnxrY8m3vPz3
 BGcd8UXBG9aSGJPO3ovMLNPKU5RxB9P+sWPLXrnqiT2xUIRldxkLNKaszFE1XBurW5fM
 zbdBCrJPEU3B2OoshpwHhbfCf4/fBJoit8IiYkYrl/73RpD46f3qVdo2XfZMFYsOnzn7
 OafRCT5eV00GU3dVUqGDQ40Y/hAz6EwhUcqLfWpnk9RwCchFeoqta5x2wzOvzziDxCg3
 +pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zMYsH26BjEm/QuhFvKKK95hdIRsmM+DiqXtzmAJnrnc=;
 b=YJ/fglGUATW01JzInyhMZL2yg6Ks79P6SBth9Rt4nu5dEMQ4sFWJrzHYPBHv/7PuGg
 KyvT6gZmjZGEQXo2aZ/E7e2AtiP9VrH6DgYBFtV8isztZ9D24n+x/JzM2whYzl1i1Y0v
 xq5vmhmDfzfzt5leyu2jIK6uOWcJfQE+csnTI2pKmnqFjKqvIOmD795gvgEQrNVNvOEy
 CB2QzQ/zurO13RQaTJGe0C+aQHySw09hWxwPAVODaaC4x2L2qdJuh2Bd7HM/2tiPCKFg
 Kz8aX3sj63cvRX4r+/PCnLH1HuOFm6g2oMi3A2ezeUjJdo61wRAPvoEJQgtKzrvJGhdt
 yjUg==
X-Gm-Message-State: AOAM530OeHo4Mz9rwLciQrZcT058NfexILUnK5Yh6n7w9b1L/04SFXHz
 ExzKoh+4DXy60gNsXYzP5lVLLXG7AELCxv3hzRELZWtszo4=
X-Google-Smtp-Source: ABdhPJz2ILt1UaNU3+Iu87F73d5KdPEgeda7HmUWxAj/zLUnWKsRVuU/aLAYxIwkjgz0OU0iUQAktToSNPdzFBZdCnM=
X-Received: by 2002:a25:27c3:0:b0:623:249b:1213 with SMTP id
 n186-20020a2527c3000000b00623249b1213mr7170205ybn.39.1645186737990; Fri, 18
 Feb 2022 04:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
In-Reply-To: <20220208200856.3558249-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 12:18:47 +0000
Message-ID: <CAFEAcA9R-Szq32VSuR8gxf=PhGrkOJpO+FUrV2ErNR6gzFtKWg@mail.gmail.com>
Subject: Re: [PATCH 0/5] include: Trim some fat from osdep.h
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 20:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The osdep.h header is included by every C file we compile, so it helps
> build times to keep it small. (As the comment at the top of the file
> notes, in an ideal world this header would contain only things that
> everybody needs and things where we need to apply a compatibility
> workaround on some hosts.) This series trims more than 130 lines from
> osdep.h (about 16% of its current size) by splitting some prototypes
> that are used only in a few files out into new headers that are
> included by those source files that need them.



Applied to target-arm.next, thanks.

-- PMM

