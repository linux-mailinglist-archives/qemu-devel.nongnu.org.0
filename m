Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF6129546
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 12:34:59 +0100 (CET)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijLzG-0003Qs-Lb
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 06:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ijLxk-0002yI-7E
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 06:33:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ijLxh-0001KD-U8
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 06:33:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20855
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ijLxh-0001Ia-Py
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 06:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577100801;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFoGC+NFlicS/6v9Frf9oi63bi8uWXTYq/qObtEBP0U=;
 b=hFbMntjcMqNRAyyLQTRg4/J7dqAEzw7hcmDVal9g9DjZ5vmH2d8BKgM5jvr30IUpKwkrCM
 UBo2Kz7tIlzBm+kQNLLaWwOvsy/VGywJYPj3xZxULxBgq6op7fvSnS7AUCYtqfyL7oXLZ1
 h9TkfHyHPaESC+hPYlY/3YZ8nlncYgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-zbEY7o1KMv26_K-AsAmgpw-1; Mon, 23 Dec 2019 06:33:19 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BD60801E6C
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 11:33:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC6F805FF;
 Mon, 23 Dec 2019 11:33:17 +0000 (UTC)
Date: Mon, 23 Dec 2019 11:33:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>
Subject: Re: [PULL 48/87] x86: move SMM property to X86MachineState
Message-ID: <20191223113315.GI2529561@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
 <1576670573-48048-49-git-send-email-pbonzini@redhat.com>
 <8e6af403-173f-ff15-11c7-5dad511795a1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8e6af403-173f-ff15-11c7-5dad511795a1@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: zbEY7o1KMv26_K-AsAmgpw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 23, 2019 at 12:28:43PM +0100, Michal Pr=C3=ADvozn=C3=ADk wrote:
> On 12/18/19 1:02 PM, Paolo Bonzini wrote:
> > Add it to microvm as well, it is a generic property of the x86
> > architecture.
> >=20
> > Suggested-by: Sergio Lopez <slp@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  hw/i386/pc.c          | 49 -------------------------------------------=
------
> >  hw/i386/pc_piix.c     |  6 +++---
> >  hw/i386/pc_q35.c      |  2 +-
> >  hw/i386/x86.c         | 50 +++++++++++++++++++++++++++++++++++++++++++=
++++++-
> >  include/hw/i386/pc.h  |  3 ---
> >  include/hw/i386/x86.h |  5 +++++
> >  target/i386/kvm.c     |  3 +--
> >  7 files changed, 59 insertions(+), 59 deletions(-)
> >=20
>=20
>=20
> > diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> > index ef63f3a..c7ff67a 100644
> > --- a/target/i386/kvm.c
> > +++ b/target/i386/kvm.c
> > @@ -2173,8 +2173,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> >      }
> > =20
> >      if (kvm_check_extension(s, KVM_CAP_X86_SMM) &&
> > -        object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE) &&
> > -        pc_machine_is_smm_enabled(PC_MACHINE(ms))) {
> > +        x86_machine_is_smm_enabled(X86_MACHINE(ms))) {
> >          smram_machine_done.notify =3D register_smram_listener;
> >          qemu_add_machine_init_done_notifier(&smram_machine_done);
> >      }
> >=20
>=20
> Sorry for not catching this earlier, but I don't think this is right.
> The @ms is not instance of X
>=20
>=20
> After I refreshed my qemu master I realized that libvirt is unable to
> fetch capabilities. Libvirt runs the following command:
>=20
>   qemu.git $ ./x86_64-softmmu/qemu-system-x86_64 -S -no-user-config
> -nodefaults -nographic -machine none,accel=3Dkvm:tcg

Hmm, it would be good if we can get QEMU CI to launch QEMU  in
this way, as this isn't the first time some change has broken
launching of QEMU for probing capabilities.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


