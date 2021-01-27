Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C86305FC1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:36:50 +0100 (CET)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4msD-0000lW-2f
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l4mqy-0008K1-78
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:35:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l4mqw-0000Ec-EF
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611761728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bjP2LmTDYlYn9Kauo/uSYJ1A0kCjgPsHcQTy97yC+kE=;
 b=KkOpML9kufYOvHQ9Wq5sU71JbWOjaNFAvm+xT/qwlf23dDrmu34qLHF3skAuPGT98J3enz
 UNjjm15/r3st0ZSeKWYiIJ+ICbt3Pa542YSaSIqmzLMBhFxU7lNgomkTKEyLxGCvfUVbs5
 xw+KUy/+01tr+t4cHKMAzxH3FMeQm40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-_3iMxPklMtOh3R_cmSeHOQ-1; Wed, 27 Jan 2021 10:35:26 -0500
X-MC-Unique: _3iMxPklMtOh3R_cmSeHOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8B858735C1;
 Wed, 27 Jan 2021 15:35:25 +0000 (UTC)
Received: from localhost (unknown [10.40.208.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 354A35D6A1;
 Wed, 27 Jan 2021 15:35:23 +0000 (UTC)
Date: Wed, 27 Jan 2021 16:35:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3] machine: add missing doc for memory-backend option
Message-ID: <20210127163522.5a8db09a@redhat.com>
In-Reply-To: <756c025a-3811-4a36-98a2-3a02bd756523@redhat.com>
References: <20210121161504.1007247-1-imammedo@redhat.com>
 <20210127104511.GF3653144@redhat.com>
 <20210127105436.GG3653144@redhat.com>
 <756c025a-3811-4a36-98a2-3a02bd756523@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: peter.maydell@linaro.org, pkrempa@redhat.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 15:24:26 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> On 1/27/21 11:54 AM, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Jan 27, 2021 at 10:45:11AM +0000, Daniel P. Berrang=C3=A9 wrote=
: =20
> >> On Thu, Jan 21, 2021 at 11:15:04AM -0500, Igor Mammedov wrote: =20
>=20
>=20
> >>
> >> How does a mgmt app know which machine types need to use this
> >> option ? The machine type names are opaque strings, and apps
> >> must not attempt to parse or interpret the version number
> >> inside the machine type name, as they can be changed by
> >> distros.  IOW, saying to use it for machine types 4.0 and
> >> older isn't a valid usage strategy IMHO.
it's possible (but no necessary) to use knob with new machine types
(defaults for these match suggested property value).
Limiting knob usage to 4.0 and older would allow us to drop
without extra efforts once 4.0 is deprecated/removed.

> > Looking at the libvirt patch, we do indeed use his property
> > unconditionally for all machine types, precisely because parsing
> > version numbers from the machine type is not allowed.
> >=20
> > https://www.redhat.com/archives/libvir-list/2021-January/msg00633.html
> >=20
> > So this doc is telling apps to do something that isn't viable =20
>=20
> The other approach that I was suggesting was, that QEMU stops reporting=
=20
> 'default-ram-id' for affected machine types. The way the switch from '-m=
=20
> XMB' to memory-backend-* was implemented in libvirt is that if libvirt=20
> sees 'default-ram-id' attribute for given machine type it uses=20
> memory-backend-* otherwise it falls back to -m.
>=20
> Since we know which machine types are "broken", we can stop reporting=20
> the attribute and thus stop tickling this bug. I agree that it puts more=
=20
> burden on distro maintainers to backport the change, but I think it's=20
> acceptable risk.

default-ram-id is already exposed in wild including old machine types
starting from 5.2

if libvirt will take care this one quirk, then I guess we can
do as suggested. I can post an additional patch to this effect if there
is agreement to go this route.

my take on it, at this point is that it's not worth the effort,
we can just use option unconditionally and flow usual deprecate/remove
process once 4.0 machine type is removed.

>=20
> Michal
>=20
>=20


