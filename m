Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931B86C611F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 08:50:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfFhm-0003Ep-7B; Thu, 23 Mar 2023 03:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pfFhk-0003Ed-Jz
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 03:49:48 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pfFhi-00020z-Km
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 03:49:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.233])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E4A70207D8;
 Thu, 23 Mar 2023 07:49:42 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 23 Mar
 2023 08:49:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0010c49fb42-2ef4-40a8-b0c2-bdc6e23d10e1,
 176673217AFB8255045F9FD15030271BA63368C6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ae61d505-b656-a362-8a80-35f266296e2a@kaod.org>
Date: Thu, 23 Mar 2023 08:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <joel@jms.id.au>, <andrew@aj.id.au>, <stefanb@linux.ibm.com>
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
 <20230323030119.2113570-2-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230323030119.2113570-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: df541291-abbf-42ca-86d2-cbea894a361c
X-Ovh-Tracer-Id: 330451624381418403
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegfedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepnhhinhgrugeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdhsthgvfhgrnhgssehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/23/23 04:01, Ninad Palsule wrote:
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
> ---
>   docs/specs/tpm.rst | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 535912a92b..bf7249b09c 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -21,11 +21,15 @@ QEMU files related to TPM TIS interface:
>    - ``hw/tpm/tpm_tis_common.c``
>    - ``hw/tpm/tpm_tis_isa.c``
>    - ``hw/tpm/tpm_tis_sysbus.c``
> + - ``hw/tpm/tpm_tis_i2c.c``
>    - ``hw/tpm/tpm_tis.h``
>   
>   Both an ISA device and a sysbus device are available. The former is
>   used with pc/q35 machine while the latter can be instantiated in the
> -Arm virt machine.
> +Arm virt machine. An I2C device support is also added which can be
> +instantiated in the arm based emulation machine. An I2C device is also
> +supported for the Arm virt machine. This device only supports the
> +TPM 2 protocol.
>   
>   CRB interface
>   -------------
> @@ -348,6 +352,20 @@ In case an Arm virt machine is emulated, use the following command line:
>       -drive if=pflash,format=raw,file=flash0.img,readonly=on \
>       -drive if=pflash,format=raw,file=flash1.img
>   
> +In case a Rainier bmc machine is emulated, use the following command line:
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


The rainier images are not the easiest to find. Could we use an AST2600 EVB
machine instead and instantiate the device from user space ? see commit
3302184f7f or 7a7308eae0.

Thanks,

C.

>   In case SeaBIOS is used as firmware, it should show the TPM menu item
>   after entering the menu with 'ESC'.
>   


