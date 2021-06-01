Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1149A39702B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 11:18:50 +0200 (CEST)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo0Xx-0005QS-1C
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 05:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo0Qb-0007fH-Sy
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 05:11:19 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo0QY-0007LT-Am
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 05:11:13 -0400
Received: by mail-ej1-x62f.google.com with SMTP id h24so16636247ejy.2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tkwL/D7IsRUjveArI9h3wFDKZ8wu6Tirw0t/TWPJDO0=;
 b=et9DTuSIOaSMveqCLy2DBtTMYPgbyvAZXOhg0FHoGjUHCi9TGnwR3W4Hef+ZbxqVv5
 q9w3/B/Z/pe1jqoeL97GbI4H7/3N0MTLrl4aqf4w0epJ5bw3MAG6nLi67UfgGQzyerbT
 zwd79XmGPhiO6GOa4zl2sy1ojL5gUohj2Yfo8V23Ny9gGOltPXlQ+WUbJ01q7cuRGUZ2
 0QZOGwQfyZ+ugoCpJnW8N4pnOrH5xqi6bft5Huufhac0MXGQvDrcJaC6lxLPt05FvpVl
 uIuA17y7L+cwi/K0h5FuDagEZiM9i049IPjsRIYqsuYO2OMrZJGR5wqn97//by2LMosE
 aAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tkwL/D7IsRUjveArI9h3wFDKZ8wu6Tirw0t/TWPJDO0=;
 b=qUK7p8KuKL5rHzptQsBpjK0XGhxgoxKM5+h8u8xRak6JzlQtd7uN0AMhJ3ovlURoCE
 JejLLD2jilWjdYWt7pIQnkcUPNcJcKNZRS+QywXHIxlEQbODw+w2mku4AcJLrta0fDoD
 UU2Mcxngeq6xnj56KU2kCXeN4xr9DyNBKgteCiDca7b0VmqlIV2edptNbkGT6rmaUlAk
 B3aYoPpFGtKJuxGXTmSt7STQqKxCqJg4+VOCRBwZUVsax8MQeSXNP5iw8saYIiAO0Y56
 DAkt3nbfs9CLoz63dfQqRWY2R7QLceYLewHsdaUH30mq5FzbuKf5DIQ1cCrtRmHhQLmx
 VkVw==
X-Gm-Message-State: AOAM533zE4u6qz0Svt32gZ30Agpu4VWwm3XdfdX8xtEAT3tLOdZiGmRW
 OQa8b9LaN4QJJlyZfd4qXfBcTyqNVnv3GDUuzMAGVA==
X-Google-Smtp-Source: ABdhPJwFpzF4mI9vQf+FDXXqHVoy6tQQTgeMiDki3EkJ/+AjSr0N/MmpozPybv2nnpOXX7YFN/KkDtpDqiWArdfQMsA=
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr9229609ejz.382.1622538667653; 
 Tue, 01 Jun 2021 02:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210529185522.78816-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jun 2021 10:10:37 +0100
Message-ID: <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
Subject: Re: [PULL 0/2] Libslirp patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 29 May 2021 at 19:55, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 62c0ac5041e9130b041adfa13a41583d3c3ddd=
24:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210526=
' into staging (2021-05-28 16:25:21 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:elmarco/qemu.git tags/libslirp-pull-request
>
> for you to fetch changes up to b060428091c758781acc4d42849accc036d3c816:
>
>   build-sys: make libslirp a meson subproject (2021-05-29 22:52:37 +0400)
>
> ----------------------------------------------------------------
> Update libslirp & make it a subproject
>
> ----------------------------------------------------------------

All hosts, odd warnings on checkout and running configure:

warning: unable to rmdir 'slirp': Directory not empty
make: Entering directory '/home/pm/qemu/build/all'
config-host.mak is out-of-date, running configure
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
warn: ignoring non-existent submodule slirp

BSD VMs: error message just before launching the VM (though the VM did
seem to then launch OK):

Found ninja-1.8.2 at /usr/bin/ninja
ninja: no work to do.
(GIT=3D"git" "/home/peter.maydell/qemu-netbsd/scripts/git-submodule.sh"
update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/be
rkeley-softfloat-3 dtc capstone slirp)
warn: ignoring non-existent submodule slirp
/usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/tests/vm/netbsd
--debug  --jobs 8 --verbose    --image
"/home/peter.maydell/.cache/qemu
-vm/images/netbsd.img"  --snapshot --build-qemu
/home/peter.maydell/qemu-netbsd --
DEBUG:root:Creating archive
/home/peter.maydell/qemu-netbsd/build/vm-test-6kefrq76.tmp/data-f706c.tar
for src_dir dir: /home/peter.maydell/q
emu-netbsd
error: pathspec 'slirp' did not match any file(s) known to git.

clang sanitizer build: link failure:
subprojects/libslirp/libslirp.so.0.3.0.p/src_arp_table.c.o: In
function `arp_table_add':
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:51:
undefined reference to `__ubsan_handle_type_mismatch_v1'
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:51:
undefined reference to `__ubsan_handle_type_mismatch_v1'
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:51:
undefined reference to `__ubsan_handle_type_mismatch_v1'
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:34:
undefined reference to `__ubsan_handle_type_mismatch_v1'
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:34:
undefined reference to `__ubsan_handle_type_mismatch_v1'
(and lots more similar)

OSX: linker warnings linking libslirp.0.dylib:


[34/1977] Linking target subprojects/libslirp/libslirp.0.dylib
ld: warning: dylib
(/usr/local/Cellar/glib/2.68.0/lib/libgthread-2.0.dylib) was built for
newer macOS version (10.15) than being linked (10.4)
ld: warning: dylib
(/usr/local/Cellar/glib/2.68.0/lib/libglib-2.0.dylib) was built for
newer macOS version (10.15) than being linked (10.4)
ld: warning: dylib (/usr/local/opt/gettext/lib/libintl.dylib) was
built for newer macOS version (10.14) than being linked (10.4)

-- PMM

