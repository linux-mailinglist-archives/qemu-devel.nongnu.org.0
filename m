Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E86F569B4D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 09:09:39 +0200 (CEST)
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Ldp-0000fK-Us
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 03:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o9LYV-0007MN-9U; Thu, 07 Jul 2022 03:04:10 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:39415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o9LYS-0005Cw-DA; Thu, 07 Jul 2022 03:04:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D6FEF1153B964;
 Thu,  7 Jul 2022 09:03:51 +0200 (CEST)
Received: from kaod.org (37.59.142.108) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 7 Jul 2022
 09:03:51 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002e31ef71d-0065-41d0-8ad1-22560e60a3e4,
 2B39F57B81C0BD827FC0711042E7B74C62F0E97C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <79c1c27c-6d92-94ac-30e2-5206d78f4115@kaod.org>
Date: Thu, 7 Jul 2022 09:03:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/5] target/ppc/kvm.c: do not return -1 on uint64_t
 return
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>
References: <20220706193140.468009-1-danielhb413@gmail.com>
 <20220706193140.468009-2-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220706193140.468009-2-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7389ba09-1c25-46e1-914a-96567eb17e46
X-Ovh-Tracer-Id: 9608148331582491613
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/22 21:31, Daniel Henrique Barboza wrote:
> kvmppc_read_int_dt() and kvmppc_read_int_cpu_dt() return an uint64_t,
> while returning -1 when an error occurs. kvmppc_read_int_cpu_dt() claims
> that it will return 0 if anything wrong happens, but it's returning -1
> if kmvppc_find_cpu_dt() fails.
> 
> The elephant in the room is that returning -1 while claiming that the
> return is uint64_t, results in 18446744073709551615 for the callers.
> This reason alone is enough to not return -1 under these circunstances.
> 
> We'll still have the problem of having to deal with a '0' return that
> might, or might not be, an error. We'll make this distintion clear in
> the next patches.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/kvm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 6eed466f80..109823136d 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1907,7 +1907,7 @@ static uint64_t kvmppc_read_int_dt(const char *filename)

I would add an errp parameter and use error_setg_errno().

C.


>   
>       f = fopen(filename, "rb");
>       if (!f) {
> -        return -1;
> +        return 0;
>       }
>   
>       len = fread(&u, 1, sizeof(u), f);
> @@ -1934,7 +1934,7 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>       uint64_t val;
>   
>       if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
> -        return -1;
> +        return 0;
>       }
>   
>       tmp = g_strdup_printf("%s/%s", buf, propname);


