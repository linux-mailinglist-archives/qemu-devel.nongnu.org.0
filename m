Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E86662436B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:42:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7oi-0007DV-1Z; Thu, 10 Nov 2022 08:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ot7of-0007Cz-48; Thu, 10 Nov 2022 08:42:01 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ot7od-0002Bs-0f; Thu, 10 Nov 2022 08:42:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 481D529D5D;
 Thu, 10 Nov 2022 13:41:46 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 10 Nov
 2022 14:41:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005f5398cea-5879-483b-9cfd-2ffd3fac5009,
 6E227D969907A8707AA43253BCDDCB2E63F9DA8C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3a79f03a-52a8-d768-1829-dfc94ef1a4e3@kaod.org>
Date: Thu, 10 Nov 2022 14:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] libdecnumber/dpd/decimal64: Fix compiler warning from
 Clang 15
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>, Daniel Henrique
 Barboza <danielhb413@gmail.com>
CC: <qemu-ppc@nongnu.org>, <qemu-trivial@nongnu.org>, <mrezanin@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221110131112.104283-1-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221110131112.104283-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 51c7bd50-5d9e-469d-b85b-30eaf43c876b
X-Ovh-Tracer-Id: 18417752152741219180
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehthhhuthhhsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhtrhhivhhirghlsehnohhnghhnuhdrohhrghdpmhhrvgiirghnihhnsehrvgguhhgrthdrtghomhdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehhedvpd
 hmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/10/22 14:11, Thomas Huth wrote:
> Clang 15 from Fedora 37 complains:
> 
>   ../libdecnumber/dpd/decimal64.c:620:8: error: variable 'n' set but
>   not used [-Werror,-Wunused-but-set-variable]
>     Int  n;                     /* output bunch counter */
>          ^
>   1 error generated.
> 
> Remove the unused variable to silence the compiler warning.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   libdecnumber/dpd/decimal64.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/libdecnumber/dpd/decimal64.c b/libdecnumber/dpd/decimal64.c
> index 4816176410..290dbe8177 100644
> --- a/libdecnumber/dpd/decimal64.c
> +++ b/libdecnumber/dpd/decimal64.c
> @@ -617,7 +617,6 @@ static const uInt multies[]={131073, 26215, 5243, 1049, 210};
>   #endif
>   void decDigitsToDPD(const decNumber *dn, uInt *targ, Int shift) {
>     Int  cut;		      /* work */
> -  Int  n;		      /* output bunch counter */
>     Int  digits=dn->digits;     /* digit countdown */
>     uInt dpd;		      /* densely packed decimal value */
>     uInt bin;		      /* binary value 0-999 */
> @@ -676,7 +675,7 @@ void decDigitsToDPD(const decNumber *dn, uInt *targ, Int shift) {
>       bin=0;			   /* [keep compiler quiet] */
>     #endif
>   
> -  for(n=0; digits>0; n++) {	   /* each output bunch */
> +  while (digits > 0) {             /* each output bunch */
>       #if DECDPUN==3		   /* fast path, 3-at-a-time */
>         bin=*inu;			   /* 3 digits ready for convert */
>         digits-=3;		   /* [may go negative] */


