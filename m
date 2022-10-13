Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA725FE172
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:40:11 +0200 (CEST)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj37q-00064G-D0
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1oj34e-0003J2-KE; Thu, 13 Oct 2022 14:36:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1oj34c-00014H-M0; Thu, 13 Oct 2022 14:36:52 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DHfJkk028681;
 Thu, 13 Oct 2022 18:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rHwKY9VuyK0VU1bWPwo/qgzHzPGT9ANwR92bPwpDyS0=;
 b=DuPXKi79ehaIxVboMcw6GUeZ1ccog3YGJP5SUgEf5Z/NHQedWBKqbdWMt7+schp473nR
 wqcY//uBYSvbUNRzdudkouIvoSQw4n6HZA/vXXcJM6x45dKZDPDNFQsmIxlaU6YC5fcx
 Usd35q1B3RPDSGr7UnW+Na4fLzIQw/mmsRv2uXoTDsO9igyKGQGEZKl+msEJIJNbJ2/W
 UcWdqOKKXHs8pwNw9IGnqqbuZLBFjLIJoc/qamJjmnXNvrVNMXGIG3ADgsiw7kAL+O0N
 ZoljuaOsrem/BzUHLvqldiVTp4VseLRW/PpeDcpw/kHB9/dASoOeS+Np0jrIYIdQLkew yA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6gp8xw39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 18:36:45 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29DIZ8P6015740;
 Thu, 13 Oct 2022 18:36:45 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3k30uaj0w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 18:36:45 +0000
Received: from smtpav01.wdc07v.mail.ibm.com ([9.208.128.113])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29DIahLK18154112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 18:36:44 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 428AB58067;
 Thu, 13 Oct 2022 18:36:43 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77BBC5804B;
 Thu, 13 Oct 2022 18:36:42 +0000 (GMT)
Received: from [9.77.158.13] (unknown [9.77.158.13])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 13 Oct 2022 18:36:42 +0000 (GMT)
Message-ID: <906b6fdc-5b09-8cb6-cd6b-4b11317bd6ee@linux.ibm.com>
Date: Thu, 13 Oct 2022 14:36:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] hw/s390x/s390-pci-inst.c: Use device_cold_reset() to
 reset PCI devices
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>
References: <20221013172123.1448288-1-peter.maydell@linaro.org>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20221013172123.1448288-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xTd4GBHZH6dIymokzYAGYBBlahjcjlpd
X-Proofpoint-GUID: xTd4GBHZH6dIymokzYAGYBBlahjcjlpd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130105
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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

On 10/13/22 1:21 PM, Peter Maydell wrote:
> The semantic difference between the deprecated device_legacy_reset()
> function and the newer device_cold_reset() function is that the new
> function resets both the device itself and any qbuses it owns,
> whereas the legacy function resets just the device itself and nothing
> else.
> 
> In s390-pci-inst.c we use device_legacy_reset() to reset an
> S390PCIBusDevice.  This device doesn't have any child qbuses, so the
> functions do the same thing and we can stop using the deprecated one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: tested only with 'make check' and 'make check-avocado', which
> probably don't exercise this codepath.
>

I exercised the codepath by triggering the associated clp using both virtio and vfio pci devices on s390x; looks good to me.

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

 
>  hw/s390x/s390-pci-inst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 20a9bcc7afb..16f5a3e81b4 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -272,7 +272,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>                  stw_p(&ressetpci->hdr.rsp, CLP_RC_SETPCIFN_FHOP);
>                  goto out;
>              }
> -            device_legacy_reset(DEVICE(pbdev));
> +            device_cold_reset(DEVICE(pbdev));
>              pbdev->fh &= ~FH_MASK_ENABLE;
>              pbdev->state = ZPCI_FS_DISABLED;
>              stl_p(&ressetpci->fh, pbdev->fh);


