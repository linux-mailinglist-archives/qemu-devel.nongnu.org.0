Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DBC2FCDB5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:03:14 +0100 (CET)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2AKX-0007HX-7S
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2AJG-0006g5-3H
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2AJE-0008RA-94
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611136911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBmn5rXy1sZ9VgaRuqxwboS9UWPASujNK3PF+nhNFlI=;
 b=cwGb12oDT/yeJMJAPEps6QjDNCL7vabz18+fthmyu8EUC1M/0rU73KISRk5gkSkJ3l1CW5
 olyMkOFOV1EzuPEy4ik4BLcGK3vDcnMVnR1nL3oS7puDedsoZHiUBdHzANlD8nbWjN+nPO
 rw5ZvgItEFy5EQYB5ndxPeslzkm4h2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-9Qz1_iIoPlmehkE9FqMFrw-1; Wed, 20 Jan 2021 05:01:46 -0500
X-MC-Unique: 9Qz1_iIoPlmehkE9FqMFrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6131059;
 Wed, 20 Jan 2021 10:01:45 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E84A019CA8;
 Wed, 20 Jan 2021 10:01:39 +0000 (UTC)
Date: Wed, 20 Jan 2021 11:01:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [RFC PATCH 0/2] x86 CPU feature +/- fiddling and +kvm-no-defaults
Message-ID: <20210120110137.1830cec9@redhat.com>
In-Reply-To: <20210119164142.GO2335568@redhat.com>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119162826.GL2335568@redhat.com>
 <20210119163518.GH1227584@habkost.net>
 <20210119164142.GO2335568@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 16:41:42 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Jan 19, 2021 at 11:35:18AM -0500, Eduardo Habkost wrote:
> > On Tue, Jan 19, 2021 at 04:28:26PM +0000, Daniel P. Berrang=C3=A9 wrote=
: =20
> > > On Tue, Jan 19, 2021 at 02:22:05PM +0000, David Edmondson wrote: =20
> > > > Currently "-cpu -feature,+feature" will disable -feature, which see=
ms
> > > > contrary to the intention of the user. Fix this such that the later
> > > > flag wins. There are no changes to the interaction of +/- and =3Don=
/=3Doff. =20
> > >=20
> > > The -feature/+feature syntax is the legacy  way of configuring
> > > features, with feature=3Don|off being the preferred, since that match=
es
> > > the general QEMU standard for boolean properties.
> > >=20
> > > Your proposed change in ordering of + vs - makes conceptual sense, bu=
t
> > > it is none the less a semantic change in behaviour that may well caus=
e
> > > breakage for existing deployed VMs. This impacts guest ABI so could
> > > particularly cause live migration problems.
> > >=20
> > > IOW, we should have implemented it the way you propose in the first
> > > place, but I don't think it is safe to change it now, unless you can
> > > tie that new semantic to a machine type version.
> > >=20
> > > Before we consider that though, Paolo has just deprecated many of the
> > > legacy approaches for boolean properties in this:
> > >=20
> > >   https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg04341.h=
tml
> > >=20
> > > I'm inclined to say that we just follow on from that and finally
> > > deprecate the +feature/-feature CPU syntax which we're already consid=
ering
> > > legacy. This would remove the need to care about changing its behavio=
ur =20
> >=20
> > I believe we had multiple proposal in the past do deprecate
> > +feature/-feature, but there were objections.  I couldn't find
> > the original threads, though. =20
>=20
> Historically libvirt was using +/- syntax, but we finally removed the las=
t
> usage of it in June 2019 / libvirt v5.4.0. So for modern QEMU libvirt wil=
l
> always use =3Don|off.
there are KVM unit tests that used /- syntax, I don't recall any attempt
to switch to canonical syntax.

>=20
> > In either case, I thought we had already deprecated the weird
> > ordering rules of "-feature,+feature". =20
>=20
> Regards,
> Daniel


