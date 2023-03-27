Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5259D6CAC51
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:53:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgr1G-0003pr-OC; Mon, 27 Mar 2023 13:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgr1D-0003pS-Uj
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:52:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgr19-00086W-T7
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:52:31 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RFjWQe001872; Mon, 27 Mar 2023 17:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0lm1zd06uq4/1qWftFMXs/UFOCUI21uYNy/o13Jt+80=;
 b=PoOn9Mj96+YyLcdsOtD+ybnRwxA9oPcVFD2UQ7EhFDFDfBuawAKCHWQzBe11Be3sy+Sb
 MHTSDepJBJu3+ZiJFXJ2Hw8mhnKWe5VtzIda6/6N3PYsQcJLxURJ5V4TqfBZB6+9UXzD
 UR/YboTNH/MSAMsfA+tlEDobhGOcrcw7SkZHj5uLrKjqW9LRC2sZnaA5E3mghArvBlb/
 maa/5toy8WFpo80pP3rElfNMhD8QG6qi/Xw6/fPgU9WjHfMlXVMOim/eXvL7nXdZicoI
 S72XxjThfI3kaP1LQiz/uVMihcXjGPKeKc4+0shwKki9+nDI0op6HrVFrZ4CBRVZis2Q RA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pke2m2xwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 17:52:12 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RG5sqU028590;
 Mon, 27 Mar 2023 17:52:11 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3phrk7ffmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 17:52:11 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RHq91d3277424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 17:52:09 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1228D58061;
 Mon, 27 Mar 2023 17:52:09 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAA115803F;
 Mon, 27 Mar 2023 17:52:08 +0000 (GMT)
Received: from [9.211.158.228] (unknown [9.211.158.228])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 17:52:08 +0000 (GMT)
Message-ID: <2c718c15-9b29-0329-3eb6-4fca2576309c@linux.vnet.ibm.com>
Date: Mon, 27 Mar 2023 12:52:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v8 3/3] tpm: Add support for TPM device over I2C bus
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, stefanb@linux.ibm.com
References: <20230327161622.3979396-1-ninad@linux.ibm.com>
 <20230327161622.3979396-4-ninad@linux.ibm.com>
 <285c89d5-cd62-4f9f-f875-9624c2e449ba@kaod.org>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <285c89d5-cd62-4f9f-f875-9624c2e449ba@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2NDnXaK5LJyXCs4fxcaUIkfOpJ-vPwrC
X-Proofpoint-ORIG-GUID: 2NDnXaK5LJyXCs4fxcaUIkfOpJ-vPwrC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270143
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi Cedric,

On 3/27/23 12:01 PM, Cédric Le Goater wrote:
> On 3/27/23 18:16, Ninad Palsule wrote:
>> Qemu already supports devices attached to ISA and sysbus. This drop adds
>> support for the I2C bus attached TPM devices. I2C model only supports
>> TPM2 protocol.
>>
>> This commit includes changes for the common code.
>> - Added I2C emulation model. Logic was added in the model to temporarily
>>    cache the data as I2C interface works per byte basis.
>> - New tpm type "tpm-tis-i2c" added for I2C support. The user has to
>>    provide this string on command line.
>>
>> Testing:
>>    TPM I2C device module is tested using SWTPM (software based TPM
>>    package). Qemu uses the rainier machine and is connected to swtpm 
>> over
>>    the socket interface.
>>
>>    The command to start swtpm is as follows:
>>    $ swtpm socket --tpmstate dir=/tmp/mytpm1    \
>>                   --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock  \
>>                   --tpm2 --log level=100
>>
>>    The command to start qemu is as follows:
>>    $ qemu-system-arm -M rainier-bmc -nographic \
>>              -kernel ${IMAGEPATH}/fitImage-linux.bin \
>>              -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
>>              -initrd 
>> ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
>>              -drive 
>> file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 \
>>              -net nic -net 
>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443 \
>>              -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>>              -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>              -device 
>> tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>> V2:
>> Incorporated Stephen's review comments.
>> - Handled checksum related register in I2C layer
>> - Defined I2C interface capabilities and return those instead of
>>    capabilities from TPM TIS. Add required capabilities from TIS.
>> - Do not cache FIFO data in the I2C layer.
>> - Make sure that Device address change register is not passed to I2C
>>    layer as capability indicate that it is not supported.
>> - Added boundary checks.
>> - Make sure that bits 26-31 are zeroed for the TPM_STS register on read
>> - Updated Kconfig files for new define.
>>
>> ---
>> V3:
>> - Moved processing of register TPM_I2C_LOC_SEL in the I2C. So I2C layer
>>    remembers the locality and pass it to TIS on each read/write.
>> - The write data is no more cached in the I2C layer so the buffer size
>>    is reduced to 16 bytes.
>> - Checksum registers are now managed by the I2C layer. Added new
>>    function in TIS layer to return the checksum and used that to process
>>    the request.
>> - Now 2-4 byte register value will be passed to TIS layer in a single
>>    write call instead of 1 byte at a time. Added functions to convert
>>    between little endian stream of bytes to single 32 bit unsigned
>>    integer. Similarly 32  bit integer to stream of bytes.
>> - Added restriction on device change register.
>> - Replace few if-else statement with switch statement for clarity.
>> - Log warning when unknown register is received.
>> - Moved all register definations to acpi/tmp.h
>>
>> ---
>> V4:
>> Incorporated review comments from Cedric and Stefan.
>> - Reduced data[] size from 16 byte to 5 bytes.
>> - Added register name in the mapping table which can be used for
>>    tracing.
>> - Removed the endian conversion functions instead used simple logic
>>    provided by Stefan.
>> - Rename I2C registers to reduce the length.
>> - Added traces for send, recv and event functions. You can turn on trace
>>    on command line by using "-trace "tpm_tis_i2c*" option.
>>
>> ---
>> V5:
>> Fixed issues reported by Stefan's test.
>> - Added mask for the INT_ENABLE register.
>> - Use correct TIS register for reading interrupt capability.
>> - Cleanup how register is converted from I2C to TIS and also saved
>>    information like tis_addr and register name in the i2cst so that we
>>    can only convert it once on i2c_send.
>> - Trace register number for unknown registers.
>>
>> ---
>> V6:
>> Fixed review comments from Stefan.
>> - Fixed some variable size.
>> - Removed unused variables.
>> - Added vmstat backin to handle migration.
>> - Added post load phase to reload tis address and register name.
>>
>> ---
>> V7:
>> Incorporated review comments from Stefan.
>> - Added tpm_tis_i2c_initfn function
>> - Set the device catagory DEVICE_CATEGORY_MISC.
>> - Corrected default locality selection.
>> - Other cleanup. Include file cleanup.
>>
>> ---
>> V8:
>> Incorporated review comments from Stefan.
>> - Removed the irq initialization as linux doesn't support interrupts for
>>    TPM
>> - Handle INT_CAPABILITY register in I2C only and return 0 to indicate
>>    that it is not supported.
>> ---
>>   hw/arm/Kconfig       |   1 +
>>   hw/tpm/Kconfig       |   7 +
>>   hw/tpm/meson.build   |   1 +
>>   hw/tpm/tpm_tis_i2c.c | 525 +++++++++++++++++++++++++++++++++++++++++++
>>   hw/tpm/trace-events  |   6 +
>>   include/sysemu/tpm.h |   3 +
>>   6 files changed, 543 insertions(+)
>>   create mode 100644 hw/tpm/tpm_tis_i2c.c
>>
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index b5aed4aff5..05d6ef1a31 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -6,6 +6,7 @@ config ARM_VIRT
>>       imply VFIO_PLATFORM
>>       imply VFIO_XGMAC
>>       imply TPM_TIS_SYSBUS
>> +    imply TPM_TIS_I2C
>>       imply NVDIMM
>>       select ARM_GIC
>>       select ACPI
>> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
>> index 29e82f3c92..a46663288c 100644
>> --- a/hw/tpm/Kconfig
>> +++ b/hw/tpm/Kconfig
>> @@ -1,3 +1,10 @@
>> +config TPM_TIS_I2C
>> +    bool
>> +    depends on TPM
>> +    select TPM_BACKEND
>> +    select I2C
>> +    select TPM_TIS
>> +
>>   config TPM_TIS_ISA
>>       bool
>>       depends on TPM && ISA_BUS
>> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
>> index 7abc2d794a..76fe3cb098 100644
>> --- a/hw/tpm/meson.build
>> +++ b/hw/tpm/meson.build
>> @@ -1,6 +1,7 @@
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: 
>> files('tpm_tis_common.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: 
>> files('tpm_tis_isa.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: 
>> files('tpm_tis_sysbus.c'))
>> +softmmu_ss.add(when: 'CONFIG_TPM_TIS_I2C', if_true: 
>> files('tpm_tis_i2c.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
>> diff --git a/hw/tpm/tpm_tis_i2c.c b/hw/tpm/tpm_tis_i2c.c
>> new file mode 100644
>> index 0000000000..5bbc414753
>> --- /dev/null
>> +++ b/hw/tpm/tpm_tis_i2c.c
>> @@ -0,0 +1,525 @@
>> +/*
>> + * tpm_tis_i2c.c - QEMU's TPM TIS I2C Device
>
>
> missing Copyright here ?
Added copyright
>
>
>> + * This work is licensed under the terms of the GNU GPL, version 2 
>> or later.
>> + * See the COPYING file in the top-level directory.
>> + *
>> + * Implementation of the TIS interface according to specs found at
>> + * http://www.trustedcomputinggroup.org. This implementation currently
>> + * supports version 1.3, 21 March 2013
>> + * In the developers menu choose the PC Client section then find the 
>> TIS
>> + * specification.
>> + *
>> + * TPM TIS for TPM 2 implementation following TCG PC Client Platform
>> + * TPM Profile (PTP) Specification, Familiy 2.0, Revision 00.43
>> + *
>> + * TPM I2C implementation follows TCG TPM I2c Interface specification,
>> + * Family 2.0, Level 00, Revision 1.00
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/i2c/i2c.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/acpi/tpm.h"
>> +#include "migration/vmstate.h"
>> +#include "tpm_prop.h"
>> +#include "qemu/log.h"
>> +#include "trace.h"
>> +#include "tpm_tis.h"
>> +
>> +/* TPM_STS mask for read bits 31:26 must be zero */
>> +#define TPM_I2C_STS_READ_MASK          0x03ffffff
>> +
>> +/* Operations */
>> +#define OP_SEND   1
>> +#define OP_RECV   2
>> +
>> +typedef struct TPMStateI2C {
>> +    /*< private >*/
>> +    I2CSlave    parent_obj;
>> +
>> +    uint8_t     offset;       /* offset into data[] */
>> +    uint8_t     operation;    /* OP_SEND & OP_RECV */
>> +    uint8_t     data[5];      /* Data */
>> +
>> +    /* i2c registers */
>> +    uint8_t     loc_sel;      /* Current locality */
>> +    uint8_t     csum_enable;  /* Is checksum enabled */
>> +
>> +    /* Derived from the above */
>> +    const char *reg_name;     /* Register name */
>> +    uint32_t    tis_addr;     /* Converted tis address including 
>> locty */
>> +
>> +    /*< public >*/
>> +    TPMState    state; /* not a QOM object */
>> +
>> +} TPMStateI2C;
>> +
>> +DECLARE_INSTANCE_CHECKER(TPMStateI2C, TPM_TIS_I2C,
>> +                         TYPE_TPM_TIS_I2C)
>> +
>> +/* Prototype */
>> +static inline void tpm_tis_i2c_to_tis_reg(TPMStateI2C *i2cst, 
>> uint8_t i2c_reg);
>> +
>> +/* Register map */
>> +typedef struct regMap {
>> +    uint8_t   i2c_reg;    /* I2C register */
>> +    uint16_t  tis_reg;    /* TIS register */
>> +    const char *reg_name; /* Register name */
>> +} I2CRegMap;
>> +
>> +/*
>> + * The register values in the common code is different than the latest
>> + * register numbers as per the spec hence add the conversion map
>> + */
>> +static const I2CRegMap tpm_tis_reg_map[] = {
>> +    /*
>> +     * These registers are sent to TIS layer. The register with UNKNOWN
>> +     * mapping are not sent to TIS layer and handled in I2c layer.
>> +     * NOTE: Adding frequently used registers at the start
>> +     */
>> +    { TPM_I2C_REG_DATA_FIFO, TPM_TIS_REG_DATA_FIFO,       
>> "FIFO",      },
>> +    { TPM_I2C_REG_STS, TPM_TIS_REG_STS,             "STS",       },
>> +    { TPM_I2C_REG_DATA_CSUM_GET, TPM_I2C_REG_UNKNOWN,         
>> "CSUM_GET",  },
>> +    { TPM_I2C_REG_LOC_SEL, TPM_I2C_REG_UNKNOWN,         "LOC_SEL",   },
>> +    { TPM_I2C_REG_ACCESS, TPM_TIS_REG_ACCESS,          "ACCESS",    },
>> +    { TPM_I2C_REG_INT_ENABLE,       TPM_TIS_REG_INT_ENABLE, 
>> "INTR_ENABLE",},
>> +    { TPM_I2C_REG_INT_CAPABILITY, TPM_I2C_REG_UNKNOWN,         
>> "INTR_CAP",  },
>> +    { TPM_I2C_REG_INTF_CAPABILITY, TPM_TIS_REG_INTF_CAPABILITY, 
>> "INTF_CAP",  },
>> +    { TPM_I2C_REG_DID_VID, TPM_TIS_REG_DID_VID,         "DID_VID",   },
>> +    { TPM_I2C_REG_RID, TPM_TIS_REG_RID,             "RID",       },
>> +    { TPM_I2C_REG_I2C_DEV_ADDRESS,  TPM_I2C_REG_UNKNOWN, 
>> "DEV_ADDRESS",},
>> +    { TPM_I2C_REG_DATA_CSUM_ENABLE, TPM_I2C_REG_UNKNOWN, 
>> "CSUM_ENABLE",},
>> +};
>> +
>> +static int tpm_tis_i2c_pre_save(void *opaque)
>> +{
>> +    TPMStateI2C *i2cst = opaque;
>> +
>> +    return tpm_tis_pre_save(&i2cst->state);
>> +}
>> +
>> +static int tpm_tis_i2c_post_load(void *opaque, int version_id)
>> +{
>> +    TPMStateI2C *i2cst = opaque;
>> +
>> +    if (i2cst->offset >= 1) {
>> +        tpm_tis_i2c_to_tis_reg(i2cst, i2cst->data[0]);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription vmstate_tpm_tis_i2c = {
>> +    .name = "tpm-tis-i2c",
>> +    .version_id = 0,
>> +    .pre_save  = tpm_tis_i2c_pre_save,
>> +    .post_load  = tpm_tis_i2c_post_load,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_BUFFER(state.buffer, TPMStateI2C),
>> +        VMSTATE_UINT16(state.rw_offset, TPMStateI2C),
>> +        VMSTATE_UINT8(state.active_locty, TPMStateI2C),
>> +        VMSTATE_UINT8(state.aborting_locty, TPMStateI2C),
>> +        VMSTATE_UINT8(state.next_locty, TPMStateI2C),
>> +
>> +        VMSTATE_STRUCT_ARRAY(state.loc, TPMStateI2C, 
>> TPM_TIS_NUM_LOCALITIES, 0,
>> +                             vmstate_locty, TPMLocality),
>> +
>> +        /* i2c specifics */
>> +        VMSTATE_UINT8(offset, TPMStateI2C),
>> +        VMSTATE_UINT8(operation, TPMStateI2C),
>> +        VMSTATE_BUFFER(data, TPMStateI2C),
>> +        VMSTATE_UINT8(loc_sel, TPMStateI2C),
>> +        VMSTATE_UINT8(csum_enable, TPMStateI2C),
>> +
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +/*
>> + * Generate interface capability based on what is returned by TIS 
>> and what is
>> + * expected by I2C. Save the capability in the data array 
>> overwriting the TIS
>> + * capability.
>> + */
>> +static uint32_t tpm_i2c_interface_capability(TPMStateI2C *i2cst,
>> +                                             uint32_t tis_cap)
>> +{
>> +    uint32_t i2c_cap;
>> +
>> +    /* Now generate i2c capability */
>> +    i2c_cap = (TPM_I2C_CAP_INTERFACE_TYPE |
>> +               TPM_I2C_CAP_INTERFACE_VER  |
>> +               TPM_I2C_CAP_TPM2_FAMILY    |
>> +               TPM_I2C_CAP_LOCALITY_CAP   |
>> +               TPM_I2C_CAP_BUS_SPEED      |
>> +               TPM_I2C_CAP_DEV_ADDR_CHANGE);
>> +
>> +    /* Now check the TIS and set some capabilities */
>> +
>> +    /* Static burst count set */
>> +    if (tis_cap & TPM_TIS_CAP_BURST_COUNT_STATIC) {
>> +        i2c_cap |= TPM_I2C_CAP_BURST_COUNT_STATIC;
>> +    }
>> +
>> +    return i2c_cap;
>> +}
>> +
>> +/* Convert I2C register to TIS address and returns the name of the 
>> register */
>> +static inline void tpm_tis_i2c_to_tis_reg(TPMStateI2C *i2cst, 
>> uint8_t i2c_reg)
>> +{
>> +    const I2CRegMap *reg_map;
>> +    int i;
>> +
>> +    i2cst->tis_addr = 0xffffffff;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(tpm_tis_reg_map); i++) {
>> +        reg_map = &tpm_tis_reg_map[i];
>> +        if (reg_map->i2c_reg == i2c_reg) {
>> +            i2cst->reg_name = reg_map->reg_name;
>> +            i2cst->tis_addr = reg_map->tis_reg;
>> +            if (i2cst->loc_sel != TPM_TIS_NO_LOCALITY) {
>> +                /* Include the locality in the address. */
>> +                i2cst->tis_addr += (i2cst->loc_sel << 
>> TPM_TIS_LOCALITY_SHIFT);
>> +            }
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (i2cst->tis_addr == 0xffffffff) {
>> +        qemu_log_mask(LOG_UNIMP, "%s: Could not convert i2c 
>> register: 0x%X\n",
>> +                      __func__, i2cst->data[0]);
>
> This condition looks more like a guest error to me. Doesn't it ?
Yes, Removed. If they add new register then we will have to add it in 
the qemu.
>
>> +    }
>> +}
>> +
>> +/* Clear some fields from the structure. */
>> +static inline void tpm_tis_i2c_clear_data(TPMStateI2C *i2cst)
>> +{
>> +    /* Clear operation and offset */
>> +    i2cst->operation = 0;
>> +    i2cst->offset = 0;
>> +    i2cst->tis_addr = 0xffffffff;
>> +    i2cst->reg_name = NULL;
>> +    memset(i2cst->data, 0, sizeof(i2cst->data));
>> +
>> +    return;
>> +}
>> +
>> +/* Send data to TPM */
>> +static inline void tpm_tis_i2c_tpm_send(TPMStateI2C *i2cst)
>> +{
>> +    uint32_t data;
>> +
>> +    if ((i2cst->operation == OP_SEND) && (i2cst->offset > 1)) {
>> +
>> +        switch (i2cst->data[0]) {
>> +        case TPM_I2C_REG_DATA_CSUM_ENABLE:
>> +            /*
>> +             * Checksum is not handled by TIS code hence we will 
>> consume the
>> +             * register here.
>> +             */
>> +            i2cst->csum_enable = TPM_DATA_CSUM_ENABLED;
>> +            break;
>> +        case TPM_I2C_REG_DATA_FIFO:
>> +            /* Handled in the main i2c_send function */
>> +            break;
>> +        case TPM_I2C_REG_LOC_SEL:
>> +            /*
>> +             * This register is not handled by TIS so save the locality
>> +             * locally
>> +             */
>> +            i2cst->loc_sel = i2cst->data[1];
>> +            break;
>> +        default:
>> +            /* We handle non-FIFO here */
>> +
>> +            /* Index 0 is a register. Convert byte stream to 
>> uint32_t */
>> +            data = i2cst->data[1];
>> +            data |= i2cst->data[2] << 8;
>> +            data |= i2cst->data[3] << 16;
>> +            data |= i2cst->data[4] << 24;
>> +
>> +            /* Add register specific masking */
>> +            switch (i2cst->data[0]) {
>> +            case TPM_I2C_REG_INT_ENABLE:
>> +                data &= TPM_I2C_INT_ENABLE_MASK;
>> +                break;
>> +            }
>> +
>> +            tpm_tis_write_data(&i2cst->state, i2cst->tis_addr, data, 
>> 4);
>> +            break;
>> +        }
>> +
>> +        tpm_tis_i2c_clear_data(i2cst);
>> +    }
>> +
>> +    return;
>> +}
>> +
>> +/* Callback from TPM to indicate that response is copied */
>> +static void tpm_tis_i2c_request_completed(TPMIf *ti, int ret)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(ti);
>> +    TPMState *s = &i2cst->state;
>> +
>> +    /* Inform the common code. */
>> +    tpm_tis_request_completed(s, ret);
>> +}
>> +
>> +static enum TPMVersion tpm_tis_i2c_get_tpm_version(TPMIf *ti)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(ti);
>> +    TPMState *s = &i2cst->state;
>> +
>> +    return tpm_tis_get_tpm_version(s);
>> +}
>> +
>> +static int tpm_tis_i2c_event(I2CSlave *i2c, enum i2c_event event)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
>> +    int ret = 0;
>> +
>> +    switch (event) {
>> +    case I2C_START_RECV:
>> +        trace_tpm_tis_i2c_event("START_RECV");
>> +        break;
>> +    case I2C_START_SEND:
>> +        trace_tpm_tis_i2c_event("START_SEND");
>> +        tpm_tis_i2c_clear_data(i2cst);
>> +        break;
>> +    case I2C_FINISH:
>> +        trace_tpm_tis_i2c_event("FINISH");
>> +        if (i2cst->operation == OP_SEND) {
>> +            tpm_tis_i2c_tpm_send(i2cst);
>> +        } else {
>> +            tpm_tis_i2c_clear_data(i2cst);
>> +        }
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * If data is for FIFO then it is received from tpm_tis_common buffer
>> + * otherwise it will be handled using single call to common code and
>> + * cached in the local buffer.
>> + */
>> +static uint8_t tpm_tis_i2c_recv(I2CSlave *i2c)
>> +{
>> +    int          ret = 0;
>> +    uint32_t     data_read;
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
>> +    TPMState    *s = &i2cst->state;
>> +    uint16_t     i2c_reg = i2cst->data[0];
>> +
>> +    if (i2cst->operation == OP_RECV) {
>> +
>> +        /* Do not cache FIFO data. */
>> +        if (i2cst->data[0] == TPM_I2C_REG_DATA_FIFO) {
>> +            data_read = tpm_tis_read_data(s, i2cst->tis_addr, 1);
>> +            ret = (data_read & 0xff);
>> +        } else if (i2cst->offset < sizeof(i2cst->data)) {
>> +            ret = i2cst->data[i2cst->offset++];
>> +        }
>> +
>> +    } else if ((i2cst->operation == OP_SEND) && (i2cst->offset < 2)) {
>> +        /* First receive call after send */
>> +
>> +        i2cst->operation = OP_RECV;
>> +
>> +        switch (i2c_reg) {
>> +        case TPM_I2C_REG_LOC_SEL:
>> +            /* Location selection register is managed by i2c */
>> +            i2cst->data[1] = i2cst->loc_sel;
>> +            break;
>> +        case TPM_I2C_REG_DATA_FIFO:
>> +            /* FIFO data is directly read from TPM TIS */
>> +            data_read = tpm_tis_read_data(s, i2cst->tis_addr, 1);
>> +            i2cst->data[1] = (data_read & 0xff);
>> +            break;
>> +        case TPM_I2C_REG_DATA_CSUM_ENABLE:
>> +            i2cst->data[1] = i2cst->csum_enable;
>> +            break;
>> +        case TPM_I2C_REG_INT_CAPABILITY:
>> +            /* Interrupt is not supported as there is not way to 
>> test it. */
>> +            i2cst->data[1] = TPM_I2C_INT_ENABLE_MASK;
>> +            i2cst->data[2] = TPM_I2C_INT_ENABLE_MASK;
>> +            i2cst->data[3] = TPM_I2C_INT_ENABLE_MASK;
>> +            i2cst->data[4] = TPM_I2C_INT_ENABLE_MASK;
>> +            break;
>> +        case TPM_I2C_REG_DATA_CSUM_GET:
>> +            /*
>> +             * Checksum registers are not supported by common code 
>> hence
>> +             * call a common code to get the checksum.
>> +             */
>> +            data_read = tpm_tis_get_checksum(s);
>> +
>> +            /* Save the byte stream in data field */
>> +            i2cst->data[1] = (data_read & 0xff);
>> +            i2cst->data[2] = ((data_read >> 8) & 0xff);
>> +            break;
>> +        default:
>> +            data_read = tpm_tis_read_data(s, i2cst->tis_addr, 4);
>> +
>> +            switch (i2c_reg) {
>> +            case TPM_I2C_REG_INTF_CAPABILITY:
>> +                /* Prepare the capabilities as per I2C interface */
>> +                data_read = tpm_i2c_interface_capability(i2cst,
>> + data_read);
>> +                break;
>> +            case TPM_I2C_REG_STS:
>> +                /*
>> +                 * As per specs, STS bit 31:26 are reserved and must
>> +                 * be set to 0
>> +                 */
>> +                data_read &= TPM_I2C_STS_READ_MASK;
>> +                break;
>> +            }
>> +
>> +            /* Save byte stream in data[] */
>> +            i2cst->data[1] = data_read;
>> +            i2cst->data[2] = data_read >> 8;
>> +            i2cst->data[3] = data_read >> 16;
>> +            i2cst->data[4] = data_read >> 24;
>> +            break;
>> +        }
>> +
>> +        /* Return first byte with this call */
>> +        i2cst->offset = 1; /* keep the register value intact for 
>> debug */
>> +        ret = i2cst->data[i2cst->offset++];
>> +    } else {
>> +        i2cst->operation = OP_RECV;
>> +    }
>> +
>> +    trace_tpm_tis_i2c_recv(ret);
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * Send function only remembers data in the buffer and then calls
>> + * TPM TIS common code during FINISH event.
>> + */
>> +static int tpm_tis_i2c_send(I2CSlave *i2c, uint8_t data)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
>> +
>> +    /* Reject non-supported registers. */
>> +    if (i2cst->offset == 0) {
>> +        /* Convert I2C register to TIS register */
>> +        tpm_tis_i2c_to_tis_reg(i2cst, data);
>> +        if (i2cst->tis_addr == 0xffffffff) {
>> +            return 0xffffffff;
>> +        }
>> +
>> +        trace_tpm_tis_i2c_send_reg(i2cst->reg_name, data);
>> +
>> +        /* We do not support device address change */
>> +        if (data == TPM_I2C_REG_I2C_DEV_ADDRESS) {
>> +            qemu_log_mask(LOG_UNIMP, "%s: Device address change "
>> +                          "is not supported.\n", __func__);
>> +            return 0xffffffff;
>> +        }
>> +    } else {
>> +        trace_tpm_tis_i2c_send(data);
>> +    }
>> +
>> +    if (i2cst->offset < sizeof(i2cst->data)) {
>> +        i2cst->operation = OP_SEND;
>> +
>> +        /* Remember data locally for non-FIFO registers */
>> +        if ((i2cst->offset == 0) ||
>> +            (i2cst->data[0] != TPM_I2C_REG_DATA_FIFO)) {
>> +            i2cst->data[i2cst->offset++] = data;
>> +        } else {
>> +            tpm_tis_write_data(&i2cst->state, i2cst->tis_addr, data, 
>> 1);
>> +        }
>> +
>> +        return 0;
>> +
>> +    }
>> +
>> +    /* Return non-zero to indicate NAK */
>> +    return 1;
>> +}
>> +
>> +static Property tpm_tis_i2c_properties[] = {
>> +    DEFINE_PROP_TPMBE("tpmdev", TPMStateI2C, state.be_driver),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void tpm_tis_i2c_realizefn(DeviceState *dev, Error **errp)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(dev);
>> +    TPMState *s = &i2cst->state;
>> +
>> +    if (!tpm_find()) {
>> +        error_setg(errp, "at most one TPM device is permitted");
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Get the backend pointer. It is not initialized propery during
>> +     * device_class_set_props
>> +     */
>> +    s->be_driver = qemu_find_tpm_be("tpm0");
>> +
>> +    if (!s->be_driver) {
>> +        error_setg(errp, "'tpmdev' property is required");
>> +        return;
>> +    }
>> +}
>> +
>> +static void tpm_tis_i2c_reset(DeviceState *dev)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(dev);
>> +    TPMState *s = &i2cst->state;
>> +
>> +    tpm_tis_i2c_clear_data(i2cst);
>> +
>> +    i2cst->csum_enable = 0;
>> +    i2cst->loc_sel = 0x00;
>> +
>> +    return tpm_tis_reset(s);
>> +}
>> +
>> +static void tpm_tis_i2c_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>> +    TPMIfClass *tc = TPM_IF_CLASS(klass);
>> +
>> +    dc->realize = tpm_tis_i2c_realizefn;
>> +    dc->reset = tpm_tis_i2c_reset;
>> +    dc->vmsd = &vmstate_tpm_tis_i2c;
>> +    device_class_set_props(dc, tpm_tis_i2c_properties);
>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>> +
>> +    k->event = tpm_tis_i2c_event;
>> +    k->recv = tpm_tis_i2c_recv;
>> +    k->send = tpm_tis_i2c_send;
>> +
>> +    tc->model = TPM_MODEL_TPM_TIS;
>> +    tc->request_completed = tpm_tis_i2c_request_completed;
>> +    tc->get_version = tpm_tis_i2c_get_tpm_version;
>> +}
>> +
>> +static const TypeInfo tpm_tis_i2c_info = {
>> +    .name          = TYPE_TPM_TIS_I2C,
>> +    .parent        = TYPE_I2C_SLAVE,
>> +    .instance_size = sizeof(TPMStateI2C),
>> +    .class_init    = tpm_tis_i2c_class_init,
>> +        .interfaces = (InterfaceInfo[]) {
>> +        { TYPE_TPM_IF },
>> +        { }
>> +    }
>> +};
>> +
>> +static void tpm_tis_i2c_register_types(void)
>> +{
>> +    type_register_static(&tpm_tis_i2c_info);
>> +}
>> +
>> +type_init(tpm_tis_i2c_register_types)
>> diff --git a/hw/tpm/trace-events b/hw/tpm/trace-events
>> index f17110458e..fa882dfefe 100644
>> --- a/hw/tpm/trace-events
>> +++ b/hw/tpm/trace-events
>> @@ -36,3 +36,9 @@ tpm_spapr_do_crq_unknown_msg_type(uint8_t type) 
>> "Unknown message type 0x%02x"
>>   tpm_spapr_do_crq_unknown_crq(uint8_t raw1, uint8_t raw2) "unknown 
>> CRQ 0x%02x 0x%02x ..."
>>   tpm_spapr_post_load(void) "Delivering TPM response after resume"
>>   tpm_spapr_caught_response(uint32_t v) "Caught response to deliver 
>> after resume: %u bytes"
>> +
>> +# tpm_tis_i2c.c
>> +tpm_tis_i2c_recv(uint8_t data) "TPM I2C read: 0x%X"
>> +tpm_tis_i2c_send(uint8_t data) "TPM I2C write: 0x%X"
>> +tpm_tis_i2c_event(const char *event) "TPM I2C event: %s"
>> +tpm_tis_i2c_send_reg(const char *name, int reg) "TPM I2C write 
>> register: %s(0x%X)"
>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
>> index fb40e30ff6..66e3b45f30 100644
>> --- a/include/sysemu/tpm.h
>> +++ b/include/sysemu/tpm.h
>> @@ -48,6 +48,7 @@ struct TPMIfClass {
>>   #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
>>   #define TYPE_TPM_CRB                "tpm-crb"
>>   #define TYPE_TPM_SPAPR              "tpm-spapr"
>> +#define TYPE_TPM_TIS_I2C            "tpm-tis-i2c"
>>     #define TPM_IS_TIS_ISA(chr)                         \
>>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
>> @@ -57,6 +58,8 @@ struct TPMIfClass {
>>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
>>   #define TPM_IS_SPAPR(chr)                           \
>>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_SPAPR)
>> +#define TPM_IS_TIS_I2C(chr)                      \
>> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_I2C)
>>     /* returns NULL unless there is exactly one TPM device */
>>   static inline TPMIf *tpm_find(void)
>

