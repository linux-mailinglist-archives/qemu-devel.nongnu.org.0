Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032E24D7F98
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:14:22 +0100 (CET)
Received: from localhost ([::1]:37008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThiW-0004SY-Ow
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:14:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nThfk-0003Qv-5a
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:11:28 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:53047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nThfh-0006FG-TI
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:11:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 20ABF239A3;
 Mon, 14 Mar 2022 10:11:13 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 14 Mar
 2022 11:11:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006ffcaa937-8c93-42ce-8aeb-b8bf2b6ad369,
 00B622A560025FB732B9BA5E5C4E2A2293E53F9D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8841c7b5-62a5-cd5a-87c6-5d1bd64416fd@kaod.org>
Date: Mon, 14 Mar 2022 11:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 0/5] user creatable pnv-phb4 devices
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220111131027.599784-1-danielhb413@gmail.com>
 <cc037332-a0f5-3acb-396a-49bdac653d2e@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <cc037332-a0f5-3acb-396a-49bdac653d2e@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 18d79829-849e-4793-bf5b-a2a22d229349
X-Ovh-Tracer-Id: 1495195079934774179
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvkedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeeuheelfeevheehtdefvdevvdfggfekueekheffjeevhfevudevveeljeethfeunecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 19:49, Thomas Huth wrote:
> On 11/01/2022 14.10, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This version implements Cedric's review suggestions from v4. No
>> drastic design changes were made.
>>
>> Changes from v4:
>> - patches 1,3,5: unchanged
>> - patch 2:
>>    * renamed function to pnv_phb4_xscom_realize()
>>    * pnv4_phb4_xscom_realize() is now called at the end of phb4_realize()
>> - patch 4:
>>    * changed pnv_phb4_get_stack signature to use chip and phb
>>    * added a new helper called pnv_pec_stk_default_phb_realize() to
>> realize the default phb when running with defaults
>> - v4 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg02148.html
>>
>> Daniel Henrique Barboza (5):
>>    ppc/pnv: set phb4 properties in stk_realize()
>>    ppc/pnv: move PHB4 XSCOM init to phb4_realize()
>>    ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
>>    ppc/pnv: Introduce user creatable pnv-phb4 devices
>>    ppc/pnv: turn pnv_phb4_update_regions() into static
> 
> It's now possible to crash QEMU with the pnv-phb4 device:
> 
> $ ./qemu-system-ppc64 -nographic -M powernv9 -device pnv-phb4
> Unexpected error in object_property_try_add() at ../../devel/qemu/qom/object.c:1229:
> qemu-system-ppc64: -device pnv-phb4: attempt to add duplicate property 'pnv-phb4[0]' to object (type 'power9_v2.0-pnv-chip')
> Aborted (core dumped)
> 
> Any ideas how to fix this?

This was introduced by :

   commit 6e7b96750359 ("ppc/pnv: fix default PHB4 QOM hierarchy")

It could be fixed with :

@@ -1598,15 +1598,15 @@ static void pnv_phb4_realize(DeviceState
              error_propagate(errp, local_err);
              return;
          }
-    }
  
-    /* Reparent the PHB to the chip to build the device tree */
-    pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
+        /* Reparent the PHB to the chip to build the device tree */
+        pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
  
-    s = qdev_get_parent_bus(DEVICE(chip));
-    if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
-        error_propagate(errp, local_err);
-        return;
+        s = qdev_get_parent_bus(DEVICE(chip));
+        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
      }
  
      /* Set the "big_phb" flag */


but I am not sure we want to keep user-created PHB* devices.

Thanks,

C.

