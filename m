Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2381052120D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:20:41 +0200 (CEST)
Received: from localhost ([::1]:41136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMyu-0000Wc-7d
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noMdc-0003oQ-Ex
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:58:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noMdZ-0005tK-0K
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652176716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sv4ujOeYDunoQ4t8sa2Ml3dFZP6CmnPeq8Q8Q7CpRg8=;
 b=cnErfRt/0JprpE1O8jbYzTIataFF3147APxnSId8X6sjcFX4efDcjlngfy/Mt05SoqgIlM
 eTt+ZBwsruBhcumPOJ3psDVD34C325yoY166L9oYvd/0wDBUY29G7a+etM8qtrMB6mRj+q
 lyJ7AoZlHVeLfDvl72L1W7X1hs7UDDA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-X0XhhSTGMimWw6qaL8WpYw-1; Tue, 10 May 2022 05:58:35 -0400
X-MC-Unique: X0XhhSTGMimWw6qaL8WpYw-1
Received: by mail-wr1-f71.google.com with SMTP id
 j21-20020adfa555000000b0020adb9ac14fso6842960wrb.13
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 02:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=sv4ujOeYDunoQ4t8sa2Ml3dFZP6CmnPeq8Q8Q7CpRg8=;
 b=lkPFLsN9ZqzlSByBcVph4lRdB0SUUu0i4zgxTcSmbqKUMoaUcJ1mBMYeF9QMX9gKea
 Uf89BHQCMaK+PN4Z+iG8qGM5TwQd6GS0AANNDdE278pQQUoc3Jj4KSVRwNTw7k7Gu6XV
 7AMJzV/U7q2i/Wap8BIe2JvLIMJNX+SNaWbVO8sKMSoNKuAZaPrIuWUkpFo+4AAI4Wz4
 HGW3mB6dKP0Po6+pnyfavJju0RKoTiuCtMXzQE3n4rCQ2WOFqlelfVLgT4wp9kYj5+oN
 T315joAaDb0Dc0e5USidHemeBjBUpx9LLvbBTgUHY1hEEbrRSqVFTT+sl85by53OaEw8
 +nIQ==
X-Gm-Message-State: AOAM532exC6r1nR7JtYaJF9+psfw8V5BO68MEPcUd7CfTbZAbUa7o194
 E7ReNiamqJpPBV5sxZ8t8i+JNjEDpc56JF1urCgjCwjY4LveUvC4VW3E8f5LYVfT3Vou9xNAgiV
 cOfTvXAsS/tWJmWCq0fwHc0chc4CY7BRZlVYrKhmleGrCexWHGJENF02LMVIkV1kut5I=
X-Received: by 2002:a5d:5987:0:b0:20c:5d7c:b4e3 with SMTP id
 n7-20020a5d5987000000b0020c5d7cb4e3mr18494291wri.133.1652176713377; 
 Tue, 10 May 2022 02:58:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9WBzHYg6QLoDmeRBLFmnEOReH7ZgSamh2dR+Tu9E+i3WIAEu5AYWQEYEIZ5oU8lSLyJwFXg==
X-Received: by 2002:a5d:5987:0:b0:20c:5d7c:b4e3 with SMTP id
 n7-20020a5d5987000000b0020c5d7cb4e3mr18494254wri.133.1652176712953; 
 Tue, 10 May 2022 02:58:32 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bl21-20020adfe255000000b0020adc114136sm16207341wrb.0.2022.05.10.02.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 02:58:32 -0700 (PDT)
Date: Tue, 10 May 2022 10:58:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: Re: [PULL 00/16] migration queue
Message-ID: <Yno3RvWhwSDZjI7o@work-vm>
References: <20220510083355.92738-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220510083355.92738-1-dgilbert@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> The following changes since commit 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9=
ab:
>=20
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into=
 staging (2022-05-09 11:07:04 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220510a
>=20
> for you to fetch changes up to 511f4a0506af1d380115a61f3362149953646871:
>=20
>   multifd: Implement zero copy write in multifd migration (multifd-zero-c=
opy) (2022-05-10 09:15:06 +0100)

Nack
This is still failing the Alpine build test:

ninja: job failed: cc -m64 -mcx16 -Ilibio.fa.p -I. -I.. -Iqapi -Itrace -Iui=
 -Iui/shader -I/usr/include/p11-kit-1 -I/usr/include/glib-2.0 -I/usr/lib/gl=
ib-2.0/include -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=
=3Dgnu11 -O2 -g -isystem /builds/dagrh/qemu/linux-headers -isystem linux-he=
aders -iquote . -iquote /builds/dagrh/qemu -iquote /builds/dagrh/qemu/inclu=
de -iquote /builds/dagrh/qemu/disas/libvixl -iquote /builds/dagrh/qemu/tcg/=
i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE=
_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls=
 -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-com=
mon -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -W=
format-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body =
-Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrou=
gh=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fsta=
ck-protector-strong -fPIE -MD -MQ libio.fa.p/io_channel-socket.c.o -MF libi=
o.fa.p/io_channel-socket.c.o.d -o libio.fa.p/io_channel-socket.c.o -c ../io=
/channel-socket.c
In file included from /usr/include/linux/errqueue.h:6,
                 from ../io/channel-socket.c:29:
/usr/include/linux/time_types.h:7:8: error: redefinition of 'struct __kerne=
l_timespec'
    7 | struct __kernel_timespec {
      |        ^~~~~~~~~~~~~~~~~
In file included from /usr/include/liburing.h:19,
                 from /builds/dagrh/qemu/include/block/aio.h:18,
                 from /builds/dagrh/qemu/include/io/channel.h:26,
                 from /builds/dagrh/qemu/include/io/channel-socket.h:24,
                 from ../io/channel-socket.c:24:
/usr/include/liburing/compat.h:9:8: note: originally defined here
    9 | struct __kernel_timespec {
      |        ^~~~~~~~~~~~~~~~~
ninja: subcommand failed
make: *** [Makefile:163: run-ninja] Error 1

> ----------------------------------------------------------------
> Migration pull 2022-05-10
>=20
> This replaces yesterdays and the pull originally sent on 28th April;
> compared to yesterdays this fixes an accidental change to skiboot.
>=20
> It contains:
>   TLS test fixes from Dan
>   Zerocopy migration feature from Leo
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>=20
> ----------------------------------------------------------------
> Daniel P. Berrang=E9 (9):
>       tests: fix encoding of IP addresses in x509 certs
>       tests: add more helper macros for creating TLS x509 certs
>       tests: add migration tests of TLS with PSK credentials
>       tests: add migration tests of TLS with x509 credentials
>       tests: convert XBZRLE migration test to use common helper
>       tests: convert multifd migration tests to use common helper
>       tests: add multifd migration tests of TLS with PSK credentials
>       tests: add multifd migration tests of TLS with x509 credentials
>       tests: ensure migration status isn't reported as failed
>=20
> Leonardo Bras (7):
>       QIOChannel: Add flags on io_writev and introduce io_flush callback
>       QIOChannelSocket: Implement io_writev zero copy flag & io_flush for=
 CONFIG_LINUX
>       migration: Add zero-copy-send parameter for QMP/HMP for Linux
>       migration: Add migrate_use_tls() helper
>       multifd: multifd_send_sync_main now returns negative on error
>       multifd: Send header packet without flags if zero-copy-send is enab=
led
>       multifd: Implement zero copy write in multifd migration (multifd-ze=
ro-copy)
>=20
>  chardev/char-io.c                    |   2 +-
>  hw/remote/mpqemu-link.c              |   2 +-
>  include/io/channel-socket.h          |   2 +
>  include/io/channel.h                 |  38 +-
>  io/channel-buffer.c                  |   1 +
>  io/channel-command.c                 |   1 +
>  io/channel-file.c                    |   1 +
>  io/channel-socket.c                  | 118 ++++-
>  io/channel-tls.c                     |   1 +
>  io/channel-websock.c                 |   1 +
>  io/channel.c                         |  49 +-
>  meson.build                          |   1 +
>  migration/channel.c                  |   3 +-
>  migration/migration.c                |  52 ++-
>  migration/migration.h                |   6 +
>  migration/multifd.c                  |  74 ++-
>  migration/multifd.h                  |   4 +-
>  migration/ram.c                      |  29 +-
>  migration/rdma.c                     |   1 +
>  migration/socket.c                   |  12 +-
>  monitor/hmp-cmds.c                   |   6 +
>  qapi/migration.json                  |  24 +
>  scsi/pr-manager-helper.c             |   2 +-
>  tests/qtest/meson.build              |  12 +-
>  tests/qtest/migration-helpers.c      |  13 +
>  tests/qtest/migration-helpers.h      |   1 +
>  tests/qtest/migration-test.c         | 867 +++++++++++++++++++++++++++++=
++----
>  tests/unit/crypto-tls-psk-helpers.c  |  18 +-
>  tests/unit/crypto-tls-psk-helpers.h  |   1 +
>  tests/unit/crypto-tls-x509-helpers.c |  16 +-
>  tests/unit/crypto-tls-x509-helpers.h |  53 +++
>  tests/unit/test-crypto-tlssession.c  |  11 +-
>  tests/unit/test-io-channel-socket.c  |   1 +
>  33 files changed, 1284 insertions(+), 139 deletions(-)
>=20
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


