Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BA8280D63
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 08:17:34 +0200 (CEST)
Received: from localhost ([::1]:46224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOENp-0001yX-Vv
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 02:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kOEMC-00016o-St; Fri, 02 Oct 2020 02:15:52 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:49709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kOEMA-00035Z-M9; Fri, 02 Oct 2020 02:15:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.55])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C4B4F61365FC;
 Fri,  2 Oct 2020 08:15:47 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 2 Oct 2020
 08:15:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e48d8418-5ed3-4e51-aecf-f19eb2745c50,
 E5699CC8EA5174E5FAE9BB942A50BECA2342936F) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] ppc/pnv: Increase max firware size
To: David Gibson <david@gibson.dropbear.id.au>
References: <20201002061353.1340766-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <81451df1-43d5-43ce-e3cf-703d78333841@kaod.org>
Date: Fri, 2 Oct 2020 08:15:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201002061353.1340766-1-clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: de6d6c11-8638-4ff6-9456-eb403828548a
X-Ovh-Tracer-Id: 14236722847832771549
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrfeehgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 02:15:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.26,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That was sent a bit fast. Can you please add in the commit log : 

  Builds enabling GCOV can be bigger than 4MB and the limit on FSP
  systems is 16MB. 

Thanks 

C.

On 10/2/20 8:13 AM, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/pnv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 6670967e26a9..d9e52873ea70 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -61,7 +61,7 @@
>  
>  #define FW_FILE_NAME            "skiboot.lid"
>  #define FW_LOAD_ADDR            0x0
> -#define FW_MAX_SIZE             (4 * MiB)
> +#define FW_MAX_SIZE             (16 * MiB)
>  
>  #define KERNEL_LOAD_ADDR        0x20000000
>  #define KERNEL_MAX_SIZE         (256 * MiB)
> 


