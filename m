Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB44359DF1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:51:23 +0200 (CEST)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUpfV-0000wB-VE
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUpaJ-0007o4-L2; Fri, 09 Apr 2021 07:45:59 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:42001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUpaD-0005aG-Oc; Fri, 09 Apr 2021 07:45:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7A0BE16D9;
 Fri,  9 Apr 2021 07:45:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 09 Apr 2021 07:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=cshO2lywy2fINVBLFUAqL5GyjEr
 CYpGGHHl+Xu6CbXE=; b=O4QbiEP1glMkSpHlKqnk7/swQie2oNzO53p1VRcoHIy
 9L7HAnHpqiH6hT7ZfYmbag9CqG6AlMuR1UIY4eLYYf/LWD93/N7vnibfoEwzUWEe
 jCw0ha2FQ4owjHU6DCmAaveautTlASXWx/Q6eYJDEpKbpyhDnIxEOOlQdOZ4B7FD
 25bg+sjitco1FVUzWkWsgOhf+h2Tdw9ROe4vfE2C+9Yk1aH3YvcWEsFdRp6+JAli
 6eSk6MijkGcm7srYJjOBIsg6rp5C4x4uDc9BwykhKYlpSAoypavAyHX2Q+PG1Odh
 z8soN6FM8a1ZF98ELXHJGyY8XQlT42oyavx0PEokEww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cshO2l
 ywy2fINVBLFUAqL5GyjErCYpGGHHl+Xu6CbXE=; b=Vv503lQlZBmfxtIrOwwUxK
 WO0tl3EfBO7GHVf1G+8+Y/PjCEForofiMF61qqsm5+DAk/iLrVYFtqkyEhfHyImH
 ECFy2ePMMokOykKgLchZZGOYIWNLckx4TeEyzzZTD8vKBEpgZ1SiBbP96sRx2Mxz
 CcuRBMlHxT1UhV6JUehzG6B6Hfur56cfY7CuRN5W3JTOEbMlVIzyMM2GUfnphX4o
 Avvx/JBUrI/uxjglhNqot3alRHqlvpEVzSeAxLg4v4u9H1MkowqSyk5anPltX9AM
 3EEdPwJZQzwOwZOUoJdF1kdAdCygsjas+NxsDN+ldsFg3dM4ETY/tg8hiTrVU+2g
 ==
X-ME-Sender: <xms:az5wYPmdUFD1Zg2PyihChFmI5-TFBbwmmHIiVhEZsIs17OhGUdXq4Q>
 <xme:az5wYC0Vw3dUyTZ3mt_tWtejVU266UL7zoG4GF4fuzO8u1Rv864jJQEiNzxde1XZO
 1S4xuDY0WwGQMZsmS4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekuddggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:az5wYFrK8sVYklhzAQsJdmUoNcwjI_tbnTim_cm8AKhY36oP5DATjg>
 <xmx:az5wYHlwCEboX2OZt9O7_sO76vX1MHCRfq6k7BOqIgiTF5PCYyoTng>
 <xmx:az5wYN1ddECLesNwVj5jGbw1QG0BTAlsEPXZlRBb4cyHivJL2e41OA>
 <xmx:bD5wYKlEgFn66MXb3peEUqBe2wjan1wVhQ5M8438hEOWD7fS9aiVAA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9C781080054;
 Fri,  9 Apr 2021 07:45:45 -0400 (EDT)
Date: Fri, 9 Apr 2021 13:45:43 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH 2/2] hw/block/nvme: drain namespaces on sq deletion
Message-ID: <YHA+Z5iu/rwpupPw@apples.localdomain>
References: <20210408193709.435939-1-its@irrelevant.dk>
 <20210408193709.435939-2-its@irrelevant.dk>
 <20210409110954.GE2085@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OkqqjPlS+SzB6Xo3"
Content-Disposition: inline
In-Reply-To: <20210409110954.GE2085@localhost>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OkqqjPlS+SzB6Xo3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Apr  9 20:09, Minwoo Im wrote:
>On 21-04-08 21:37:09, Klaus Jensen wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> For most commands, when issuing an AIO, the BlockAIOCB is stored in the
>> NvmeRequest aiocb pointer when the AIO is issued. The main use of this
>> is cancelling AIOs when deleting submission queues (it is currently not
>> used for Abort).
>>
>> However, some commands like Dataset Management Zone Management Send
>> (zone reset) may involve more than one AIO and here the AIOs are issued
>> without saving a reference to the BlockAIOCB. This is a problem since
>> nvme_del_sq() will attempt to cancel outstanding AIOs, potentially with
>> an invalid BlockAIOCB since the aiocb pointer is not NULL'ed when the
>> request structure is recycled.
>>
>> Fix this by
>>
>>   1. making sure the aiocb pointer is NULL'ed when requests are recycled
>>   2. only attempt to cancel the AIO if the aiocb is non-NULL
>>   3. if any AIOs could not be cancelled, drain all aio as a last resort.
>>
>> Fixes: dc04d25e2f3f ("hw/block/nvme: add support for the format nvm command")
>> Fixes: c94973288cd9 ("hw/block/nvme: add broadcast nsid support flush command")
>> Fixes: e4e430b3d6ba ("hw/block/nvme: add simple copy command")
>> Fixes: 5f5dc4c6a942 ("hw/block/nvme: zero out zones on reset")
>> Fixes: 2605257a26b8 ("hw/block/nvme: add the dataset management command")
>> Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>> Cc: Minwoo Im <minwoo.im@samsung.com>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>>  hw/block/nvme.c | 23 +++++++++++++++++++++--
>>  1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>> index 94bc373260be..3c4297e38a52 100644
>> --- a/hw/block/nvme.c
>> +++ b/hw/block/nvme.c
>> @@ -470,6 +470,7 @@ static void nvme_req_clear(NvmeRequest *req)
>>  {
>>      req->ns = NULL;
>>      req->opaque = NULL;
>> +    req->aiocb = NULL;
>>      memset(&req->cqe, 0x0, sizeof(req->cqe));
>>      req->status = NVME_SUCCESS;
>>  }
>> @@ -3681,6 +3682,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
>>      NvmeSQueue *sq;
>>      NvmeCQueue *cq;
>>      uint16_t qid = le16_to_cpu(c->qid);
>> +    int nsid;
>
>Even we don't have fully supported number of namespaces in this device
>(0xFFFFFFFF), can we have this one with `uint32_t` ?
>

Sure!

>Otherwise, looks good to me.
>
>Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
>

--OkqqjPlS+SzB6Xo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBwPmAACgkQTeGvMW1P
Den2Qgf+JSnYG8epgLq+erl9yaRlKZggfuYWIR6boSwwR8e0gHE+Ogz9WKfTrVb/
n0dTRxCENNcHViHfXVwRZilyVV7yieHImRQCHdFDKTP/mMo1/Vq2+FqKyMoBspMi
QW3ysKoVwDj5IlTBysq/vAA9vGMT0FbWmWvau7I6sY1Pw72y7JeGbeElDtg4FSym
IeQ6yeS1k4NM3OTQT6vA2rZO6a2Cf6BVj/kjsB0K9ZV4nj2UXijdUDwb5dntQ3Is
aJ+2x9dgFkDbaCn0RsWztQNWFlE9+Zm1BB7EIg5PF7NH1SDdxJPDi4n57bkguZbQ
f7PM7lmrPzuITo1OmLa2wi86WKRSzA==
=ciog
-----END PGP SIGNATURE-----

--OkqqjPlS+SzB6Xo3--

