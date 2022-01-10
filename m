Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18B48A22C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:53:35 +0100 (CET)
Received: from localhost ([::1]:51900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n72bd-00012w-To
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:53:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n72Yw-0007vW-9r
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:50:47 -0500
Received: from [2607:f8b0:4864:20::d36] (port=46010
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n72Yr-0002uR-OK
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:50:46 -0500
Received: by mail-io1-xd36.google.com with SMTP id i14so19611677ioj.12
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JieRS3sxJqmN7lErEGVXW1DZHz7hZ15yFREAtcGIKxM=;
 b=ptpc+vDgEik0bspvPHq+2uJls0pXuSFNs22rFMwMzGrvga5s6iyerX3sbeGuLiWuJJ
 hXAkQRow1wMMVVpDyzWK9Etilu3t6nWzmTdjDUwrck0FX7DE24woQbYE4wJT34QhYp21
 VZH5ydqIb7zQ7I8fVQaelXEIRgYEQiyGx6xcFl+hvWQdVRgfll/FtwAk3X/J+zNQ7bvh
 NZgj8wv1BEFKFMrK2xcBxsaE3DBFQfB+I8dPVMpEsS8VrsUpGmjVTX6ujwFIr2sXgsFR
 3U+ZsvLmxV2sdFpBlcV0YtRT1a4ZZCg67yFuhW//kT+2fv3Ei0HEtxTE+9ktIl8ug6Kc
 WzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=JieRS3sxJqmN7lErEGVXW1DZHz7hZ15yFREAtcGIKxM=;
 b=NenDTdG4H/ydzlXuMoEVtmVSdgcvQrXawA8yBmAAD3zA4zhrrnbkcSEzEIjSwXyUCA
 d2bEQOUbul5c7HDgI2M/cbO2q6ncwkV79Npr4LndTNoxkwpIkHlHG9hAHAMfRNdW4ljK
 kB210UwoaKY3P03mNyW2oItcROFZKfgMXaSDVIJIjk25K/S8LHUxYwU7vTIiJJK7uuVH
 ZPbfYvZXvISEV0e8wRS/kzs/qeD8jA+4/M/lbP8gpoDkXGn8Ap1ByiwV1pawvv8BAmv9
 Al8/hweqj9vkjsBQT/yAJQbq9xGCRJFz76VH6YU9vBKOTz7aU71T/ruCLpYe6cJv/oNU
 erlw==
X-Gm-Message-State: AOAM530VaxqlkbU5jya85oEnnKMqy/HNd0Y4cv+WRDPY89C/izY7MQxF
 qqotBhsCKHXSGQa20hdP88bCjw==
X-Google-Smtp-Source: ABdhPJznC673aw5BPJZ4Q0yGPy+5uufr4CRw2WQr2BqTsnOkvYUl2uHbIEE/1HZPHsHM8VTfvKk1QQ==
X-Received: by 2002:a05:6638:1345:: with SMTP id
 u5mr874174jad.203.1641851438955; 
 Mon, 10 Jan 2022 13:50:38 -0800 (PST)
Received: from ?IPv6:2603:300b:6:5100:989a:e54e:5d51:ae2e?
 ([2603:300b:6:5100:989a:e54e:5d51:ae2e])
 by smtp.gmail.com with ESMTPSA id o5sm4190216iow.8.2022.01.10.13.50.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jan 2022 13:50:38 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v1 25/34] linux-user/elfload: add extra logging for hole
 finding
In-Reply-To: <20220105135009.1584676-26-alex.bennee@linaro.org>
Date: Mon, 10 Jan 2022 14:50:37 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <12A5D966-CFC4-4FD0-8848-22E4346F44F3@gmail.com>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-26-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 5, 2022, at 6:50 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>=20
> The various approaches to finding memory holes are quite complicated
> to follow especially at a distance. Improve the logging so we can see
> exactly what method found the space for the guest memory.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
> linux-user/elfload.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)

Reviewed-by: Warner Losh <imp@bsdimp.com>

I=E2=80=99ve added similar things in the past for debugging bsd-user.

> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 767f54c76d..238979b8b6 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2221,6 +2221,9 @@ static void pgb_have_guest_base(const char =
*image_name, abi_ulong guest_loaddr,
>     if (test !=3D addr) {
>         pgb_fail_in_use(image_name);
>     }
> +    qemu_log_mask(CPU_LOG_PAGE,
> +                  "%s: base @ %p for " TARGET_ABI_FMT_ld " bytes\n",
> +                  __func__, addr, guest_hiaddr - guest_loaddr);
> }
>=20
> /**
> @@ -2263,6 +2266,9 @@ static uintptr_t =
pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
>             if (mmap_start !=3D MAP_FAILED) {
>                 munmap(mmap_start, guest_size);
>                 if (mmap_start =3D=3D (void *) align_start) {
> +                    qemu_log_mask(CPU_LOG_PAGE,
> +                                  "%s: base @ %p for %" PRIdPTR" =
bytes\n",
> +                                  __func__, mmap_start + offset, =
guest_size);
>                     return (uintptr_t) mmap_start + offset;
>                 }
>             }
> @@ -2342,6 +2348,12 @@ static uintptr_t pgb_find_hole(uintptr_t =
guest_loaddr, uintptr_t guest_size,
>     }
>     free_self_maps(maps);
>=20
> +    if (ret !=3D -1) {
> +        qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %" PRIxPTR
> +                      " for %" PRIdPTR " bytes\n",
> +                      __func__, ret, guest_size);
> +    }
> +
>     return ret;
> }
>=20
> @@ -2391,6 +2403,9 @@ static void pgb_static(const char *image_name, =
abi_ulong orig_loaddr,
>     }
>=20
>     guest_base =3D addr;
> +
> +    qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %"PRIxPTR" for %" =
PRIdPTR" bytes\n",
> +                  __func__, addr, hiaddr - loaddr);
> }
>=20
> static void pgb_dynamic(const char *image_name, long align)
> @@ -2447,6 +2462,9 @@ static void pgb_reserved_va(const char =
*image_name, abi_ulong guest_loaddr,
>                      "using -R option)", reserved_va, test, =
strerror(errno));
>         exit(EXIT_FAILURE);
>     }
> +
> +    qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %p for %ld bytes\n",
> +                  __func__, addr, reserved_va);
> }
>=20
> void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
> --=20
> 2.30.2
>=20
>=20


