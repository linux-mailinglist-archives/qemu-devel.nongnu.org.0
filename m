Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9638D66E61D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:34:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqn5-00031K-Gz; Tue, 17 Jan 2023 13:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqmo-0002wY-C2; Tue, 17 Jan 2023 13:34:30 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqmm-0007iR-M9; Tue, 17 Jan 2023 13:34:17 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D0AB65C0132;
 Tue, 17 Jan 2023 13:34:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 17 Jan 2023 13:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673980455; x=
 1674066855; bh=l4Hh/ODTUo1ZSOLfpCsXpdmf8t/R1i5uvfMX7S3UTI4=; b=b
 OgfYb4y1em8B5sE5V0hXP4cMVRrDxQjiBnGuyYzivPr4DAgZZPnkcQOc9eSreOAz
 AYuxPJ0IAOCqVjXKL7RkKS0j6iq28252vb1RQSjvepgrq6+1ZumV+0Xb5eF8lxUH
 DU+IIUpQebTNDUtBBL9SKA892SYhdbf2P8FLdueYIcawgrEsGZWkkcoLVepAtH80
 /DCTtZHBtKKWQxmpXECEmjsuBfUyf76g0tOAj2v602nZWeBJkQ5hb7rLDIYVhYaN
 /gAuTQXwPmD1IHKm4u708aIOfDrWpvS+/HWYMLMvvtg1NAnNBEda3fKDeqqKa4q6
 du6rfLOapdSebQjnqvY3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673980455; x=
 1674066855; bh=l4Hh/ODTUo1ZSOLfpCsXpdmf8t/R1i5uvfMX7S3UTI4=; b=L
 2fRcfBl9GCALYvXnB9WRkFnU+0WwSDQZLut9Zm1fNbB4/DqEf4BN+XZ5AZah5ZfV
 pAa3/iIyzefyqCtWU0DPowb+NsyuZwGnZxbY+8sEbT89l9wg6Y6ceCTFq1Mjq9J3
 O+k0KIp+nTyqjLibIEknnEn8/FCV9B5mCguRhVZHDaErcPNkrTXz4IL9xYY6OWq+
 D72311OOQWtBYguvDiNbW6ZP0nsTTNSOrhAVbtUQf5uD9KC/7Iqjvx0kKML0w/hx
 xcJdSzSs+zEvbhn2zjQSVL29p62AHLBS1XnJ4Kmn1jUDZ55eDHwlMcMhAr0G6smH
 D30/n9+kltMPyvHDkgHuQ==
X-ME-Sender: <xms:J-rGYxr6Z_L7U4mAOEX6Mmg0j30rlzGvLW_3EdPhqxwmnb6kvLx6cA>
 <xme:J-rGYzr15gTysBHUREgIqqqvbE3y3vXnhNXXlSxj5WFGDjcoiCnpobpvSC50EZwye
 Ii-AjXJ-_s_iZleiPs>
X-ME-Received: <xmr:J-rGY-PdgOt4-qVenCMlnVNXt7susd2xfqyerW917LJKOTrdXYE_5T9hT83_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:J-rGY87XX7lpKla0VTyKqRKwtWnBNUQdLH8KvYtH5Ea2XiIGIOFoew>
 <xmx:J-rGYw673dt91CvFtkxIKeLFvBRLZDvoHviJoiW1DyQOivJ8Y6K6kw>
 <xmx:J-rGY0jVRelkbTXTDu8Cusxy5UEsGViBwCvfnVxbAodnHAIBE74Oow>
 <xmx:J-rGY_ZBQN26YRNK0sBZqn3bYXPH_MC_y_MstkwubcoMQVbKMOeDhA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 13:34:14 -0500 (EST)
Date: Tue, 17 Jan 2023 10:34:12 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 4/5] hw/arm/aspeed: Add aspeed_eeprom.c
Message-ID: <Y8bqJCJqsdkD+q71@pdel-mbp>
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-5-peter@pjd.dev>
 <d494fe87-d083-cc64-867b-186852a120d7@kaod.org>
 <ca4d0954-4d45-ea42-e1c1-efae62e30b1c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca4d0954-4d45-ea42-e1c1-efae62e30b1c@linaro.org>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=peter@pjd.dev;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 17, 2023 at 09:08:57AM +0100, Philippe Mathieu-Daudé wrote:
> On 17/1/23 08:39, Cédric Le Goater wrote:
> > On 1/17/23 00:56, Peter Delevoryas wrote:
> > > - Create aspeed_eeprom.c and aspeed_eeprom.h
> > > - Include aspeed_eeprom.c in CONFIG_ASPEED meson source files
> > > - Include aspeed_eeprom.h in aspeed.c
> > > - Add fby35_bmc_fruid data
> > > - Use new at24c_eeprom_init_rom helper to initialize BMC FRUID
> > > EEPROM with data
> > >    from aspeed_eeprom.c
> [...]
> 
> > > diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> > > new file mode 100644
> > > index 000000000000..89860e37d007
> > > --- /dev/null
> > > +++ b/hw/arm/aspeed_eeprom.h
> > > @@ -0,0 +1,11 @@
> > > +/* Copyright (c) Meta Platforms, Inc. and affiliates. */
> 
> Missing license.

+1, will fix

> 
> > > +#ifndef ASPEED_EEPROM_H
> > > +#define ASPEED_EEPROM_H
> > > +
> > > +#include "qemu/osdep.h"
> > > +
> > > +extern const uint8_t fby35_bmc_fruid[];
> > 
> > 
> > may be define the array with an explicit size to avoid the size variable ?
> > I don't see any good solution.
>  /* Return rom_size and set rombufptr, or return 0 */
>  size_t aspeed_get_default_rom_content(const char *machine_typename,
>                                        const void **rombufptr);
> 
> ?


Hmmm I don't think this would work, cause actually there are more FRUID
EEPROM's than just this one. I only added this one in this commit, but there's
also FRUID EEPROM's from the network card and baseboard. I'll include those 2
EEPROM's in the next version to illustrate.

