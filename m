Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6761790B0F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 00:38:02 +0200 (CEST)
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hykrB-0003nn-1r
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 18:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hykqK-0003ID-6b
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 18:37:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hykqH-0003UP-G5
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 18:37:07 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43414)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hykqG-0003TC-3A
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 18:37:04 -0400
Received: by mail-oi1-x241.google.com with SMTP id y8so5903961oih.10
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 15:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zS31GvV0PFyQWcqerrYKYvtguQYc6K4quLPzhQ+dZCs=;
 b=lLaTM9Fqwy9JwvuZIBMHlTU44OOLoVFEa7Gva53hy6/Q/zFVNnMCrUEPlw1F7DT9Fo
 pMZhOApxRflQI9UDg+NM/arzfl3NQBWgeAfJJ7h3S66gs+2d8Fy/a/skyyeNlxqDh4Tw
 K1CzvxmqODCQNoO7FJJnF4E8Mxt5ush212hHiZ9m2keQBYYusw/EGkmRNmGeMcK+TqvR
 2bmtQWlFCkmhHOseRvTxDm1bMj27kFGxx96C15G7dJIv1pbs19Yly2FBtwTg5UVNjwOt
 1xNSkkY4beV6cn8GWoN3y/IHoKhPthonyWhuRYh2Jr5spwsx/h8+rvzWP44YUnwMHGXO
 j9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zS31GvV0PFyQWcqerrYKYvtguQYc6K4quLPzhQ+dZCs=;
 b=SCETWvB8bTwiRqTlZf4TWYIiqnl9N7zf2TGqLIWbts9TdnPLWTmWmvvT8xa1fPvQO3
 JeRxoDgkKQVoC4WR9Fob0u83VegE6M0/EiIIVk5Db6gaLcWqjk+ztGPBp3gI7p+BEk7X
 /6Qs6Gxx8h0Gpk3wGr7P8a/2J8R87ObLf+NibnVPYwJO6hHbRug7ONYdgWj3qLOS+SRK
 /7OrxIFOLi6rGLSBsRNa8jo0Mp0TmZWOm/vmM6RjnnZ143pNFK1AX9jh9UpvjYbepynm
 eTLrAqFqhr5DCws+BxnoFOYWLik8C4YTHsOx7866A2IHu0YIoqhVI45fpwiUoBWWljvG
 0NAQ==
X-Gm-Message-State: APjAAAVEDm4nAectpO2SqQ+ow3jrjMVOxroK3KQTGM2sFZ8PW6dHX2dT
 WvP/dPVz+SHk2/pvFnCdVHyDCESNlPEOpoAulk0=
X-Google-Smtp-Source: APXvYqzsc+/DpdRnGS3nfeTC27aBOlo68nkGFGGpxsnTzqv88LeURsdKjQk/AE6e5+juYkO4/bBZ0sClirbH9GWxKM4=
X-Received: by 2002:a54:4619:: with SMTP id p25mr823490oip.62.1565995021646;
 Fri, 16 Aug 2019 15:37:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 16 Aug 2019 15:37:00
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 16 Aug 2019 15:37:00
 -0700 (PDT)
In-Reply-To: <20190816211356.59244-1-scw@google.com>
References: <20190816211356.59244-1-scw@google.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sat, 17 Aug 2019 00:37:00 +0200
Message-ID: <CAL1e-=hMssOVfvGWsyWmUgPyG-1ovMva9W5-T+GJgoyn_29-VQ@mail.gmail.com>
To: Shu-Chun Weng <scw@google.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH] Add support for ethtool via
 TARGET_SIOCETHTOOL ioctls.
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
Cc: arunkaly@google.com, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

16.08.2019. 23.28, "Shu-Chun Weng via Qemu-devel" <qemu-devel@nongnu.org>
=D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> The ioctl numeric values are platform-independent and determined by
> the file include/uapi/linux/sockios.h in Linux kernel source code:
>
>   #define SIOCETHTOOL   0x8946
>
> These ioctls get (or set) the field ifr_data of type char* in the
> structure ifreq. Such functionality is achieved in QEMU by using
> MK_STRUCT() and MK_PTR() macros with an appropriate argument, as
> it was done for existing similar cases.
>
> Signed-off-by: Shu-Chun Weng <scw@google.com>
> ---

Shu-Chun, hi, and welcome!

Just a couple of cosmetic things:

  - by convention, the title of this patch should start with "linux-user:",
since this patch affects linux user QEMU module;

  - the patch title is too long (and has some minor mistakes) -
"linux-user: Add support for SIOCETHTOOL ioctl" should be good enough;

  - the lenght of the code lines that you add or modify must not be greater
than 80.

Sincerely,
Aleksandar

>  linux-user/ioctls.h       | 1 +
>  linux-user/syscall_defs.h | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 3281c97ca2..9d231df665 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -208,6 +208,7 @@
>    IOCTL(SIOCGIFINDEX, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_int_ifreq))=
)
>    IOCTL(SIOCSIFPFLAGS, IOC_W, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
>    IOCTL(SIOCGIFPFLAGS, IOC_W | IOC_R,
MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
> +  IOCTL(SIOCETHTOOL, IOC_R | IOC_W, MK_PTR(MK_STRUCT(STRUCT_ptr_ifreq)))
>    IOCTL(SIOCSIFLINK, 0, TYPE_NULL)
>    IOCTL_SPECIAL(SIOCGIFCONF, IOC_W | IOC_R, do_ioctl_ifconf,
>                  MK_PTR(MK_STRUCT(STRUCT_ifconf)))
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 0662270300..276f96039f 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -819,6 +819,8 @@ struct target_pollfd {
>  #define TARGET_SIOCGIFTXQLEN   0x8942          /* Get the tx queue
length      */
>  #define TARGET_SIOCSIFTXQLEN   0x8943          /* Set the tx queue
length      */
>
> +#define TARGET_SIOCETHTOOL     0x8946          /* Ethtool interface
      */
> +
>  /* ARP cache control calls. */
>  #define TARGET_OLD_SIOCDARP    0x8950          /* old delete ARP table
entry   */
>  #define TARGET_OLD_SIOCGARP    0x8951          /* old get ARP table
entry      */
> --
> 2.23.0.rc1.153.gdeed80330f-goog
>
>
