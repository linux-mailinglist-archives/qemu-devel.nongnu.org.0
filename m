Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41B53693D4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:39:28 +0200 (CEST)
Received: from localhost ([::1]:54144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZw1n-0007oZ-DF
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZvwK-0004ZF-0c; Fri, 23 Apr 2021 09:33:48 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:58269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZvwF-00022R-VG; Fri, 23 Apr 2021 09:33:47 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5A11E12E3;
 Fri, 23 Apr 2021 09:33:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 09:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=hHl/NnTvNP3kIJcOCO1tWd+2u2t
 pGeSCcFfXI+YYmM8=; b=0XHqsEnEYFg/zOfP5S2Q2Osv7P6CkIHxhcxqusznpH+
 OHMwpz0VQHfIfSVYCFAau+BE44KWXo++AYZhCEOhk7GjnslRLAEEzz5jhFJjrGel
 g2x+nQeRWpWe22xDqGnJ6NobN0iqo5pc746yQT9rcCdrO/p9dIjoyTL0uLuSkldO
 APaoUH4AVob8H+cwfdkViaG7/kFkurUZwcGe8t4AMQfwUJRkMCwyGVDjBhpAPsmB
 ARmqbMs4rOgDu5LCgbzEWEqoaSaboaYhQhryATcpVW8CoaMkoqy5l7XvbwTjlw5f
 Iq3A7lhAV12uQC2VH4RQElT4UI9Gq+20Z5Gd2Gb8FtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hHl/Nn
 TvNP3kIJcOCO1tWd+2u2tpGeSCcFfXI+YYmM8=; b=Txc5HZ2OWnVfCm8GjWcU54
 BCgwXTZ+JKhLUqxTNzcD+jYAW3c+KKlPvJMpCwQ8qcXuzb4vHLSOELNLeh54Ym0K
 rfW9WmjzX64GhEmnHGzs2QaB25+Z3FiRgBtlyLTivhYcayiXrOShL2jqr0ft/5lE
 Fm0ileTuyeuWNR/1YKHHe+L7fLOq9yFgLtCMfhtzyKWf0Dgi3pQXOuCS5bg3qOPz
 BPHU6/3hFp7fDA4OTT+Qrm49DvsLi8gDe20V0awdPwi8zzBz8PI7QofqZ9GopOwy
 SdTig7irrTly0zTzaH5eP89fYHp0ogu+mgQ0TRhozCf5M2mlirgeg97txIYenPDw
 ==
X-ME-Sender: <xms:tMyCYAvY5On3oYquCEz4zufo8PAhZML4ZyvbVQig9lhkYmc60W6sQQ>
 <xme:tMyCYJRJ36HIX334AUc04AgAFOUvACX8B_tJ8PDTg3l3Y15h9eIvUTPu27C1ahQ2D
 uHiB6j6HqIgAmbYHYI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:tMyCYHKF7nz5yiaW3gPdPpaAfnaZ0QPdjQt4ny4TsHiQcWSfnn8LBA>
 <xmx:tMyCYMt6OZFPeX-6JqrJGNyeSJdJ-lGXStXXUjUBpWN2OvR2fDZTAw>
 <xmx:tMyCYO9Aev2kjZ2A4X9QGS8lIcGUBdX5hoQWZBOA35NuEAGZYLuJ9g>
 <xmx:tMyCYGOFEFJCdvbyAgNJOrCktevcNkyKUHxCD5khYuXe8aRgWQvtOA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id EFDFD240057;
 Fri, 23 Apr 2021 09:33:38 -0400 (EDT)
Date: Fri, 23 Apr 2021 15:33:36 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.0 v2 2/2] hw/block/nvme: disable hotplugging for
 subsystem-linked controllers
Message-ID: <YILMsBXGTcXFOWah@apples.localdomain>
References: <20210423052127.512489-1-its@irrelevant.dk>
 <20210423052127.512489-3-its@irrelevant.dk>
 <CAFEAcA8xS6Hoqd+Y96FxhrDabsotYURsHHvEeN9yDLDHzzVf+g@mail.gmail.com>
 <YILKsjz+WoXFiKUh@apples.localdomain>
 <CAFEAcA_OzW7TWk8JrvrzEY-Rapcs1wVjuWKvYGzBgWFHQO+vxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XOSPckCP4HDacYaY"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_OzW7TWk8JrvrzEY-Rapcs1wVjuWKvYGzBgWFHQO+vxg@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XOSPckCP4HDacYaY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Apr 23 14:25, Peter Maydell wrote:
>On Fri, 23 Apr 2021 at 14:25, Klaus Jensen <its@irrelevant.dk> wrote:
>>
>> On Apr 23 14:21, Peter Maydell wrote:
>> >On Fri, 23 Apr 2021 at 06:21, Klaus Jensen <its@irrelevant.dk> wrote:
>> >>
>> >> From: Klaus Jensen <k.jensen@samsung.com>
>> >>
>> >> If a controller is linked to a subsystem, do not allow it to be
>> >> hotplugged since this will mess up the (possibly shared) namespaces.
>> >>
>> >> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> >> ---
>> >>  hw/block/nvme.c | 4 ++++
>> >>  1 file changed, 4 insertions(+)
>> >>
>> >> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>> >> index 5fe082ec34c5..7606b58a39b9 100644
>> >> --- a/hw/block/nvme.c
>> >> +++ b/hw/block/nvme.c
>> >> @@ -6140,12 +6140,16 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>> >>
>> >>  static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
>> >>  {
>> >> +    DeviceClass *dc;
>> >>      int cntlid;
>> >>
>> >>      if (!n->subsys) {
>> >>          return 0;
>> >>      }
>> >>
>> >> +    dc = DEVICE_GET_CLASS(n);
>> >> +    dc->hotpluggable = false;
>> >> +
>> >>      cntlid = nvme_subsys_register_ctrl(n, errp);
>> >>      if (cntlid < 0) {
>> >>          return -1;
>> >
>> >I'm not sure this is right -- the DeviceClass is the
>> >class struct, which there's only one of for every instance
>> >of the device in the system. So this is saying "if this instance
>> >is linked to a subsystem, don't let any *future* instances ever
>> >be hotpluggable". I'm not even sure if it will do the right
>> >thing for the current device, because this function is called
>> >from the device's realize method, and the device_set_realized()
>> >function does the "forbid if dc->hotpluggable is false" check
>> >before calling the realize method.
>> >
>> >Possibly what you want to do here is to call the
>> >device_get_hotplugged() function and just make the realize
>> >method fail with a suitable error if the device is both (a) being
>> >hotplugged and (b) has a subsystem link; but I'm not an expert on
>> >hotplug, so I might be wrong.
>> >
>>
>> Thanks Peter, this sounds exactly like what I want. I'll respin!
>>
>> I have a "full" fix that actually makes the device hotpluggable in the
>> context of subsystems, but it is definitely not an -rc thing.
>
>For 6.0 I don't think we should put this in anyway -- it's not
>a regression and in any case it sounds like it needs more work...
>

Agree, patch 1 is what I would like to see in if an -rc5 is spun.

--XOSPckCP4HDacYaY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCCzK0ACgkQTeGvMW1P
Dekq7wf8CFfNZPLm8fB0JNtwkzruNJQU95RgbFXR7FPr6XWJpJ9Ej2Uw8pGTr4zF
e0mtlXCMRJJFK0BIdBuAs/YMX4nLnygEvtdcXlaDaPrYWCebAjG/iBxVjc9uTWQp
UWU3beObYgEobLvnju/Lo7cS5AnvMY6WpGc4+gAz/d/fkT+j3HZ9kPCk4ZIecwgP
5GjUGmmHSX1xS3oFIWc0Rh9AZagfF8GtZd8V0AidREu8Jmvl2iJPnFiwo+6N2lYl
CUQe7JQrOgzZc/M3Q4ReI8IpKgaBIUKXS+SfxspX+QRk9csqWrnSrednZJsGKi/y
er1ZvR9bL8JSiMWCuISXVF3mwMrI5A==
=ksuW
-----END PGP SIGNATURE-----

--XOSPckCP4HDacYaY--

