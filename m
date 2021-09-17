Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D340F482
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:08:23 +0200 (CEST)
Received: from localhost ([::1]:37928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9r4-0008Uo-Ch
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mR9p0-0006RY-6W
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:06:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mR9ot-0000XS-GE
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:06:13 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j134-20020a1c238c000000b0030b32367649so3025660wmj.3
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EWX7LtfbvUbZhOcMQaMQrtguuDZy1PSNR0PZwkGe/+8=;
 b=SwqPtWlBJodXjZekKQzy6qPvUdnS6tXV+5AFCiUoCgl+VZN9NYXxFoNir4b++8lSWo
 z+858Orzi/eKPN+cFifl2R4gqX68/dENHyAj/eLFNuOH33MxfJp2D1DmmiM4BD4cHTyU
 q4tV20EII+PxOopFRtZLeZ7MnKSrn4PkcAfhxjnAfN6NAVx+FYWkgqjuNwlYbgIDkAga
 47KJzbNVU0V5XFXwDvzJVOOzumOxhlf/d9Vfs36hYOnbruQuuLHmyeOemVt1wlLibmN2
 nQnfxWuP7IDYw+/w22uB+4kmrAx8eyEMNWik5pLHFBIrWvodRoz0q5z2l8wq8+oY3iXW
 7Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EWX7LtfbvUbZhOcMQaMQrtguuDZy1PSNR0PZwkGe/+8=;
 b=X2uq0tOMy78cWAd2kh8WUJaBPFgNEXqn1fhGMC/JTOPr3PqME9f8ZDQLiUXJGrWdYE
 qvmsHho89ouSYpxt4KKQrRjubAd6efjUCTlekpo2Wz8CiNbI2af1U8z45C+YOBeMNhQC
 vL/wvM8AyfiqBg2EOFt4FmB++MDmBy296Yo+B4Lvmna1lT1aYyPtnYwX/FmnS1MIMTy8
 CjEOVzszxR1ukNQZ+lednOd0xoKmrepxSjtSykWFymDYn/wKmR7CFtZx5B+Np+tpJMsM
 jrNMmpKRevZQYUz9QQJ6tr3nQFZmTPoR6Yck4olLzCHmutnV1ahCdZPezmhr8B18qNe0
 avxw==
X-Gm-Message-State: AOAM530b2CW6GKyGPB+PArxZAHf/ZA12WA73zfaA6eczDR3Y92YWaROU
 X8M4WZRFm9CyyaYA99fTEhimTejLRqcZOXsVK8XnTQ==
X-Google-Smtp-Source: ABdhPJzpTYLnxwdXU7fN+185/qhjp7UxrcTbc+T8lWx8wC/rGdAjWn8u4AT3EmstqHu3HvoC0Ia/tPl3nIbINTGklE0=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr9255187wmm.133.1631869565202; 
 Fri, 17 Sep 2021 02:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210916151237.1188301-1-laurent@vivier.eu>
In-Reply-To: <20210916151237.1188301-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Sep 2021 10:05:13 +0100
Message-ID: <CAFEAcA_C2JxvKOM0F9HCLciNA+THYZLP6JvRC72AJ2wBcrEqzA@mail.gmail.com>
Subject: Re: [PULL 00/10] Linux user for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 16:16, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 7d79344d4fa44e520e6e89f8fed9a27d3d554a9b:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-09-13 13:33:21 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request
>
> for you to fetch changes up to 74e43b04b0260da09d14bc56a5d629d4753b8b27:
>
>   linux-user: Check lock_user result for ip_mreq_source sockopts (2021-09-16 17:04:21 +0200)
>
> ----------------------------------------------------------------
> Pull request linux-user 20210916
>
> Code cleanup
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

