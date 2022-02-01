Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CC04A5A09
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:30:33 +0100 (CET)
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqQh-0007FL-VL
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:30:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1nEqOQ-0006Y7-J7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:28:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1nEqOM-0005EN-Pi
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643711277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJ24sWrV8rRA8y+xzrjr3WhwPPWUBlTXUVfbn2L+Dwo=;
 b=CDMg60hThxjpyUgB/LlmrXQd1YblSErXaWqiZ71IrTF4wkjFauXr047DdIUn0LVAxxcsXG
 GwrGvYKPKoGoiu9vH8VybQ0z4E8V8kaWZy7Ik1LrzGRVYfNso9O1+1LTpFyJURbW0zSI58
 6vkqVqOD9c6FuD7J5ALk64hbE0ELS4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-2VQO9L6dN2WkLtwXk-MbFw-1; Tue, 01 Feb 2022 05:27:56 -0500
X-MC-Unique: 2VQO9L6dN2WkLtwXk-MbFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D63641091DA0;
 Tue,  1 Feb 2022 10:27:54 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5DD16D036;
 Tue,  1 Feb 2022 10:27:23 +0000 (UTC)
Date: Tue, 1 Feb 2022 11:27:20 +0100
From: Stefano Brivio <sbrivio@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <20220201112720.4ac9b8df@elisabeth>
In-Reply-To: <Yfj4ERdAvmCF4ZzY@redhat.com>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth> <Yfj4ERdAvmCF4ZzY@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 09:06:25 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Feb 01, 2022 at 07:31:39AM +0100, Stefano Brivio wrote:
> > Hi,
> >=20
> > On Tue, 25 Jan 2022 10:20:11 +0100
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> >  =20
> > >   Hi,
> > >  =20
> > > > IMHO the ideal scenario would be for us to have a kernel, initrd
> > > > containing just busybox tools for the key arch targets we care
> > > > about. Those could be used with direct kernel boot or stuffed
> > > > into a disk iamge. Either way, they would boot in ~1 second,
> > > > even with TCG, and would be able to execute simple shell scripts
> > > > to test a decent amount of QEMU functionality.   =20
> > >=20
> > > I have some test images based on buildroot which are essentially that=
.
> > > https://gitlab.com/kraxel/br-kraxel/
> > >=20
> > > Still a significant download, but much smaller than a full fedora or
> > > ubuntu cloud image and it boots much faster too.  Not down to only on=
e
> > > second though. =20
> >=20
> > I'm not sure you can recycle something from it, but my (ugly) approach
> > to make this fast (for a different purpose -- I'm using qemu to run
> > tests in guests, not testing qemu) is to build an initramfs by copying
> > the host binaries I need (a shell, ip, jq) and recursively sourcing
> > libraries using ldd (I guess I mentioned it's ugly).
> >=20
> > No downloads, systemd, dracut, etc., guest boots in half a second
> > (x86_64 on x86_64, KVM -- no idea with TCG). Host kernel with a few
> > modules packed and loaded by a custom init script. =20
>=20
> That is such a good idea, that it is exactly what I do too :-)
>=20
>   https://gitlab.com/berrange/tiny-vm-tools/-/blob/master/make-tiny-image=
.py
>=20
> it works incredibly well for the simple case of host-arch=3D=3Dguest-arch=
.

Ah-ha, I feel better now. ;)

> It could be made to work for foreign arch easily enough - just need
> to have a foreign chroot lieing around somewhere you can point it
> to.

By the way, stage3 archives from:

=09https://www.gentoo.org/downloads/#other-arches

get quite close to it ...no kernel binaries though.

--=20
Stefano


