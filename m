Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C4C3B8666
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:42:15 +0200 (CEST)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycLu-0004w0-OW
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lycCO-0005Ez-H3
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lycCB-0005BM-A5
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625067129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q599SNYrr7ylFlIhU39v4SKlAWzNIJqoWPB48Ok/WB4=;
 b=H1bfaHV8AQR3uwzech5tycfofptxPGZAdki0pMtqiAlWY7iVBBHJvU3GXJyAtWltclqugm
 n2MHUGMAhtGWZj3vYjsdooTPmk8P76pVhdFUGtza4PZCsjtm+ngjh760njzNhIUvnIPHAV
 vma2Vy2LRC0JJLtTQRgrrfiB97ktd+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-6CLzQbaXMNG3OPQNY1H0DQ-1; Wed, 30 Jun 2021 11:32:08 -0400
X-MC-Unique: 6CLzQbaXMNG3OPQNY1H0DQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9204A800D62;
 Wed, 30 Jun 2021 15:32:06 +0000 (UTC)
Received: from localhost (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3405B19D9B;
 Wed, 30 Jun 2021 15:32:05 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>, David Hildenbrand
 <david@redhat.com>
Subject: Re: [PATCH 1/1] s390x/cpumodel: add 3931 and 3932
In-Reply-To: <7cd6fb75-521b-e970-4f25-b23722765bf9@de.ibm.com>
Organization: Red Hat GmbH
References: <20210622201923.150205-1-borntraeger@de.ibm.com>
 <20210622201923.150205-2-borntraeger@de.ibm.com>
 <b584eb80-ceac-9188-11a2-c4a86388ac1e@redhat.com>
 <7cd6fb75-521b-e970-4f25-b23722765bf9@de.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 30 Jun 2021 17:32:04 +0200
Message-ID: <8735szl66j.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30 2021, Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 30.06.21 15:32, David Hildenbrand wrote:
>> On 22.06.21 22:19, Christian Borntraeger wrote:
>>> This defines 5 new facilities and the new 3931 and 3932 machines.
>>> As before the name is not yet known and we do use gen16a and gen16b.
>>> The new features are part of the full model.
>>>
>>> The default model is still empty (same as z15) and will be added
>>> in a separate patch at a later point in time.
>>>
>>> Also add the dependencies of new facilities and as a fix for z15 add
>>> a dependency from S390_FEAT_VECTOR_PACKED_DECIMAL_ENH to
>>> S390_VECTOR_PACKED_DECIMAL.
>>>
>>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>>> ---
>>> =C2=A0 target/s390x/cpu_features_def.h.inc |=C2=A0 5 +++++
>>> =C2=A0 target/s390x/cpu_models.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++++
>>> =C2=A0 target/s390x/gen-features.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 14 ++++++++++++++
>>> =C2=A0 3 files changed, 25 insertions(+)
>>>
>>> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_fea=
tures_def.h.inc
>>> index 7db3449e0434..c71caee74411 100644
>>> --- a/target/s390x/cpu_features_def.h.inc
>>> +++ b/target/s390x/cpu_features_def.h.inc
>>> @@ -109,6 +109,11 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH, "vxpdeh", STFL=
, 152, "Vector-Packed-Decimal-
>>> =C2=A0 DEF_FEAT(MSA_EXT_9, "msa9-base", STFL, 155, "Message-security-as=
sist-extension-9 facility (excluding subfunctions)")
>>> =C2=A0 DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
>>> =C2=A0 DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
>>> +DEF_FEAT(NNPA, "nnpa", STFL, 165, "NNPA facility")
>>> +DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Pac=
ked-Decimal-Enhancement facility 2")
>>> +DEF_FEAT(BEAR, "bear", STFL, 193, "BEAR-enhancement facility")
>>=20
>> Usually we use "eh" for enhancement. Which would result in "beareh" or a=
lternatively "beh". But maybe the "enhancement" part is not actually an enh=
ancement, but instead this facility is more like the etoken or unpack facil=
ity ...
>
> There was no bear facility (I think it was part of PER3).
> beareh or beh would be fine with me.
>
>>=20
>>> +DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
>>> +DEF_FEAT(ACTIVITY, "activity", STFL, 196, "Processor-Activity-Instrume=
ntation facility")
>>=20
>> Would "pai" be a more appropriate feature name?
>
> pai would be ok for me as well.
>
> Conny, do you want to replace "activity" with "pai" and "bear" with "bear=
eh" in your tree?

I can certainly edit this to a naming everyone agrees with (no strong
opinions from my side).

[Although I rather like large animals in cpu facilities 8)]


