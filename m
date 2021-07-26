Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC333D5374
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 08:59:47 +0200 (CEST)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7uaY-00059m-BW
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 02:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1m7uZH-0004Tr-3Y
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 02:58:27 -0400
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:48594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1m7uZB-000337-Fv
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 02:58:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id E101928A556;
 Mon, 26 Jul 2021 08:58:09 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 26 Jul
 2021 08:58:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002e4cd0b69-438d-41fe-ad91-857aa83272c0,
 304F60ADCA8AFD6B2B28CBB9C9B5026C0D1EFB7F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH for-6.1? v2 7/9] hw/pci-hist/pnv_phb4: Fix typo in
 pnv_phb4_ioda_write
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Richard
 Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
 <20210725122416.1391332-8-richard.henderson@linaro.org>
 <ddbabd5d-9dba-6f3e-b0b2-d770730fa427@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <74a90eeb-0c03-d541-bef0-ccf61b80d12e@kaod.org>
Date: Mon, 26 Jul 2021 08:58:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ddbabd5d-9dba-6f3e-b0b2-d770730fa427@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8c1986cc-a1d0-4502-b612-a0aa8ca28e75
X-Ovh-Tracer-Id: 6701637724073397155
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrgeeggddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo52.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.091,
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/21 11:27 PM, Philippe Mathieu-Daudé wrote:
> +Cédric/Benjamin
> 
> On 7/25/21 2:24 PM, Richard Henderson wrote:
>> From clang-13:
>> hw/pci-host/pnv_phb4.c:375:18: error: variable 'v' set but not used \
>>     [-Werror,-Wunused-but-set-variable]
>>
>> It's pretty clear that we meant to write back 'v' after
>> all that computation and not 'val'.
>>
> 
> Fixes: 4f9924c4d4c ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")

I went through the code and the PHB4 specs and I guess we didn't 
see any issues before because the written data is properly formatted
in OPAL.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> 
>> Acked-by: David Gibson <david@gibson.dropbear.id.au>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  hw/pci-host/pnv_phb4.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 54f57c660a..5c375a9f28 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -392,7 +392,7 @@ static void pnv_phb4_ioda_write(PnvPHB4 *phb, uint64_t val)
>>              v &= 0xffffffffffff0000ull;
>>              v |= 0x000000000000cfffull & val;
>>          }
>> -        *tptr = val;
>> +        *tptr = v;
>>          break;
>>      }
>>      case IODA3_TBL_MBT:
>>
> 


