Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D852FD990
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:26:27 +0100 (CET)
Received: from localhost ([::1]:56096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2J7a-0007Ju-TF
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2J3K-0005Vb-C7
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:22:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2J3G-00014I-Ey
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611170517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BSCpKHfLAydbAnxQl7cCLwAXEcfsqT2AFdr9/w+ijC4=;
 b=bUBwkq4AGCbuYsg1lfky1vVL6Dp1z5YY1/t2arhMYaw8qwJ9ZkriKYPJCkoRet+9q1XWQL
 ldlxNj6ZiqGEaU2GD4hJcqw74U/pfTdUdmjszAduHh8Ws/lOBW4uCPzLNcpRCWykMKwHxA
 9vIc3jZrmnTcgvbrwXdHmXMC0AJm33c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-27bHl-YyMP-fOdKcWJOt4Q-1; Wed, 20 Jan 2021 14:21:43 -0500
X-MC-Unique: 27bHl-YyMP-fOdKcWJOt4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25502107ACE3;
 Wed, 20 Jan 2021 19:21:42 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB8BD71C85;
 Wed, 20 Jan 2021 19:21:36 +0000 (UTC)
Date: Wed, 20 Jan 2021 20:21:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [RFC PATCH 1/2] hw/i386: -cpu model,-feature,+feature should
 enable feature
Message-ID: <20210120202134.4e0c4523@redhat.com>
In-Reply-To: <20210120161801.GP1227584@habkost.net>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
 <20210119152056.GE1227584@habkost.net> <cuna6t499ir.fsf@dme.org>
 <20210119163052.GG1227584@habkost.net>
 <20210120100803.GF3015589@redhat.com> <cuny2gn7vzz.fsf@dme.org>
 <20210120161801.GP1227584@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Edmondson <dme@dme.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 11:18:01 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, Jan 20, 2021 at 10:17:36AM +0000, David Edmondson wrote:
> > On Wednesday, 2021-01-20 at 10:08:03 GMT, Daniel P. Berrang=C3=A9 wrote=
:
> >  =20
> > > On Tue, Jan 19, 2021 at 11:30:52AM -0500, Eduardo Habkost wrote: =20
> > >> On Tue, Jan 19, 2021 at 04:27:56PM +0000, David Edmondson wrote: =20
> > >> > On Tuesday, 2021-01-19 at 10:20:56 -05, Eduardo Habkost wrote:
> > >> >  =20
> > >> > > Hi,
> > >> > >
> > >> > > Thanks for the patch.  Getting rid of special -feature/+feature
> > >> > > behavior was in our TODO list for a long time.
> > >> > >
> > >> > > On Tue, Jan 19, 2021 at 02:22:06PM +0000, David Edmondson wrote:=
 =20
> > >> > >> "Minus" features are applied after "plus" features, so ensure t=
hat a
> > >> > >> later "plus" feature causes an earlier "minus" feature to be re=
moved.
> > >> > >>=20
> > >> > >> This has no effect on the existing "-feature,feature=3Don" back=
ward
> > >> > >> compatibility code (which warns and turns the feature off). =20
> > >> > >
> > >> > > If we are changing behavior, why not change behavior of
> > >> > > "-feature,feature=3Don" at the same time?  This would allow us t=
o
> > >> > > get rid of plus_features/minus_features completely and just make
> > >> > > +feature/-feature synonyms to feature=3Don/feature=3Doff. =20
> > >> >=20
> > >> > Okay, I'll do that.
> > >> >=20
> > >> > Given that there have been warnings associated with
> > >> > "-feature,feature=3Don" for a while, changing that behaviour seems
> > >> > acceptable.
> > >> >=20
> > >> > Would the same be true for changing "-feature,+feature"? (i.e. wha=
t this
> > >> > patch does) Really: can this just be changed, or does there have t=
o be
> > >> > some period where the behaviour stays the same with a warning? =20
> > >>=20
> > >> I actually expected warnings to be triggered when using
> > >> "-feature,+feature" as well.  If we were not generating warnings
> > >> for that case, it will need more careful evaluation, just to be
> > >> sure it's safe.  Igor, do you remember the details here? =20
> > >
> > > Where are you expecting warnings ? I don't see any when launching QEM=
U =20
> >=20
> > qemu-system-x86_64 -display none -cpu Westmere,-vmx,+vmx
> >=20
> > Warnings because the result of this is "-vmx".
> >  =20
> > > IMHO just leave the parsing unchanged, deprecate it, and then delete
> > > the code.  We don't need to "improve" usability semantics of somethin=
g
> > > that we want to delete anyway. =20
> >=20
> > /me nods. =20
>=20
> I agree, but I guess we need to convince Paolo:
> https://lore.kernel.org/qemu-devel/1990888058.22417362.1465939000140.Java=
Mail.zimbra@redhat.com/
that's ancient :)

He recently started this revolution himself :)
https://www.mail-archive.com/qemu-devel@nongnu.org/msg757280.html

That's why I have -cpu +/-foo deprecation on my not too far away TODO list.


