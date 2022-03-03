Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE31B4CC2B9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:28:42 +0100 (CET)
Received: from localhost ([::1]:57740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoJm-0003Tc-3E
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:28:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nPo0T-0006mb-8z
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:08:46 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:55389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nPo0R-00084x-Jc
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:08:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 53C09E5CA992;
 Thu,  3 Mar 2022 17:08:40 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 17:08:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00623bd6a0a-4ee8-450d-a89c-f40738373a45,
 A0610A17E77809494FE20D2F959CCE2A9331EACD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.1.230.64
Message-ID: <1e788002-e8b3-fb8d-fd8e-a17ccb7ab23f@kaod.org>
Date: Thu, 3 Mar 2022 17:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] avocado/boot_linux_console.py: check tcg accel in
 test_ppc64_e500
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220303153517.168943-1-danielhb413@gmail.com>
 <20220303153517.168943-5-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220303153517.168943-5-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1849fd9c-b5e0-4ed2-bbad-6c2ef0c9160c
X-Ovh-Tracer-Id: 16719613618639571750
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtiedgkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, crosa@redhat.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 16:35, Daniel Henrique Barboza wrote:
> Some ppc64 hosts (e.g. IBM POWER hosts) aren't able to run the e500
> machine using KVM accel. Skip this test if TCG accel isn't available.
> 
> Cc: Cleber Rosa <crosa@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   tests/avocado/boot_linux_console.py | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index d7d9130329..6d6e748572 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -1165,7 +1165,9 @@ def test_ppc64_e500(self):
>           :avocado: tags=arch:ppc64
>           :avocado: tags=machine:ppce500
>           :avocado: tags=cpu:e5500
> +        :avocado: tags=accel:tcg
>           """
> +        self.require_accelerator("tcg")
>           tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>           self.do_test_advcal_2018('19', tar_hash, 'uImage')
>   


