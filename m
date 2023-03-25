Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ACE6C8F5C
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 17:13:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg6UV-0007Dr-Gz; Sat, 25 Mar 2023 12:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pg6US-00079w-Un
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 12:11:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pg6UN-0007rC-5j
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 12:11:33 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32PFYLj6033443; Sat, 25 Mar 2023 16:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=A88lTy9kvZKVSei3geCrHgIm+lKvCMVTkSTkE/Yd2Wc=;
 b=kdUamoas4e2m50uZl6Jf4xlQVzlQhxG2LbCnhhIpMRBm78x16WzLcoO5kAkfDGOXYBYv
 mMfa0QPZaER77btu8prPXSkiIkwdqaCbpMaAquMwjQ4J/txFG4ySQtidLj4Xca2KDScp
 2O5EBUORKGij5hJwgnBLErGyRz4T5g29+ZDy2WCyZQ4XVfGytWEB5ZzNIUjMc1y6XkiN
 WcJRacNj2f6jEIDgHUT0VlXcj/EQ2/oH0PvToH36HgzwS8kG9jnQSu8yWH4aN2sF26QQ
 NafloKIIR9BXHIiQC7GsQG/qDJAOn8FxENN3681AymTUKS4VEGHHHdvIbuJkuLqkc9L7 rw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3phr8qt0m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Mar 2023 16:11:03 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32PDtDpi019633;
 Sat, 25 Mar 2023 16:11:02 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3phrk735ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Mar 2023 16:11:02 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32PGB04R36766244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 25 Mar 2023 16:11:01 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E518658045;
 Sat, 25 Mar 2023 16:11:00 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6671258056;
 Sat, 25 Mar 2023 16:11:00 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Sat, 25 Mar 2023 16:11:00 +0000 (GMT)
Message-ID: <5aafd432-acae-ad58-b567-16911a04bc7d@linux.ibm.com>
Date: Sat, 25 Mar 2023 12:10:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230325043751.3559591-1-ninad@linux.ibm.com>
 <20230325043751.3559591-2-ninad@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230325043751.3559591-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zZ2T054zsnv1_DaR_UfJHjNLgMntxkAP
X-Proofpoint-GUID: zZ2T054zsnv1_DaR_UfJHjNLgMntxkAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303250134
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/25/23 00:37, Ninad Palsule wrote:
> This is a documentation change for I2C TPM device support.
> 
> Qemu already supports devices attached to ISA and sysbus.
> This drop adds support for the I2C bus attached TPM devices.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> 
> ---
> V2:
> 
> Incorporated Stephen's review comments
> - Added example in the document.
> 
> ---
> V4:
> Incorporate Cedric & Stefan's comments
> 
> - Added example for ast2600-evb
> - Corrected statement about arm virtual machine.
> ---
>   docs/specs/tpm.rst | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 535912a92b..a0600e2834 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -21,12 +21,16 @@ QEMU files related to TPM TIS interface:
>    - ``hw/tpm/tpm_tis_common.c``
>    - ``hw/tpm/tpm_tis_isa.c``
>    - ``hw/tpm/tpm_tis_sysbus.c``
> + - ``hw/tpm/tpm_tis_i2c.c``
>    - ``hw/tpm/tpm_tis.h``
>   
>   Both an ISA device and a sysbus device are available. The former is
>   used with pc/q35 machine while the latter can be instantiated in the
>   Arm virt machine.
>   
> +An I2C device support is also added which can be instantiated in the armadded -> provided
arm -> Arm

> +based emulation machines. This device only supports the TPM 2 protocol.
> +
>   CRB interface
>   -------------
>   
> @@ -348,6 +352,34 @@ In case an Arm virt machine is emulated, use the following command line:
>       -drive if=pflash,format=raw,file=flash0.img,readonly=on \
>       -drive if=pflash,format=raw,file=flash1.img
>   
> +In case a ast2600-evb bmc machine is emulated and want to use TPM device
> +attached to I2C bus, use the following command line:
> +
> +.. code-block:: console
> +
> +  qemu-system-arm -M ast2600-evb -nographic \
> +    -kernel arch/arm/boot/zImage \
> +    -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
> +    -initrd rootfs.cpio \
> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
> +
> +In case a Rainier bmc machine is emulated and want to use TPM device
> +attached to I2C bus, use the following command line:
> +
> +.. code-block:: console
> +
> +  qemu-system-arm -M rainier-bmc -nographic \
> +    -kernel ${IMAGEPATH}/fitImage-linux.bin \
> +    -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
> +    -initrd ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
> +    -drive file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2\
> +    -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443\
> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
> +
>   In case SeaBIOS is used as firmware, it should show the TPM menu item
>   after entering the menu with 'ESC'.
>   

With the above nits:

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

