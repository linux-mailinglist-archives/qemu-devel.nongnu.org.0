Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F1D6C9CDA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 09:53:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pghf2-0002CD-Kc; Mon, 27 Mar 2023 03:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pghew-0002Bn-Ce
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:52:54 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pgheu-0000D1-0u
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:52:53 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1085921891;
 Mon, 27 Mar 2023 07:52:49 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 27 Mar
 2023 09:52:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001934f660c-4280-4b5d-8ed6-2c46b71cba75,
 A6C3435B678E6C193C864925704A598F32E2E8B9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <24c4b174-21d2-32ce-c944-8f76eec0281c@kaod.org>
Date: Mon, 27 Mar 2023 09:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Ninad Palsule <ninad@linux.ibm.com>
CC: <qemu-devel@nongnu.org>, <andrew@aj.id.au>, <stefanb@linux.ibm.com>
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <20230326224426.3918167-2-ninad@linux.ibm.com>
 <CACPK8XfLBT-6eu4cv=CbS2d368N-wcVuvSy+w4Kt-JavPqrhyA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XfLBT-6eu4cv=CbS2d368N-wcVuvSy+w4Kt-JavPqrhyA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 780f42e6-5b59-4d7b-a9f3-86d63a48314a
X-Ovh-Tracer-Id: 5426837551422540707
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehuddguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpnhhinhgrugeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpshhtvghfrghnsgeslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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

On 3/27/23 09:47, Joel Stanley wrote:
> On Sun, 26 Mar 2023 at 22:44, Ninad Palsule <ninad@linux.ibm.com> wrote:
>>
>> This is a documentation change for I2C TPM device support.
>>
>> Qemu already supports devices attached to ISA and sysbus.
>> This drop adds support for the I2C bus attached TPM devices.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>
>> ---
>> V2:
>>
>> Incorporated Stephen's review comments
>> - Added example in the document.
>>
>> ---
>> V4:
>> Incorporate Cedric & Stefan's comments
>>
>> - Added example for ast2600-evb
>> - Corrected statement about arm virtual machine.
>>
>> ---
>> V6:
>> Incorporated review comments from Stefan.
>> ---
>>   docs/specs/tpm.rst | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
>> index 535912a92b..590e670a9a 100644
>> --- a/docs/specs/tpm.rst
>> +++ b/docs/specs/tpm.rst
>> @@ -21,12 +21,16 @@ QEMU files related to TPM TIS interface:
>>    - ``hw/tpm/tpm_tis_common.c``
>>    - ``hw/tpm/tpm_tis_isa.c``
>>    - ``hw/tpm/tpm_tis_sysbus.c``
>> + - ``hw/tpm/tpm_tis_i2c.c``
>>    - ``hw/tpm/tpm_tis.h``
>>
>>   Both an ISA device and a sysbus device are available. The former is
>>   used with pc/q35 machine while the latter can be instantiated in the
>>   Arm virt machine.
>>
>> +An I2C device support is also provided which can be instantiated in the Arm
>> +based emulation machines. This device only supports the TPM 2 protocol.
>> +
>>   CRB interface
>>   -------------
>>
>> @@ -348,6 +352,34 @@ In case an Arm virt machine is emulated, use the following command line:
>>       -drive if=pflash,format=raw,file=flash0.img,readonly=on \
>>       -drive if=pflash,format=raw,file=flash1.img
>>
>> +In case a ast2600-evb bmc machine is emulated and want to use TPM device
>> +attached to I2C bus, use the following command line:
>> +
>> +.. code-block:: console
>> +
>> +  qemu-system-arm -M ast2600-evb -nographic \
>> +    -kernel arch/arm/boot/zImage \
>> +    -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
>> +    -initrd rootfs.cpio \
>> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
>> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
> 
> For testing, use this command to load the driver to the correct address:
> 
> echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
> 
> (I don't know how specific we want to make the instructions, but
> adding a line like above would help others from having to re-discover
> the command).

or/and add an avocado test for it. See tests/avocado/machine_aspeed.py.

The avocado framework is a bit fragile when reading from the console but
we hope to fix that.

Thanks

C.

> 
>> +
>> +In case a Rainier bmc machine is emulated and want to use TPM device
>> +attached to I2C bus, use the following command line:
>> +
>> +.. code-block:: console
>> +
>> +  qemu-system-arm -M rainier-bmc -nographic \
>> +    -kernel ${IMAGEPATH}/fitImage-linux.bin \
>> +    -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
>> +    -initrd ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
>> +    -drive file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2\
>> +    -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443\
>> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
>> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>> +
> 
> I'd drop this example, the above one is enough.
> 
>>   In case SeaBIOS is used as firmware, it should show the TPM menu item
>>   after entering the menu with 'ESC'.
>>
>> --
>> 2.37.2
>>


