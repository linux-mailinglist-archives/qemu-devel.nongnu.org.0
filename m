Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF723FD901
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:49:30 +0200 (CEST)
Received: from localhost ([::1]:55796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOkE-00037f-0C
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLONa-0001cI-UW
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:26:07 -0400
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:45650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLONV-0006gt-Tb
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:26:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 6FE96294504;
 Wed,  1 Sep 2021 13:25:58 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 13:25:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002c6e01acf-b444-4155-9ddc-fc36d5aea9ef,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 1/8] docs/system: ppc: Update the URL for OpenPOWER
 firmware images
To: Greg Kurz <groug@kaod.org>
References: <20210901094153.227671-1-clg@kaod.org>
 <20210901094153.227671-2-clg@kaod.org> <20210901121047.1051be9f@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2fcfce42-ab03-f988-d28a-83ba3abcfee3@kaod.org>
Date: Wed, 1 Sep 2021 13:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901121047.1051be9f@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7c9c993e-a9aa-4ee7-99b1-af9caabc0040
X-Ovh-Tracer-Id: 7153405058555153376
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -83
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludejmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekvefgudekkeekjeegfedtffefkeduteeviedvgeevkeehudffleehvedvueefkeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhophgvnhhpohifvghrrdighiiinecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo52.mail-out.ovh.net
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.029,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 12:10 PM, Greg Kurz wrote:
> On Wed, 1 Sep 2021 11:41:46 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> This also fixes a small skiboot/skiroot typo and removes the links to
>> the specific POWER8 and POWER9 images since the firmware images can be
>> used to run all machines.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  docs/system/ppc/powernv.rst | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
>> index 4c4cdea527e2..4ccfb2258622 100644
>> --- a/docs/system/ppc/powernv.rst
>> +++ b/docs/system/ppc/powernv.rst
>> @@ -53,8 +53,7 @@ initramfs ``skiroot``. Source code can be found on GitHub:
>>  
>>    https://github.com/open-power.
>>  
>> -Prebuilt images of ``skiboot`` and ``skiboot`` are made available on the `OpenPOWER <https://openpower.xyz/job/openpower/job/openpower-op-build/>`__ site. To boot a POWER9 machine, use the `witherspoon <https://openpower.xyz/job/openpower/job/openpower-op-build/label=slave,target=witherspoon/lastSuccessfulBuild/>`__ images. For POWER8, use
>> -the `palmetto <https://openpower.xyz/job/openpower/job/openpower-op-build/label=slave,target=palmetto/lastSuccessfulBuild/>`__ images.
>> +Prebuilt images of ``skiboot`` and ``skiroot`` are made available on the `OpenPOWER <https://github.com/open-power/op-build/releases/download/v2.7/>`__ site.
>>  
> 
> This URL ends up 404 for me.
> 
> I suggest you change it to:
> 
>     https://github.com/open-power/op-build/releases/tag/v2.7
> 
> or even
> 
>     https://github.com/open-power/op-build/releases
> 
> which are valid and display individual links for the image files.

Yes. I will resend this one.

Thanks,

C.

