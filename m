Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0575B4044
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 21:56:29 +0200 (CEST)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWk72-0001ny-5e
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 15:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oWk5F-0008QN-BM; Fri, 09 Sep 2022 15:54:37 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oWk5D-0003JQ-2g; Fri, 09 Sep 2022 15:54:37 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 16BA95C00F0;
 Fri,  9 Sep 2022 15:54:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 09 Sep 2022 15:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1662753274; x=1662839674; bh=1MdDp8nqib
 uD5PvMBICw8lfViml4pzKprQW4MWGdix0=; b=Ak5/ao0PzwHQoQRfmBi90MLp/5
 t1gj4BQhrsiUYT6VZlzNHpTfUn/eN5BzNcmTXWPeoQx2q39OVeIB8AhetsjM1sxH
 cQqXMj2opj3TCqMGGS+LNjKIDGeVRFDvF18dTsMqisUZn0KdO8vo0A4zHTS4xB1N
 Nro1i+nIZ2aw0OV6oA6Qgk6WR5vuEw2Nqi9T7hPqb+dIUNEg1TyuMakSbMmIC0Ww
 MrubGWAscNwKJuiWWMf8zmJcbmS31qUfq8r+qme65YgqpMebSptvQvUQBizm9QeE
 vteg/2Jf/e6hqft42Dg11ST2wW3F3l000J0wOsh8+D7V5B41RZfEvxgyXFtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662753274; x=1662839674; bh=1MdDp8nqibuD5PvMBICw8lfViml4
 pzKprQW4MWGdix0=; b=zHmZPlzfsM4pcEMGK/fSS2jELaJIlKgNm/ifa8ILhq+J
 Eby4AQPcQeaUf4GckmoT/DwVichWVhQGdnaN+LTsOkXs1wlHP4SEFzFWx2riim8c
 AcKRPE8KtR4kp/NG2LAPqAojdRj/BvXCMMYvhVDSAYoqorkynKQhSMx3g3gDIL3U
 jixv2iHG7sZTgpcWq2u4GTHYiNI3VNRSYSMjLHISGKoEWdXNV0Y6+xqoamN1jwLN
 rGSz9LP+ckaItgx00N/HESl34BOCyOuQEeOPm8TlcAkt1POADb9+0zHBG8Ml6zTZ
 ImuLPx6cp75+9hmJguj5Bnl1Lnz71Xef5OKDd0t0SA==
X-ME-Sender: <xms:-ZkbYzhfBymEwAbmgBLfu1O676J5DrpI0punYyEmm2K-J1O245G16Q>
 <xme:-ZkbYwD3RbdhfUpCeEisN1jr1Zhl9n7NxA4VU4_clUk_Tr4SmPhyMQZbm7TY-Li6-
 kWQNWm4zHPat9jrTTA>
X-ME-Received: <xmr:-ZkbYzGDFJAeRpGmydPTBHwNp5fpalw64-V2sd9PLVwjXLHCJKs6JN9miLurI5HggiPi98hmrnsS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeevgfehgedvvdekveeifeekjeduueetieegvdeitedvffdvgffhjeekveek
 tdehfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:-ZkbYwROqXraLIUC56-DmrN6chdxVAsfoMgzlzQB3JKJS4ys1rofcg>
 <xmx:-ZkbYwyUIfZlxw3hns3uPli1VE6VwUQmDkKxuDDEvNgn9DIpPpPIXA>
 <xmx:-ZkbY25tRVt2DoOFJjgBQHjZ8Y-1vQe9taP75i1ve4AK5mVkVoAvUw>
 <xmx:-pkbY_qfQvSMH8hiAE17xxSHE36pfaqQsAEhlRoNrhB-IkydBtinKw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 15:54:33 -0400 (EDT)
Date: Fri, 9 Sep 2022 12:54:31 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Titus Rwantare <titusr@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz,
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com
Subject: Re: [RFC PATCH 0/3] Initial PECI bus support
Message-ID: <YxuZ95ppk9lZ/23g@pdel-fedora-MJ0HJWH9>
References: <20220906220552.1243998-1-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906220552.1243998-1-titusr@google.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 06, 2022 at 10:05:49PM +0000, Titus Rwantare wrote:
> The Platform Environment Control Interface (PECI), is a way for Intel
> processors to communicate with management controllers.
> 
> This series of patches simulate some PECI subsystem functionality. This
> work is currently used against Nuvoton 7xx BMC, but it can easily be
> extended to support Aspeed BMCs. Most of the functionality is derived
> from PECI support in openbmc. See https://github.com/openbmc/libpeci
> 
> The main consumer of this work is openbmc, so functionality not
> exercised by the openbmc/libpeci is unlikely to be present here.
> 
> peci-core.c is an attempt to split out functionality defined by the
> spec. Anything that is not expected to change between BMC vendors.
> 
> The following commands have some support:
>     Ping()
>     GetDIB()
>     GetTemp()
>     ~RdPkgConfig()
>     ~RdEndPtConfig()
> 
> To be implemented:
>     RdIAMSR()
>     RdPCIConfig()
>     RdPCIConfigLocal()
> 
> Currently, in the board file during bmc_init() one may specify defaults
> as follows:
> 
> static void my_machine_peci_init(NPCM7xxState *soc)
> {
>     PECIBus *peci_bus = npcm7xx_peci_get_bus(soc);
>     DeviceState *dev;
> 
>     /* per socket properties - both sockets are identical in this case */
>     PECIClientProperties peci_props = {
>         .cpu_family = FAM6_SAPPHIRE_RAPIDS_X,
>         .cpus = 56,
>         .dimms = 16
>     };
> 
>     /* socket 0 - with example setting a few of the cpu and dimm temperatures in millidegrees */
>     dev = DEVICE(peci_add_client(peci_bus, 0x30, &peci_props));
>     object_property_set_uint(OBJECT(dev), "cpu_temp[0]", 30000, &error_abort);
>     object_property_set_uint(OBJECT(dev), "cpu_temp[2]", 35000, &error_abort);
>     object_property_set_uint(OBJECT(dev), "dimm_temp[1]", 40000, &error_abort);
>     object_property_set_uint(OBJECT(dev), "dimm_temp[8]", 36000, &error_abort);
> 
>     /* socket 1 */
>     dev = DEVICE(peci_add_client(peci_bus, 0x31, &peci_props));
>     object_property_set_uint(OBJECT(dev), "cpu_temp[9]", 50000, &error_abort);
>     object_property_set_uint(OBJECT(dev), "dimm_temp[0]", 31000, &error_abort);
>     object_property_set_uint(OBJECT(dev), "dimm_temp[14]", 36000, &error_abort);
>     ...
> }
> 
> This is something that can also be extended as other parameters arise that need
> to differ between platforms. So far you can have have different CPUs, DIMM counts,
> DIMM temperatures here. These fields can also be adjusted at runtime through qmp.

That looks good to me, seems like the standard way to do it in QEMU.

> 
> A lot of the registers are hard coded, see hw/peci/peci-client.c. I'd like to
> gauge interest in what potential users would like to be adjustable at runtime.
> I've not written QEMU models that read config files at runtime, something I'd
> appreciate guidance on.

This part I don't totally understand. I also barely know anything about
PECI.

Is the register location for things different between CPU generations?

If so (and I expect it probably is), why is there only a configuration
for Sapphire Rapids, and not for the other ones?

Is that because of PECI protocol changes between generations?

In which case, maybe there needs to be a notion of PECI version
somewhere?

Also, I don't understand why it would be adjustable at runtime, do we
change register locations during execution?

I would expect it to be part of the board definition.

You could provide a bunch of sample configs for the CPU's that you're
testing for, and the board configuration could just select the sample
config it is using (corresponding to the CPU model).

That's the model I would imagine, but I might be missing some important
context here.

Thanks,
Peter

> 
> Thanks all
> 
> Titus Rwantare (3):
>   hw/peci: add initial support for PECI
>   hw/peci: add PECI support for NPCM7xx BMCs
>   hw/peci: add support for EndPointConfig reads
> 
>  MAINTAINERS                    |  10 +-
>  hw/Kconfig                     |   1 +
>  hw/arm/Kconfig                 |   1 +
>  hw/arm/npcm7xx.c               |   9 +
>  hw/meson.build                 |   1 +
>  hw/peci/Kconfig                |   2 +
>  hw/peci/meson.build            |   2 +
>  hw/peci/npcm7xx_peci.c         | 204 +++++++++++++++++++++++
>  hw/peci/peci-client.c          | 293 +++++++++++++++++++++++++++++++++
>  hw/peci/peci-core.c            | 222 +++++++++++++++++++++++++
>  hw/peci/trace-events           |  10 ++
>  hw/peci/trace.h                |   1 +
>  include/hw/arm/npcm7xx.h       |   2 +
>  include/hw/peci/npcm7xx_peci.h |  37 +++++
>  include/hw/peci/peci.h         | 217 ++++++++++++++++++++++++
>  meson.build                    |   1 +
>  16 files changed, 1012 insertions(+), 1 deletion(-)
>  create mode 100644 hw/peci/Kconfig
>  create mode 100644 hw/peci/meson.build
>  create mode 100644 hw/peci/npcm7xx_peci.c
>  create mode 100644 hw/peci/peci-client.c
>  create mode 100644 hw/peci/peci-core.c
>  create mode 100644 hw/peci/trace-events
>  create mode 100644 hw/peci/trace.h
>  create mode 100644 include/hw/peci/npcm7xx_peci.h
>  create mode 100644 include/hw/peci/peci.h
> 
> -- 
> 2.37.2.789.g6183377224-goog
> 

