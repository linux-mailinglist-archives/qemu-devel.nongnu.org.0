Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC66424575
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:58:16 +0200 (CEST)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBBH-0003En-8p
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mYAom-0003bY-Lr; Wed, 06 Oct 2021 13:35:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mYAok-0001yk-KI; Wed, 06 Oct 2021 13:35:00 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196H7KJO010239; 
 Wed, 6 Oct 2021 13:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=B0b/hxyJaTwVoOEY3a56lq+WxzilZtuBTmnAASmoT5o=;
 b=UcDkOGuBBfme3XzHM6GoysQ7Gr1J88v8k3z79OKzvTCltPv0v1EL/k2c3osuH6YzG3B+
 nyDogm5ZABVSNz+hc68LgkMygJsH5XMurgx4ub+bqZ50egEwlue7WGXrC43KiWczbyGk
 FwbFObor7hvgOTn6gX7dgLSELf5JikFGGVbrjGEsyTPmb2waaS3+cW1KKcDX8TiPE/XY
 28WAG0v3L0iG4Hg0IP+xI6I81OCCiLriuN+kM/QQ8CJWLfeycre2yJXyIUoANP4/qhyr
 uqBGIDGS047vtzZdOLjHo2H9RxF1IJa4kwq8wB6LUXnXxbyAXJy2DklaqmlWOGTheYXx 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bh38ba9ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 13:34:52 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 196H7LBh010389;
 Wed, 6 Oct 2021 13:34:52 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bh38ba99g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 13:34:51 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 196HWePX017925;
 Wed, 6 Oct 2021 17:34:50 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3bhepcrwhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 17:34:49 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 196HTM0H53150062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Oct 2021 17:29:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D257C11C06C;
 Wed,  6 Oct 2021 17:34:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70C0211C05E;
 Wed,  6 Oct 2021 17:34:44 +0000 (GMT)
Received: from li-43c5434c-23b8-11b2-a85c-c4958fb47a68.ibm.com (unknown
 [9.171.18.96]) by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Oct 2021 17:34:44 +0000 (GMT)
Subject: Re: [PATCH] s390x/ipl: check kernel command line size
To: Marc Hartmayer <mhartmay@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211006092631.20732-1-mhartmay@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <becad959-69c2-326a-c774-91b5bad5329d@de.ibm.com>
Date: Wed, 6 Oct 2021 19:34:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211006092631.20732-1-mhartmay@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yYUp3pWPQFzLzhW3iSqX6s0z2MiCbVR9
X-Proofpoint-GUID: hejgCULXQEbYEk4V08cOhF9LJf0wnPgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110060110
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Sven Schnelle <svens@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 06.10.21 um 11:26 schrieb Marc Hartmayer:
> Check if the provided kernel command line exceeds the maximum size of the s390x
> Linux kernel command line size, which is 896 bytes.
> 
> Reported-by: Sven Schnelle <svens@linux.ibm.com>
> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>


> ---
>   hw/s390x/ipl.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index 1821c6faeef3..a58ea58cc736 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -38,6 +38,7 @@
>   #define KERN_IMAGE_START                0x010000UL
>   #define LINUX_MAGIC_ADDR                0x010008UL
>   #define KERN_PARM_AREA                  0x010480UL
> +#define KERN_PARM_AREA_SIZE             0x000380UL
>   #define INITRD_START                    0x800000UL
>   #define INITRD_PARM_START               0x010408UL
>   #define PARMFILE_START                  0x001000UL
> @@ -190,10 +191,19 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>            * loader) and it won't work. For this case we force it to 0x10000, too.
>            */
>           if (pentry == KERN_IMAGE_START || pentry == 0x800) {
> -            char *parm_area = rom_ptr(KERN_PARM_AREA, strlen(ipl->cmdline) + 1);
> +            size_t cmdline_size = strlen(ipl->cmdline) + 1;
> +            char *parm_area = rom_ptr(KERN_PARM_AREA, cmdline_size);
> +
>               ipl->start_addr = KERN_IMAGE_START;
>               /* Overwrite parameters in the kernel image, which are "rom" */
>               if (parm_area) {
> +                if (cmdline_size > KERN_PARM_AREA_SIZE) {
> +                    error_setg(errp,
> +                               "kernel command line exceeds maximum size: %lu > %lu",
> +                               cmdline_size, KERN_PARM_AREA_SIZE);
> +                    return;
> +                }
> +
>                   strcpy(parm_area, ipl->cmdline);
>               }
>           } else {
> 

