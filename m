Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F4C662280
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEp3A-0006Hc-52; Mon, 09 Jan 2023 05:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEp2p-0006Fj-2v
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:06:22 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEp2m-0000lq-RS
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:06:18 -0500
Received: by mail-pg1-x52b.google.com with SMTP id r18so5485996pgr.12
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 02:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OMTzlQv56uXFeKfOUdmsqzHW0WOzBQUpkVFq7Yegk0o=;
 b=JPV0CKeYZmVUiShqa/hXh2rFsUray2ec4WW2mreQHRpfYzUEyxAB9QQBE3fdd54Tb0
 UDzRxsPbRkGumVD5dSNlvxe7KCELYPATLNFqWsjfq2u1nrdkjdkjPWLl9lctdLxUtc3l
 QJ5OVevfJJLCd6rZQYDCWm5NVAB7vaEuY6alP60n9BTDEm3LuGty0uyx9Oq8aYqYYt1z
 zdfC2SxzPkhzPCxIvaZ28hsmfrWLbR58FsES6w7v27S+78PIQZ8Fr4dtoqs857UDmKhT
 mAk2R2tlwX7CLSZbogxaYDU6px2El6bTnyTn1ilVvH7EDY9/8UfbLCat2LQVvQVNQ8TZ
 PCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OMTzlQv56uXFeKfOUdmsqzHW0WOzBQUpkVFq7Yegk0o=;
 b=JYhqt73nQOCVCCo2AObVSTXX/7ipa5+v1c02rUKRfhpMewfISnJgVPghgFAVBP3/HJ
 TpNdCwUCsynmv+IpLKmDMez5XKRwfHv8yP6Wly3vkxPBqoPM+Vhre+92vFLI9Zhav8X7
 fMC/EK8K9Xha5Q18r+v9pvtQNMyoUrIK600PAlBmwwfkIClBC/N+ZpEQooFic5YOy+b2
 WVNFTPCOvcUFv7coPyugtvwrgQNwQOFKK8JqS7miUDVFFeK1U6nU+DAlzjcRwIYiVJHO
 AClUSHnT14r0w4pj4pNltIQk8Qh92s0VgfjwoG0NuUp196cdpjSx8IDhVZ/3nKkp6I6s
 YsNw==
X-Gm-Message-State: AFqh2kpmzy349HnBhXo8L1yiu7LwxbWoWWHFBkLZYDnd141GJSIIJKtU
 GmHtFs8H/jrvU2G0buF760e8kZcUHLbFiEkx+mEypQ==
X-Google-Smtp-Source: AMrXdXt1uNj8h0BJp9QFFERYXcHqre19i8wVKNfb4107JBJG6IXgALQErj6lv0k64o500nTVyGIcauOy06LBEgQG85g=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr401065pgd.192.1673258773898; Mon, 09
 Jan 2023 02:06:13 -0800 (PST)
MIME-Version: 1.0
References: <20230107132153.108680-1-pbonzini@redhat.com>
In-Reply-To: <20230107132153.108680-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2023 10:06:02 +0000
Message-ID: <CAFEAcA9XR3CLQCaTAsUB3zfkbUge9csONs8OW2gFf03uaHb-Uw@mail.gmail.com>
Subject: Re: [PULL v2 00/24] QEMU patches for 2022-12-21
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 7 Jan 2023 at 13:22, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit d1852caab131ea898134fdcea8c14bc2ee75fbe9:
>
>   Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging (2023-01-05 16:59:22 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to fb418b51b7b43c34873f4b9af3da7031b7452115:
>
>   i386: SGX: remove deprecated member of SGXInfo (2023-01-06 00:51:02 +0100)
>
> ----------------------------------------------------------------
> * Atomic memslot updates for KVM (Emanuele, David)
> * Always send errors to logfile when daemonized (Greg)
> * Add support for IDE CompactFlash card (Lubomir)
> * First round of build system cleanups (myself)
> * First round of feature removals (myself)
> * Reduce "qemu/accel.h" inclusion (Philippe)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

