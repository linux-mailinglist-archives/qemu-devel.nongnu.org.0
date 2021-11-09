Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F20544B155
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:41:25 +0100 (CET)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUBX-0005U8-Mb
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:41:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUAF-0004jl-8P
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:40:03 -0500
Received: from [2607:f8b0:4864:20::12e] (port=42539
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUAD-0007Ac-K8
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:40:03 -0500
Received: by mail-il1-x12e.google.com with SMTP id s15so2230046ild.9
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=tfbZSxhLFiMcrzAFnv9p/A7aEriBar4FzQdnUa7yaS0=;
 b=re/gn8aFewnMjXxkOBEd8U0e1hID8wN/nrxMkyagn0ROCUbJn1ETkp+eU6+yJQE8Bm
 4yb4rmIY96gj3jfwauFYPOlhdx2qg29gmG+V9UbZMQyTPFZ7Tb++6RRJuF/FqivG6G/M
 snfRYS+ZxxBTjRAccEFI/xgJwbpM/MHaV/Ym5dpNMuAvv/nierugYMV8uPnmYqNABaZr
 iSpMnW/CEtYT1ZfSF9zDg8YayXZXRIvRsfmZ332c+SciVGEwRo3Z1XARPmrCGyvT/tVr
 wKVgoZVsSjqg43OsQqBrsHQ4ybdlZOZp0dET1wWIYeYoGOMAoGW5xfwAoukttAgDIsXW
 NPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=tfbZSxhLFiMcrzAFnv9p/A7aEriBar4FzQdnUa7yaS0=;
 b=FvWzqqN4DjUXtatxyvgYbQh2x2l0Kb1ztwfsLuHck31+r5Ho94ohKEPS44ZcF/wvkJ
 8Yb2K907RNZvIWBXvFyiQXqi5d7ddLRc9plWI6d9bbd/DLZkC+g57S36DqqjlROq5BIM
 NhXAIEzxoKBx6HXlCFc9zDlZ5sb3R8HbqKhQm+kRg9BfGPsfJO5Tzrny2ELFkseXN4Ia
 SVU3Fus0Kqr1y4dgiwgj82cxNGRpl1pXsMzC2g1V0fiVAkOGk2nFrd9mCxXDWy0FIM07
 kkVDVHU1NAsmy0lqHL2yy4hDHXCcK+KMRqeaELx6f21wHwE9fQZYMzYuX7xQD+XP8GFt
 uBWw==
X-Gm-Message-State: AOAM5302NnqUA3x/GcFQv16XRFQARg5Aj9fgupMR5xW0Sw5ihJVs5Au3
 zX0b8AzBylS1I+AzktgOPffbBA==
X-Google-Smtp-Source: ABdhPJwzGD+BTpVJYom4bWexZ2xlemQnpv2yBrnLMcUqvbb4bhiNgnfSOSODTIQlFbSaPHNJUagYbQ==
X-Received: by 2002:a92:4b0e:: with SMTP id m14mr6216927ilg.271.1636475999768; 
 Tue, 09 Nov 2021 08:39:59 -0800 (PST)
Received: from ?IPv6:2603:300b:6:5100:3543:ecc0:2149:6a1b?
 ([2603:300b:6:5100:3543:ecc0:2149:6a1b])
 by smtp.gmail.com with ESMTPSA id l4sm12316671ilv.46.2021.11.09.08.39.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:39:59 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH] linux-user: Replace __u64 with uint64_t
In-Reply-To: <20211108194230.1836262-1-raj.khem@gmail.com>
Date: Tue, 9 Nov 2021 09:39:57 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B9AB29E-2C18-4AC4-AC57-015B98770704@gmail.com>
References: <20211108194230.1836262-1-raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x12e.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Nov 8, 2021, at 12:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> uint64_t is available in all userspaces via compiler include stdint.h
> therefore use it instead of __u64 which is linux internal type, it =
fixes
> build on some platforms eg. aarch64 systems using musl C library
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> linux-user/host/aarch64/hostdep.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/linux-user/host/aarch64/hostdep.h =
b/linux-user/host/aarch64/hostdep.h
> index a8d41a21ad..34d934f665 100644
> --- a/linux-user/host/aarch64/hostdep.h
> +++ b/linux-user/host/aarch64/hostdep.h
> @@ -25,7 +25,7 @@ extern char safe_syscall_end[];
> static inline void rewind_if_in_safe_syscall(void *puc)
> {
>     ucontext_t *uc =3D puc;
> -    __u64 *pcreg =3D &uc->uc_mcontext.pc;
> +    uint64_t *pcreg =3D &uc->uc_mcontext.pc;
>=20
>     if (*pcreg > (uintptr_t)safe_syscall_start
>         && *pcreg < (uintptr_t)safe_syscall_end) {

Reviewed-by: Warner Losh <imp@bsdimp.com>

I wonder why we don=E2=80=99t have a typedef like bed=E2=80=99s =
register_t though=E2=80=A6


