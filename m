Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAE53C6D7F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:31:22 +0200 (CEST)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3El7-0000XP-7Q
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3EgU-0005al-2h
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:26:34 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3EgL-0005my-Je
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:26:33 -0400
Received: by mail-ed1-x530.google.com with SMTP id ec55so7415999edb.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 02:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2f7CThWkI5Pv1jgTPYnEX7EJY80FoD/ubVOSJ6sJg+Y=;
 b=q4nC6UEihGk/Tb4154obtydDUkwtJ4xXh8d9VRdpEkhaJjjtq+jvkB8PBv/0O4O835
 Og8aeb5v9Z4u9bLxkKmfpO4ZC1jqnJ83bH4kJYw07F7Pqx7mJRJobIrc+3ci5C8ilQe0
 Bad0F5nBS6rPt7gsQVqVuPNqYlxMx2C6w5z0wadYpPLdLPTvOY9BRwb05UcpqHq1Ipei
 ckzJxwVdQNzRQ1PzrAkhqsJU8LPCiHR9oFqs1iuyuRdnBh2++Pe5FSisLJGIArKJEDLO
 obZVP9yrvKDLiijxN9YsD9HHE/Ip/51gY6ZV6Vb6vzY3qp/Bf8TVYKaqWPaFNaQA3U0C
 yoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2f7CThWkI5Pv1jgTPYnEX7EJY80FoD/ubVOSJ6sJg+Y=;
 b=GNRrnzPSIpm/rE8TMgLm/TJJElbYU+EIn2aba3RcMEAf+1vlRbQQZRGCX8MUzQ9ZDP
 ixQfcXSFWK6RoWobDL82jLwdgBOpfSaGqPHxNcbn6CtrBlX9nOucLnl4jTDryz/L3qhQ
 15nqsXBxzXgBDyYSyJWp6YZw2rDe4nSXkv7mTnhqOR0tGIvZx8hJDdBfQxPALYKzN4Ry
 EBWDVT+255m49QvxEBa6FB+f5rQKk0uwIUIBy6ovukLlo34uav3aiCYeyXDb2l5f/frG
 7RKgq4dzYQ5Ine1nXcScc2hVNZuUbAYRtc6zsBHfleFQ9B2TSSRoSajajPBziBNMJIfi
 PJ8g==
X-Gm-Message-State: AOAM532bd0gjiHi8R1ET3di5vRv6fv9oCP0j7bLVbcvHjsT8koRAsMaG
 BEu48FaG3VLCplBpNT+xoJnBdlLleUOlb1gkfSqH3Q==
X-Google-Smtp-Source: ABdhPJxLS6/sVdmSddJNJwU+PXr9rp4eyhi7yKmLhBgQNZN6j4oB5PaqOc0DQX/fGoWnd6zu0nlG4h0EugzRrSY1NEg=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr4417158edt.100.1626168383875; 
 Tue, 13 Jul 2021 02:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210712130223.1825930-1-berrange@redhat.com>
In-Reply-To: <20210712130223.1825930-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 10:25:44 +0100
Message-ID: <CAFEAcA8_CaW5aPGt+PD6j5OfY7f=VztL6utk++Wg=OYcoawUqg@mail.gmail.com>
Subject: Re: [PULL 00/22] Crypto and more patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 14:23, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210=
a2:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710=
' into staging (2021-07-12 11:02:39 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/crypto-and-more-pull-request
>
> for you to fetch changes up to 1fc9958410c8683950ea22084b133a755561398b:
>
>   tests/migration: fix unix socket migration (2021-07-12 14:00:20 +0100)
>
> ----------------------------------------------------------------
> Merge crypto updates and misc fixes
>
>  * Introduce a GNUTLS backend for crypto algorithms
>  * Change crypto library preference gnutls > gcrypt > nettle > built-in
>  * Remove built-in DES impl
>  * Remove XTS mode from built-in AES impl
>  * Fix seccomp rules to allow resource info getters
>  * Fix migration performance test
>  * Use GDateTime in io/ and net/rocker/ code
>
> ----------------------------------------------------------------

Hi; this failed 'make check' on ppc64be:
MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
G_TEST_SRCDIR=3D/home/pm215/qemu/tests/unit
G_TEST_BUILDDIR=3D/home/pm215/qemu/build/all/tests/unit
tests/unit/test-crypto-cipher --tap -k
test-crypto-cipher: cbc.c:53: nettle_cbc_encrypt: Assertion `!(length
% block_size)' failed.
PASS 1 test-crypto-cipher /crypto/cipher/aes-ecb-128
PASS 2 test-crypto-cipher /crypto/cipher/aes-ecb-192
PASS 3 test-crypto-cipher /crypto/cipher/aes-ecb-256
PASS 4 test-crypto-cipher /crypto/cipher/aes-cbc-128
PASS 5 test-crypto-cipher /crypto/cipher/aes-cbc-192
PASS 6 test-crypto-cipher /crypto/cipher/aes-cbc-256
PASS 7 test-crypto-cipher /crypto/cipher/des-ecb-56-one-block
PASS 8 test-crypto-cipher /crypto/cipher/des-cbc-56-one-block
PASS 9 test-crypto-cipher /crypto/cipher/des-ecb-56
PASS 10 test-crypto-cipher /crypto/cipher/3des-cbc
PASS 11 test-crypto-cipher /crypto/cipher/3des-ecb
PASS 12 test-crypto-cipher /crypto/cipher/aes-xts-128-1
PASS 13 test-crypto-cipher /crypto/cipher/aes-xts-128-2
PASS 14 test-crypto-cipher /crypto/cipher/aes-xts-128-3
PASS 15 test-crypto-cipher /crypto/cipher/aes-xts-128-4
ERROR test-crypto-cipher - too few tests run (expected 17, got 15)

The failure is reproducible. Here's a backtrace from a debug
build:

test-crypto-cipher: cbc.c:53: nettle_cbc_encrypt: Assertion `!(length
% block_size)' failed.

Thread 1 "test-crypto-cip" received signal SIGABRT, Aborted.
0x00007ffff77b8460 in __libc_signal_restore_set (set=3D0x7fffffffe468)
at ../sysdeps/unix/sysv/linux/internal-signals.h:86
86      ../sysdeps/unix/sysv/linux/internal-signals.h: No such file or
directory.
(gdb) bt
#0  0x00007ffff77b8460 in __libc_signal_restore_set
(set=3D0x7fffffffe468) at
../sysdeps/unix/sysv/linux/internal-signals.h:86
#1  __GI_raise (sig=3D<optimized out>) at ../sysdeps/unix/sysv/linux/raise.=
c:48
#2  0x00007ffff779bd40 in __GI_abort () at abort.c:79
#3  0x00007ffff77ae490 in __assert_fail_base (fmt=3D<optimized out>,
    assertion=3Dassertion@entry=3D0x7ffff72b6f38 "!(length % block_size)",
file=3Dfile@entry=3D0x7ffff72b6f30 "cbc.c", line=3Dline@entry=3D53,
    function=3Dfunction@entry=3D0x7ffff72b6f50 "nettle_cbc_encrypt") at ass=
ert.c:92
#4  0x00007ffff77ae528 in __GI___assert_fail (assertion=3D0x7ffff72b6f38
"!(length % block_size)", file=3D0x7ffff72b6f30 "cbc.c",
    line=3D<optimized out>, function=3D0x7ffff72b6f50
"nettle_cbc_encrypt") at assert.c:101
#5  0x00007ffff728c154 in nettle_cbc_encrypt () from
/usr/lib/powerpc64-linux-gnu/libnettle.so.8
#6  0x00007ffff7e6b894 in ?? () from
/usr/lib/powerpc64-linux-gnu/libgnutls.so.30
#7  0x00007ffff7e6c72c in ?? () from
/usr/lib/powerpc64-linux-gnu/libgnutls.so.30
#8  0x00007ffff7d6d794 in gnutls_cipher_encrypt2 () from
/usr/lib/powerpc64-linux-gnu/libgnutls.so.30
#9  0x000000010003c330 in qcrypto_gnutls_cipher_encrypt
(cipher=3D0x10016e550, in=3D0x7fffffffeca8, out=3D0x7fffffffecc8, len=3D32,
    errp=3D0x100122b48 <error_abort>) at ../../crypto/cipher-gnutls.c.inc:1=
03
#10 0x000000010003cef0 in qcrypto_cipher_encrypt (cipher=3D0x10016e550,
in=3D0x7fffffffeca8, out=3D0x7fffffffecc8, len=3D32,
    errp=3D0x100122b48 <error_abort>) at ../../crypto/cipher.c:177
#11 0x000000010002e75c in test_cipher_null_iv () at
../../tests/unit/test-crypto-cipher.c:749
#12 0x00007ffff7bbed38 in ?? () from
/usr/lib/powerpc64-linux-gnu/libglib-2.0.so.0
#13 0x00007ffff7bbeabc in ?? () from
/usr/lib/powerpc64-linux-gnu/libglib-2.0.so.0
#14 0x00007ffff7bbeabc in ?? () from
/usr/lib/powerpc64-linux-gnu/libglib-2.0.so.0
#15 0x00007ffff7bbf364 in g_test_run_suite () from
/usr/lib/powerpc64-linux-gnu/libglib-2.0.so.0
#16 0x00007ffff7bbf3bc in g_test_run () from
/usr/lib/powerpc64-linux-gnu/libglib-2.0.so.0
#17 0x000000010002eb78 in main (argc=3D1, argv=3D0x7ffffffff8e8) at
../../tests/unit/test-crypto-cipher.c:821

In frame 9 len is 32 and ctx_>blocksize is 16, so =C2=AF\_(=E3=83=84)_/=C2=
=AF

thanks
-- PMM

