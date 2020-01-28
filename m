Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFCB14BE04
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 17:49:43 +0100 (CET)
Received: from localhost ([::1]:33510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwU3a-000765-0d
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 11:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iwU1j-0005kY-OJ
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 11:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iwU1i-0005gy-CT
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 11:47:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40773
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iwU1i-0005gN-9H
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 11:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580230065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSEHuj1VIyeRHHeR0+Wg96oFvVRVEvG3ub6TDc+StgA=;
 b=daKBxNqyEWxVg5rZH94dH1p65I3UaGUQADQSk0JI4HeVrBS8kQixgm5A+qMqeyyvwOYZ+P
 5DGPdn2LOydRdhYgwtPKIs/7bKjm/F1+IJsHUnyroIzITf6dnuXxyTO8aHOJ+HfxS9jCT2
 yq//eIDgBtrG49mri5wGHa3k0QCiFxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-SGZ_omfANWeFFAs7T0bV3w-1; Tue, 28 Jan 2020 11:47:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9AE2100550E;
 Tue, 28 Jan 2020 16:47:26 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B66119C70;
 Tue, 28 Jan 2020 16:47:19 +0000 (UTC)
Date: Tue, 28 Jan 2020 16:47:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 00/13] RFC: [for 5.0]: HMP monitor handlers cleanups
Message-ID: <20200128164717.GT3215@work-vm>
References: <20200127103647.17761-1-mlevitsk@redhat.com>
 <2e885a1d-94c7-53b5-44f7-feffe70f57c3@redhat.com>
 <20200127204355.GE4544@andariel.pipo.sk>
 <12217cd6-7866-ce9c-c0da-24775f9d045d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <12217cd6-7866-ce9c-c0da-24775f9d045d@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: SGZ_omfANWeFFAs7T0bV3w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Jan Tomko <jtomko@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* John Snow (jsnow@redhat.com) wrote:
>=20
>=20
> On 1/27/20 3:43 PM, Peter Krempa wrote:
> > On Mon, Jan 27, 2020 at 14:39:02 -0500, John Snow wrote:
> >>
> >>
> >> On 1/27/20 5:36 AM, Maxim Levitsky wrote:
> >>> This patch series is bunch of cleanups
> >>> to the hmp monitor code.
> >>>
> >>> This series only touched blockdev related hmp handlers.
> >>>
> >>> No functional changes expected other that
> >>> light error message changes by the last patch.
> >>>
> >>> This was inspired by this bugzilla:
> >>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1719169
> >>>
> >>> Basically some users still parse hmp error messages,
> >>> and they would like to have them prefixed with 'Error:'
> >>>
> >>
> >> HMP isn't meant to be parsed. It's explicitly *not* API or ABI. I do
> >> like consistency in my UIs (it's useful for human eyes, too), but I'd
> >> like to know more about the request.
> >=20
> > That's true as long as there's an stable replacement ... see below.
> >=20
>=20
> Thanks for the context!
>=20
> >>
> >> Is this request coming from libvirt? Can we wean them off of this
> >> interface? What do they need as a replacement?
> >=20
> > There are 5 commands that libvirt still has HMP interfaces for:
> >=20
> > drive_add
> > drive_del
> >=20
> > savevm
> > loadvm
> > delvm
> >=20
> > From upstream point of view there's no value in adding the 'error'
> > prefix to drive_add/drive_del as libvirt now uses blockdev-add/del QMP
> > command instead which have implicit error propagation.
> >=20
>=20
> As thought.
>=20
> > There are no replacements for the internal snapshot commands, but they
> > reported the 'error' prefix for some time even before this series.
> >=20
> > Said that, please don't break savevm/loadvm/delvm until a QMP
> > replacement is added.
> >=20
>=20
> Yes, noted. I wonder where userfaultfd write support is these days...

How would that help you there?

Dave

> > The bug was reported at the time when libvirt didn't use blockdev yet,
> > but at this point it's pointless from our side. This wouldn't even fix
> > the scenario when old (pre-5.10) libvirt would use new qemu because the
> > drive-add handler never checked the error prefix.
> >=20
> > [1] https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dblob;f=3Dsrc/qemu/qemu=
_monitor_text.c;h=3D9135a11f0a3aae718c86bb199112fba8d16d4d80;hb=3DHEAD
> >=20
>=20
> Thank you for the report from libvirtville :)
>=20
> --js
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


