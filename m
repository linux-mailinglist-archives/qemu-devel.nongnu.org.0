Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2B6CACD5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 20:16:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgrNz-0005lF-SZ; Mon, 27 Mar 2023 14:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgrNx-0005jC-A8
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 14:16:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgrNv-0000MC-MW
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 14:16:01 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RHg8UG029328; Mon, 27 Mar 2023 18:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mEW5jBB5k1WxPmTcUX2fvN9W4y6JRK0ep9Og1jSjsEc=;
 b=K43XgBAOAs/1RnNiSVj0epjNMih/Qobb1fgzfbZxmDVE+LqYKblJROOmyonMByoVZhF+
 jmxbwQpsmD4phZ76wSvv6Y4DG8BiqfHD8iyum7lOBrDMHA5kDEn4L2HdfIj8hk1NVYx1
 ZC7uKrr//rzUAa6gU2I8O92M0XiVnDb3rjpVI4kUPq8yV7HwS+2SioIFWJCdws6wnhOr
 4DYaXa5DC7Qe5BYZzt9F5mv+ZXKu2xcpCJ8RqbTvqZxzBr9iljrp6rYkwfqdVVYZHRLI
 WTTTSC0evqQZnSLp6IiG3VIXVQAs8oFnv/NMHggVOJa60z6qjGjYTeWwM8maH0CdzO+4 YQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkfs6gumm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 18:15:51 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RFujUl029183;
 Mon, 27 Mar 2023 18:15:50 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3phrk6ym6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 18:15:50 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RIFnjL10879542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 18:15:49 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 600BF58067;
 Mon, 27 Mar 2023 18:15:49 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB22E5804B;
 Mon, 27 Mar 2023 18:15:48 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 18:15:48 +0000 (GMT)
Message-ID: <9bef39c0-23bd-b818-3924-b47b85c3ce21@linux.ibm.com>
Date: Mon, 27 Mar 2023 14:15:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230327181241.4046253-1-ninad@linux.ibm.com>
 <20230327181241.4046253-2-ninad@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230327181241.4046253-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zPMewi_PudTo4J-TGNeJUfHaJLmJ6Yei
X-Proofpoint-GUID: zPMewi_PudTo4J-TGNeJUfHaJLmJ6Yei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270148
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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



On 3/27/23 14:12, Ninad Palsule wrote:
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
> 
> ---
> V6:
> Incorporated review comments from Stefan.
> 
> ---
> V8:
> 
> Incorporate review comments from Joel and Stefan
> 
> - Removed the rainier example
> - Added step required to configure on ast2600-evb
> ---
>   docs/specs/tpm.rst | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 535912a92b..efe124a148 100644
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
> +An I2C device support is also provided which can be instantiated in the Arm
> +based emulation machines. This device only supports the TPM 2 protocol.
> +
>   CRB interface
>   -------------
>   
> @@ -348,6 +352,23 @@ In case an Arm virt machine is emulated, use the following command line:
>       -drive if=pflash,format=raw,file=flash0.img,readonly=on \
>       -drive if=pflash,format=raw,file=flash1.img
>   
> +In case a ast2600-evb bmc machine is emulated and you want to use a TPM device
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
> +  For testing, use this command to load the driver to the correct address
> +
> +  echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
> +
>   In case SeaBIOS is used as firmware, it should show the TPM menu item
>   after entering the menu with 'ESC'.
>   

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

