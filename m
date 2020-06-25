Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A60209D0A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 12:48:42 +0200 (CEST)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joPQv-0001TF-6x
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 06:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1joPQ6-00013y-Rf
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 06:47:50 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48879
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1joPQ4-0007Kr-5C
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 06:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593082066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kj7C0d6ycSzQqrULoDpDT1mncvESh3zGcSBnTIX92ns=;
 b=Ylg/WZ/J27lXFBWBkCu1NB3AHcFcLYshR0IfOiqYH3Y2iEU7l4oMTN4MUKDYKis4bK8YyB
 Y2bZ0DKkBX8Y2mmp4It6OxJzMBgrrffbwafQGc+VDiuPBu68fipEbtO370kQ7vWmoZ3DlB
 3+9FG4HDUgpCj6lDnRoHAyk8SIup/4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-ihc5FNuAN6WPGpEt-z_R5w-1; Thu, 25 Jun 2020 06:46:36 -0400
X-MC-Unique: ihc5FNuAN6WPGpEt-z_R5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF073107ACCA;
 Thu, 25 Jun 2020 10:46:35 +0000 (UTC)
Received: from gondolin (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 450A2101E662;
 Thu, 25 Jun 2020 10:46:25 +0000 (UTC)
Date: Thu, 25 Jun 2020 12:46:23 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [RFC 0/4] Enable virtio-fs on s390x
Message-ID: <20200625124623.4bfa6321.cohuck@redhat.com>
In-Reply-To: <20200625103924.GH1009994@redhat.com>
References: <20200625100430.22407-1-mhartmay@linux.ibm.com>
 <20200625101935.GF1009994@redhat.com>
 <20200625123136.2c3c0ebe.cohuck@redhat.com>
 <20200625103924.GH1009994@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Marc Hartmayer <mhartmay@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Jun 2020 11:39:24 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, Jun 25, 2020 at 12:31:36PM +0200, Cornelia Huck wrote:
> > On Thu, 25 Jun 2020 11:19:35 +0100
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >  =20
> > > On Thu, Jun 25, 2020 at 12:04:26PM +0200, Marc Hartmayer wrote: =20
> > > > This RFC is about enabling virtio-fs on s390x. For that we need
> > > >  + some shim code (first patch), and we need
> > > >  + libvhost-user to deal with virtio endiannes as mandated by the s=
pec.
> > > > =20
> > > > The second part is trickier, because unlike QEMU we are not certain
> > > > about the guest's native endianness, which is needed to handle the
> > > > legacy-interface appropriately. In fact, this is the reason why jus=
t
> > > > RFC.
> > > >=20
> > > > One of the open questions is whether to build separate versions, on=
e
> > > > for guest little endian and one for guest big endian, or do we want
> > > > something like a command line option? (Digression on the libvirt
> > > > modeling)   =20
> > >=20
> > > When you talk about  big vs little endian, are you referring to TCG
> > > scenarios with mixed host/guest arch, or arches which can support
> > > either endianess, or both ? i guess it doesn't matter actually, as
> > > I think the latter forces a specific answer.
> > >=20
> > > Considering that some architectures allow the guest OS to flip betwee=
n
> > > big & little endian as they boot, libvirt cannot know what endianess
> > > the guest is using when it launches virtiofsd. It thus cannot pick
> > > between two different endianness builds of virtiofsd automatically.
> > > This would force the user to tell libvirt what arch the guest is usin=
g
> > > at the time they define the guest. This is an undesirable restriction
> > > for use cases where the admin of the guest OS has no direct control
> > > over the host config. =20
> >=20
> > Right, but that is in practice only a problem for legacy devices, isn't
> > it? The standard says that non-legacy devices use little-endian
> > everywhere; it's the legacy 'device endian' that is causing us
> > headaches.
> >=20
> > Which leads to the question: Do we really need to support legacy
> > virtio-fs devices, or can we just force virtio-1, as many (most?) newer
> > virtio devices do? =20
>=20
> I'd hope virtio-fs is already forced to modern only, as there's no legacy
> PCI ID assigned to it in the spec.

I did not find a call to virtio_pci_force_virtio_1(), so apparently not?


