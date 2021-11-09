Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9946444B188
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:48:51 +0100 (CET)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUIj-0005pe-Ov
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:48:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUFg-0000ca-M1
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:45:40 -0500
Received: from [2607:f8b0:4864:20::d35] (port=36517
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUFe-0000b0-5q
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:45:40 -0500
Received: by mail-io1-xd35.google.com with SMTP id e144so23768864iof.3
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=Ccxc2AUWEzt+4g7jjXwswaOnKt5PGOmRGnjJoVf91HY=;
 b=DxIPDSeX9YP1aAnhWZ21Q4fgZdA6DYOrVtoOLI8bXvcX8tXpVGo4dP7EybwH9xyK8s
 1nHgb/E4M8A/7Gea4lEnqTYxIIOeaCLdJdiR+rHJ04qmUfRwmydPFqCvqCozTgMLGnHe
 lQDME/ZnZ40KwycAQD4nezMgVMho8Xxf7R2lxbyoVQJaVMZNTzqMOfNaQuTp8xcXCamg
 DFzbwHvmkppYjiaraeUkb904f8cltZifW6jcdM38Azq9VCQi2lFO5bBdLaWPWyvWfCtg
 d6ER5hv83EwzZGe1Cw53MM6kW+EVNclNF3w8WIFyJaeM4a8QcuQOfm5Z/4bP07JwIL92
 fmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=Ccxc2AUWEzt+4g7jjXwswaOnKt5PGOmRGnjJoVf91HY=;
 b=Ml886T5bBATb7DgzHYmv+Erg4IPmRA32QTcG/qQeURP0vF8LSd1ocyjIFAPYZckVZo
 M/+BmHb3pBrt8judb8KmYJljIXy/1kaQ3kkphBWYXX+Sf13a0OtmXEQbCK1Kkr0qIn64
 nl2+UL7nLlFfhG4xq9P2M1s1tvTHURbJ48puzjb7qOBFmXIcyd7XcgynZ+PpxUe30EU9
 f1KnF5qfDP/OMJPsMhR4xNJfr1TcyC3jimWt3ntYOc2/iCYLtKsVzVh/TjxzuYFKl/qH
 ZmO++CXrcTcAhLdVSf2pJuOprP0Xncu+qLCOO5C1bM8YsbgVqK/RN+e2MJEeT1dHrT5l
 EXdg==
X-Gm-Message-State: AOAM531aghvrvgX9/KXo79goChHABW8T/ElBYE8aIhTXoZ6pCfff3ADD
 gdPiqUzG4HZOLJCjAah8hgzo3Q==
X-Google-Smtp-Source: ABdhPJwbq6R2nDQ1IrVyzUYB8SAtRGoDtrOsFZ779Vz6XZuwmP9CgDi/pikFeM/d7c0t6faumyx/mQ==
X-Received: by 2002:a02:ba90:: with SMTP id g16mr6772384jao.85.1636476336141; 
 Tue, 09 Nov 2021 08:45:36 -0800 (PST)
Received: from ?IPv6:2603:300b:6:5100:3543:ecc0:2149:6a1b?
 ([2603:300b:6:5100:3543:ecc0:2149:6a1b])
 by smtp.gmail.com with ESMTPSA id i16sm10197369ioh.54.2021.11.09.08.45.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:45:35 -0800 (PST)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <97850228-68AF-484B-8BC9-D3BF0B946277@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_8F606EB1-68F3-428C-858D-A9C8E4C0899C";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 1/4] linux-user: Split out do_getdents, do_getdents64
Date: Tue, 9 Nov 2021 09:45:34 -0700
In-Reply-To: <20211107124845.1174791-2-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
 <20211107124845.1174791-2-richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd35.google.com
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


--Apple-Mail=_8F606EB1-68F3-428C-858D-A9C8E4C0899C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On Nov 7, 2021, at 5:48 AM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> Retain all 3 implementations of getdents for now.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> linux-user/syscall.c | 325 +++++++++++++++++++++++--------------------
> 1 file changed, 172 insertions(+), 153 deletions(-)

Reviewed by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 544f5b662f..a2f605dec4 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8137,6 +8137,176 @@ static int host_to_target_cpu_mask(const =
unsigned long *host_mask,
>     return 0;
> }
>=20
> +#ifdef TARGET_NR_getdents
> +static int do_getdents(abi_long arg1, abi_long arg2, abi_long arg3)
> +{
> +    int ret;
> +
> +#ifdef EMULATE_GETDENTS_WITH_GETDENTS
> +# if TARGET_ABI_BITS =3D=3D 32 && HOST_LONG_BITS =3D=3D 64
> +    struct target_dirent *target_dirp;
> +    struct linux_dirent *dirp;
> +    abi_long count =3D arg3;
> +
> +    dirp =3D g_try_malloc(count);
> +    if (!dirp) {
> +        return -TARGET_ENOMEM;
> +    }
> +
> +    ret =3D get_errno(sys_getdents(arg1, dirp, count));
> +    if (!is_error(ret)) {
> +        struct linux_dirent *de;
> +        struct target_dirent *tde;
> +        int len =3D ret;
> +        int reclen, treclen;
> +        int count1, tnamelen;
> +
> +        count1 =3D 0;
> +        de =3D dirp;
> +        target_dirp =3D lock_user(VERIFY_WRITE, arg2, count, 0);
> +        if (!target_dirp) {
> +            return -TARGET_EFAULT;
> +        }
> +        tde =3D target_dirp;
> +        while (len > 0) {
> +            reclen =3D de->d_reclen;
> +            tnamelen =3D reclen - offsetof(struct linux_dirent, =
d_name);
> +            assert(tnamelen >=3D 0);
> +            treclen =3D tnamelen + offsetof(struct target_dirent, =
d_name);
> +            assert(count1 + treclen <=3D count);
> +            tde->d_reclen =3D tswap16(treclen);
> +            tde->d_ino =3D tswapal(de->d_ino);
> +            tde->d_off =3D tswapal(de->d_off);
> +            memcpy(tde->d_name, de->d_name, tnamelen);
> +            de =3D (struct linux_dirent *)((char *)de + reclen);
> +            len -=3D reclen;
> +            tde =3D (struct target_dirent *)((char *)tde + treclen);
> +            count1 +=3D treclen;
> +        }
> +        ret =3D count1;
> +        unlock_user(target_dirp, arg2, ret);
> +    }
> +    g_free(dirp);
> +# else
> +    struct linux_dirent *dirp;
> +    abi_long count =3D arg3;
> +
> +    dirp =3D lock_user(VERIFY_WRITE, arg2, count, 0);
> +    if (!dirp) {
> +        return -TARGET_EFAULT;
> +    }
> +    ret =3D get_errno(sys_getdents(arg1, dirp, count));
> +    if (!is_error(ret)) {
> +        struct linux_dirent *de;
> +        int len =3D ret;
> +        int reclen;
> +        de =3D dirp;
> +        while (len > 0) {
> +            reclen =3D de->d_reclen;
> +            if (reclen > len) {
> +                break;
> +            }
> +            de->d_reclen =3D tswap16(reclen);
> +            tswapls(&de->d_ino);
> +            tswapls(&de->d_off);
> +            de =3D (struct linux_dirent *)((char *)de + reclen);
> +            len -=3D reclen;
> +        }
> +    }
> +    unlock_user(dirp, arg2, ret);
> +# endif
> +#else
> +    /* Implement getdents in terms of getdents64 */
> +    struct linux_dirent64 *dirp;
> +    abi_long count =3D arg3;
> +
> +    dirp =3D lock_user(VERIFY_WRITE, arg2, count, 0);
> +    if (!dirp) {
> +        return -TARGET_EFAULT;
> +    }
> +    ret =3D get_errno(sys_getdents64(arg1, dirp, count));
> +    if (!is_error(ret)) {
> +        /*
> +         * Convert the dirent64 structs to target dirent.  We do this
> +         * in-place, since we can guarantee that a target_dirent is =
no
> +         * larger than a dirent64; however this means we have to be
> +         * careful to read everything before writing in the new =
format.
> +         */
> +        struct linux_dirent64 *de;
> +        struct target_dirent *tde;
> +        int len =3D ret;
> +        int tlen =3D 0;
> +
> +        de =3D dirp;
> +        tde =3D (struct target_dirent *)dirp;
> +        while (len > 0) {
> +            int namelen, treclen;
> +            int reclen =3D de->d_reclen;
> +            uint64_t ino =3D de->d_ino;
> +            int64_t off =3D de->d_off;
> +            uint8_t type =3D de->d_type;
> +
> +            namelen =3D strlen(de->d_name);
> +            treclen =3D offsetof(struct target_dirent, d_name) + =
namelen + 2;
> +            treclen =3D QEMU_ALIGN_UP(treclen, sizeof(abi_long));
> +
> +            memmove(tde->d_name, de->d_name, namelen + 1);
> +            tde->d_ino =3D tswapal(ino);
> +            tde->d_off =3D tswapal(off);
> +            tde->d_reclen =3D tswap16(treclen);
> +            /*
> +             * The target_dirent type is in what was formerly a =
padding
> +             * byte at the end of the structure:
> +             */
> +            *(((char *)tde) + treclen - 1) =3D type;
> +
> +            de =3D (struct linux_dirent64 *)((char *)de + reclen);
> +            tde =3D (struct target_dirent *)((char *)tde + treclen);
> +            len -=3D reclen;
> +            tlen +=3D treclen;
> +        }
> +        ret =3D tlen;
> +    }
> +    unlock_user(dirp, arg2, ret);
> +#endif
> +    return ret;
> +}
> +#endif /* TARGET_NR_getdents */
> +
> +#if defined(TARGET_NR_getdents64) && defined(__NR_getdents64)
> +static int do_getdents64(abi_long arg1, abi_long arg2, abi_long arg3)
> +{
> +    struct linux_dirent64 *dirp;
> +    abi_long count =3D arg3;
> +    int ret;
> +
> +    dirp =3D lock_user(VERIFY_WRITE, arg2, count, 0);
> +    if (!dirp) {
> +        return -TARGET_EFAULT;
> +    }
> +    ret =3D get_errno(sys_getdents64(arg1, dirp, count));
> +    if (!is_error(ret)) {
> +        struct linux_dirent64 *de;
> +        int len =3D ret;
> +        int reclen;
> +        de =3D dirp;
> +        while (len > 0) {
> +            reclen =3D de->d_reclen;
> +            if (reclen > len) {
> +                break;
> +            }
> +            de->d_reclen =3D tswap16(reclen);
> +            tswap64s((uint64_t *)&de->d_ino);
> +            tswap64s((uint64_t *)&de->d_off);
> +            de =3D (struct linux_dirent64 *)((char *)de + reclen);
> +            len -=3D reclen;
> +        }
> +    }
> +    unlock_user(dirp, arg2, ret);
> +    return ret;
> +}
> +#endif /* TARGET_NR_getdents64 */
> +
> #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
> _syscall2(int, pivot_root, const char *, new_root, const char *, =
put_old)
> #endif
> @@ -10227,162 +10397,11 @@ static abi_long do_syscall1(void *cpu_env, =
int num, abi_long arg1,
> #endif
> #ifdef TARGET_NR_getdents
>     case TARGET_NR_getdents:
> -#ifdef EMULATE_GETDENTS_WITH_GETDENTS
> -#if TARGET_ABI_BITS =3D=3D 32 && HOST_LONG_BITS =3D=3D 64
> -        {
> -            struct target_dirent *target_dirp;
> -            struct linux_dirent *dirp;
> -            abi_long count =3D arg3;
> -
> -            dirp =3D g_try_malloc(count);
> -            if (!dirp) {
> -                return -TARGET_ENOMEM;
> -            }
> -
> -            ret =3D get_errno(sys_getdents(arg1, dirp, count));
> -            if (!is_error(ret)) {
> -                struct linux_dirent *de;
> -		struct target_dirent *tde;
> -                int len =3D ret;
> -                int reclen, treclen;
> -		int count1, tnamelen;
> -
> -		count1 =3D 0;
> -                de =3D dirp;
> -                if (!(target_dirp =3D lock_user(VERIFY_WRITE, arg2, =
count, 0)))
> -                    return -TARGET_EFAULT;
> -		tde =3D target_dirp;
> -                while (len > 0) {
> -                    reclen =3D de->d_reclen;
> -                    tnamelen =3D reclen - offsetof(struct =
linux_dirent, d_name);
> -                    assert(tnamelen >=3D 0);
> -                    treclen =3D tnamelen + offsetof(struct =
target_dirent, d_name);
> -                    assert(count1 + treclen <=3D count);
> -                    tde->d_reclen =3D tswap16(treclen);
> -                    tde->d_ino =3D tswapal(de->d_ino);
> -                    tde->d_off =3D tswapal(de->d_off);
> -                    memcpy(tde->d_name, de->d_name, tnamelen);
> -                    de =3D (struct linux_dirent *)((char *)de + =
reclen);
> -                    len -=3D reclen;
> -                    tde =3D (struct target_dirent *)((char *)tde + =
treclen);
> -		    count1 +=3D treclen;
> -                }
> -		ret =3D count1;
> -                unlock_user(target_dirp, arg2, ret);
> -            }
> -            g_free(dirp);
> -        }
> -#else
> -        {
> -            struct linux_dirent *dirp;
> -            abi_long count =3D arg3;
> -
> -            if (!(dirp =3D lock_user(VERIFY_WRITE, arg2, count, 0)))
> -                return -TARGET_EFAULT;
> -            ret =3D get_errno(sys_getdents(arg1, dirp, count));
> -            if (!is_error(ret)) {
> -                struct linux_dirent *de;
> -                int len =3D ret;
> -                int reclen;
> -                de =3D dirp;
> -                while (len > 0) {
> -                    reclen =3D de->d_reclen;
> -                    if (reclen > len)
> -                        break;
> -                    de->d_reclen =3D tswap16(reclen);
> -                    tswapls(&de->d_ino);
> -                    tswapls(&de->d_off);
> -                    de =3D (struct linux_dirent *)((char *)de + =
reclen);
> -                    len -=3D reclen;
> -                }
> -            }
> -            unlock_user(dirp, arg2, ret);
> -        }
> -#endif
> -#else
> -        /* Implement getdents in terms of getdents64 */
> -        {
> -            struct linux_dirent64 *dirp;
> -            abi_long count =3D arg3;
> -
> -            dirp =3D lock_user(VERIFY_WRITE, arg2, count, 0);
> -            if (!dirp) {
> -                return -TARGET_EFAULT;
> -            }
> -            ret =3D get_errno(sys_getdents64(arg1, dirp, count));
> -            if (!is_error(ret)) {
> -                /* Convert the dirent64 structs to target dirent.  We =
do this
> -                 * in-place, since we can guarantee that a =
target_dirent is no
> -                 * larger than a dirent64; however this means we have =
to be
> -                 * careful to read everything before writing in the =
new format.
> -                 */
> -                struct linux_dirent64 *de;
> -                struct target_dirent *tde;
> -                int len =3D ret;
> -                int tlen =3D 0;
> -
> -                de =3D dirp;
> -                tde =3D (struct target_dirent *)dirp;
> -                while (len > 0) {
> -                    int namelen, treclen;
> -                    int reclen =3D de->d_reclen;
> -                    uint64_t ino =3D de->d_ino;
> -                    int64_t off =3D de->d_off;
> -                    uint8_t type =3D de->d_type;
> -
> -                    namelen =3D strlen(de->d_name);
> -                    treclen =3D offsetof(struct target_dirent, =
d_name)
> -                        + namelen + 2;
> -                    treclen =3D QEMU_ALIGN_UP(treclen, =
sizeof(abi_long));
> -
> -                    memmove(tde->d_name, de->d_name, namelen + 1);
> -                    tde->d_ino =3D tswapal(ino);
> -                    tde->d_off =3D tswapal(off);
> -                    tde->d_reclen =3D tswap16(treclen);
> -                    /* The target_dirent type is in what was formerly =
a padding
> -                     * byte at the end of the structure:
> -                     */
> -                    *(((char *)tde) + treclen - 1) =3D type;
> -
> -                    de =3D (struct linux_dirent64 *)((char *)de + =
reclen);
> -                    tde =3D (struct target_dirent *)((char *)tde + =
treclen);
> -                    len -=3D reclen;
> -                    tlen +=3D treclen;
> -                }
> -                ret =3D tlen;
> -            }
> -            unlock_user(dirp, arg2, ret);
> -        }
> -#endif
> -        return ret;
> +        return do_getdents(arg1, arg2, arg3);
> #endif /* TARGET_NR_getdents */
> #if defined(TARGET_NR_getdents64) && defined(__NR_getdents64)
>     case TARGET_NR_getdents64:
> -        {
> -            struct linux_dirent64 *dirp;
> -            abi_long count =3D arg3;
> -            if (!(dirp =3D lock_user(VERIFY_WRITE, arg2, count, 0)))
> -                return -TARGET_EFAULT;
> -            ret =3D get_errno(sys_getdents64(arg1, dirp, count));
> -            if (!is_error(ret)) {
> -                struct linux_dirent64 *de;
> -                int len =3D ret;
> -                int reclen;
> -                de =3D dirp;
> -                while (len > 0) {
> -                    reclen =3D de->d_reclen;
> -                    if (reclen > len)
> -                        break;
> -                    de->d_reclen =3D tswap16(reclen);
> -                    tswap64s((uint64_t *)&de->d_ino);
> -                    tswap64s((uint64_t *)&de->d_off);
> -                    de =3D (struct linux_dirent64 *)((char *)de + =
reclen);
> -                    len -=3D reclen;
> -                }
> -            }
> -            unlock_user(dirp, arg2, ret);
> -        }
> -        return ret;
> +        return do_getdents64(arg1, arg2, arg3);
> #endif /* TARGET_NR_getdents64 */
> #if defined(TARGET_NR__newselect)
>     case TARGET_NR__newselect:
> --
> 2.25.1
>=20
>=20


--Apple-Mail=_8F606EB1-68F3-428C-858D-A9C8E4C0899C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmGKpa4ACgkQbBzRKH2w
EQBLxA//el5yw0CIZuPy3yCBdxvwiAAIunR7ZIFU7FGNCSp7MlXDO+hawqUxM5Kt
vlbBmPUpUJLQRrSmfDPjYWHTU4CyhcuHnoR/vGeBSaMwGj0W2YBc9pDMMZKRUu3C
W7fbEor/iRHUcm1ojHZfC2OAOZRlpiKtJVr2kjcQKCt6b8sM6HTU6jOw+v6JlUnS
JtZznvDjuOhzCfUcHKHqVG1tXRI7UzY0coyjSkfWfRtMNVGvqgv070AUBXg2cJsr
SjAgV9ecpIIZlsEABzFIZtuQ9icEHDIz22ldXmYf0TBwJgkLJOCurH/muLXrVrMJ
lh6r9Po7xkMZQsNzdX6ga6Q4iPyNbqF76gBRpFzWm0Q4zXZ/AMvwBxfutnX7HkdS
LVdyf1AlgkksUojvejNhI80GGiwT6M81eBndZAZ57PHbINBQ4cboJNS2Anu8z5+F
UImVpTOBszP69WDhntcVdxS1K8ux/n8KlZ8TKQbcAzad+OFowHzg96Fj5BpLKA1n
UH3SggzcRGwu70EBHUdVQX7s4n/1Pt6/PK1ya8rJ17aUDVbnbXG8GDXFTeuth4wF
/HVFf82kw+NCImoddmO9OsJV9POLs6co4lUE/UkEOtQof1lNJzojxv/MUbP6Ir5t
OsGAyEFk4IvNVzAkUxXpOmwYNDvIhP3M/QMAUr7rgzfgOcYkCEg=
=K4A3
-----END PGP SIGNATURE-----

--Apple-Mail=_8F606EB1-68F3-428C-858D-A9C8E4C0899C--

