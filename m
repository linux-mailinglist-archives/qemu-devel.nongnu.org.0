Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA29144B180
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:47:00 +0100 (CET)
Received: from localhost ([::1]:37728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUGx-000172-Eg
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:46:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUDu-0006qE-05
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:43:52 -0500
Received: from [2607:f8b0:4864:20::d30] (port=44766
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUDs-0008Pz-KE
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:43:49 -0500
Received: by mail-io1-xd30.google.com with SMTP id f9so23216987ioo.11
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6OonUcZX8oIp/6aSNbAmVRQmohTd1Z0Y3KpssEhsxYE=;
 b=K9FueyUAvW3N19Q/yixaNX4Z/qHJ90tzvAii4bkjYArMi0lsTXuINhLuGy5m+JJ3xa
 /JXdlO7s0Ye5k3Jj1liwN2YJOGHgF0nGGBwY/pzB6dXVAYGYnTXGuCZI5ZBenkv1HEst
 nuqRN1spq4ISA+mlpI/p3aT/Jh7+7DU89mUkjZeBBlbpXKw/SUFWWIYqEv81ZZyOJAWU
 T3So3CkTXA8CgtPVaao+FauQzhBqSmX+M5Qyz2ENiYjGn2cA1t9zNrgbDtATn8aWlsoO
 1/JhinttGjn304kKhILnMPZu25uNgfUmOdDJT36wT+gU+d16GAuz9jr+Rw2uL+8ZC1FX
 /Q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=6OonUcZX8oIp/6aSNbAmVRQmohTd1Z0Y3KpssEhsxYE=;
 b=heuTZaBeKJzrMctaZpizbxtu1/k9g5t22bURmWtcF8QdAeTileAwTzfpy2ZGT587uN
 ggzhVd0P5hJwDij0zOLNaGNRPtjPNCMSBEe8yGp69kZbMYOqA4gLIPK3JRptULvVTrxK
 79ZdekKrXv+mgxbsWOep71U8bz65vaqErW3ofjStNZyhy6ioMNvWAz8TKe5e3e5hlXov
 5r3i+tZsx/W4VRIIKb+3mx1xXUqB9mYJDBS/TbYy7NEApIdiX4Yr13ww1bE23ro+STrA
 v/9smbl+7t0ku/DffmMjnl3Qbil1mbez345sEN/GfKkNvGmgHwJY3aeiR5ZAsONs/vic
 l+7g==
X-Gm-Message-State: AOAM531Pwau1y3Ym8eUx63TqGh5cdWq4lFAc6O3E/+XSB1i3cATFH5Fl
 /FGzW6xCypy3R1utM2qRCOvbK5amN62kGg==
X-Google-Smtp-Source: ABdhPJwmFFM+r4LevtLYmvvSGpxxR6uy4aCGIKDma7cjmE8GYNiEDGlTafc7nvyoUP2W5zklpcy16g==
X-Received: by 2002:a05:6638:144f:: with SMTP id
 l15mr6688557jad.21.1636476227391; 
 Tue, 09 Nov 2021 08:43:47 -0800 (PST)
Received: from ?IPv6:2603:300b:6:5100:3543:ecc0:2149:6a1b?
 ([2603:300b:6:5100:3543:ecc0:2149:6a1b])
 by smtp.gmail.com with ESMTPSA id i16sm10197369ioh.54.2021.11.09.08.43.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:43:46 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 2/4] linux-user: Always use flexible arrays for dirent
 d_name
In-Reply-To: <20211107124845.1174791-3-richard.henderson@linaro.org>
Date: Tue, 9 Nov 2021 09:43:46 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <B7032FBE-11E2-41F2-B4B0-3E3DDC22D82D@gmail.com>
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
 <20211107124845.1174791-3-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Nov 7, 2021, at 5:48 AM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> We currently use a flexible array member for target_dirent,
> but use incorrectly fixed length arrays for target_dirent64,
> linux_dirent and linux_dirent64.
>=20
> This requires that we adjust the definition of the VFAT READDIR
> ioctls which hard-code the 256 namelen size into the ioctl constant.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> linux-user/syscall_defs.h | 6 +++---
> linux-user/syscall.c      | 6 ++++--
> 2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index a5ce487dcc..98b09ee6d6 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -441,7 +441,7 @@ struct target_dirent64 {
> 	int64_t		d_off;
> 	unsigned short	d_reclen;
> 	unsigned char	d_type;
> -	char		d_name[256];
> +	char		d_name[];
> };
>=20
>=20
> @@ -2714,7 +2714,7 @@ struct linux_dirent {
>     long            d_ino;
>     unsigned long   d_off;
>     unsigned short  d_reclen;
> -    char            d_name[256]; /* We must not include limits.h! */
> +    char            d_name[];
> };
>=20
> struct linux_dirent64 {
> @@ -2722,7 +2722,7 @@ struct linux_dirent64 {
>     int64_t         d_off;
>     unsigned short  d_reclen;
>     unsigned char   d_type;
> -    char            d_name[256];
> +    char            d_name[];
> };
>=20
> struct target_mq_attr {
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a2f605dec4..499415ad81 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -197,8 +197,10 @@
> //#define DEBUG_ERESTARTSYS
>=20
> //#include <linux/msdos_fs.h>
> -#define	VFAT_IOCTL_READDIR_BOTH		_IOR('r', 1, struct =
linux_dirent [2])
> -#define	VFAT_IOCTL_READDIR_SHORT	_IOR('r', 2, struct =
linux_dirent [2])
> +#define VFAT_IOCTL_READDIR_BOTH \
> +    _IOC(_IOC_READ, 'r', 1, (sizeof(struct linux_dirent) + 256) * 2)
> +#define VFAT_IOCTL_READDIR_SHORT \
> +    _IOC(_IOC_READ, 'r', 2, (sizeof(struct linux_dirent) + 256) * 2)
>=20
> #undef _syscall0
> #undef _syscall1
> --=20
> 2.25.1
>=20
>=20


