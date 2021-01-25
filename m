Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62828301FF5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 02:36:51 +0100 (CET)
Received: from localhost ([::1]:54462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3qoC-0005dL-UG
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 20:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1l3qmo-00057s-5y
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 20:35:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1l3qmm-0006Gi-35
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 20:35:21 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10P1XS61122526
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 20:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=L37ZFx3go/RdtI+cRd/KvvBZrxZV/KrDl6qqg9Vqhqs=;
 b=EDACP8+NZ8sfjeCCMh0gvIVCGaBkCSqItMukDTtq0Le/omdy4A/jbh2Xvy5rLljZD+xn
 TQKe+muJabdCZEeuqdYScDL5IowS3kuUPB4Aekf6BC20do7xmnNSqxcXZ5kE+kf0alyl
 l11VxgERyJeF0YS39y8OugrFz+sOfSFUK/H/o725IVUlB/L22RPoudkVwwzic7M7td9D
 rzlD3O0JawoIugz+gOqIrOp+VIPzkLgln1LdZxz1sfmY0SarLH5jyBl0uzg79nylBNLX
 5KflQY6K4flWe9FKfAhE3UcIN++GJ1T6pkkNsLw8btJH9PflApbimXCH2w04Drnj2R60 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 369m520a8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 20:35:16 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10P1YTTG127437
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 20:35:15 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 369m520a8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 Jan 2021 20:35:15 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10P1UYUH025568;
 Mon, 25 Jan 2021 01:35:14 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 368be8p74q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 01:35:14 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10P1ZD8p27591136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 01:35:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA249112065;
 Mon, 25 Jan 2021 01:35:13 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC6A4112064;
 Mon, 25 Jan 2021 01:35:13 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jan 2021 01:35:13 +0000 (GMT)
Subject: Re: [PATCH] tests: Fix memory leak in tpm-util.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210115204637.3332555-1-stefanb@linux.vnet.ibm.com>
 <9c97a694-e7c3-7fb2-10e6-9310055dac30@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <e6fcde28-95c7-beb7-2aff-ce49c75582e4@linux.ibm.com>
Date: Sun, 24 Jan 2021 20:35:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9c97a694-e7c3-7fb2-10e6-9310055dac30@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-24_13:2021-01-22,
 2021-01-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250006
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 10:44 AM, Philippe Mathieu-Daudé wrote:
> On 1/15/21 9:46 PM, Stefan Berger wrote:
>> This patch fixes the following memory leak detected by asan:
>>
>> Indirect leak of 560320 byte(s) in 136 object(s) allocated from:
>>      #0 0x556b3b3f9b57 in calloc (/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23fb57)
>>      #1 0x152b0e96b9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
>>      #2 0x556b3b588f61 in parse_object /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:318:12
>>      #3 0x556b3b588f61 in parse_value /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:546:16
>>      #4 0x556b3b5886e8 in json_parser_parse /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:580:14
>>      #5 0x556b3b52ff4a in json_message_process_token /home/stefanb/tmp/qemu-tip/build/../qobject/json-streamer.c:92:12
>>      #6 0x556b3b59896f in json_lexer_feed_char /home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:313:13
>>      #7 0x556b3b598443 in json_lexer_feed /home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:350:9
>>      #8 0x556b3b436c70 in qmp_fd_receive /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:614:9
>>      #9 0x556b3b435871 in qtest_qmp_receive_dict /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:636:12
>>      #10 0x556b3b435871 in qtest_qmp_receive /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:624:27
>>      #11 0x556b3b435c59 in qtest_vqmp /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:715:12
>>      #12 0x556b3b435c59 in qtest_qmp /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:756:16
>>      #13 0x556b3b4328c7 in tpm_util_wait_for_migration_complete /home/stefanb/tmp/qemu-tip/build/../tests/qtest/tpm-util.c:245:15
>>      #14 0x556b3b4333be in tpm_test_swtpm_migration_test /home/stefanb/tmp/qemu-tip/build/../tests/qtest/tpm-tests.c:117:5
>>      #15 0x152b0e98e29d  (/lib64/libglib-2.0.so.0+0x7b29d)
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   tests/qtest/tpm-util.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>
> Thanks!


I hope it solves all TPM-related memory leak issues for your tests. I 
have already seen this patch  in a PULL request now.

    Stefan


>
> Phil.
>


