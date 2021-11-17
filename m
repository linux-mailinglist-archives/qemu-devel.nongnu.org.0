Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B575D4542F8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:51:19 +0100 (CET)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGez-0003MP-RR
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mnGdd-0001ox-7z; Wed, 17 Nov 2021 03:49:53 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:50897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mnGdb-0005I6-2r; Wed, 17 Nov 2021 03:49:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8740121711;
 Wed, 17 Nov 2021 08:49:48 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 09:49:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004ffa905a8-a7a8-4ef8-851a-0cd3c484b07a,
 6BDA4A3F9269C8E5581A3C4EE5F64AFAFECCD473) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5d500a70-7240-d70b-eb3e-d06c8266e014@kaod.org>
Date: Wed, 17 Nov 2021 09:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, Alexey Kardashevskiy
 <aik@ozlabs.ru>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211114005111.515543-1-aik@ozlabs.ru>
 <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
 <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
 <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
 <cf010ee6-0a8c-c18b-4c3b-3b4761d2ed69@ozlabs.ru>
 <fe6d8599-49d6-779d-cfe9-7f5a7a48cd60@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <fe6d8599-49d6-779d-cfe9-7f5a7a48cd60@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5e7b961e-bb38-496d-bde3-87abb35ad94e
X-Ovh-Tracer-Id: 13991558144701795235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeefhfekueehudeuhfektdehlefhhfeiteffteejleegfffgffduveejvdeluedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohhrrdgtiienucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 09:39, Richard Henderson wrote:
> On 11/16/21 11:48 PM, Alexey Kardashevskiy wrote:
>> Yup. I am doing SLOF updates this way for ages after diifs became quite huge to make mailman barfing on the size, and the "subsystem" in the subj was the way to reduce the noise Peter had to respond to :)
>>
>> btw should I be signing those? I am not now.
> 
> You could if you and Cedric want to do so (is it really Alexey sending the sub pr and not an impostor with access to the same github account?), but it will not leave a permanent record in the mainline history, because the merge object with the signature will be removed by any rebase.


Yes. I just noticed that the merge commit is lost :

2021-11-09 15:50 +0100 Christophe Lombard                     o [ppc-7.0] {origin/ppc-7.0} pci-host: Allow extended config space access for PowerNV PHB4 model
2021-11-16 17:39 +0100 Cédric Le Goater                       M─┐ Merge tag 'qemu-slof-20211112' of github.com:aik/qemu into ppc-7.0
2021-11-13 14:47 +1100 Alexey Kardashevskiy                   │ o pseries: Update SLOF firmware image
2021-11-12 12:28 +0100 Richard Henderson                      M─│─┐ Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging
2021-11-10 17:25 -0300 Daniel Henrique Barboza                │ o─┘ {origin/ppc-for-upstream} {origin/ppc-next} <pull-ppc-20211112> ppc/mmu_helper.c: do not truncate 'ea
...

After rebase :

2021-11-09 15:50 +0100 Christophe Lombard                     o [ppc-7.0] pci-host: Allow extended config space access for PowerNV PHB4 model
2021-11-13 14:47 +1100 Alexey Kardashevskiy                   o pseries: Update SLOF firmware image
2021-11-16 21:07 +0100 Richard Henderson                      o Update version for v6.2.0-rc1 release
2021-11-16 18:55 +0100 Richard Henderson                      M─┐ Merge tag 'pull-nbd-2021-11-16' of https://repo.or.cz/qemu/ericb into staging
...

Alexey's commit appears in the list with only his SoB and we loose :

     Merge tag 'qemu-slof-20211112' of github.com:aik/qemu into ppc-7.0

     * tag 'qemu-slof-20211112' of github.com:aik/qemu:
       pseries: Update SLOF firmware image

     Signed-off-by: Cédric Le Goater <clg@kaod.org>

which I find interesting to identify where the SLOF blob is coming from.


Thanks,

C.


