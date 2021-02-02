Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E68E30C0A0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:04:23 +0100 (CET)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wI2-0003gf-Je
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wAY-0005y6-1V
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:56:38 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wAV-0005jb-Q7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:56:37 -0500
Received: by mail-ej1-x630.google.com with SMTP id y9so8488844ejp.10
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jiFQaXFttxJSENurejXZ8WXq/HbpjklHF69X13wr1p4=;
 b=EYvNtR7MY8tR4NqH1hiV1brV0nuQUd0ZfAKilTLIFBz8ILw/AjOMUKFZ7tqXWjnzXf
 8EJ9IsQ7AHMjVRN8zJWBX/PdqN6RRkXHsodyO10tztrFzEWOMswv0waaXgfH9oeAnV/Z
 hsA/meOytyihuWa4rro3+j0lxDtIAE+NIGNGMt1TWMu+7rr0w8R69w9uTWzuGh/hBiyy
 kkSIeXaR+Kzn9Ok68o+PGAhRpRzvvwJNkro/F6QifgH1VphYYBEliOMGmDb5v8Ke/7xn
 3AbsSrhXk7tJ3ln5r4aSyO46G84eQS4jr1mPiLWz7jRRonXOwwx6w/TxGSrnXDPrXrnx
 hwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jiFQaXFttxJSENurejXZ8WXq/HbpjklHF69X13wr1p4=;
 b=WeTVv+pN824JdsOkFi2Fk3gceFtMVQSz1Ut9sDQ9eBj3o5IIGc7eH7kNizYFH+C09a
 ykLj1oSw+pp7CfH/TaX2lNiErjMzOl1aELnuAumOLPhzhHhD8DI0/YlT7PprckFZSPhL
 K4WiEJZDZn5pSMV5uLDXWdtj+A6p6j/dXi3esEHLwblR4mkPJjS22gg1ayOqc6GiKAfp
 1ndpBCMJHYgDK6ZzRrBxUXJBDVz7QgvV2F0Qz8kW6SCAqp4mSOpQsH/q3MHKiqXfKTGD
 syx0spD+xEjuVqZ77PuOBo/aE/B2YmDbK084mP50wtdT895YFReIL7VsJMZ9z4fNy0Xg
 u7PA==
X-Gm-Message-State: AOAM530QMfGZdbz73u5W60GtWVS6pgn7XylcQKXQ/g6xIGR4u0MAVeHY
 Kx2gc/ujmHYl3ld+8G+b+Me6HPfQDbzqDHzDx8X5Ug==
X-Google-Smtp-Source: ABdhPJxiPLZUk4cwTeYbok60eY3DyrEdxazpJaxqefJeKLl+/dcf4DGYf96mrZS/g8vUITmC5ulD0k4F0qH23zIcbjY=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr283098eji.407.1612274189986; 
 Tue, 02 Feb 2021 05:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20210202074644.89637-1-pbonzini@redhat.com>
In-Reply-To: <20210202074644.89637-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 13:56:18 +0000
Message-ID: <CAFEAcA87JXmZL6yBawnO9y6XT+kwFz1_D9EqC3t7XVZu8+z8Ow@mail.gmail.com>
Subject: Re: [PULL v3 00/38] Misc patches (buildsys, i386,
 fuzzing) for 2021-01-29
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Tue, 2 Feb 2021 at 07:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 74208cd252c5da9d867270a178799abd802b93=
38:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-p=
ull-request' into staging (2021-01-29 19:51:25 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to a365bda83444f142bb1b9c1b5fdcdefade87981d:
>
>   pc-bios/descriptors: fix paths in json files (2021-02-01 17:30:52 +0100=
)
>
> ----------------------------------------------------------------
> * Fuzzing improvements (Qiuhao, Alexander)
> * i386: Fix BMI decoding for instructions with the 0x66 prefix (David)
> * slirp update (Marc-Andr=C3=A9)
> * initial attempt at fixing event_notifier emulation (Maxim)
> * i386: PKS emulation, fix for "qemu-system-i386 -cpu host" (myself)
> * meson: RBD test fixes (myself)
> * meson: TCI warnings (Philippe)
> * Leaner build for --disable-guest-agent, --disable-system and
>   --disable-tools (Philippe, Stefan)
> * --enable-tcg-interpreter fix (Richard)
> * i386: SVM feature bits (Wei)
> * HVF bugfix (Alex)
> * KVM bugfix (Thomas)

Fails to build, x86-64 Linux clang.
(configure rune:
 '../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
'--extra-cflags=3D-fsanitize=3Dundefined  -fno-sanitize=3Dshift-base
-Werror')

clang  -o subprojects/libslirp/libslirp.so.0.2.3
subprojects/libslirp/libslirp.so.0.2.3.p/src_arp_table.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_bootp.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_cksum.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_dhcpv6.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_dnssearch.c.o
subprojects/libslirp/libslirp.so.0.2
.3.p/src_if.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_ip6_icmp.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_ip6_input.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_ip6_output.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_ip_icmp.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_ip_input.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_ip_output.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_mbuf.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_misc.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_ncsi.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_ndp_table.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_sbuf.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_slirp.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/
src_socket.c.o subprojects/libslirp/libslirp.so.0.2.3.p/src_state.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_stream.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_tcp_input.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_tcp_output.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_tcp_subr.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_tcp_timer.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_tftp.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_udp.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_udp6.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_util.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_version.c.o
subprojects/libslirp/libslirp.so.0.2.3.p/src_vmstate.c.o
-Wl,--as-needed -Wl,--no-undefined -shared -fPIC -Wl,--start-group
-Wl,-soname,libslirp.so.0 -Wl,--warn-common -Wl,-z,relro -Wl,-z,now
-m64 -fsanitize=3Dundefined -fno-sanitize=3Dshift-base -Werror
-fstack-protector-strong
-Wl,--version-script,/home/petmay01/linaro/qemu-for-merges/subprojects/libs=
lirp/src/libslirp.map
-pthread -lgthread-2.0 -lglib-2.0 -Wl,--end-group
subprojects/libslirp/libslirp.so.0.2.3.p/src_arp_table.c.o: In
function `arp_table_add':
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:50:
undefined reference to `__ubsan_handle_type_mismatch_v1'
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:50:
undefined reference to `__ubsan_handle_type_mismatch_v1'
[etc etc etc]
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:52:
undefined reference to `__ubsan_handle_nonnull_arg'
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:58:
undefined reference to `__ubsan_handle_type_mismatch_v1'
[etc etc etc]

and so on for lots of other libslirp files and ubsan symbols.

thanks
-- PMM

