Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48AB1142CA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 15:36:49 +0100 (CET)
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icsFM-0004lh-MQ
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 09:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1icsDx-0003ZG-PI
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 09:35:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1icsDv-0003Zv-8d
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 09:35:21 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42967
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1icsDv-0003UF-3U
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 09:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575556517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxkbHnBPvo0Fmuw0zcVRG7m0+bujKLeTKyZVxn0l1Pc=;
 b=jV0hlRIykg8Zpbv6DjpsMxaLGmojmNi+GS2e+Q37fu/ajlpt4LiKoVsw2phaaaiNeDjY5v
 RMb9sVZZmTuGvijFczVN1pFrSVNbjTD5ZE1x9gyqaDkuigBJCoM/nIJEsBHavCIwwjMJY+
 1ARRLxILLTVQWjGtf5zpgrZhlypoGbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-NgbXKPOAPAW3xlujVgLxeA-1; Thu, 05 Dec 2019 09:35:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A30011B18BC0;
 Thu,  5 Dec 2019 14:35:12 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19B0B5C1C3;
 Thu,  5 Dec 2019 14:35:07 +0000 (UTC)
Date: Thu, 5 Dec 2019 11:35:06 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 2/2] s390x/cpumodel: Introduce dynamic feature groups
Message-ID: <20191205143506.GG498046@habkost.net>
References: <b062f580-d664-f68c-2364-1f65df6ee265@de.ibm.com>
 <C829F458-099D-4E95-B835-67F008E60B13@redhat.com>
 <b4f4546d-b620-0428-40bf-59f4584a80f3@de.ibm.com>
 <b4ee8526-b1e3-21ee-5e1e-b22520e29339@redhat.com>
 <20191129193317.GE14595@habkost.net>
 <a5ae30ef-e193-fd22-b3e2-a7626e82d9b1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a5ae30ef-e193-fd22-b3e2-a7626e82d9b1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: NgbXKPOAPAW3xlujVgLxeA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Jiri Denemark <jdenemar@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 02, 2019 at 10:15:12AM +0100, David Hildenbrand wrote:
>=20
> >> Say the user has the option to select a model (zEC12, z13, z14), upper
> >> layers always want to have a model that includes all backported securi=
ty
> >> features. While the host model can do that, CPU definitions can't. You
> >> can't change default models within a QEMU release, or for older releas=
es
> >> (e.g., a z13).
> >>
> >=20
> > This is a good description of the main use case we're worried
> > about in x86 too, and the main reason we have added versioned CPU
> > models.
> >=20
> > I remember I was planning to use `query-cpu-model-expansion` for
> > "please give me the best configuration for this specific CPU
> > model" (which would be very similar to the approach used in this
> > series).  Now, I need to refresh my memory and try to remember
> > why I concluded this approach wouldn't work for x86.
>=20
> I would be interested in that - I don't really think exposing CPU
> versions to the user is necessary here.
>=20
> E.g., you can maintain the versions internally and enable the stored
> features of the fitting one with "recommended-features=3Don...".

I was re-reading some code and threads, and now I remember: the
main obstacle for using query-cpu-model-expansion for CPU model
version resolution in x86 is the fact that the x86 CPU models
aren't static yet.  (type=3Dfull expansion isn't useful for CPU the
use case above; type=3Dstatic expansion requires static CPU models
to be useful)

I was planning to make x86 CPU models static, then I noticed we
do have lots of feature flags that depend on the current
accelerator (set by kvm_default_props) or current machine (set
by compat_props).  This breaks the rules for static CPU models.

We can still try to provide useful static CPU models in x86 in
the future (I want to).  But I don't want to make this an
obstacle for providing a CPU model update mechanism that works
for x86 (which is more urgent).

>=20
> >=20
> >=20
> >>>
> >>> Maybe its just the interface or the name. But I find this very non-in=
tuitive
> >>
> >> I'm open for suggestions.
> >>
> >>>
> >>> e.g. you wrote
> >>>
> >>>     Get the maximum possible feature set (e.g., including deprecated
> >>>     features) for a CPU definition in the configuration ("everything =
that
> >>>     could be enabled"):
> >>>         -cpu z14,all-features=3Doff,available-features=3Don
> >>>
> >>>     Get all valid features for a CPU definition:
> >>>         -cpu z14,all-features=3Don
> >>>
> >>> What is the point of this? It is either the same as the one before, o=
r it wont
> >>> be able to start.=20
> >>
> >> valid !=3D available, all !=3D available. Yes, the model won't run unl=
ess
> >> you are on pretty good HW :)
> >>
> >> Maybe I should just have dropped the last example, as it seems to
> >> confuse people - it's mostly only relevant for introspection via CPU
> >> model expansion.
> >>
> >> I am open for better names. e.g. all-features -> valid-features.
> >=20
> > "all" is not a meaningful name to me.  It surely doesn't mean
> > "all features in the universe", so it means a more specific set
> > of features.  How is that set defined?
> >=20
> > "valid" seems clearer, but we still need a description of what
> > "valid" means exactly.
> >=20
>=20
> So, we have
>=20
> +static S390DynFeatGroupDef s390_dyn_feature_groups[] =3D {
> +    /* "all" corresponds to our "full" definitions */
> +    DYN_FEAT_GROUP_INIT("all-features", ALL, "Features valid for a CPU
> definition"),
> [...]
> +};
>=20
> it includes features that are not available - all features that could
> theoretically be enabled for that CPU definition.
>=20
> (e.g., "vx" was introduced with z13 and cannot be enabled for the z12.
> It's part of the full model of a z13, but not of a z12)

Isn't this something already returned by device-list-properties?

--=20
Eduardo


