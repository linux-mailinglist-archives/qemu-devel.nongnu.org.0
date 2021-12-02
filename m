Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6462E466BAF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 22:29:37 +0100 (CET)
Received: from localhost ([::1]:60470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mste4-0004HI-7s
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 16:29:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mstcO-0002pm-FO; Thu, 02 Dec 2021 16:27:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mstcM-00056Q-7M; Thu, 02 Dec 2021 16:27:51 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2JMIrU007313; 
 Thu, 2 Dec 2021 21:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=yHVE14uLEUi/akhqDuYAWZJHii1GS7yHddHJIm4z6pg=;
 b=SWE0EXgsu826DHT0O5zNHEG0CIR+4Dak70jbpl8c0QvDyMaloIQyVXB4yiF7hLtHFWDd
 RwYCwZJSkjMBtTOTiix7vd+gFkNv72+Y1YfNTTNe8gcpvtx2KClegQoQ1EjDeISlENAd
 Qed7jWKFKadAahyCyLyCw+VB0HZH4GZUtJ6CwzbEhbDTO6l8TrJfb4egaOk85fi8Bkpp
 WzvGesMSxlDE4MAjz8p4JyZroMsvjlWHSWHc2YFGOMt1S6m80o7F1GQNYMB1EiChKKua
 vFbbGls3KCpK0FGM920XBO+WWV5MZ7h0FJ5X707EptQXoOSklvCVeqSvALVhEqHsLM+K Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq489tbjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 21:27:48 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B2KuEn1027095;
 Thu, 2 Dec 2021 21:27:48 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq489tbj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 21:27:48 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2LP7ZG005215;
 Thu, 2 Dec 2021 21:27:47 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3cn5f16th7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 21:27:47 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B2LRjGt37224790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 21:27:45 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC856B206A;
 Thu,  2 Dec 2021 21:27:45 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E1A9B2064;
 Thu,  2 Dec 2021 21:27:43 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.70.80])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  2 Dec 2021 21:27:42 +0000 (GMT)
Message-ID: <99048302a6eb80ad60c2292d219e1b816affeec9.camel@linux.ibm.com>
Subject: Re: [PATCH 2/4] s390x/pci: don't use hard-coded dma range in reg_ioat
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 02 Dec 2021 16:27:41 -0500
In-Reply-To: <20211202164110.326947-3-mjrosato@linux.ibm.com>
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-3-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PQTfLB_2_6Jqdy9d5oRMSGE5e74h4pDZ
X-Proofpoint-GUID: 9leqHglNb8VhUi4s-xcZvhnXDP6ucHuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_14,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 mlxlogscore=786 adultscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112020133
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-12-02 at 11:41 -0500, Matthew Rosato wrote:
> Instead use the values from clp info, they will either be the hard-
> coded
> values or what came from the host driver via vfio.
> 
> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  hw/s390x/s390-pci-inst.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 1c8ad91175..11b7f6bfa1 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -916,9 +916,10 @@ int pci_dereg_irqs(S390PCIBusDevice *pbdev)
>      return 0;
>  }
>  
> -static int reg_ioat(CPUS390XState *env, S390PCIIOMMU *iommu, ZpciFib
> fib,
> +static int reg_ioat(CPUS390XState *env, S390PCIBusDevice *pbdev,
> ZpciFib fib,
>                      uintptr_t ra)
>  {
> +    S390PCIIOMMU *iommu = pbdev->iommu;
>      uint64_t pba = ldq_p(&fib.pba);
>      uint64_t pal = ldq_p(&fib.pal);
>      uint64_t g_iota = ldq_p(&fib.iota);
> @@ -927,7 +928,7 @@ static int reg_ioat(CPUS390XState *env,
> S390PCIIOMMU *iommu, ZpciFib fib,
>  
>      pba &= ~0xfff;
>      pal |= 0xfff;
> -    if (pba > pal || pba < ZPCI_SDMA_ADDR || pal > ZPCI_EDMA_ADDR) {
> +    if (pba > pal || pba < pbdev->zpci_fn.sdma || pal > pbdev-
> >zpci_fn.edma) {
>          s390_program_interrupt(env, PGM_OPERAND, ra);
>          return -EINVAL;
>      }
> @@ -1125,7 +1126,7 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t
> r1, uint64_t fiba, uint8_t ar,
>          } else if (pbdev->iommu->enabled) {
>              cc = ZPCI_PCI_LS_ERR;
>              s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
> -        } else if (reg_ioat(env, pbdev->iommu, fib, ra)) {
> +        } else if (reg_ioat(env, pbdev, fib, ra)) {
>              cc = ZPCI_PCI_LS_ERR;
>              s390_set_status_code(env, r1, ZPCI_MOD_ST_INSUF_RES);
>          }
> @@ -1150,7 +1151,7 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t
> r1, uint64_t fiba, uint8_t ar,
>              s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
>          } else {
>              pci_dereg_ioat(pbdev->iommu);
> -            if (reg_ioat(env, pbdev->iommu, fib, ra)) {
> +            if (reg_ioat(env, pbdev, fib, ra)) {
>                  cc = ZPCI_PCI_LS_ERR;
>                  s390_set_status_code(env, r1,
> ZPCI_MOD_ST_INSUF_RES);
>              }


