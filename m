Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836E3327DED
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:11:25 +0100 (CET)
Received: from localhost ([::1]:36560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhOW-00049y-Ip
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lGhNE-0003Zh-Im
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:10:04 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:38247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lGhNA-00006v-S8
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:10:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.102])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id E33D726A966;
 Mon,  1 Mar 2021 13:09:55 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 13:09:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001dc04b1e4-745b-4b3c-b8e6-288a704d7ad2,
 79E354DF6B7F793720F6EA4F82BCB5A412373A8E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 15/21] sd: emmc: Update CID structure for eMMC
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Markus Armbruster
 <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>, Vincent
 Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Alistair
 Francis <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, Paolo
 Bonzini <pbonzini@redhat.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1614540807-30686-16-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2237fa1b-4aa4-cb62-2225-6eba1caec38b@kaod.org>
Date: Mon, 1 Mar 2021 13:09:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1614540807-30686-16-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a4832eee-3223-4a47-b314-d06b99a25d6b
X-Ovh-Tracer-Id: 15677874731305765645
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehsrghirdhprghvrghnrdgsohguughuseigihhlihhngidrtghomh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 8:33 PM, Sai Pavan Boddu wrote:
> CID structure is little different for eMMC, w.r.t to product name and
> manufacturing date.
> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/sd/sd.c | 47 ++++++++++++++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index bba0446..08b77ad 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -365,23 +365,36 @@ static void sd_set_scr(SDState *sd)
>  
>  static void sd_set_cid(SDState *sd)
>  {
> -    sd->cid[0] = MID;       /* Fake card manufacturer ID (MID) */
> -    sd->cid[1] = OID[0];    /* OEM/Application ID (OID) */
> -    sd->cid[2] = OID[1];
> -    sd->cid[3] = PNM[0];    /* Fake product name (PNM) */
> -    sd->cid[4] = PNM[1];
> -    sd->cid[5] = PNM[2];
> -    sd->cid[6] = PNM[3];
> -    sd->cid[7] = PNM[4];
> -    sd->cid[8] = PRV;       /* Fake product revision (PRV) */
> -    sd->cid[9] = 0xde;      /* Fake serial number (PSN) */
> -    sd->cid[10] = 0xad;
> -    sd->cid[11] = 0xbe;
> -    sd->cid[12] = 0xef;
> -    sd->cid[13] = 0x00 |    /* Manufacture date (MDT) */
> -        ((MDT_YR - 2000) / 10);
> -    sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
> -    sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
> +    if (sd->emmc) {
> +        sd->cid[0] = MID;
> +        sd->cid[1] = 0x1;       /* CBX */
> +        sd->cid[2] = OID[0];    /* OEM/Application ID (OID) */
> +        sd->cid[8] = 0x0;
> +        sd->cid[9] = PRV;        /* Fake product revision (PRV) */
> +        sd->cid[10] = 0xde;      /* Fake serial number (PSN) */
> +        sd->cid[11] = 0xad;
> +        sd->cid[12] = 0xbe;
> +        sd->cid[13] = 0xef;
> +        sd->cid[14] = ((MDT_YR - 1997) % 0x10); /* MDT */
> +    } else {
> +        sd->cid[0] = MID;       /* Fake card manufacturer ID (MID) */
> +        sd->cid[1] = OID[0];    /* OEM/Application ID (OID) */
> +        sd->cid[2] = OID[1];
> +        sd->cid[8] = PRV;       /* Fake product revision (PRV) */
> +        sd->cid[9] = 0xde;      /* Fake serial number (PSN) */
> +        sd->cid[10] = 0xad;
> +        sd->cid[11] = 0xbe;
> +        sd->cid[12] = 0xef;
> +        sd->cid[13] = 0x00 |    /* Manufacture date (MDT) */
> +            ((MDT_YR - 2000) / 10);
> +        sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
> +   }
> +   sd->cid[3] = PNM[0];    /* Fake product name (PNM) 48bit */
> +   sd->cid[4] = PNM[1];
> +   sd->cid[5] = PNM[2];
> +   sd->cid[6] = PNM[3];
> +   sd->cid[7] = PNM[4];
> +   sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
>  }


These are constant values and could be kept in SDCardClass. 

C.


>  #define HWBLOCK_SHIFT   9           /* 512 bytes */
> 


