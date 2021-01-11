Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3D32F1408
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:19:49 +0100 (CET)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyx6q-00070x-5m
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyx4g-0005lo-PJ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:17:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyx4c-0004go-PO
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610371050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyiJ+NKj6fZKP0CC+UsY2WFGlECTLqYFGMouHG+leVw=;
 b=Q9UZ7BM/KCHHH1FNKnupQTpa9FZhoXf1LH7ZiuwGWDY3vT9CdOKSUCRu1y/AU7WHYDBDk+
 QqflMijtlgYbvlLgi2+AVwYjNaWTh58nqA1zosrl9xTBK+GlvaS/BBiTl06q+R6pku2wwm
 arohOppGWQP7a29DTq1IQrObhyOzab0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-sw910tZGNQ6xqzvYYk4d8A-1; Mon, 11 Jan 2021 08:17:26 -0500
X-MC-Unique: sw910tZGNQ6xqzvYYk4d8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27568C73A0;
 Mon, 11 Jan 2021 13:17:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E95010016FF;
 Mon, 11 Jan 2021 13:17:25 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D00E918095C7;
 Mon, 11 Jan 2021 13:17:24 +0000 (UTC)
Date: Mon, 11 Jan 2021 08:17:24 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <187831554.32408075.1610371044488.JavaMail.zimbra@redhat.com>
In-Reply-To: <7631e12a-5422-3167-51fd-1e853a119f8f@de.ibm.com>
References: <cover.1610364304.git.mrezanin@redhat.com>
 <e1ad733af7b23929456d05aacae693ce6462d4b3.1610364304.git.mrezanin@redhat.com>
 <5acb5521-fdd2-e511-9cc3-176086183dd5@redhat.com>
 <88c2eb01-f8f5-18d5-6513-57322930cc77@redhat.com>
 <115622555.32388560.1610368920610.JavaMail.zimbra@redhat.com>
 <f4c3ce8c-7688-461b-8ed2-2c8befc561a3@redhat.com>
 <7631e12a-5422-3167-51fd-1e853a119f8f@de.ibm.com>
Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
MIME-Version: 1.0
X-Originating-IP: [10.40.192.93, 10.4.195.18]
Thread-Topic: s390x: Fix vm name copy length
Thread-Index: k9W4vezOLAHOwZj0sNeDip8SXzp80Q==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Christian Borntraeger" <borntraeger@de.ibm.com>
> To: "Thomas Huth" <thuth@redhat.com>, "Miroslav Rezanina" <mrezanin@redha=
t.com>
> Cc: "qemu-s390x" <qemu-s390x@nongnu.org>, "Philippe Mathieu-Daud=C3=A9" <=
philmd@redhat.com>, qemu-devel@nongnu.org
> Sent: Monday, January 11, 2021 2:02:32 PM
> Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
>=20
>=20
>=20
> On 11.01.21 13:54, Thomas Huth wrote:
> > On 11/01/2021 13.42, Miroslav Rezanina wrote:
> >>
> >>
> >> ----- Original Message -----
> >>> From: "Thomas Huth" <thuth@redhat.com>
> >>> To: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>, mrezanin@redha=
t.com,
> >>> qemu-devel@nongnu.org, "qemu-s390x"
> >>> <qemu-s390x@nongnu.org>
> >>> Sent: Monday, January 11, 2021 1:24:57 PM
> >>> Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy lengt=
h
> >>>
> >>> On 11/01/2021 13.10, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>> Hi Miroslav,
> >>>>
> >>>> On 1/11/21 12:30 PM, mrezanin@redhat.com wrote:
> >>>>> From: Miroslav Rezanina <mrezanin@redhat.com>
> >>>>>
> >>>>> There are two cases when vm name is copied but closing \0 can be lo=
st
> >>>>> in case name is too long (>=3D256 characters).
> >>>>>
> >>>>> Updating length to copy so there is space for closing \0.
> >>>>>
> >>>>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> >>>>> ---
> >>>>> =C2=A0=C2=A0 target/s390x/kvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> >>>>> =C2=A0=C2=A0 target/s390x/misc_helper.c | 4 +++-
> >>>>> =C2=A0=C2=A0 2 files changed, 4 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> >>>>> index b8385e6b95..2313b5727e 100644
> >>>>> --- a/target/s390x/kvm.c
> >>>>> +++ b/target/s390x/kvm.c
> >>>>> @@ -1918,7 +1918,7 @@ static void insert_stsi_3_2_2(S390CPU *cpu, _=
_u64
> >>>>> addr, uint8_t ar)
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (qemu_name) {
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncp=
y((char *)sysib.ext_names[0], qemu_name,
> >>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(sysib.ext_names[0]));
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(sysib.ext_names[0]) - 1);
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strcpy=
((char *)sysib.ext_names[0], "KVMguest");
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>>
> >>>> What about using strpadcpy() instead?
> >>>
> >>> Yes, strpadcpy is the better way here - this field has to be padded w=
ith
> >>> zeroes, so doing "- 1" is wrong here.
> >>
> >> Hi Thomas,
> >>
> >> as I wrote in reply to Phillipe - the array is memset to zeroes before=
 the
> >> if so we
> >> are sure it's padded with zeroes (in this occurrence, not true for sec=
ond
> >> one).
> >=20
> > Ok, but dropping the last character is still wrong here. The ext_names =
do
> > not need to be terminated with a \0 if they have the full length.
> The current code is actually correct. We are perfectly fine without the f=
inal
> \n if the string is really 256 bytes.
>=20
> Replacing memset + strncpy with strpadcpy is certainly a good cleanup. Is=
 it
> necessary? No.

Yes, it is necessary because otherwise compiler (GCC 11) produce warning an=
d so
build fail when --enable-werror is used.

Mirek


>=20
>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


