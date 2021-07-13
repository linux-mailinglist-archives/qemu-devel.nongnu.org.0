Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCCE3C7464
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:21:27 +0200 (CEST)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3L9y-0006Rc-5b
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7r-0003dV-Al
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7o-0006q9-Ob
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zkm6ppgu/oPo+cyfMJJsJvuR3hA1pMQ+p026sUYZzAg=;
 b=Xq+n83ohlPJoPYSque3g/dGE3szrZoJzLzwbKoj8xnaLRsHbN/xjLUKrLXwuSpCZ1ENegA
 rnjB7wUcQaapASEGzG3nU+I8hb77pQwQBEiJI/scTJhXjDtIS9fe5C7HCnq643oXS03v9s
 OGe76cMihHlL/NicBBZkT/uJ85UXq7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-0IG_eL-RM2muBdYtX3EOIw-1; Tue, 13 Jul 2021 12:19:08 -0400
X-MC-Unique: 0IG_eL-RM2muBdYtX3EOIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB897802C89;
 Tue, 13 Jul 2021 16:19:07 +0000 (UTC)
Received: from localhost (ovpn-113-28.rdu2.redhat.com [10.10.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83AA55D6AB;
 Tue, 13 Jul 2021 16:19:07 +0000 (UTC)
Date: Tue, 13 Jul 2021 09:22:09 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 0/4] docs: improve -smp documentation
Message-ID: <20210713132209.6afj2w7xmfyuu3od@habkost.net>
References: <20210628113047.462498-1-berrange@redhat.com>
 <20210709204857.n3lgxit32lcvlkv7@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210709204857.n3lgxit32lcvlkv7@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 04:48:57PM -0400, Eduardo Habkost wrote:
> On Mon, Jun 28, 2021 at 12:30:43PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > This is a spin off from this thread:
> >=20
> >   https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06135.html
> >=20
> > to improve the documentation of the current behaviour of -smp
> > arg. In that thread it is suggested that we change the behaviour
> > to prefer use of cores over sockets, when topology is omitted. This
> > documentation update explicitly notes that default topology is liable
> > to change, to allow for this enhancement.
>=20
> Queued, thanks!

I had to remove it due to build failures:
https://gitlab.com/ehabkost/qemu/-/jobs/1413791527#L1139


FAILED: libqemu-microblazeel-softmmu.fa.p/softmmu_vl.c.o
cc -Ilibqemu-microblazeel-softmmu.fa.p -I. -I.. -Itarget/microblaze -I../ta=
rget/microblaze -I../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/sha=
der -I/usr/include/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/inc=
lude -fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgn=
u11 -O2 -g -isystem /builds/ehabkost/qemu/linux-headers -isystem linux-head=
ers -iquote . -iquote /builds/ehabkost/qemu -iquote /builds/ehabkost/qemu/i=
nclude -iquote /builds/ehabkost/qemu/disas/libvixl -iquote /builds/ehabkost=
/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -m32 -D_GNU=
_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -W=
redundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-al=
iasing -fno-common -fwrapv -m32 -Wold-style-declaration -Wold-style-definit=
ion -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qual=
ifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined =
-Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-va=
lue -Wno-psabi -fstack-protector-strong -fPIC -isystem../linux-headers -isy=
stemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"microblazeel-softmmu-con=
fig-target.h"' '-DCONFIG_DEVICES=3D"microblazeel-softmmu-config-devices.h"'=
 -MD -MQ libqemu-microblazeel-softmmu.fa.p/softmmu_vl.c.o -MF libqemu-micro=
blazeel-softmmu.fa.p/softmmu_vl.c.o.d -o libqemu-microblazeel-softmmu.fa.p/=
softmmu_vl.c.o -c ../softmmu/vl.c
./qemu-options.def: In function 'help':
./qemu-options.def:52:1: error: expected ')' before 'QEMU_ARCH_ALL'
   52 | QEMU_ARCH_ALL)
      | ^~~~~~~~~~~~~
../softmmu/vl.c:809:10: note: in definition of macro 'DEF'
  809 |     if ((arch_mask) & arch_type)                               \
      |          ^~~~~~~~~
../softmmu/vl.c:809:9: note: to match this '('
  809 |     if ((arch_mask) & arch_type)                               \
      |         ^
./qemu-options.def:43:1: note: in expansion of macro 'DEF'
   43 | DEF("smp", HAS_ARG, QEMU_OPTION_smp,
      | ^~~
../softmmu/vl.c:809:21: error: invalid operands to binary & (have 'const ch=
ar *' and 'uint32_t' {aka 'const unsigned int'})
  809 |     if ((arch_mask) & arch_type)                               \
      |         ~           ^
      |         |
      |         const char *
./qemu-options.def:43:1: note: in expansion of macro 'DEF'
   43 | DEF("smp", HAS_ARG, QEMU_OPTION_smp,
      | ^~~
./qemu-options.def: At top level:
./qemu-options.def:49:1: error: initialization of 'unsigned int' from 'cons=
t char *' makes integer from pointer without a cast [-Werror=3Dint-conversi=
on]
   49 | "                dies=3D number of CPU dies on one socket (for PC o=
nly)\n"
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
../softmmu/vl.c:845:34: note: in definition of macro 'DEF'
  845 |     { option, opt_arg, opt_enum, arch_mask },
      |                                  ^~~~~~~~~
./qemu-options.def:49:1: note: (near initialization for 'qemu_options[7].ar=
ch_mask')
   49 | "                dies=3D number of CPU dies on one socket (for PC o=
nly)\n"
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
../softmmu/vl.c:845:34: note: in definition of macro 'DEF'
  845 |     { option, opt_arg, opt_enum, arch_mask },
      |                                  ^~~~~~~~~
./qemu-options.def:52:1: error: expected '}' before 'QEMU_ARCH_ALL'
   52 | QEMU_ARCH_ALL)
      | ^~~~~~~~~~~~~
../softmmu/vl.c:845:34: note: in definition of macro 'DEF'
  845 |     { option, opt_arg, opt_enum, arch_mask },
      |                                  ^~~~~~~~~
../softmmu/vl.c:845:5: note: to match this '{'
  845 |     { option, opt_arg, opt_enum, arch_mask },
      |     ^
./qemu-options.def:43:1: note: in expansion of macro 'DEF'
   43 | DEF("smp", HAS_ARG, QEMU_OPTION_smp,
      | ^~~
cc1: all warnings being treated as errors
[663/5259] Compiling C object libqemu-microblazeel-softmmu.fa.p/accel_tcg_t=
cg-accel-ops-icount.c.o
ninja: build stopped: subcommand failed.
make: *** [Makefile:154: run-ninja] Error 1

--=20
Eduardo


