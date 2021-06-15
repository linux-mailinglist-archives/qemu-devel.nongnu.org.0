Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0C93A78EF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:19:23 +0200 (CEST)
Received: from localhost ([::1]:51104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt4I5-0004Hi-Uw
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lt4Bw-0002fc-Mh; Tue, 15 Jun 2021 04:13:00 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lt4Bt-0000HF-PK; Tue, 15 Jun 2021 04:13:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DF88D5C009A;
 Tue, 15 Jun 2021 04:12:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 15 Jun 2021 04:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=1Wf3oiT2gaX6RBdT3s5CJkleMhT
 SisdUP7a70F1Co1Q=; b=YwmAsnDpOXsI4n+fJKrOmwkwhr+KQpoKHJJcU1HG352
 BVL6gnyW3GNvJvszMMZZoogP+ciEhQQb1JNtwtUGOFD/j5g1KQUjiqP3y6GXEWu2
 O5UE1zr7rLyYndoC7+m+aX2D4CU5iiLQL4/WDlHxBBhmUcOkmX7KmuelL+CE+Zik
 Z1cAETN/Egi8Xnt+c4DsTNgHafjMjlAWq/UO75cbsPDvYcA0vVqUdJSTn0kzbkHw
 zBRDOrfCQZ7QE13ZUBiG/OLqqpdZiG/kkpAQGdjsrPtW3M1DtvEdN4d6ILn/lqtM
 glnNp0hPVp4WG/T/aDPCE/d1BH9MyoO7+KAkKY1KVzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1Wf3oi
 T2gaX6RBdT3s5CJkleMhTSisdUP7a70F1Co1Q=; b=HGPnWqgQYIKpYOR6fHeE6V
 ipq0DAPBKmPoBo8+eHxyAY2TfLqmrmvZjylhsVsC2+Bo5nrT60GFDte1w9aLiq3y
 eHxq6MwiIsaTXIq0ePyEWtiIZgrP1GUnlb0sGtcX+/9j1RfXESrwXdsKNhnKrKl8
 HZqTAZvlatPoLlZpYMvZWZKO0RlTM4Y0eliw/tb3RuyVFNuDp1g9B6IDx2EQZcH7
 Vx9xx4ZcfrTKFJIzlW6XZbHIfIda24usdWfosXvVOv/qzk7ICqrX1ldIYDYE2DES
 aHYsMM17aBJAWgr8avAZdvjHkRVoqgXWnAVLAjeNMHg1ZRGRfT/f+MrktE7IbMsA
 ==
X-ME-Sender: <xms:BmHIYLQP8GtOrTD5RyRH4xxMN-KlIG57xtFDGU-OCrAxH5wtoMEyOw>
 <xme:BmHIYMyDOH3mKizLoQuLt_mmoS6bTrCiK0yfbe89gH3_8X0bzqttA6WmnyVfMAnzZ
 nbA9KjRdRKTzhfzgXM>
X-ME-Received: <xmr:BmHIYA2-6XY34Wu3TGv5MNUnKe972_jJhb49YPIMKFyWoS5QJraY9X-_9kQrZMUtqOoJaUBeMXA4HB6lIPoWL2ZPnoheeYz2xXBU1HtAQjgKPRpQ3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedviedgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepheevffekffevuddugfdvudfhjeffveefgedvhfejvdevheetheffveetgfel
 uddtnecuffhomhgrihhnpegtthhrlhdrtgifnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BmHIYLAFJWFxGS6NlR94X-7gb2IfDOGdGxKTO_01LcK1irU15DIZEQ>
 <xmx:BmHIYEhQY7pIlepGexYyRWq8Sw8_UV8m0yxHrGTbh8nf53HNIwiRww>
 <xmx:BmHIYPp6sIlvhorExE9ythfs_WKPlHYMjIekkPpWxXD68fJBd55bBA>
 <xmx:B2HIYNuF6020FHF07Jzkk3hGUgsmltWSOjRvfJyFOq_RTmBHOv_TVg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 04:12:54 -0400 (EDT)
Date: Tue, 15 Jun 2021 10:12:51 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jakub =?utf-8?B?SmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>
Subject: Re: [PATCH v2] hw/nvme: be more careful when deasserting IRQs
Message-ID: <YMhhA7Vc1cl+XTI1@apples.localdomain>
References: <20210614135429.56475-1-jakub.jermar@kernkonzept.com>
 <YMedu0Ry1YKJ/2SV@apples.localdomain>
 <ca7fc845-47e9-e122-e4c5-128761a0f2aa@kernkonzept.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pPITjm7JR/4nCjz5"
Content-Disposition: inline
In-Reply-To: <ca7fc845-47e9-e122-e4c5-128761a0f2aa@kernkonzept.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pPITjm7JR/4nCjz5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 15 09:42, Jakub Jerm=C3=A1=C5=99 wrote:
>On 6/14/21 8:19 PM, Klaus Jensen wrote:
>>On Jun 14 15:54, Jakub Jerm=C3=A1=C5=99 wrote:
>>>An IRQ vector used by a completion queue cannot be deasserted without
>>>first checking if the same vector does not need to stay asserted for
>>>some other completion queue. To this end the controller structure is
>>>extended by a counter of asserted completion queues.
>>>
>>>To prevent incrementing the counter for completion queues that are
>>>asserted repeatedly, each completion queue is extended by a flag which
>>>tells whether the queue is currently asserted.
>>>
>>
>>I wasn't clear on this on my last review, but the misunderstanding=20
>>here is that the completion queue vector somehow matters for=20
>>pin-based interrupts - it does not. There is only *one* interrupt=20
>>vector and if the controller is not using MSI-X, then the Interrupt=20
>>Vector (IV) field of the Create I/O Completion Queue command *must*=20
>>be zero.
>>
>>In other words, all that matters is if there are one or more CQEs=20
>>posted (in any queue).
>
>Ah, my bad. I got confused by the assert(vector < 32).
>
>>Would this (untested) patch do the trick?
>
>It works for my testcase, but I am not sure this will work when=20
>deassert is called when the IRQ is not necessarily asserted, such as=20
>in nvme_del_cq.
>

You are right, I think it needs a check on cq->tail !=3D cq->head before=20
decrementing cq_pending.

>Jakub
>
>>diff --git i/hw/nvme/nvme.h w/hw/nvme/nvme.h
>>index 93a7e0e5380e..60250b579464 100644
>>--- i/hw/nvme/nvme.h
>>+++ w/hw/nvme/nvme.h
>>@@ -405,6 +405,7 @@ typedef struct NvmeCtrl {
>> =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=A0 max_q_ents;
>> =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t=C2=A0=C2=A0=C2=A0=C2=A0 outstanding_aer=
s;
>> =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=A0 irq_status;
>>+=C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
q_pending;
>> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=C2=A0 host_timestamp;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* Timestamp sent=20
>>by the host */
>> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=C2=A0 timestamp_set_qemu_c=
lock_ms;=C2=A0=C2=A0=C2=A0 /* QEMU clock time */
>> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=C2=A0 starttime_ms;
>>diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
>>index 7dea64b72e6a..4de4b3177463 100644
>>--- i/hw/nvme/ctrl.c
>>+++ w/hw/nvme/ctrl.c
>>@@ -473,6 +473,10 @@ static void nvme_irq_deassert(NvmeCtrl *n,=20
>>NvmeCQueue *cq)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 assert(cq->vector < 32);
>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (-=
-(n->cq_pending)) {
>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return;
>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 n->irq_status &=3D ~(1 << cq->vector);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 nvme_irq_check(n);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>@@ -1258,6 +1262,7 @@ static void nvme_post_cqes(void *opaque)
>> =C2=A0=C2=A0=C2=A0=C2=A0 NvmeCQueue *cq =3D opaque;
>> =C2=A0=C2=A0=C2=A0=C2=A0 NvmeCtrl *n =3D cq->ctrl;
>> =C2=A0=C2=A0=C2=A0=C2=A0 NvmeRequest *req, *next;
>>+=C2=A0=C2=A0=C2=A0 bool empty =3D cq->head =3D=3D cq->tail;
>> =C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, =
next) {
>>@@ -1287,6 +1292,10 @@ static void nvme_post_cqes(void *opaque)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QTAILQ_INSERT_TAIL(&sq-=
>req_list, req, entry);
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (cq->tail !=3D cq->head) {
>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (empty) {
>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n->cq=
_pending++;
>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvme_irq_assert(n, cq);
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0}
>>
>>
>>>Signed-off-by: Jakub Jermar <jakub.jermar@kernkonzept.com>
>>>---
>>>hw/nvme/ctrl.c | 22 ++++++++++++++++------
>>>hw/nvme/nvme.h |=C2=A0 2 ++
>>>2 files changed, 18 insertions(+), 6 deletions(-)
>>>
>>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>>index 0bcaf7192f..97a5d768ee 100644
>>>--- a/hw/nvme/ctrl.c
>>>+++ b/hw/nvme/ctrl.c
>>>@@ -451,9 +451,13 @@ static void nvme_irq_assert(NvmeCtrl *n,=20
>>>NvmeCQueue *cq)
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msix_=
notify(&(n->parent_obj), cq->vector);
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace=
_pci_nvme_irq_pin();
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asse=
rt(cq->vector < 32);
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n->i=
rq_status |=3D 1 << cq->vector;
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvme=
_irq_check(n);
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
!cq->irq_asserted) {
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cq->irq_asserted =3D true;
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 assert(cq->vector < 32);
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 n->irq_asserted_cnt[cq->vector]++;
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 n->irq_status |=3D 1 << cq->vector;
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 nvme_irq_check(n);
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>=C2=A0=C2=A0=C2=A0 } else {
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_pci_nvme_irq_masked();
>>>@@ -466,9 +470,15 @@ static void nvme_irq_deassert(NvmeCtrl *n,=20
>>>NvmeCQueue *cq)
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (msix_enabled(&(n->parent_=
obj))) {
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n;
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asse=
rt(cq->vector < 32);
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n->i=
rq_status &=3D ~(1 << cq->vector);
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvme=
_irq_check(n);
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
cq->irq_asserted) {
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cq->irq_asserted =3D false;
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 assert(cq->vector < 32);
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 assert(n->irq_asserted_cnt[cq->vector]);
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (n->irq_asserted_cnt[cq->vector]-- =3D=3D 1) {
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n->irq_status &=3D ~(1 << cq-=
>vector);
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 nvme_irq_check(n);
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>=C2=A0=C2=A0=C2=A0 }
>>>}
>>>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>>>index 81a35cda14..753bf7a923 100644
>>>--- a/hw/nvme/nvme.h
>>>+++ b/hw/nvme/nvme.h
>>>@@ -352,6 +352,7 @@ typedef struct NvmeCQueue {
>>>=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=A0 head;
>>>=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=A0 tail;
>>>=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=A0 vector;
>>>+=C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_a=
sserted;
>>>=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=A0 size;
>>>=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=C2=A0 dma_addr;
>>>=C2=A0=C2=A0=C2=A0 QEMUTimer=C2=A0=C2=A0 *timer;
>>>@@ -404,6 +405,7 @@ typedef struct NvmeCtrl {
>>>=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=A0 max_q_ents;
>>>=C2=A0=C2=A0=C2=A0 uint8_t=C2=A0=C2=A0=C2=A0=C2=A0 outstanding_aers;
>>>=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=A0 irq_status;
>>>+=C2=A0=C2=A0=C2=A0 uint16_t=C2=A0=C2=A0=C2=A0 irq_asserted_cnt[32];
>>>=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=C2=A0 host_timestamp;=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* Timestamp sent=20
>>>by the host */
>>>=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=C2=A0 timestamp_set_qemu_clock_m=
s;=C2=A0=C2=A0=C2=A0 /* QEMU clock time */
>>>=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=C2=A0 starttime_ms;
>>>--=20
>>>2.31.1
>>>
>>>
>>
>
>

--=20
One of us - No more doubt, silence or taboo about mental illness.

--pPITjm7JR/4nCjz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDIYP8ACgkQTeGvMW1P
DemQHgf9EgncnG1m4JnLEkxvkZ0N2Po1KKsGJnluOoMlY9X26yGB3VzWdEO1k1xN
vyfTgfiSMswDdXRp9C0hVp1j/LFsyedrrLlUZU9A3WlZ3r1nyyC5eUh/4NHwh322
vtCm1r72DrjMmUXvrs7Bix6Ff/5D9ENh6XvStySsaVvkP1C3pXOVaG2NIwwqunaF
o9XS51c5NOs2lWSkgRKMYoWvz4JAhymEsM1DJUzj6UeJZf0B2snxcbDDB2/7wuh8
nKLKUYQfW2SX+2rHcqQofu8rYQDZqj1bLjWAGxii0D3jlkKtJImPKgmU9oe8j9aq
uAi5zD1nPUV4H5E4X6gdTZcAtn52Qg==
=YsHZ
-----END PGP SIGNATURE-----

--pPITjm7JR/4nCjz5--

