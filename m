Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C016299AC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:08:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouvej-0000UR-Q3; Tue, 15 Nov 2022 08:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ouvef-0000OV-5B
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:07:10 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ouveb-0006Wi-Dr
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:07:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1FA8113ED9BE8;
 Tue, 15 Nov 2022 14:06:58 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 15 Nov
 2022 14:06:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002cbd81469-1655-42f4-957a-661fefa1a461,
 4108EF7A520F6C47CD43A20CA0BA38D18DA47D40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <890395fe-ed58-8a5d-be76-b28d99e6289a@kaod.org>
Date: Tue, 15 Nov 2022 14:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Automatically zero-extend flash images
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <patrick@stwcx.xyz>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, Alistair Francis
 <alistair@alistair23.me>
References: <20221114190823.1888691-1-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221114190823.1888691-1-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 31d21a8d-bd50-4fc8-825d-0e7e28619236
X-Ovh-Tracer-Id: 10300295299853683503
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhesphhjugdruggvvhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgrthhrihgtkhesshhtfigtgidrgiihiidpfhhrrghsshgvrdhighhlvghsihgrshesghhmrghilhdrtghomhdprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdfovfetjf
 hoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hello Peter,

On 11/14/22 20:08, Peter Delevoryas wrote:
> I've been using this patch for a long time so that I don't have to use
> dd to zero-extend stuff all the time. It's just doing what people are
> doing already, right? I hope it's not controversial.

I simply run :

    truncate --size <size>

on the FW file when needed and it is rare because most FW image builders
know the flash size of the target.

However, the current error message is confusing and the following could
be an improvement :

@@ -1606,6 +1606,13 @@ static void m25p80_realize(SSIPeripheral
      if (s->blk) {
          uint64_t perm = BLK_PERM_CONSISTENT_READ |
                          (blk_supports_write_perm(s->blk) ? BLK_PERM_WRITE : 0);
+
+        if (blk_getlength(s->blk) != s->size) {
+            error_setg(errp, "backend file is too small for flash device %s (%d MB)",
+                       object_class_get_name(OBJECT_CLASS(mc)), s->size >> 20);
+            return;
+        }
+
          ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
          if (ret < 0) {
              return;

I can send a patch for the above.


<hack>

I mostly run the QEMU machines with -snapshot, this hack  :

   blk_set_allow_write_beyond_eof(s->blk, true);

makes it work also ...

</hack>


Thanks,

C.

> One note: I couldn't figure out how to make it work without changing the
> permissions on the block device to allow truncation. If somebody knows
> how to avoid the `blk_get_perm`, `blk_set_perm` calls here, let me know!
>
> Thanks,
> Peter
> 
> Peter Delevoryas (1):
>    hw/arm/aspeed: Automatically zero-extend flash images
> 
>   hw/arm/aspeed.c | 40 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
> 


