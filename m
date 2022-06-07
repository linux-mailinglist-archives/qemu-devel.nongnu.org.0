Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C43553F709
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 09:18:37 +0200 (CEST)
Received: from localhost ([::1]:43828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyTU3-0006yK-PH
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 03:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyTI4-0001r9-NM
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 03:06:13 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:49441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyTI2-0007DK-DY
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 03:06:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.28])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4581C254CD;
 Tue,  7 Jun 2022 07:06:06 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 09:06:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004113b6c9e-8c47-45c6-81e2-670844a81565,
 B3A9F5ABA359FFEAA5F192A1B4EC97B2EEB111D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0cc8c2f6-8a53-01e5-3440-6b7e42f98213@kaod.org>
Date: Tue, 7 Jun 2022 09:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] avocado/boot_linux_console.py: Update ast2600 test
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <qemu-devel@nongnu.org>, Cleber Rosa
 <crosa@redhat.com>
CC: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220607011938.1676459-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220607011938.1676459-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f70bfebd-dd0c-493c-be8c-b3a63b2b0e9a
X-Ovh-Tracer-Id: 17932770766585826211
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtgedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkedujeejteehfffgleevjefgveettdfgjedvueffudeljeejudevieefgeefleegnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
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

On 6/7/22 03:19, Joel Stanley wrote:
> Update the test_arm_ast2600_debian test to
> 
>   - the latest Debian kernel
>   - use the Rainier machine instead of Tacoma
> 
> Both of which contains support for more hardware and thus exercises more
> of the hardware Qemu models.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   tests/avocado/boot_linux_console.py | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 6b1533c17c8b..477b9b887754 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -1046,18 +1046,18 @@ def test_arm_vexpressa9(self):
>       def test_arm_ast2600_debian(self):
>           """
>           :avocado: tags=arch:arm
> -        :avocado: tags=machine:tacoma-bmc
> +        :avocado: tags=machine:rainier-bmc
>           """
>           deb_url = ('http://snapshot.debian.org/archive/debian/'
> -                   '20210302T203551Z/'
> +                   '20220606T211338Z/'
>                      'pool/main/l/linux/'
> -                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
> -        deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
> +                   'linux-image-5.17.0-2-armmp_5.17.6-1%2Bb1_armhf.deb')
> +        deb_hash = '8acb2b4439faedc2f3ed4bdb2847ad4f6e0491f73debaeb7f660c8abe4dcdc0e'
>           deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
>                                       algorithm='sha256')
> -        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
> +        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.17.0-2-armmp')
>           dtb_path = self.extract_from_deb(deb_path,
> -                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
> +                '/usr/lib/linux-image-5.17.0-2-armmp/aspeed-bmc-ibm-rainier.dtb')
>   
>           self.vm.set_console()
>           self.vm.add_args('-kernel', kernel_path,


