Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5F033A493
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 12:43:20 +0100 (CET)
Received: from localhost ([::1]:44798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLP9T-0005ZR-3J
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 07:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLP4I-0004gk-2x
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 07:37:58 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLP4G-00058E-DP
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 07:37:57 -0400
Received: by mail-ej1-x629.google.com with SMTP id mj10so61585395ejb.5
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YkWmRjJDrFv6sLqt6nlX716w+jDFdsChorsNVgXkIT8=;
 b=ufvk1KF5VBa9ltCPu1quCDk3ZV0gtLSMdv224bgnfIp0pTbOJbWwJLwGO0t9Bv0QgJ
 TUeY8QdheKsrpu485Z9SRmNzeP8463BIOvvx8nKR3SDrgwzDAgcn5wNZyiixBzLicZR2
 yVONWwDQl9mr6BL7Cnjnt7OQ7GcswGcB0ZtqVo6EC/DoeT4L6UQShrddDpyuKhro7BxH
 Ib+8+PNDBHF4vvK/B1Cmal/RU7SHHZG3MuFsy8rUqDLRi4AItDzzD4k78y8lHzH48IVz
 c+iRKjNuaPwJFoEyQTtgYdkJX2GxbmAhFROsrS+fwdX0PaDletbYkxq2/R6hnGRSomqz
 CQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YkWmRjJDrFv6sLqt6nlX716w+jDFdsChorsNVgXkIT8=;
 b=paYRSq4dygudljxxBAI7Bfv0ZkOd8/EGV9by1FplEpx/Utzwpe9Nh4VSMdSQcQVD61
 q8VIqO3ncRnuQHPw6WtMXdWb563ItsCyOY9yqCaDinJoguOp7vg+TQG92/qe9g4JXlIH
 rcS0roY4nRFPM5uFEOUSwmj6ifHctLiwaws+UiBFNP31/Gsd4J7xrTRlYZxZ0vF73ken
 +aO8CYmj527MsK4IvlGERmwykcwqCQ8glbP2dgemJZg+wb/qltuWTFqDIhcxuEHVcaLl
 W4NG+BsL8x4Kh7L7AC2NTFqRJ1hv45i/esZd6HXO5un5CYN2W15y+rTA6i/HpG4nZCGy
 dk5A==
X-Gm-Message-State: AOAM533TLgBQizPzU8cIFWU81THPD7qecP2eMmdseFHkASVsPTH9em5M
 KppKY8ewcZXJwawL7oDEpdRi7QZpbrFSKSlNC8A2NQ==
X-Google-Smtp-Source: ABdhPJxv/VGMHaUDVGkqoERIzhrhzs5+DpMdPBE/j58p2Wsg2KLPisGv1NK9xFGgzx0YxDRBzAfSrflRMhV/4BBGG+s=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr18160576ejj.4.1615721874611; 
 Sun, 14 Mar 2021 04:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Mar 2021 11:37:33 +0000
Message-ID: <CAFEAcA-fMR8yLC6Y=HSYgpSOrffCYSNnf-0sDQ2RrNWrQff6Ng@mail.gmail.com>
Subject: Re: [PULL 00/16] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 at 06:16, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit f4abdf32714d1845b7c01ec136dd2b04c2f7db47:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-docs-xen-updates-100321-2' into staging (2021-03-11 16:20:58 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 9bdb56367679e68e5e71a1c29a1087bda6414b25:
>
>   pvrdma: wean code off pvrdma_ring.h kernel header (2021-03-12 14:08:31 +0800)
>
> ----------------------------------------------------------------
>

Hi; this has a merge conflict in net/nic.c relating to
ID generation: it looks like
"net: unbreak well-form id check for "-nic" (in this pullreq)
"net: Use id_generate() in the network subsystem, too" (in master)
are both changing the way that NIC ID strings are created, and
I don't know which is supposed to be the correct way.

Please can you fix up the conflict appropriately and resend?

thanks
-- PMM

