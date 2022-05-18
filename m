Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D552BB9F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:55:17 +0200 (CEST)
Received: from localhost ([::1]:57020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrK8y-00047d-Dt
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nrK0J-0008Dg-3y
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:46:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nrK0G-0005qR-SW
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:46:18 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IDjSFU013010;
 Wed, 18 May 2022 13:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8HrEjw7s7Gg10LYiCUnWUXK5Fkj6ba4rcBlf36rvNmc=;
 b=JFfdbqRo2upgfID5EI4KGBnBKHTyk3/RG/RBDrXU79LUWJl4jzJ3AiJq0VcpPO0U1C1U
 9TVkInhoGHzCKAXKcf66BNee1cOxwKCePux9ImwEAgDpNe+NHy1UQZfsuXHeb6f4BBUH
 3ZvOAVA/Z+yC6d2/cVFAIp4SR/fbCQWmR1wpjv+xH7VckWFtvxzMJlzG4ITB84FXjGt6
 gIlxsdgIk/BAt3jg8MtkfTHqxO+6j7ZTFZCJeiabM3UHNHtVuM1sL3ywNCgJVnpubyRw
 xfA/nLR7xY5x90j2cPI906vds7bupXRpf7GW1FZs5Xh4fI0TMaL8wbC43/E5uKdNLBD/ Rw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g51y8g0fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 13:46:13 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24IDgs9C029314;
 Wed, 18 May 2022 13:46:12 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 3g242acubr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 13:46:12 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24IDkBY97930280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 13:46:11 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FA1B136055;
 Wed, 18 May 2022 13:46:11 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F301513605D;
 Wed, 18 May 2022 13:46:10 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 13:46:10 +0000 (GMT)
Message-ID: <d12b05bd-6bbe-b5a5-1801-540e5d0d63d8@linux.ibm.com>
Date: Wed, 18 May 2022 09:46:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] hw/tpm/tpm_tis_common.c: Assert that locty is in range
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220513163827.26281-1-peter.maydell@linaro.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220513163827.26281-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h4MIwYB6zXETW15wA0hs9wzZVWZyWAj_
X-Proofpoint-ORIG-GUID: h4MIwYB6zXETW15wA0hs9wzZVWZyWAj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_05,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180079
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/13/22 12:38, Peter Maydell wrote:
> In tpm_tis_mmio_read(), tpm_tis_mmio_write() and
> tpm_tis_dump_state(), we calculate a locality index with
> tpm_tis_locality_from_addr() and then use it as an index into the
> s->loc[] array.  In all these cases, the array index can't overflow
> because the MemoryRegion is sized to be TPM_TIS_NUM_LOCALITIES <<
> TPM_TIS_LOCALITY_SHIFT bytes.  However, Coverity can't see that, and
> it complains (CID 1487138, 1487180, 1487188, 1487198, 1487240).

> 
> Add assertions that the calculated locality index is valid, which
> will help Coverity and also catch any potential future bug where
> the MemoryRegion isn't sized exactly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I trust that the 3 fixes resolve the 5 CIDs.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> ---
> Tested with 'make check' only...
> 
>   hw/tpm/tpm_tis_common.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
> index e700d821816..81edae410c8 100644
> --- a/hw/tpm/tpm_tis_common.c
> +++ b/hw/tpm/tpm_tis_common.c
> @@ -295,6 +295,8 @@ static void tpm_tis_dump_state(TPMState *s, hwaddr addr)
>       uint8_t locty = tpm_tis_locality_from_addr(addr);
>       hwaddr base = addr & ~0xfff;
> 
> +    assert(TPM_TIS_IS_VALID_LOCTY(locty));
> +
>       printf("tpm_tis: active locality      : %d\n"
>              "tpm_tis: state of locality %d : %d\n"
>              "tpm_tis: register dump:\n",
> @@ -336,6 +338,8 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
>       uint32_t avail;
>       uint8_t v;
> 
> +    assert(TPM_TIS_IS_VALID_LOCTY(locty));
> +
>       if (tpm_backend_had_startup_error(s->be_driver)) {
>           return 0;
>       }
> @@ -458,6 +462,8 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
>       uint16_t len;
>       uint32_t mask = (size == 1) ? 0xff : ((size == 2) ? 0xffff : ~0);
> 
> +    assert(TPM_TIS_IS_VALID_LOCTY(locty));
> +
>       trace_tpm_tis_mmio_write(size, addr, val);
> 
>       if (locty == 4) {

All 3 of your fixes below are after the 3 existing calls to 
tpm_tis_locality_from_addr(). Would Coverity be happy if we were to move 
the asserts into that one function? I am fine with this patch, though.

