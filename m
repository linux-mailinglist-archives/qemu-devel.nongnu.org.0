Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE3700C80
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 18:04:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxVDj-00005V-RE; Fri, 12 May 2023 12:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1pxVDh-0008VC-MY; Fri, 12 May 2023 12:02:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1pxVDf-0002Zp-OZ; Fri, 12 May 2023 12:02:13 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CFewdS020541; Fri, 12 May 2023 16:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=seX/kuQHN20bJ3yUXcDP0uGSJVH7NSqgLfEIj71Hf48=;
 b=og4nyqCmuJTsBO75NF8d7Nb5BpcvomWr0BkIEGB5VWcBCI5NfGeCNDDOF1UsRSOnMaCy
 lsN5YX/ydc021oSdS4htknYQlm96zns2qsNMcpVsUiagI3P/zc4Ey5KgQBx54JE8VwEv
 mSYZ2+TwLxBsLzpNBqGZS5xqgd7G+00iiFDT5dgN/DS6E15uhvDzWEG/BX6WtPQvrwtX
 ahn9pDhZSFEpreBo/Kfje2M0xX6fNC6mrONsWVW1ku+/1XQ3py13FDfJyyTObDe9akcT
 QtvOpJReJAjoG78paUE2jIbH4oW+MBULPRGFIETnqX+A9tJLQEwf/A9/vBxI6bkKB5Ky xw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qh5g9admm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 16:02:08 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34CG27Xd018657
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 16:02:07 GMT
Received: from [10.251.40.46] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 12 May
 2023 09:02:05 -0700
Message-ID: <88e30a90-71c3-0ded-8412-0f3af6ec3b37@quicinc.com>
Date: Fri, 12 May 2023 17:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] sbsa-ref: switch default cpu core to Neoverse-N1
To: Peter Maydell <peter.maydell@linaro.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20230506183417.1360427-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA-d2_3xXMNwMG+-WOw=y=zandSM24-GfcJ8s=3etqACcQ@mail.gmail.com>
From: Leif Lindholm <quic_llindhol@quicinc.com>
In-Reply-To: <CAFEAcA-d2_3xXMNwMG+-WOw=y=zandSM24-GfcJ8s=3etqACcQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2zbxfDMp0ysBg9TnW4AyEfJm-1IWWK2d
X-Proofpoint-ORIG-GUID: 2zbxfDMp0ysBg9TnW4AyEfJm-1IWWK2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305120133
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023-05-12 15:50, Peter Maydell wrote:
> On Sat, 6 May 2023 at 19:34, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>>
>> The world outside moves to newer and newer cpu cores. Let move SBSA
>> Reference Platform to something newer as well.
>>
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> ---
>>   hw/arm/sbsa-ref.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>> index 0b93558dde..a1562f944a 100644
>> --- a/hw/arm/sbsa-ref.c
>> +++ b/hw/arm/sbsa-ref.c
>> @@ -852,7 +852,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>>
>>       mc->init = sbsa_ref_init;
>>       mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
>> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
>> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n1");
>>       mc->max_cpus = 512;
>>       mc->pci_allow_0_address = true;
>>       mc->minimum_page_bits = 12;
> 
> Seems reasonable; Leif, any objection?

None.

Longer-term, I still want to move to "max" as the default, but that is 
likely to require some invasive changes to TF-A, and this is already a 
huge improvement. So:
Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

Thanks!

/
     Leif



