Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3500E3A5FB2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:06:40 +0200 (CEST)
Received: from localhost ([::1]:39572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjUM-0001yK-RO
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lsjPs-0000q4-Ox; Mon, 14 Jun 2021 06:02:01 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:35321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lsjPq-0006iK-5v; Mon, 14 Jun 2021 06:02:00 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 06B735C0049;
 Mon, 14 Jun 2021 06:01:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 14 Jun 2021 06:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=KorIcomus2cOa8Yd5fJW0RHw9zT
 YsDXa4TVL1fwyhHQ=; b=hws0PxvS5UYay5WlRGY1/FR6Av4Mq62vy4j4pXFAH29
 N/an6Qv1mAwHOQIUbUtevihZ4Yqkti0oBnTVFlQhB0/iF47Zhm0VHtCS2A3qylk6
 6saSTZLmxXGsDbRiBsH/sfaW5SeijxnrEm4ttQ4sBRnIvAYsh56dSEih2IlGr17/
 fvh8jzPyPBSxQRswpWoJ3q7fUtg46fFDaWarC7HCok+ydoKEfq2xfgQu4EDd2s+0
 5LQOgkenzj1YUB/t1LH9PL8GF/x8yOys3Vyc+ogCZ6PV9LsTUr0SAGnlN5zkc1S6
 RLuB79D3SbnoQx20mbji9xn8I97qqKzbA10QPuRAWDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KorIco
 mus2cOa8Yd5fJW0RHw9zTYsDXa4TVL1fwyhHQ=; b=WOL8R3qxKDV7iBDipLr4RE
 Q/v3qPExn+SYa1yVYl6QvV4zbe/CL1rR4NHavX0o1sh+lNR7PI6LppzHq4yUIrdF
 NnHujin/gDRXSN0KOL28+r7c0Ze+88E2HIkF4PtMn652/6/CYZFTldRmsbo5fjRy
 0KpRI3PCRVSv15zT+lx/YkbqBe9HV/PKxndJLLab2RNvZR+EDIQcSg4idRsUUr9d
 IVf8gDTJ3atBwKGMG6UjvVKhwzXcBzKNdHPyuj2CRVkw4pW/ob8q/n/LHKVvUGqM
 PQ8fIHGEZXRegClGzIQ+Vz7O3fsUTgw5qlwhLXBFPIIebV6HtJzGLYbC4x97fFug
 ==
X-ME-Sender: <xms:DCnHYN2SCRQBevwflagHqxdnX9294y85rvZHbKiazAyz_Bt5GINicQ>
 <xme:DCnHYEEyuHMCI_V-v7tbjpsTdnbOggsspo1PUkWjfLD7ut3Qj-VBfEYBgGg4x56nQ
 axb9iYMEgBhNc7JefU>
X-ME-Received: <xmr:DCnHYN4j4GtUGcBP8QI0uOnlEVaBLCYspjnpQCvNq7KNHsYa_Dp5KXYSLYGVeo7VcaL_HjKXrCIAH7NMznfuByR70UzQu6eGpyrI0by-mX6jPrG13A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtro
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepueeuffeihffggfetheejieevleduhf
 etfffhheeigfehteejieetvddtgedvhedtnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:DCnHYK0lNChr8rwIZwEo0V96VWK6_YEbs55HvXoOrbRMVCE-PBxdqQ>
 <xmx:DCnHYAE9zfU2Dt7tLxXPlSabUp4-j2W45b6BAImKYzwUn4lnzH59mQ>
 <xmx:DCnHYL97BKkaAigLc2RTPwkV3y3yrTVDA-aG7ae3yPVihJ_9yicmvQ>
 <xmx:DinHYL3OBuqj9cUjE_T_SseJLBlecgLExMKo_iZHk4A1IMzPuCY1RA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 06:01:47 -0400 (EDT)
Date: Mon, 14 Jun 2021 12:01:44 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v2 1/2] hw/nvme: fix endianess conversion and add
 controller list
Message-ID: <YMcpCKlhXMpyZbaz@apples.localdomain>
References: <CGME20210601150640epcas5p298805b3669ca8b586d92da31d4742ab0@epcas5p2.samsung.com>
 <20210601150226.5558-1-anaidu.gollu@samsung.com>
 <YMEjGTBNHmsu5RgT@apples.localdomain>
 <20210613115958.GA20730@2030045822>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NwBTru7NG7lBVxKg"
Content-Disposition: inline
In-Reply-To: <20210613115958.GA20730@2030045822>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NwBTru7NG7lBVxKg
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 13 17:29, Gollu Appalanaidu wrote:
>On Wed, Jun 09, 2021 at 10:22:49PM +0200, Klaus Jensen wrote:
>>On Jun  1 20:32, Gollu Appalanaidu wrote:
>>>Add the controller identifiers list CNS 0x13, available list of ctrls
>>>in NVM Subsystem that may or may not be attached to namespaces.
>>>
>>>In Identify Ctrl List of the CNS 0x12 and 0x13 no endian conversion
>>>for the nsid field.
>>>
>>>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>>
>>>-v2:
>>>Fix the review comments from Klaus and squashed 2nd commit into
>>>1st commit
>>>
>>>---
>>>hw/nvme/ctrl.c       | 26 ++++++++++++++++----------
>>>hw/nvme/trace-events |  2 +-
>>>include/block/nvme.h |  1 +
>>>3 files changed, 18 insertions(+), 11 deletions(-)
>>>
>>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>>index 2e7498a73e..813a72c655 100644
>>>--- a/hw/nvme/ctrl.c
>>>+++ b/hw/nvme/ctrl.c
>>>@@ -4251,9 +4251,11 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, Nvm=
eRequest *req, bool active)
>>>   return NVME_INVALID_CMD_SET | NVME_DNR;
>>>}
>>>
>>>-static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest=
 *req)
>>>+static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
>>>+                                        bool attached)
>>>{
>>>   NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>>>+    uint32_t nsid =3D le32_to_cpu(c->nsid);
>>>   uint16_t min_id =3D le16_to_cpu(c->ctrlid);
>>>   uint16_t list[NVME_CONTROLLER_LIST_SIZE] =3D {};
>>>   uint16_t *ids =3D &list[1];
>>>@@ -4261,15 +4263,17 @@ static uint16_t nvme_identify_ns_attached_list(N=
vmeCtrl *n, NvmeRequest *req)
>>>   NvmeCtrl *ctrl;
>>>   int cntlid, nr_ids =3D 0;
>>>
>>>-    trace_pci_nvme_identify_ns_attached_list(min_id);
>>>+    trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
>>>
>>>-    if (c->nsid =3D=3D NVME_NSID_BROADCAST) {
>>>-        return NVME_INVALID_FIELD | NVME_DNR;
>>>-    }
>>>+    if (attached) {
>>>+        if (nsid =3D=3D NVME_NSID_BROADCAST) {
>>>+            return NVME_INVALID_FIELD | NVME_DNR;
>>>+        }
>>>
>>>-    ns =3D nvme_subsys_ns(n->subsys, c->nsid);
>>>-    if (!ns) {
>>>-        return NVME_INVALID_FIELD | NVME_DNR;
>>>+        ns =3D nvme_subsys_ns(n->subsys, nsid);
>>>+        if (!ns) {
>>>+            return NVME_INVALID_FIELD | NVME_DNR;
>>>+        }
>>>   }
>>>
>>>   for (cntlid =3D min_id; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid=
++) {
>>
>>Assume that `attached` is false and `n->subsys` is NULL.
>>
>>KABOOOOM :)
>
>This scenario has been tested but executed without any issue, since here
>ARRAY_SIZE calculating size as per the "NVME_MAX_CONTROLLERS" defined.
>

Yes, I realized this was compile-time, but still surprising behavior and=20
not intended ;)

>These two CNS values shows affect when there exists a Subsystem. will add
>check condition if there is no Subsystem will return invalid field in comm=
and.
>
>if (!n->subsys) {
>	return NVME_INVALID_FIELD | NVME_DNR;
>}
>

Sounds good.

--NwBTru7NG7lBVxKg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDHKQUACgkQTeGvMW1P
DenPEAf9GuJcXlxlAEQr6RwmHRDcQsTaE2rqi2cvoJEbcMewlcA27lVeYBA+Utvl
wXHLx095CiF6paDRAd/Yo9IvkTQ5IbYdVeYL3GqlGyGBi69yJqhP5nak3lIsGe50
JCZdyf1QW4GVON4E01S0vKBgwJl5czAnIeRxzTKSjz1A8MEjDuqp9pGFTmeU7BfX
8/NUzxR96NDk31q1YKLAMGZh6ernj7gb3l48PTkTkphGZ5kN/BlOCAxY4OoKgRJP
Fw4FmZyaNLYQSzvskmVAxUn9Di4p/2NNktUKMq/2hf1mouajK6FRo3YyXHf1L/L5
Mii4+iRztBZFGlmLmSfyn6TUgMLJMg==
=fatr
-----END PGP SIGNATURE-----

--NwBTru7NG7lBVxKg--

