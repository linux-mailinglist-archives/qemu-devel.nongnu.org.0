Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E453906F2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:52:39 +0200 (CEST)
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaII-0001fk-3I
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1llZhW-0003dv-42
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:14:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1llZhR-000457-3A
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:14:37 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PG3JQW002570; Tue, 25 May 2021 12:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SW3z3W1LzqxdWaZSGotRA4FvPmT5XhIG4fsnk/mtsSM=;
 b=jQnb97Z6kCEQLcAtSuqv1NNmz5hZRmwViSIdLA1ECHeGYh0zvI2uWYrQcJ2B2/pIjnEE
 PZyz4rvg4hX/d3iJLfqqntII78ZMVgTdIVXRCakEDXyU8UgfRckZmfvTm8IxPDUxrLvx
 LIzuJ6js2rPbvyqvGPLNedKd6qNiAZcGGlHsry1K8oslrnoTnZt0NGaM3WkW87ctr2M1
 K9fk3vOFIHKB+33V7FCnGOENy8f/SslPrpJvSxj3fKMYSNcqC2Hpc8Pq2BaTt733mCWc
 Jx4JinxTXgfrGlVEnIMg+pkmMI+CEJXBO6FjeKRIMo4IXpCW6DZdRvbX4PLixnc+cVmI Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38s4bmrhpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 12:14:29 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14PG3rFN004793;
 Tue, 25 May 2021 12:14:28 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38s4bmrhnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 12:14:28 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PG7xcr003789;
 Tue, 25 May 2021 16:14:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 38s1qd1j41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 16:14:28 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PGERw614745918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 16:14:27 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0BB311206F;
 Tue, 25 May 2021 16:14:27 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDCD3112069;
 Tue, 25 May 2021 16:14:27 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 16:14:27 +0000 (GMT)
Subject: Re: [PATCH 4/6] tests/qtest/pflash-cfi02-test: Avoid potential
 integer overflow
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210525134458.6675-1-peter.maydell@linaro.org>
 <20210525134458.6675-5-peter.maydell@linaro.org>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <fdc27797-d191-9449-b3b3-eb2d74b806a1@linux.ibm.com>
Date: Tue, 25 May 2021 12:14:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525134458.6675-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E8BMzWSHtLQKIdrFVfffArEoj3tfyzDs
X-Proofpoint-ORIG-GUID: GHgSQJABvfXtMuJOPOBdkIDsZpWwQhY6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_07:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/25/21 9:44 AM, Peter Maydell wrote:
> Coverity points out that we calculate a 64-bit value using 32-bit
> arithmetic; add the cast to force the multiply to be done as 64-bits.
> (The overflow will never happen with the current test data.)
>
> Fixes: Coverity CID 1432320
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   tests/qtest/pflash-cfi02-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-test.c
> index 60db81a3a2b..6168edc821a 100644
> --- a/tests/qtest/pflash-cfi02-test.c
> +++ b/tests/qtest/pflash-cfi02-test.c
> @@ -406,7 +406,7 @@ static void test_geometry(const void *opaque)
>
>       for (int region = 0; region < nb_erase_regions; ++region) {
>           for (uint32_t i = 0; i < c->nb_blocs[region]; ++i) {
> -            uint64_t byte_addr = i * c->sector_len[region];
> +            uint64_t byte_addr = (uint64_t)i * c->sector_len[region];
>               g_assert_cmphex(flash_read(c, byte_addr), ==, bank_mask(c));
>           }
>       }

