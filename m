Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54BE453892
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:32:45 +0100 (CET)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn2K3-0007Dh-Ph
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:32:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mn2IU-0006C3-47; Tue, 16 Nov 2021 12:31:06 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:48737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mn2IP-0005MH-UV; Tue, 16 Nov 2021 12:31:05 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 79C67CBEB7DD;
 Tue, 16 Nov 2021 18:30:58 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 18:30:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004ee545d81-8777-4f94-8445-78fdb405adbe,
 BFAEB7FE3C4E2C4D96001007C3BA12B7689A693E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <ae41e917-8b22-07dc-31dd-902dbc5d5c0d@kaod.org>
Date: Tue, 16 Nov 2021 18:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Alexey
 Kardashevskiy <aik@ozlabs.ru>
References: <20211114005111.515543-1-aik@ozlabs.ru>
 <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
 <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
 <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bcee2559-0ad4-47a5-b02c-95aa32b8c20e
X-Ovh-Tracer-Id: 16920586751203314595
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
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

On 11/16/21 18:28, Richard Henderson wrote:
> On 11/16/21 6:12 PM, Philippe Mathieu-Daudé wrote:
>> On 11/16/21 17:46, Cédric Le Goater wrote:
>>> On 11/14/21 01:51, Alexey Kardashevskiy wrote:
>>>> The following changes since commit
>>>> d139786e1b3d67991e6cb49a8a59bb2182350285:
>>>>
>>>>     ppc/mmu_helper.c: do not truncate 'ea' in
>>>> booke206_invalidate_ea_tlb() (2021-11-11 11:35:13 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     git@github.com:aik/qemu.git tags/qemu-slof-20211112
>>>>
>>>> for you to fetch changes up to 73944a4bf4ab259b489af8128b4aec525484d642:
>>>>
>>>>     pseries: Update SLOF firmware image (2021-11-13 14:47:56 +1100)
>>>>
>>>> ----------------------------------------------------------------
>>>> Alexey Kardashevskiy (1):
>>>>         pseries: Update SLOF firmware image
>>>>
>>>>    pc-bios/README   |   2 +-
>>>>    pc-bios/slof.bin | Bin 991744 -> 991920 bytes
>>>>    roms/SLOF        |   2 +-
>>>>    3 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> Queued for 7.0.
>>
>> I am not sure this is a good idea, as this will make bisection
>> painful over the release tag.
> 
> It is my understanding that Cedric will rebase for the mainline PR.  
> At least that's how David was handling subsystem pulls.

Yes. I don't plan to send a PR on tree without rebasing. I am just
collecting now.

Thanks,

C.

