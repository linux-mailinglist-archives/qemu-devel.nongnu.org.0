Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90E47F9C3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 03:26:04 +0100 (CET)
Received: from localhost ([::1]:50850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1fi6-0003wc-TU
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 21:26:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n1fgz-0003Gb-Bc
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 21:24:53 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35234
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n1fgx-0008B4-Lz
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 21:24:53 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BR21W2l028355; 
 Mon, 27 Dec 2021 02:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2AdkmA5k4MQqtg3qZ/dGpqACF5g9nysTXYi1Uwj+GGQ=;
 b=jNihZisqah7SZfWGjq6lZAeu+j0sheAUhcGsVkyrbcbYDUOpp531d8OfviKVVr2iRx22
 MslGR6IYnYCy0RbWH4bwD5u+4OSfct5nTtjprUUD8NwXEgCdPfpqz3Dm2kpX1+H9dHGH
 MHGKi4PDRhdNnHEZ9HhtkTAcwLm+qOd+Qplp9sVJ3orPnh5lCFhf6op/qhFwIQ9MAIl7
 IDIDXf6wJFLCzMfOMAtBOzVSonvr53BrJuDo7B0fD4k+E4eNgeqgrddZEXK850KOQO0W
 P2oEt7fWUJbn7/uXTOTy7wOtaylzBOMSI06h4T617fcQXLGfyRNn+NpJNDEeoebByO5A tQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d74beg9vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 02:24:46 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BR2IDlM021866;
 Mon, 27 Dec 2021 02:24:46 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3d5tx9anuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 02:24:46 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BR2OjBo31719780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 02:24:45 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BE10B2065;
 Mon, 27 Dec 2021 02:24:45 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 754A0B2068;
 Mon, 27 Dec 2021 02:24:45 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 02:24:45 +0000 (GMT)
Message-ID: <c212e049-0f1a-dc81-e785-2ae02097187d@linux.ibm.com>
Date: Sun, 26 Dec 2021 21:24:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] tpm: fixed be_buffer_size size in in tpm_crb
Content-Language: en-US
To: Yuri Konotopov <ykonotopov@gnome.org>, qemu-devel@nongnu.org
References: <20211225123806.113368-1-ykonotopov@gnome.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20211225123806.113368-1-ykonotopov@gnome.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jx9dD70xN7_JyyS9fnNtc_2r-Agt9J3D
X-Proofpoint-ORIG-GUID: jx9dD70xN7_JyyS9fnNtc_2r-Agt9J3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-26_11,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270010
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.063,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 12/25/21 07:38, Yuri Konotopov wrote:
> Trying to boot VM with TPM 2.0 CRB in passthrough mode without this change
> I got "Requested buffer size of 3968 is smaller than host TPM's fixed
> buffer size of 4096".

I suppose the host has a TIS interface.

The reason it gives this message is that the response this TPM may send 
back could be 4096 bytes in size but the CRB of the VM can only catch 
3968 bytes, so there's a mismatch. You may not be able to use the CRB in 
passthrough mode. I would try to have the VM use the TIS.

    Stefan


> Looks like it can not be less than backend buffer size nor less than
> CRB_CTRL_CMD_SIZE.
>
> Signed-off-by: Yuri Konotopov <ykonotopov@gnome.org>
> ---
>   hw/tpm/tpm_crb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index 58ebd1469c..8243645453 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -270,7 +270,7 @@ static void tpm_crb_reset(void *dev)
>       s->regs[R_CRB_CTRL_RSP_SIZE] = CRB_CTRL_CMD_SIZE;
>       s->regs[R_CRB_CTRL_RSP_ADDR] = TPM_CRB_ADDR_BASE + A_CRB_DATA_BUFFER;
>   
> -    s->be_buffer_size = MIN(tpm_backend_get_buffer_size(s->tpmbe),
> +    s->be_buffer_size = MAX(tpm_backend_get_buffer_size(s->tpmbe),
>                               CRB_CTRL_CMD_SIZE);
>   
>       if (tpm_backend_startup_tpm(s->tpmbe, s->be_buffer_size) < 0) {

