Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8BD3B74C4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:59:18 +0200 (CEST)
Received: from localhost ([::1]:57356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFCn-0001j7-Fd
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lyFB3-0000wB-1X
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:57:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20058
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lyFAy-0002JM-HG
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:57:28 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TEYdqM089747
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YuVROYmKB87UW/H2bjm8B95g4+1QAmcqRQKVL/SKXQ0=;
 b=jHRppf1puffN6Y4p/PEVbWTyNUT+JvovnXlHTSM1VMBxFNeRFM0q6TqYyZBcZwFMhXCB
 6p8P2EQfwXFn+gJsvpKLWL942STvjWU785QCgOvEc7nV9F4vHoCyuBh8IlmXVq/WiObc
 cm1b9B8pJp6cD3DBNBnCoAlbeuySVsFfSKWMeACbthh+Zn2GzKOgKGPrHkiDVJBkyFHv
 udnirYcXi2OtcfrSGPZv+w0LIyMih8mp0bwwWehFct38KrBjx+o/WuVOSImqeVlD/Rj/
 QD03oOeIrlYChwdt68xm4EybUoU6LNaFFoSSQ7JBahYwxlWIz2kQMcHu8esu94/9V+2Q nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39g59urx8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:57:19 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15TEZFCd097556
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:57:18 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39g59urx82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 10:57:18 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15TElY7g024360;
 Tue, 29 Jun 2021 14:57:17 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 39duvcuhgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 14:57:14 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15TEuGnS25035100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 14:56:16 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 519EECAA98;
 Tue, 29 Jun 2021 14:56:16 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04AA2CAACE;
 Tue, 29 Jun 2021 14:56:15 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 29 Jun 2021 14:56:15 +0000 (GMT)
Subject: Re: [PATCH 24/53] acpi: build_tpm2: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210625091818.1047980-26-imammedo@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <86ab2d57-ffb7-1e30-69f9-bb81863f6bf0@linux.ibm.com>
Date: Tue, 29 Jun 2021 10:56:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625091818.1047980-26-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y7hypu0ynE4dhaiKfDbV13lAgmSGxk7E
X-Proofpoint-ORIG-GUID: UMjcT6vAehaAcA1m9noYjVetbNi9kdC7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_06:2021-06-28,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mst@redhat.com, stefanb@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/25/21 5:17 AM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

I applied patch 19 of this series along with this one and this one works 
(TPM 1.2 not so much with TCPA modifications):

Tested-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
> CC: stefanb@linux.vnet.ibm.com
> ---
>   hw/acpi/aml-build.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 3da32301b6..159f998187 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2098,13 +2098,14 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                   const char *oem_id, const char *oem_table_id)
>   {
>       uint8_t start_method_params[12] = {};
> -    unsigned log_addr_offset, tpm2_start;
> +    unsigned log_addr_offset;
>       uint64_t control_area_start_address;
>       TPMIf *tpmif = tpm_find();
>       uint32_t start_method;
> +    AcpiTable table = { .sig = "TPM2", .rev = 4,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>
> -    tpm2_start = table_data->len;
> -    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +    acpi_init_table(&table, table_data);
>
>       /* Platform Class */
>       build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
> @@ -2142,9 +2143,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>       bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>                                      log_addr_offset, 8,
>                                      ACPI_BUILD_TPMLOG_FILE, 0);
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + tpm2_start),
> -                 "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
> +    acpi_table_composed(linker, &table);
>   }
>   #endif
>

