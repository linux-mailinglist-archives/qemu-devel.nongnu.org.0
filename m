Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A3563ED5
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:29:24 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Wd9-0006z3-Bo
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WZ5-0002tX-Tr
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:25:11 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:50759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WZ0-0004sG-3t
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:25:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 297C823E08;
 Sat,  2 Jul 2022 06:25:03 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 2 Jul 2022
 08:25:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006ac03e6ec-5a5d-4040-b2d7-624062df4b1c,
 FB2626423410402F5F47B43F186DFD06AD25B17E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <55014e2a-a668-4843-8338-850abeb5ff04@kaod.org>
Date: Sat, 2 Jul 2022 08:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/9] target/ppc: add errp to kvmppc_read_int_cpu_dt()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-3-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220630194249.886747-3-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9dee8bfb-2bd9-463f-bfbd-db4558590fcb
X-Ovh-Tracer-Id: 16482893164718820317
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeelkeffieejfffgjeelheetgfehhffgieetheettddtieehkeduffefffetgffhnecuffhomhgrihhnpehfrghtrghlrdhnohenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/22 21:42, Daniel Henrique Barboza wrote:
> The function can't just return 0 whether an error happened and call it a
> day. We must provide a way of letting callers know if the zero return is
> legitimate or due to an error.
> 
> Add an Error pointer to kvmppc_read_int_cpu_dt() that will be filled
> with an appropriate error, if one occurs. Callers are then free to pass
> an Error pointer and handle it.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/kvm.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 109823136d..bc17437097 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1925,15 +1925,17 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
>   
>   /*
>    * Read a CPU node property from the host device tree that's a single
> - * integer (32-bit or 64-bit).  Returns 0 if anything goes wrong
> - * (can't find or open the property, or doesn't understand the format)
> + * integer (32-bit or 64-bit).  Returns 0 and set errp if anything goes
> + * wrong (can't find or open the property, or doesn't understand the
> + * format)
>    */
> -static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
> +static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>   {
>       char buf[PATH_MAX], *tmp;
>       uint64_t val;
>   
>       if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
> +        error_setg(errp, "Failed to read CPU property %s", propname);
>           return 0;
>       }
>   
> @@ -1946,12 +1948,12 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>   
>   uint64_t kvmppc_get_clockfreq(void)
>   {
> -    return kvmppc_read_int_cpu_dt("clock-frequency");
> +    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);


This should be fatal. no ?

C.


>   }
>   
>   static int kvmppc_get_dec_bits(void)
>   {
> -    int nr_bits = kvmppc_read_int_cpu_dt("ibm,dec-bits");
> +    int nr_bits = kvmppc_read_int_cpu_dt("ibm,dec-bits", NULL);
>   
>       if (nr_bits > 0) {
>           return nr_bits;
> @@ -2336,8 +2338,8 @@ static void alter_insns(uint64_t *word, uint64_t flags, bool on)
>   static void kvmppc_host_cpu_class_init(ObjectClass *oc, void *data)
>   {
>       PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -    uint32_t dcache_size = kvmppc_read_int_cpu_dt("d-cache-size");
> -    uint32_t icache_size = kvmppc_read_int_cpu_dt("i-cache-size");
> +    uint32_t dcache_size = kvmppc_read_int_cpu_dt("d-cache-size", NULL);
> +    uint32_t icache_size = kvmppc_read_int_cpu_dt("i-cache-size", NULL);
>   
>       /* Now fix up the class with information we can query from the host */
>       pcc->pvr = mfpvr();


