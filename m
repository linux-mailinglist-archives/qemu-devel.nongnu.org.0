Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148DB60D53E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 22:09:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onQDD-0005ks-C4; Tue, 25 Oct 2022 16:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1onQD9-0005QL-4U
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 16:07:43 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1onQD7-0001c9-73
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 16:07:42 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id r3so16113218yba.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 13:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/x683W/vDHr/QtxjDODVNxR341Q2iZCtH/kEZe6Q4Y=;
 b=Ezx5QdxWMWkP74tBT27uZw4+vK5onAb6/AIH/3N9sn1aiotXm/4sD486LfAxl1KWLv
 DT/rBfoV1PN5vmIj2MnXYUVIR6rM33pCTBjIfHcAqmzTcNy6pVA+ktr8UhZnXeZRrzRF
 fj5lOf0UbXRIChr1ZZhuClUsN5UPDMrlw8l314NvDO/5tkwuTEh3SLEyI/udPNWXFhIQ
 Yisa7y/dXz5A40cBkMN+0SEzGSVrUbvzBKJI+dyjDSRXI9NijIDLNW0kAMCOUko3quZC
 1AKOMBNGcwZklkuPwFD0OjaWy0wXj6/sMu7jolmxn5icRq/ms2VOw+vdNmsdeHMXqmLl
 q6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/x683W/vDHr/QtxjDODVNxR341Q2iZCtH/kEZe6Q4Y=;
 b=w4vCGzg/3PPG/A/vUwBYUSo/8RVbzAfapSckpLGKLeHI6Sod0bg4OGm7ihnbo1RZo5
 E2FxgOrYFbHyjYU93yXgFvnnVHj5ftoMlSB/DbiKOBpz5K3Yt0C0fzDlv4LAfH9eYJQR
 kQTHQShemo21lY4ESDiaOIh/J8aTByzygH/ULKVLGYj4v6JlsJHVwBtULXS9keGlAVu+
 S0zE4kXk/WBSv5rD0dm1gMCFcAfFA00UcGfTcmmMChe7oqwxbqGdJSCbAh1bTF7Td6po
 MJPcIwz2/ygVMWvWDVeHPVqY2HAvv3aEzHy2iBut91qKLEx3ZtPl7h9kR6gCCOfQabCd
 dTGg==
X-Gm-Message-State: ACrzQf0+r7ucJ5u7BJWjci1i6TupwOZACtIhA9c5hGnJ6qGRZ/PZOUob
 oWS91XMLEgWPXuzLWHn7wgbJRBSVAB/Pv8FWEGc=
X-Google-Smtp-Source: AMsMyM4jJbI4N5cliq2OdSzlSM5IdTyS0nSmD7u5rx+PBwXp10P94tILTIGjkb6j76E7+hdfTuNT2M7PU/UiNaEbdpI=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr36860078ybe.642.1666728459341; Tue, 25
 Oct 2022 13:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221025080541.271547-1-armbru@redhat.com>
In-Reply-To: <20221025080541.271547-1-armbru@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 25 Oct 2022 16:07:27 -0400
Message-ID: <CAJSP0QVkhzTw6_n+UgEVYDBhMqFuve1oVT2SnorwtMarWHgDcA@mail.gmail.com>
Subject: Re: [PULL 00/28] QAPI patches patches for 2022-10-25
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
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

The following CI failures were reported. I think they may be related
to this pull request:

cc -m64 -mcx16 -Ilibblock.fa.p -I. -I.. -Iqapi -Itrace -Iui
-Iui/shader -Iblock -I/usr/include/p11-kit-1
-I/usr/include/x86_64-linux-gnu -I/usr/include/uuid
-I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
-fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g
-isystem /builds/qemu-project/qemu/linux-headers -isystem
linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -pthread -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
-Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-D_FILE_OFFSET_BITS=3D64 -D__USE_FILE_OFFSET64 -D__USE_LARGEFILE64
-DUSE_POSIX_ACLS=3D1 -MD -MQ libblock.fa.p/block_rbd.c.o -MF
libblock.fa.p/block_rbd.c.o.d -o libblock.fa.p/block_rbd.c.o -c
../block/rbd.c
../block/rbd.c: In function =E2=80=98qemu_rbd_do_create=E2=80=99:
../block/rbd.c:545:15: error: =E2=80=98BlockdevCreateOptionsRbd=E2=80=99 {a=
ka =E2=80=98struct
BlockdevCreateOptionsRbd=E2=80=99} has no member named =E2=80=98has_encrypt=
=E2=80=99; did you
mean =E2=80=98encrypt=E2=80=99?
545 | if (opts->has_encrypt) {
| ^~~~~~~~~~~
| encrypt

https://gitlab.com/qemu-project/qemu/-/jobs/3225215747

I think this will solve it:
diff --cc block/rbd.c
index f826410f40,d809b8e0a3..3aa6aae0e0
--- a/block/rbd.c
+++ b/block/rbd.c
@@@ -542,7 -542,7 +542,7 @@@ static int qemu_rbd_do_create(BlockdevC
      }

  #ifndef LIBRBD_SUPPORTS_ENCRYPTION
--    if (opts->has_encrypt) {
++    if (opts->encrypt) {
          error_setg(errp, "RBD library does not support image encryption")=
;
          return -ENOTSUP;
      }

cc -m64 -mcx16 -Ilibqemuutil.a.p -I. -I.. -Iqapi -Itrace -Iui/shader
-I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
-fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g
-isystem /builds/qemu-project/qemu/linux-headers -isystem
linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-MD -MQ libqemuutil.a.p/stubs_qdev.c.o -MF
libqemuutil.a.p/stubs_qdev.c.o.d -o libqemuutil.a.p/stubs_qdev.c.o -c
../stubs/qdev.c
../stubs/qdev.c:18:6: error: conflicting types for
'qapi_event_send_device_deleted'
18 | void qapi_event_send_device_deleted(bool has_device,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../stubs/qdev.c:16:
./qapi/qapi-events-qdev.h:20:6: note: previous declaration of
'qapi_event_send_device_deleted' was here
20 | void qapi_event_send_device_deleted(const char *device, const char *pa=
th);
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../stubs/qdev.c:25:6: error: conflicting types for
'qapi_event_send_device_unplug_guest_error'
25 | void qapi_event_send_device_unplug_guest_error(bool has_device,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../stubs/qdev.c:16:
./qapi/qapi-events-qdev.h:22:6: note: previous declaration of
'qapi_event_send_device_unplug_guest_error' was here
22 | void qapi_event_send_device_unplug_guest_error(const char
*device, const char *path);
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://gitlab.com/qemu-project/qemu/-/jobs/3225215726

