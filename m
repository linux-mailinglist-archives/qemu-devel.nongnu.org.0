Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C812A2E9D7C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 19:52:25 +0100 (CET)
Received: from localhost ([::1]:55300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwUxs-0000KT-AE
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 13:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kwUwh-0008EO-SX
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 13:51:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kwUwd-0007o5-Pg
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 13:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609786265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNJdQJ06w2m5Gr+f4GbZ9y2gxZ9vffE30reIM9mR158=;
 b=Zlok2woY778TOqa4YMcjuJFvJUgx/ILbyNfBiXq0wIq2H1DrLKu42I4t5jmwCBW6N7W7e4
 iRtJU4Txa/Ozkqn6lCeONhsAWdlePTRYIyhiJ/TcK3eCMs0C1WoWwSP8E3dTZ0KMhmC5Gl
 h4oP/8wi3nm8GHXQGGdmquyGVQHslYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-bMWWCF78O6ip6d1rdU5tvw-1; Mon, 04 Jan 2021 13:51:03 -0500
X-MC-Unique: bMWWCF78O6ip6d1rdU5tvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4B88107ACE3;
 Mon,  4 Jan 2021 18:51:02 +0000 (UTC)
Received: from localhost (unknown [10.40.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 914CC57;
 Mon,  4 Jan 2021 18:50:57 +0000 (UTC)
Date: Mon, 4 Jan 2021 19:50:55 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [BUG] qemu git error with virgl
Message-ID: <20210104195055.7d60dbc4@redhat.com>
In-Reply-To: <a6651e26-58b8-cee0-bb15-198e6fb64d48@redhat.com>
References: <30eb4fc7-ef1f-4e92-4e1f-46b71ae8d9f0@siduction.org>
 <a6651e26-58b8-cee0-bb15-198e6fb64d48@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Torsten Wohlfarth <towo@siduction.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 3 Jan 2021 18:28:11 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Cc'ing Gerd + patch author/reviewer.
>=20
> On 1/2/21 2:11 PM, Torsten Wohlfarth wrote:
> > Hello,
> >=20
> > i can't start any system if i use virgl. I get the following error:
> >=20
> > qemu-x86_64: ../ui/console.c:1791: dpy_gl_ctx_create: Assertion
> > `con->gl' failed.

Does following fix issue:
  [PULL 12/55] vl: initialize displays _after_ exiting preconfiguration

> > ./and.sh: line 27: 3337167 Aborted=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu-x86_64 -m=
 4096
> > -smp cores=3D4,sockets=3D1 -cpu host -machine pc-q35-4.0,accel=3Dkvm -d=
evice
> > virtio-vga,virgl=3Don,xres=3D1280,yres=3D800 -display sdl,gl=3Don -devi=
ce
> > intel-hda,id=3Dsound0,msi=3Don -device
> > hda-micro,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 -device qemu-xhci,i=
d=3Dxhci
> > -device usb-tablet,bus=3Dxhci.0 -net
> > nic,macaddr=3D52:54:00:12:34:62,model=3De1000 -net
> > tap,ifname=3D$INTERFACE,script=3Dno,downscript=3Dno -drive
> > file=3D/media/daten2/image/lineageos.qcow2,if=3Dvirtio,index=3D1,media=
=3Ddisk,cache=3Dnone,aio=3Dthreads
> >=20
> > Set 'tap3' nonpersistent
> >=20
> > i have bicected the issue:
> >  =20
> > towo:Defiant> git bisect good =20
> > b4e1a342112e50e05b609e857f38c1f2b7aafdc4 is the first bad commit
> > commit b4e1a342112e50e05b609e857f38c1f2b7aafdc4
> > Author: Paolo Bonzini <pbonzini@redhat.com>
> > Date:=C2=A0=C2=A0 Tue Oct 27 08:44:23 2020 -0400
> >=20
> > =C2=A0=C2=A0=C2=A0 vl: remove separate preconfig main_loop
> >=20
> > =C2=A0=C2=A0=C2=A0 Move post-preconfig initialization to the x-exit-pre=
config. If
> > preconfig
> > =C2=A0=C2=A0=C2=A0 is not requested, just exit preconfig mode immediate=
ly with the QMP
> > =C2=A0=C2=A0=C2=A0 command.
> >=20
> > =C2=A0=C2=A0=C2=A0 As a result, the preconfig loop will run with accel_=
setup_post
> > =C2=A0=C2=A0=C2=A0 and os_setup_post restrictions (xen_restrict, chroot=
, etc.)
> > =C2=A0=C2=A0=C2=A0 already done.
> >=20
> > =C2=A0=C2=A0=C2=A0 Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > =C2=A0=C2=A0=C2=A0 Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >=20
> > =C2=A0include/sysemu/runstate.h |=C2=A0 1 -
> > =C2=A0monitor/qmp-cmds.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 9 -----
> > =C2=A0softmmu/vl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 95
> > ++++++++++++++++++++---------------------------
> > =C2=A03 files changed, 41 insertions(+), 64 deletions(-)
> >=20
> > Regards,
> >=20
> > Torsten Wohlfarth
> >=20
> >=20
> >  =20
>=20
>=20


