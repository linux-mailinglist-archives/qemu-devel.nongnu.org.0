Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5D2F12AB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:59:17 +0100 (CET)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywmy-0002C5-6T
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:59:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kywSW-0005SU-Hs
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kywST-0007Vm-4v
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610368682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NhrZQ8CeR701Xf2prTYoUkC4bvjutfohkq6TklGKGIc=;
 b=a3bx2Tk97OSc9pli8KQTQPCN/CXgF78ifq1Gwe9yYH6oUnaL+NRSJhtFOKsJKelLglc5FU
 bJf/67WEh6LZeOlXGgrLdn02cnlcZ7OVtunMNSkswzdsjhtSEj/92JWWPzWAzGVvJOm1Gm
 +ohvHV3dejd988+Ea2baG3VOCH5QBLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-xD49ArU3MqSJVxliTKUvmg-1; Mon, 11 Jan 2021 07:38:00 -0500
X-MC-Unique: xD49ArU3MqSJVxliTKUvmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20FA8100C601
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 12:37:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 190CD1349A
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 12:37:59 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E931318095C7;
 Mon, 11 Jan 2021 12:37:58 +0000 (UTC)
Date: Mon, 11 Jan 2021 07:37:58 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <379455623.32388376.1610368678443.JavaMail.zimbra@redhat.com>
In-Reply-To: <5acb5521-fdd2-e511-9cc3-176086183dd5@redhat.com>
References: <cover.1610364304.git.mrezanin@redhat.com>
 <e1ad733af7b23929456d05aacae693ce6462d4b3.1610364304.git.mrezanin@redhat.com>
 <5acb5521-fdd2-e511-9cc3-176086183dd5@redhat.com>
Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
MIME-Version: 1.0
X-Originating-IP: [10.40.192.93, 10.4.195.25]
Thread-Topic: s390x: Fix vm name copy length
Thread-Index: ZN616bK1A8UxRKsrV7p3folxnetS5Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> To: mrezanin@redhat.com, qemu-devel@nongnu.org
> Sent: Monday, January 11, 2021 1:10:07 PM
> Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
>=20
> Hi Miroslav,
>=20
> On 1/11/21 12:30 PM, mrezanin@redhat.com wrote:
> > From: Miroslav Rezanina <mrezanin@redhat.com>
> >=20
> > There are two cases when vm name is copied but closing \0 can be lost
> > in case name is too long (>=3D256 characters).
> >=20
> > Updating length to copy so there is space for closing \0.
> >=20
> > Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> > ---
> >  target/s390x/kvm.c         | 2 +-
> >  target/s390x/misc_helper.c | 4 +++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> > index b8385e6b95..2313b5727e 100644
> > --- a/target/s390x/kvm.c
> > +++ b/target/s390x/kvm.c
> > @@ -1918,7 +1918,7 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64
> > addr, uint8_t ar)
> >       */
> >      if (qemu_name) {
> >          strncpy((char *)sysib.ext_names[0], qemu_name,
> > -                sizeof(sysib.ext_names[0]));
> > +                sizeof(sysib.ext_names[0]) - 1);
> >      } else {
> >          strcpy((char *)sysib.ext_names[0], "KVMguest");
> >      }
>=20
> What about using strpadcpy() instead?
>=20
>     strpadcpy((char *)sysib.sysib_322.ext_names[0],
>               sizeof(sysib.sysib_322.ext_names[0]),
>               qemu_name ?: "KVMguest", '\0');

Hi Philippe,=20

I went with -1 here because code use memset to 0 few lines above this code,=
 so
we now there are only zeroes in the array and we do not have to write them =
again.

>=20
> > diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
> > index 58dbc023eb..7c478b9e58 100644
> > --- a/target/s390x/misc_helper.c
> > +++ b/target/s390x/misc_helper.c
> > @@ -369,8 +369,10 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t=
 a0,
> > uint64_t r0, uint64_t r1)
> >                  ebcdic_put(sysib.sysib_322.vm[0].name, qemu_name,
> >                             MIN(sizeof(sysib.sysib_322.vm[0].name),
> >                                 strlen(qemu_name)));
> > +=09=09memset((char *)sysib.sysib_322.ext_names[0], 0,
> > +=09=09       sizeof(sysib.sysib_322.ext_names[0]));
> >                  strncpy((char *)sysib.sysib_322.ext_names[0], qemu_nam=
e,
> > -                        sizeof(sysib.sysib_322.ext_names[0]));
> > +                        sizeof(sysib.sysib_322.ext_names[0]) - 1);
>=20
> And here:
>=20
>                strpadcpy((char *)sysib.sysib_322.ext_names[0],
>                          sizeof(sysib.sysib_322.ext_names[0]),
>                          qemu_name, '\0');

However, here we are adding memset so using strpadcpy is better choice to
ensure we have \0 after name string.

Mirek

>=20
> >              } else {
> >                  ebcdic_put(sysib.sysib_322.vm[0].name, "TCGguest", 8);
> >                  strcpy((char *)sysib.sysib_322.ext_names[0], "TCGguest=
");
> >=20
>=20
>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


