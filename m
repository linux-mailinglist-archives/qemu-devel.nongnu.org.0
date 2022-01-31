Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD574A3F69
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:41:07 +0100 (CET)
Received: from localhost ([::1]:50572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nETBK-0006lM-Cr
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:41:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nET7l-0004Z8-Eg; Mon, 31 Jan 2022 04:37:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nET7e-0008Hp-HF; Mon, 31 Jan 2022 04:37:23 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20V73cHv006005; 
 Mon, 31 Jan 2022 09:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MlXN9e8Mr+TyOHHfDymEiGZI+Q85RZnWsLD4OmDiVMo=;
 b=JY1ikMkxgS3mJFUceTv4b+Ek1BZht11IE+gu+0xu9qsItLaiOkDHozg+jgkGNK6o1UVu
 5+Gh3gMb3tiyzAp6k9vaffhxs6gHx4jAd+hhHBFB4sK+WiPR55NdAjwB/S8vNljHB/F4
 Pv6H/A2s2SUsYA0QXaZUCMhbgdr7GNkaQAq/+f4fIAJ/HyP2AhM7/8QVFevzb3V3HteI
 PbTMwraqxwz2kDpU0WLcyr0GregEKjShtsrOe7Xjzbwemdu1JHmyrJSfrjutYHZrWQIA
 0h17/w95BbrA69uwOs/dfgIjSksEi9sik7+s5NO7kGDIjV1vxBILznA1B4ASS5Q2hlPi Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx66cq0sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 09:35:58 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20V8vxMd013574;
 Mon, 31 Jan 2022 09:35:57 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx66cq0ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 09:35:57 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20V9SEMl019369;
 Mon, 31 Jan 2022 09:35:55 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3dvvuhs871-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 09:35:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20V9ZpqN13435172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 09:35:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C157CAE051;
 Mon, 31 Jan 2022 09:35:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11130AE04D;
 Mon, 31 Jan 2022 09:35:51 +0000 (GMT)
Received: from [9.171.16.238] (unknown [9.171.16.238])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 31 Jan 2022 09:35:50 +0000 (GMT)
Message-ID: <2309d661-be2b-de6b-f53f-51190279f367@linux.ibm.com>
Date: Mon, 31 Jan 2022 10:37:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 4/9] s390x/pci: enable for load/store intepretation
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20220114203849.243657-1-mjrosato@linux.ibm.com>
 <20220114203849.243657-5-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20220114203849.243657-5-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OQjQq7bVkovY5k2fo9QCYEz4QqJTL7DC
X-Proofpoint-ORIG-GUID: yrxysnpqkbMAsVObC-A-TGVdGQY1V5wm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_02,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, schnelle@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/14/22 21:38, Matthew Rosato wrote:
> Use the associated vfio feature ioctl to enable interpretation for devices
> when requested.  As part of this process, we must use the host function
> handle rather than a QEMU-generated one -- this is provided as part of the
> ioctl payload.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c          | 70 +++++++++++++++++++++++++++++++-
>   hw/s390x/s390-pci-inst.c         | 63 +++++++++++++++++++++++++++-
>   hw/s390x/s390-pci-vfio.c         | 52 ++++++++++++++++++++++++
>   include/hw/s390x/s390-pci-bus.h  |  1 +
>   include/hw/s390x/s390-pci-vfio.h | 15 +++++++
>   5 files changed, 199 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 01b58ebc70..a39ccfee05 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -971,12 +971,58 @@ static void s390_pci_update_subordinate(PCIDevice *dev, uint32_t nr)
>       }
>   }
>   

...snip...

> diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
> index ff708aef50..42533e38f7 100644
> --- a/include/hw/s390x/s390-pci-vfio.h
> +++ b/include/hw/s390x/s390-pci-vfio.h
> @@ -20,6 +20,9 @@ bool s390_pci_update_dma_avail(int fd, unsigned int *avail);
>   S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
>                                             S390PCIBusDevice *pbdev);
>   void s390_pci_end_dma_count(S390pciState *s, S390PCIDMACount *cnt);
> +int s390_pci_probe_interp(S390PCIBusDevice *pbdev);
> +int s390_pci_set_interp(S390PCIBusDevice *pbdev, bool enable);
> +int s390_pci_update_passthrough_fh(S390PCIBusDevice *pbdev);
>   void s390_pci_get_clp_info(S390PCIBusDevice *pbdev);
>   #else
>   static inline bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
> @@ -33,6 +36,18 @@ static inline S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
>   }
>   static inline void s390_pci_end_dma_count(S390pciState *s,
>                                             S390PCIDMACount *cnt) { }
> +int s390_pci_probe_interp(S390PCIBusDevice *pbdev)

static inline ?

> +{
> +    return -EINVAL;
> +}
> +static inline int s390_pci_set_interp(S390PCIBusDevice *pbdev, bool enable)
> +{
> +    return -EINVAL;
> +}
> +static inline int s390_pci_update_passthrough_fh(S390PCIBusDevice *pbdev)
> +{
> +    return -EINVAL;
> +}
>   static inline void s390_pci_get_clp_info(S390PCIBusDevice *pbdev) { }
>   #endif
>   
> 

-- 
Pierre Morel
IBM Lab Boeblingen

