Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C896C492B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 12:29:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewe9-0004uK-Ju; Wed, 22 Mar 2023 07:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pewdz-0004tO-Di
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:28:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pewdx-00078i-Q7
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:28:39 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MAg7id001308; Wed, 22 Mar 2023 11:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YBwqPl/eXBoiBX9KVYH2fr5z3xIpltKL3SRU9yOEvtg=;
 b=C6hCPH2M0fI9OskB59k9EiboLQhyL98u6ieZ0aBXAkVs9+WUsEvKKpF0MPrAOLIlw49n
 sD+nXzYNvM03jy7Bp3qjkTlCR+qiQpeN8DKXF15gZHRu/XGLqpdVGiGd6+EYCcqWA87I
 +QVdBNQVz6/8ScUpVP+sSkwoJgks7YYbFLMaLGzitEscA+HzaWl3HUED2j7u7q618s/q
 ewz5DudMA5JxFQfjKdPjCqw0r0wb6WMNSRQP79s+lqmCCvcUfytIi7SG0eQRiQm/Ysns
 IFONeSFD5iLufDBiH6MnyKlNIkcaCgNXkHsjjTxiclNjOIE3JohrhazPt9X/eaoBVaSg 0g== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg05a95rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 11:28:24 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MB6ilN032024;
 Wed, 22 Mar 2023 11:28:22 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x700gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 11:28:22 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32MBSL1x29295158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 11:28:21 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 131815805E;
 Wed, 22 Mar 2023 11:28:21 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D38F758059;
 Wed, 22 Mar 2023 11:28:20 +0000 (GMT)
Received: from [9.211.67.180] (unknown [9.211.67.180])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 11:28:20 +0000 (GMT)
Message-ID: <9d656af9-913b-c586-79cf-eae842f45281@linux.vnet.ibm.com>
Date: Wed, 22 Mar 2023 06:28:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
 <20230321053001.3886666-4-ninad@linux.ibm.com>
 <2d32bfa7-0804-c046-bb8c-ca30d400ed4a@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <2d32bfa7-0804-c046-bb8c-ca30d400ed4a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 90Qj8dxACNqMij6OwoqrylS9mPYRVnKr
X-Proofpoint-ORIG-GUID: 90Qj8dxACNqMij6OwoqrylS9mPYRVnKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_08,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220079
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


On 3/21/23 8:30 PM, Stefan Berger wrote:
>
>
> On 3/21/23 01:30, Ninad Palsule wrote:
>> Qemu already supports devices attached to ISA and sysbus. This drop adds
>> support for the I2C bus attached TPM devices. I2C model only supports
>> TPM2 protocol.
>>
>
>> +
>> +/* Send data to TPM */
>> +static inline void tpm_tis_i2c_tpm_send(TPMStateI2C *i2cst)
>> +{
>> +    if ((i2cst->operation == OP_SEND) && (i2cst->offset > 1)) {
>> +        uint16_t tis_reg;
>> +        uint32_t data;
>> +        int      i;
>> +
>> +        tis_reg = tpm_tis_i2c_to_tis_reg(i2cst->data[0], &i2cst->size);
>> +
>> +        /* Index 0 is always a register */
>> +        for (i = 1; i < i2cst->offset; i++) {
>> +            data = (i2cst->data[i] & 0xff);
>> +            tpm_tis_write_data(&i2cst->state, tis_reg, data, 1);
>> +        }
>
>
> I think there should be tpm_tis_set_data_buffer function that you can 
> call rather than transferring the data byte-by-byte.
>
> Thanks for the series!
>
>   Stefan

I thought about it but the FIFO case performs multiple operations hence 
I did not want to change it. Currently there is no function to set data 
buffer in the common code.

Thanks for the review!

Ninad Palsule


