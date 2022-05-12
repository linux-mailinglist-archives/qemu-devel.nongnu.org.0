Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ED85250CF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:04:31 +0200 (CEST)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAMg-0008Ie-2P
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npALm-0007Mo-UO
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:03:34 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:39965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npALk-0006k9-U6
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:03:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D2BE4FF1FBF9;
 Thu, 12 May 2022 17:03:28 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 12 May
 2022 17:03:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001d3f8d64a-6e52-4ac2-824a-e7ffa5e30908,
 FCA23F8D57E7683589BA222FDBA2D0A573BDCAF7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <eac9aa01-0745-7775-c6bc-2e0ec8bd59aa@kaod.org>
Date: Thu, 12 May 2022 17:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/17] powernv: introduce pnv-phb unified devices
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <david@gibson.dropbear.id.au>,
 <fbarrat@linux.ibm.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
 <d6ee5ef4-5242-1f1b-839c-242d18d10800@ilande.co.uk>
 <e7f2e6bc-b443-ed96-683b-835fbe7a55b8@gmail.com>
 <f0492ebb-d742-d465-421b-8c412de65f65@ilande.co.uk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f0492ebb-d742-d465-421b-8c412de65f65@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5ad3f406-be60-4e7d-b69e-af8bdf601728
X-Ovh-Tracer-Id: 2431943800129227558
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfsggrrhhrrghtsehlihhnuhigrdhisghmrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> As a rough outline for a pnv-phb device, I'd aim for creating a proxy for the underlying device rather than manually invoking the QOM instance and qdev-related functions:
> 
> 
> struct PnvPHB {
>      ....
>      uint32_t version;
>      Object *phb_dev;  /* Could be PHBCommonBase if it exists */
> };
> 
> DECLARE_SIMPLE_OBJECT_TYPE(...)
> 
> ...
> ...
> 
> static Property pnv_phb_properties[] = {
>      DEFINE_PROP_UINT32("version", PnvPHB, version, 0),

It could be the type name directly.

>      DEFINE_PROP_END_OF_LIST(),
> };
> 
> static void pnv_phb_realize(DeviceState *dev, Error **errp)
> {
>      PnvPHB *pnv_phb = PNV_PHB(dev);
>      g_autofree char *phb_typename;
> 
>      if (!pnv_phb->version) {
>          error_setg("version not specified", errp);
>          return;
>      }
> 
>      switch (pnv_phb->version) {
>      case 3:
>          phb_typename = g_strdup(TYPE_PNV_PHB3);
>          break;
>      case 4:
>          phb_typename = g_strdup(TYPE_PNV_PHB4);
>          break;
>      default:
>          g_assert_unreached();
>      }
> 
>      pnv_phb->phb_dev = object_new(phb_typename);
>      object_property_add_child(OBJECT(dev), "phb-device", pnv_phb->phb_dev);
> 
>      if (!qdev_realize(DEVICE(pnv_phb->phb_dev), errp)) {
>          return;
>      }
> 
>      /* Passthrough child device properties to the proxy device */
>      qdev_alias_all_properties(dev, OBJECT(pnv_phb->phb_dev));
> }
> 
> Finally you can set the pnv-phb version on a per-machine basis by adding the version to the machine compat_props:
> 
> static GlobalProperty compat[] = {
>      { TYPE_PHB_PNV, "version", 3},
> };
> 


That looks nice. Something to try for cold plugging phbs on the machine.

Thanks,

C.


