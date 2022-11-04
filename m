Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552D9619A4C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 15:41:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqxrG-0003xq-8K; Fri, 04 Nov 2022 10:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqxrE-0003xT-CP; Fri, 04 Nov 2022 10:39:44 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqxrC-0003k6-5n; Fri, 04 Nov 2022 10:39:44 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-36cbcda2157so45044347b3.11; 
 Fri, 04 Nov 2022 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/BHVOj8xAoG7l9QBbuTtX2+IW6S1ePSCEuZKYXcStU=;
 b=PrkF7zjeA0YwmHUrXyOQle7YDncoGEWyp+OMhCd+F4GO7+nXtrv8Yn9A1M3a5vuhxY
 J38dZenVTOn4prm6PpJskkkcK8GpQqz9AGUh819X+ZOSQksJgEzl9yRBxOUpvFYca3AA
 JPRrzsrLOYVaFwsn5Tubej5rDmtHFyA/tVQqt8+9MaPAy3EXmGFegdWxc6wI+6JYMusH
 +vQxFGmeiuAPqc7ZSUl5GQcpdcLShgIxmfSd8Wh711f9xO6Axcpx1SgOvB9g3Oi3heYy
 gmHBkA7LZm0cQ4+PWEAY5ZH4TI6ZTpz5K7Hw7ceCzSvCLMS15eRuiukY4hkzzlmRdRf8
 ul5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/BHVOj8xAoG7l9QBbuTtX2+IW6S1ePSCEuZKYXcStU=;
 b=NLi0j389A7tFzq5IdBKGY8uD82VzIBzddlsVKYZlOI+kL4lHTA9R5ToQOL0JwnpuMW
 0T7Y7Qyc+fJ33uyAsRcPnReSjG2LOQObljvsf8abu0DfZz4bx/h7msnlGhl1Y80g4mg4
 CZK5vsn1qh+V3Cy4rODT0gj0VUVEFXh8NwnbWCBv0CTf6gtgJEtCnTNgQuyzpZjvzCFG
 C9IOIbsOZswUzX3D+NLtiFLYUK6LrOvmiKkXgLzy5Wi65Y7ZhRwZvHImETqK3cnEfHA1
 PsoAspfR1/nHZCQJQtxKWOx+u/Wep6jwAg366hz1ZhTiwQ7dBcCl7K3I4DmmkZKO/JHq
 45sg==
X-Gm-Message-State: ACrzQf2TdECbGKZhPcm7fNPQ0hLrBlzlgRy10O2VlwmWqnI1+8/xW9u2
 iF27ylrmP/mjTRwWotygzdqqKgrB3arhQ0HJkZI=
X-Google-Smtp-Source: AMsMyM6r+2FqQhNintFYwF9bXMWF6gjNl4DO2jVne7laAYBhGbuC++687BF+n2rkPAX1RCCIQqqfHphOHbIWe3H/SoI=
X-Received: by 2002:a81:8445:0:b0:36c:c302:8926 with SMTP id
 u66-20020a818445000000b0036cc3028926mr35527313ywf.296.1667572780133; Fri, 04
 Nov 2022 07:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221103161727.4116147-1-laurent@vivier.eu>
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 4 Nov 2022 10:39:28 -0400
Message-ID: <CAJSP0QUG8_sx5Jct1XjGX8_kdYGpJ6akQnnyZbZ8ODNZsfemAQ@mail.gmail.com>
Subject: Re: [PULL 00/10] Trivial branch for 7.2 patches
To: Laurent Vivier <laurent@vivier.eu>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan and Laurent,
Please take a look at this CI failure, I think it's triggered by this
pull request:

arm-linux-gnueabi-gcc -Isubprojects/libvhost-user/libvhost-user.a.p
-Isubprojects/libvhost-user -I../subprojects/libvhost-user
-fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g
-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_FILE_OFFSET_BITS=3D64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-pthread -D_GNU_SOURCE -MD -MQ
subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -MF
subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o.d -o
subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -c
../subprojects/libvhost-user/libvhost-user.c
../subprojects/libvhost-user/libvhost-user.c: In function =E2=80=98generate=
_faults=E2=80=99:
../subprojects/libvhost-user/libvhost-user.c:664:27: error: format
=E2=80=98%zx=E2=80=99 expects argument of type =E2=80=98size_t=E2=80=99, bu=
t argument 6 has type
=E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99} [=
-Werror=3Dformat=3D]
664 | vu_panic(dev, "%s: Failed to userfault region %d "
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
......
668 | dev_region->size, dev_region->mmap_offset,
| ~~~~~~~~~~~~~~~~
| |
| uint64_t {aka long long unsigned int}
../subprojects/libvhost-user/libvhost-user.c:665:50: note: format
string is defined here
665 | "@%" PRIx64 " + size:%zx offset: %zx: (ufd=3D%d)%s\n",
| ~~^
| |
| unsigned int
| %llx
../subprojects/libvhost-user/libvhost-user.c:664:27: error: format
=E2=80=98%zx=E2=80=99 expects argument of type =E2=80=98size_t=E2=80=99, bu=
t argument 7 has type
=E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99} [=
-Werror=3Dformat=3D]
664 | vu_panic(dev, "%s: Failed to userfault region %d "
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
......
668 | dev_region->size, dev_region->mmap_offset,
| ~~~~~~~~~~~~~~~~~~~~~~~
| |
| uint64_t {aka long long unsigned int}
../subprojects/libvhost-user/libvhost-user.c:665:62: note: format
string is defined here
665 | "@%" PRIx64 " + size:%zx offset: %zx: (ufd=3D%d)%s\n",
| ~~^
| |
| unsigned int
| %llx
cc1: all warnings being treated as errors

https://gitlab.com/qemu-project/qemu/-/jobs/3275327714

On Thu, 3 Nov 2022 at 12:20, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit a11f65ec1b8adcb012b89c92819cbda4dc25aa=
f1:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into=
 staging (2022-11-01 13:49:33 -0400)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.2-=
pull-request
>
> for you to fetch changes up to 489db95896b86dacdde9dab1de84745880449e37:
>
>   tests/unit: simpler variable sequence for test-io-channel (2022-11-03 1=
7:16:34 +0100)
>
> ----------------------------------------------------------------
> Pull request trivial branch 20221103
>
> ----------------------------------------------------------------
>
> Alex Benn=C3=A9e (1):
>   tests/unit: simpler variable sequence for test-io-channel
>
> Chuck Zmudzinski (1):
>   xen/pt: fix syntax error that causes FTBFS in some configurations
>
> Han Han (1):
>   qapi: virtio: Fix the introduced version
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   target/m68k: Rename qregs.def -> qregs.h.inc
>   target/s390x: Rename insn-data/format.def -> insn-data/format.h.inc
>   target/tricore: Rename csfr.def -> csfr.h.inc
>
> Stefan Weil (4):
>   Fix some typos in documentation and comments
>   libvhost-user: Fix wrong type of argument to formatting function
>     (reported by LGTM)
>   libvhost-user: Fix format strings
>   libvhost-user: Add format attribute to local function vu_panic
>
>  docs/devel/testing.rst                        |  2 +-
>  docs/system/arm/cpu-features.rst              |  2 +-
>  docs/system/loongarch/loongson3.rst           |  2 +-
>  docs/tools/virtiofsd.rst                      |  2 +-
>  hw/xen/meson.build                            |  2 +-
>  include/exec/memory.h                         |  2 +-
>  qapi/qom.json                                 |  2 +-
>  qapi/virtio.json                              | 34 +++++++++----------
>  qemu-options.hx                               | 10 +++---
>  qga/qapi-schema.json                          |  2 +-
>  subprojects/libvhost-user/libvhost-user.c     | 19 ++++++++---
>  target/m68k/{qregs.def =3D> qregs.h.inc}        |  0
>  target/m68k/translate.c                       |  4 +--
>  .../tcg/{insn-data.def =3D> insn-data.h.inc}    |  2 +-
>  .../{insn-format.def =3D> insn-format.h.inc}    |  0
>  target/s390x/tcg/translate.c                  | 10 +++---
>  target/tricore/{csfr.def =3D> csfr.h.inc}       |  0
>  target/tricore/translate.c                    |  4 +--
>  tests/qtest/libqtest.h                        |  2 +-
>  tests/unit/test-io-channel-command.c          | 14 +++-----
>  20 files changed, 60 insertions(+), 55 deletions(-)
>  rename target/m68k/{qregs.def =3D> qregs.h.inc} (100%)
>  rename target/s390x/tcg/{insn-data.def =3D> insn-data.h.inc} (99%)
>  rename target/s390x/tcg/{insn-format.def =3D> insn-format.h.inc} (100%)
>  rename target/tricore/{csfr.def =3D> csfr.h.inc} (100%)
>
> --
> 2.37.3
>
>

