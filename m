Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA953C737A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:43:57 +0200 (CEST)
Received: from localhost ([::1]:33364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KZh-0003Lh-2m
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m3KYO-0001tm-St
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:42:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47218
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m3KYM-0006ea-2d
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:42:36 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DFY2i0196404
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 11:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xQ6xS9YTbLMvCbseoDV5wUzcqqvxu69oPEf+/7xx7Ew=;
 b=IHTgUT5r7ycoxeAqkRE6Pv0AMASW4yaZk3BaWp/GCck5e80X/iBvTBgJaKeklh6sRXs6
 l0SHBSEuuYkRQi4MGsrAsJ2mVKqES39sG3zizPBm8ZFKOtFc+2nUSDNNxRZFPbEXVmKx
 1co/mOAhDw7c7VTqM9dFm14x0PwJ7n6MTjq6bidDn2/cAMrQXQTBKKB5wKcm6vKPoPak
 SeTU+bCVzb6DUjrFaqJ2N6FTe03Zpx/yxDaiMWqOE+HKMRegVw38LIarJLy1o0URIQSx
 gDWApMnA+DtVqyVhW20ozmqDDMgo4BQyx7IXIolz6arOfY4SXXiTkAyVoxMUV5dN3Ws3 /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs3ca1sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 11:42:31 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16DFYBIP001108
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 11:42:31 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs3ca1s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 11:42:31 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16DFflbr023403;
 Tue, 13 Jul 2021 15:42:30 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 39rkguc5bc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 15:42:30 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16DFgTqT32112974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 15:42:29 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B10F136060;
 Tue, 13 Jul 2021 15:42:29 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5B6A13605D;
 Tue, 13 Jul 2021 15:42:28 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 15:42:28 +0000 (GMT)
Subject: Re: [PATCH v4 00/10] tests: Add test cases for TPM 1.2 ACPI tables
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20210712204736.365349-1-stefanb@linux.vnet.ibm.com>
 <20210713111900-mutt-send-email-mst@kernel.org>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <12871140-459a-d368-4130-64a27a90b00a@linux.ibm.com>
Date: Tue, 13 Jul 2021 11:42:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713111900-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QbbinrxCej71tFE7FcTpicd-kpQ6DaXh
X-Proofpoint-ORIG-GUID: AO3SE4-rt-qyTMcVt82Q6ObqOv_Hgh5P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_07:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130099
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.368,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/13/21 11:19 AM, Michael S. Tsirkin wrote:
> On Mon, Jul 12, 2021 at 04:47:26PM -0400, Stefan Berger wrote:
>> This series of patches adds test case for TPM 1.2 ACPI tables.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> Pls feel free to merge through tpm tree.

Thanks. I will have to post a v5 since this one had issues on s390x.

   Stefan


>
>>    Stefan
>>
>> v4:
>>    - Added patch 10 that checks for availability of a TPM device model
>>      using QMP and if not available skips the ACPI table test
>>
>> v3:
>>    - Define enum TPMVersion for when CONFIG_TPM is not defined
>>      affected patches 2 and 6
>>
>> v2:
>>    - Proper handling of renaming of files holding expected ACPI data
>>
>>
>> Stefan Berger (10):
>>    tests: Rename TestState to TPMTestState
>>    tests: Add tpm_version field to TPMTestState and fill it
>>    tests: acpi: Prepare for renaming of TPM2 related ACPI files
>>    tests: Add suffix 'tpm2' or 'tpm12' to ACPI table files
>>    tests: acpi: tpm2: Add the renamed ACPI files and drop old ones
>>    tests: tpm: Create TPM 1.2 response in TPM emulator
>>    tests: acpi: prepare for new TPM 1.2 related tables
>>    tests: acpi: Add test cases for TPM 1.2 with TCPA table
>>    tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs
>>    tests: Use QMP to check whether a TPM device model is available
>>
>>   tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 0 -> 8465 bytes
>>   .../data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
>>   tests/data/acpi/q35/TCPA.tis.tpm12            | Bin 0 -> 50 bytes
>>   .../data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
>>   tests/qtest/bios-tables-test.c                |  30 ++++++---
>>   tests/qtest/tpm-crb-test.c                    |   5 +-
>>   tests/qtest/tpm-emu.c                         |  61 ++++++++++++++++--
>>   tests/qtest/tpm-emu.h                         |  20 +++++-
>>   tests/qtest/tpm-tis-device-test.c             |   3 +-
>>   tests/qtest/tpm-tis-test.c                    |   3 +-
>>   tests/qtest/tpm-tis-util.c                    |   2 +-
>>   11 files changed, 100 insertions(+), 24 deletions(-)
>>   create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm12
>>   rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
>>   create mode 100644 tests/data/acpi/q35/TCPA.tis.tpm12
>>   rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)
>>
>> -- 
>> 2.31.1
>>
>>

