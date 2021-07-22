Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2523D242B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:02:27 +0200 (CEST)
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6YLJ-0005AG-Pz
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6YJn-0003rb-74
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:00:51 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6YJl-0008IA-2x
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:00:50 -0400
Received: by mail-ed1-x536.google.com with SMTP id l26so6680346eda.10
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 06:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=84ZQZRB6/8wlruUD7Qw8pvQA/vP9kPKSuIgDfPmp4Bs=;
 b=Iq3A4qB99MfH/emVnPteM5Pxh6Vdq6PDoVsC/SseIRpQfJHDM/Uqv55P+y8JeJ7H4s
 3as9SSBMR/yajB6T1JltfiLSP1aHp+w2lfbxmjfeGao5gOgrgc/HM5WXU7wICsBobqtb
 eF/Oz/PxXpNU2H9Sgd93zgjP4HYr94oV+4L/I61P92XjK2dMeIWnQ2HmYcpvXnlWLmNR
 cfeDXgZUlpPavnPNSs9mHVFtypLlezvP+Sh2w5ddk60Z6j4+munbjVM+WzRR8+MB0s49
 hqoWOL8XlgVGLvx1yOREsvTOKj31IC131eVcMjPMVkDHKkhdL2DORtEjRLPIFehDMrvj
 gCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=84ZQZRB6/8wlruUD7Qw8pvQA/vP9kPKSuIgDfPmp4Bs=;
 b=FJyZRRbzBNYIvkDYWf1uK7OKijh9jN8mGsjB6LdB4kopeSR7+adXM36IVy8AbPs8be
 U5bwG+SaU8xl+8lhKpw+Hdh6V3xx4VXvpyHoFKpVLrg5tM2LaX4EV+ZmTtZ91S8y10mp
 L/HHQYqdZcSZgSQoicX6bzkS2zBh+nDXuhgSjVUlFpBvhAykHZElYqivOi5NTH5ZYm1P
 etH1J0CqsrN1HCz/yBayrYzqwLIT4ya2Ov3RrE3KnLKjmiz90V/kloGKDDIuMEd6y1zE
 ynr3YJQ2M3NviKM15FNiaiImZq4fjh56SMhgRRe+P0TpfsaZ4sV6Mdx/e3+996RXk9QH
 hz1w==
X-Gm-Message-State: AOAM532rSUeFC5ZoDKoZNA81BoMiuEWLB3isvq5hqiO7ZIL3Z0+z5FIb
 lnOXfpGLAns8+30RHUkuEM7fLFWiBZbEptq0Bto4WA==
X-Google-Smtp-Source: ABdhPJx7SCEx5VTXkmrtHwCDJvjtuuDRbASYsPrUoHnd66MUa+s5NVHJN5D2B0c3xciNI8jxbjLNTEor4wQbMKF1ePM=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr53851428edt.100.1626958847542; 
 Thu, 22 Jul 2021 06:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210721194729.648763-1-eblake@redhat.com>
In-Reply-To: <20210721194729.648763-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jul 2021 14:00:06 +0100
Message-ID: <CAFEAcA8yoYRaRCjvRPH-S7MR6jF53Q3-XLKX8kOas1Pbz2SgLw@mail.gmail.com>
Subject: Re: [PULL 0/3] block bitmaps patches for rc1, 2021-07-21
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Wed, 21 Jul 2021 at 20:49, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit e77c8b8b8e933414ef07dbed04e02973fccffeb0:
>
>   Update version for v6.1.0-rc0 release (2021-07-21 17:10:15 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-bitmaps-2021-07-21
>
> for you to fetch changes up to 955171e4417bf39edb5503e694501e082a757731:
>
>   qemu-img: Add --skip-broken-bitmaps for 'convert --bitmaps' (2021-07-21 14:14:41 -0500)
>
> ----------------------------------------------------------------
> block bitmaps patches for 2021-07-21
>
> - fix 'qemu-img convert --bitmaps' handling of qcow2 files with
>   inconsistent bitmaps
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

