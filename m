Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F11EBE60
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 16:44:57 +0200 (CEST)
Received: from localhost ([::1]:47864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg89w-0000m6-EV
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 10:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jg88c-00081L-9N; Tue, 02 Jun 2020 10:43:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jg88b-0006ZA-9S; Tue, 02 Jun 2020 10:43:33 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 052EWJHn090513; Tue, 2 Jun 2020 10:43:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dr0h9xfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 10:43:29 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 052EWbHc091715;
 Tue, 2 Jun 2020 10:43:29 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dr0h9xey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 10:43:28 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 052EQKVM001927;
 Tue, 2 Jun 2020 14:43:28 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 31bf49hd09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 14:43:28 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 052EhRRY49217944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jun 2020 14:43:27 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B747112064;
 Tue,  2 Jun 2020 14:43:27 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23823112061;
 Tue,  2 Jun 2020 14:43:27 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jun 2020 14:43:27 +0000 (GMT)
Subject: Re: [RFC 4/6] tests: tpm-emu: Remove assert on TPM2_ST_NO_SESSIONS
From: Stefan Berger <stefanb@linux.ibm.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
References: <20200601102113.1207-1-eric.auger@redhat.com>
 <20200601102113.1207-5-eric.auger@redhat.com>
 <50a54958-e9e0-c95f-3893-f7f790186e0e@linux.ibm.com>
Message-ID: <819aff96-6be2-3a3b-2b79-cd8e88029041@linux.ibm.com>
Date: Tue, 2 Jun 2020 10:43:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <50a54958-e9e0-c95f-3893-f7f790186e0e@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_13:2020-06-02,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 adultscore=0 impostorscore=0 cotscore=-2147483648 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006020100
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 10:08:28
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/20 9:39 AM, Stefan Berger wrote:
> On 6/1/20 6:21 AM, Eric Auger wrote:
>> While writing tests for checking the content of TPM2 and DSDT
>> along with TPM-TIS instantiation I attempted to reuse the
>> framework used for TPM-TIS tests. However While dumping the
>> ACPI tables I get an assert on TPM2_ST_NO_SESSIONS. My assumption
>> is maybe the other tests did not execute long enough to encounter
>> this. So I tentatively propose to remove the assert as it
>> does not seem to break other tests and enable the new ones.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   tests/qtest/tpm-emu.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
>> index c43ac4aef8..298d0eec74 100644
>> --- a/tests/qtest/tpm-emu.c
>> +++ b/tests/qtest/tpm-emu.c
>> @@ -49,7 +49,6 @@ static void *tpm_emu_tpm_thread(void *data)
>>           s->tpm_msg->tag = be16_to_cpu(s->tpm_msg->tag);
>>           s->tpm_msg->len = be32_to_cpu(s->tpm_msg->len);
>>           g_assert_cmpint(s->tpm_msg->len, >=, minhlen);
>> -        g_assert_cmpint(s->tpm_msg->tag, ==, TPM2_ST_NO_SESSIONS);
> You should not have to remove this. The tests are skipped if swtpm 
> does not support TPM 2 via --tpm2 option. This would be a very old 
> swtpm version, though. So, all tests are run with --tpm2 option and 
> any response received from the TPM would be a TPM 2 response that 
> should have TPM2_ST_NO_SESSIONS as the tag. I'd be curious what other 
> value you are seeing there.


In hw/tpm/tpm_util.c tpm_util_test_tpmdev() we have a probing function 
that tries to determine whether the attached TPM is a TPM 1.2 or TPM 2. 
It sends a TPM 2 command first and I would say this is the only command 
we should see in this (fake) TPM emulation here. We respond with a TPM 2 
command header [indicating failure], but the probing function should 
then not proceed to probe with the TPM 1.2 command.


>>             s->tpm_msg = g_realloc(s->tpm_msg, s->tpm_msg->len);
>>           qio_channel_read(ioc, (char *)&s->tpm_msg->code,
>
>


