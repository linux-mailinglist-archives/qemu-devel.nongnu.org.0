Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1601233D55B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:03:24 +0100 (CET)
Received: from localhost ([::1]:33292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAI7-0000l1-4n
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lMAGl-0000Gk-1U
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:01:59 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lMAGh-0005Lm-No
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:01:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0E8695C0042;
 Tue, 16 Mar 2021 10:01:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 16 Mar 2021 10:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knazarov.com; h=
 content-type:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to; s=fm2; bh=A
 3YrfiIW5EiLYpOqkspHuVLDxoMhglsQOHVkiSz3c6s=; b=SoqgwQpwuV4IOzczw
 NTeHme98IzPANvPOwdwfLsDm6YOzbC591fFAnGJei3cHL8Hu8EytwpEBI9Cbzoyt
 IiTXTSR5OwXNc9QQV3Y8/oFOHGAnxGsMXStNjqhJfp/e+aGLGlx9Aw0y5SQu6xrF
 8DxR8u7GjcCCiMjvTDazmGBrgKY4AXYTnUaksNZDHVM1opiY2X3LwcaccuxWOQtB
 i3lCGGy/wXNpRkW5Kqssdc0bEoXifORSqeDf6ddjpx74E2plcw5N8Cc33HgM2NoF
 1q0BNQE/Il+pe2vaI84cCmE5P7gNYaYjhdfUzdRE0S34LOCpMgGvbToNsU8HDFWc
 ViTBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=A3YrfiIW5EiLYpOqkspHuVLDxoMhglsQOHVkiSz3c
 6s=; b=wnfSjkgo+MAYlBvNyCXJPfiduYtwxCuQ7OTMVw5H1jTeYhRw1WlmTSnWp
 u50lsPhEu8YD0tcm6yrDliGKIMMzPDH1en+cGIKdRGxqSzuSD2nWEwac+IwRUes+
 kuyC2uhQoR2iQHl0E7O6ydR6JnYkYnKYU//3oWwzmpzMlS4qarmgItQLTPdURutS
 FKahlE9DLQyS2zVg4ftYWLQWM+BVsvjpte3lOhh/ytrSIrb2WK00nJSAqDKzXAed
 Gk9+1exwR6gql4ad0BjSRtYAl6Hy3u4zuZeLEh5qLGgavbETRrmtyWKWIokVDQIr
 bPRVRMZbY7NrNjnS3amTYyZXDmf0A==
X-ME-Sender: <xms:ULpQYNU__kdmsVzTT4FDiYJtSt6r_nzEUjfJfws-EzzCSov21wle2Q>
 <xme:ULpQYNmn7OpawfJjWqlkJnM7GPAp9fEf5RZJnjID2s-KPKzM2xsfgNgzMewlk5W-a
 vtw7wcWE8Yzjqqz1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffgffkfhfvofesthhqmhdthhdtvdenucfhrhhomhepfdhmrghi
 lheskhhnrgiirghrohhvrdgtohhmfdcuoehmrghilheskhhnrgiirghrohhvrdgtohhmqe
 enucggtffrrghtthgvrhhnpeevheeigfduheeuuedthfdtuddvtdegvdeikeeugeejvdeu
 vdekleffvdejleeufeenucfkphepuddtledrvdehvddruddtjedrleenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilheskhhnrgiirghr
 ohhvrdgtohhm
X-ME-Proxy: <xmx:ULpQYJbF_Ib-LaImseaVBvmrlNPry4vQudF9pz9v6rn29RkXTRnrOA>
 <xmx:ULpQYAVRUBII5-qf6I24jM3jZzEvlhNg7TfW5M-E3xC4BDJq7_h7tw>
 <xmx:ULpQYHnB3DcIFuJbv2WqNn3tuKz3OKhAIdQJ9_YiVFJgEYtBvaxCpw>
 <xmx:UbpQYGu_SEbrVsShLxcrpgbCO5OAALjhMl6uopzZtp6ICrNa4bZlIQ>
Received: from pin.lan (unknown [109.252.107.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0BC53108006A;
 Tue, 16 Mar 2021 10:01:51 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v3 1/3] edid: move timing generation into a separate
 function
From: "mail@knazarov.com" <mail@knazarov.com>
In-Reply-To: <20210316133228.ew4j6f5yoxds4iyy@sirius.home.kraxel.org>
Date: Tue, 16 Mar 2021 17:01:50 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <593A5DAE-F6DE-4239-839D-D0202D06C980@knazarov.com>
References: <20210315114639.91953-1-mail@knazarov.com>
 <20210316133228.ew4j6f5yoxds4iyy@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Received-SPF: pass client-ip=66.111.4.26; envelope-from=mail@knazarov.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've based my work on Akihiko Odaki's previous patchset that introduced =
dynamic refresh rate (see "Based-on" in the description).
Should I rebase it to master?

> On 16 Mar 2021, at 16:32, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
> On Mon, Mar 15, 2021 at 02:46:37PM +0300, Konstantin Nazarov wrote:
>> The timing generation is currently performed inside the function that
>> fills in the DTD. The DisplayID generation needs it as well, so =
moving
>> it out to a separate function.
>>=20
>> Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
>> Signed-off-by: Konstantin Nazarov <mail@knazarov.com>
>=20
> Doesn't apply cleanly.  Do you have a git tree somewhere?
>=20
> take care,
>  Gerd
>=20


