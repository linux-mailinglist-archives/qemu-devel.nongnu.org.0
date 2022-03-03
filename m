Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99C14CB793
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 08:21:58 +0100 (CET)
Received: from localhost ([::1]:43278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPfmg-0007sD-2T
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 02:21:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nPflT-0007Bg-Qr
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:20:43 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:33373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nPflS-0002XY-2K
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:20:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D8DE621B12;
 Thu,  3 Mar 2022 07:20:38 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 08:20:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0028799a579-5be0-466d-b5f7-054c21fddda5,
 A0610A17E77809494FE20D2F959CCE2A9331EACD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <80133f3d-319d-f7a0-2b30-09c605c7cd06@kaod.org>
Date: Thu, 3 Mar 2022 08:20:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 00/49] target/ppc: PowerISA Vector/VSX instruction batch
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <962c99fa-07a4-d8d6-1c14-534ddcfc6b52@kaod.org>
 <295ae767-277c-589f-51e2-ff5401a15a79@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <295ae767-277c-589f-51e2-ff5401a15a79@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d25e83c2-d7a6-4678-a2b8-dd3fa80b09df
X-Ovh-Tracer-Id: 7801923406626786153
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddthedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeifeeigfdutefhgfekledvhfelvddvkedujeeutdettdekkeeiffduvdelueetgfenucffohhmrghinhepvghlughorhgrughordhorhhgrdgsrhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/22 20:56, Matheus K. Ferst wrote:
> On 01/03/2022 05:29, Cédric Le Goater wrote:
>> On 2/25/22 22:08, matheus.ferst@eldorado.org.br wrote:
>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>
>>> This patch series implements 5 missing instructions from PowerISA v3.0
>>> and 58 new instructions from PowerISA v3.1, moving 87 other instructions
>>> to decodetree along the way.
>>>
>>> Patches without review: 4, 24, 26, 27, 34, 35, 38, 40, 44-46
>>
>> I think we are done.
>>
>> Applied to ppc-7.0.
>>
>> Thanks,
>>
>> C.
> 
> We still had some minor fixes, but I guess we can send in a follow-up patch.
  
yes, please send them with Fixes: tags. I am planning for a small PR
after the weekend. These would be good to have.

Thanks,

C.


> 
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


