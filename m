Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63FD220DF9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 15:20:50 +0200 (CEST)
Received: from localhost ([::1]:50992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvhL7-0003a5-Ng
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 09:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1jvhK0-0002Ly-VD
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 09:19:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36742
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1jvhJz-0007D7-4V
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 09:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594819178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyZiBvuu3IGScuXRKifik3Nx/IQHORt/FywNor9x2GU=;
 b=VxAscC0FSgFwlzRW1WGfU7WpeIsj7AW8kbdh8szFda9jDM5ERuIdYhi+ZPR1oKBaeoCDYc
 izb3b637dzA5kvB4VQNcJJTzaBSPfyqZG9THkraJTVgJIqkUUMYVokP485IWxbLhNmZM20
 s2Tk/kv21obBsTrNRZQ1S2DMwU+URVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-OLitZIb2N6eKZ7K50ZuPxA-1; Wed, 15 Jul 2020 09:19:20 -0400
X-MC-Unique: OLitZIb2N6eKZ7K50ZuPxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 485341083;
 Wed, 15 Jul 2020 13:19:19 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-114-162.ams2.redhat.com
 [10.36.114.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FDFF710A0;
 Wed, 15 Jul 2020 13:19:19 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id 5C4593E047D; Wed, 15 Jul 2020 15:19:17 +0200 (CEST)
Date: Wed, 15 Jul 2020 15:19:17 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] cpu-models-x86: Fix CPU model name - s/IBR/IBRS/
Message-ID: <20200715131917.GA11047@paraplu>
References: <20200619125413.2210-1-kchamart@redhat.com>
 <159257318219.466.4187935413407341907@d1fd068a5071>
MIME-Version: 1.0
In-Reply-To: <159257318219.466.4187935413407341907@d1fd068a5071>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kchamart@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:37:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 19, 2020 at 06:26:23AM -0700, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200619125413.2210-1-kchamart@redh=
at.com/

[...]

> clang -iquote /tmp/qemu-test/build/tests -iquote tests -iquote /tmp/qemu-=
test/src/tcg/i386 -isystem /tmp/qemu-test/src/linux-headers -isystem /tmp/q=
emu-test/build/linux-headers -iquote . -iquote /tmp/qemu-test/src -iquote /=
tmp/qemu-test/src/accel/tcg -iquote /tmp/qemu-test/src/include -iquote /tmp=
/qemu-test/src/disas/libvixl -I/usr/include/pixman-1   -Werror -fsanitize=
=3Dundefined -fsanitize=3Daddress  -pthread -I/usr/include/glib-2.0 -I/usr/=
lib64/glib-2.0/include  -fPIE -DPIE -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSE=
T_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wall=
 -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-com=
mon -fwrapv -std=3Dgnu99  -Wold-style-definition -Wtype-limits -Wformat-sec=
urity -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-e=
xterns -Wendif-labels -Wexpansion-to-defined -Wno-initializer-overrides -Wn=
o-missing-include-dirs -Wno-shift-negative-value -Wno-string-plus-int -Wno-=
typedef-redefinition -Wno-tautological-type-limit-compare -fstack-protector=
-strong   -I/usr/include/p11-kit-1   -DSTRUCT_IOVEC_DEFINED  -I/usr/include=
/libpng16  -I/usr/include/spice-1 -I/usr/include/spice-server -I/usr/includ=
e/cacard -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/inclu=
de/nss3 -I/usr/include/nspr4 -pthread -I/usr/include/libmount -I/usr/includ=
e/blkid -I/usr/include/pixman-1   -I/tmp/qemu-test/src/tests -I/tmp/qemu-te=
st/src/tests/qtest -MMD -MP -MT tests/test-crypto-tlssession.o -MF tests/te=
st-crypto-tlssession.d -g   -c -o tests/test-crypto-tlssession.o /tmp/qemu-=
test/src/tests/test-crypto-tlssession.c
> /tmp/qemu-test/src/tests/qht-bench.c:287:29: error: implicit conversion f=
rom 'unsigned long' to 'double' changes value from 18446744073709551615 to =
18446744073709551616 [-Werror,-Wimplicit-int-float-conversion]
>         *threshold =3D rate * UINT64_MAX;
>                           ~ ^~~~~~~~~~
> /usr/include/stdint.h:130:23: note: expanded from macro 'UINT64_MAX'


I don't think this failure is related to the submitted patch.  Do I need
to respin?

[...]

--=20
/kashyap


