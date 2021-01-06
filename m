Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349712EC13D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 17:34:16 +0100 (CET)
Received: from localhost ([::1]:50132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxBlG-0003rW-Pk
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 11:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kxBjI-0002y7-R0
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:32:12 -0500
Received: from mga01.intel.com ([192.55.52.88]:14567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kxBjE-0000VB-Tp
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:32:12 -0500
IronPort-SDR: PxeIK2OU7bIFz83R2xg6OWJTOV8/emKb/LvT3RRgaNyNO6Ie7+aeK6KjOENP3VaGidLPyJqVeU
 ke7fMbzbPdag==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="195849866"
X-IronPort-AV: E=Sophos;i="5.79,480,1602572400"; d="scan'208";a="195849866"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 08:32:01 -0800
IronPort-SDR: GM5Ekbe2OhWuG0LTYMgqBkU2ZK2ndIUmKI8hFMI71ekT633ftVdYn/HehKp2eCB7LD6RKngjzp
 061GscR7Qi5w==
X-IronPort-AV: E=Sophos;i="5.79,480,1602572400"; d="scan'208";a="402744892"
Received: from pthatich-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.252.142.206])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 08:32:01 -0800
Date: Wed, 6 Jan 2021 08:31:59 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH v2 07/32] hw/cxl/device: Implement basic mailbox
 (8.2.8.4)
Message-ID: <20210106163159.g2bfznulor4p4rha@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
 <20210105165323.783725-8-ben.widawsky@intel.com>
 <20210106132123.00003a9d@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210106132123.00003a9d@Huawei.com>
Received-SPF: pass client-ip=192.55.52.88; envelope-from=ben.widawsky@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, linuxarm@openeuler.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-06 13:21:23, Jonathan Cameron wrote:
> On Tue, 5 Jan 2021 08:52:58 -0800
> Ben Widawsky <ben.widawsky@intel.com> wrote:
> 
> > This is the beginning of implementing mailbox support for CXL 2.0
> > devices.
> > 
> > v2: Use register alignment helper (Ben)
> >     Minor cleanups (Jonathan)
> >     Rename error codes to match spec (Jonathan)
> >     Update cap count from 1 to 2 (Jonathan)
> >     Add infra to support CEL (Ben)
> >     Add more of the actual mailbox handling from later patch (Ben)
> > 
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> 
> Hi Ben,
> 
> I hacked support in for ARM64 to give this a spin and ran into an
> interesting problem around read sizes.

Cool!

> 
> The mailbox registers space allows 4 or 8 byte reads, but in the kernel
> driver (I think I have the right version from your github) you do
> the payload drain with
> memcpy_from_io()

https://gitlab.com/bwidawsk/linux/-/tree/cxl-2.0v3

Vishal in the Cc is finishing up some work on adding support to ndctl, after
which I'll be sending that (or something closely related) to the mailing list.

> 
> If the size of the payload is not a multiple of 8 bytes, on ARM64 that
> results in byte reads and an exception.  This happens with some of the
> existing calls which happen to have non multiple of 8 payload sizes.

Could you add the backtrace here? You caused me to go look at what x86 does. I
actually assumed on modern platforms it did movsb (byte moves), which are highly
optimized in microcode. In fact, it does some amount of word moves too, which
was new info to me.

So I'm not really sure yet why ARM64 is special here.

> 
> I hacked below to allow 1 byte reads from that region but that's probably
> not the right fix.  I found a statement in the CXL spec saying maximum read
> size from this register block was 8 bytes but couldn't immediately see a minimum.
> (I haven't looked that hard yet though!)

8.2
• A 32 bit register shall be accessed as a 1 Byte, 2 Bytes or 4 Bytes quantity.
• A 64 bit register shall be accessed as a 1 Byte, 2 Bytes, 4 Bytes or 8 Bytes quantity

Interesting though, I really thought QEMU should do the right thing here and you
wouldn't need to allow 1byte accesses. 

> 
> Various approaches in kernel could also be used:
> 1) Change the payload drain to have specific handling for the end few bytes.
> 2) Pad the various structures to ensure payloads are always 8 byte multiples
> in length (nasty).

I think the right solution is to support/allow byte and word access. I just
thought it should work in the existing code. I'd like to try to figure out
what's going on.

How much effort would it be for me to reproduce what you've done?

> 
> > ---
> >  hw/cxl/cxl-device-utils.c   | 122 ++++++++++++++++++++++++-
> >  hw/cxl/cxl-mailbox-utils.c  | 173 ++++++++++++++++++++++++++++++++++++
> >  hw/cxl/meson.build          |   1 +
> >  include/hw/cxl/cxl.h        |   3 +
> >  include/hw/cxl/cxl_device.h |  27 +++++-
> >  5 files changed, 322 insertions(+), 4 deletions(-)
> >  create mode 100644 hw/cxl/cxl-mailbox-utils.c
> > 
> > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> > index b86e5466bd..642e3c2617 100644
> > --- a/hw/cxl/cxl-device-utils.c
> > +++ b/hw/cxl/cxl-device-utils.c
> > @@ -44,6 +44,108 @@ static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
> >      return ldn_le_p(&retval, size);
> >  }
> >  
> > +static uint64_t mailbox_reg_read(void *opaque, hwaddr offset, unsigned size)
> > +{
> > +    CXLDeviceState *cxl_dstate = opaque;
> > +
> > +    if (cxl_device_check_register_alignment(offset, size)) {
> > +        qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> > +        return 0;
> > +    }
> > +
> > +    return ldn_le_p(cxl_dstate->mbox_reg_state + offset, size);
> > +}
> > +
> > +static void mailbox_mem_writel(uint32_t *reg_state, hwaddr offset,
> > +                               uint64_t value)
> > +{
> > +    switch (offset) {
> > +    case A_CXL_DEV_MAILBOX_CTRL:
> > +        /* fallthrough */
> > +    case A_CXL_DEV_MAILBOX_CAP:
> > +        /* RO register */
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP,
> > +                      "%s Unexpected 32-bit access to 0x%" PRIx64 " (WI)\n",
> > +                      __func__, offset);
> > +        break;
> > +    }
> > +
> > +    stl_le_p((uint8_t *)reg_state + offset, value);
> > +}
> > +
> > +static void mailbox_mem_writeq(uint8_t *reg_state, hwaddr offset,
> > +                               uint64_t value)
> > +{
> > +    switch (offset) {
> > +    case A_CXL_DEV_MAILBOX_CMD:
> > +        break;
> > +    case A_CXL_DEV_BG_CMD_STS:
> > +        /* BG not supported */
> > +        /* fallthrough */
> > +    case A_CXL_DEV_MAILBOX_STS:
> > +        /* Read only register, will get updated by the state machine */
> > +        return;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP,
> > +                      "%s Unexpected 64-bit access to 0x%" PRIx64 " (WI)\n",
> > +                      __func__, offset);
> > +        return;
> > +    }
> > +
> > +    stq_le_p(reg_state + offset, value);
> > +}
> > +
> > +static void mailbox_reg_write(void *opaque, hwaddr offset, uint64_t value,
> > +                              unsigned size)
> > +{
> > +    CXLDeviceState *cxl_dstate = opaque;
> > +
> > +    /*
> > +     * Lock is needed to prevent concurrent writes as well as to prevent writes
> > +     * coming in while the firmware is processing. Without background commands
> > +     * or the second mailbox implemented, this serves no purpose since the
> > +     * memory access is synchronized at a higher level (per memory region).
> > +     */
> > +    RCU_READ_LOCK_GUARD();
> > +
> > +    switch (size) {
> > +    case 4:
> > +        if (unlikely(offset & (sizeof(uint32_t) - 1))) {
> > +            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> > +            return;
> > +        }
> > +        mailbox_mem_writel(cxl_dstate->mbox_reg_state32, offset, value);
> > +        break;
> > +    case 8:
> > +        if (unlikely(offset & (sizeof(uint64_t) - 1))) {
> > +            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> > +            return;
> > +        }
> > +        mailbox_mem_writeq(cxl_dstate->mbox_reg_state, offset, value);
> > +        break;
> > +    }
> > +
> > +    if (ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL,
> > +                         DOORBELL))
> > +        cxl_process_mailbox(cxl_dstate);
> > +}
> > +
> > +static const MemoryRegionOps mailbox_ops = {
> > +    .read = mailbox_reg_read,
> > +    .write = mailbox_reg_write,
> > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .valid = {
> > +        .min_access_size = 4,
> 
> Hack was to set this to 1 (and the impl below - no idea if both are needed).
> 
> > +        .max_access_size = 8,
> > +    },
> > +    .impl = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 8,
> > +    },
> > +};
> > +
> >  static const MemoryRegionOps dev_ops = {
> >      .read = dev_reg_read,
> >      .write = NULL,
> > @@ -83,20 +185,33 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
> >                            "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
> >      memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dstate,
> >                            "device-status", CXL_DEVICE_REGISTERS_LENGTH);
> > +    memory_region_init_io(&cxl_dstate->mailbox, obj, &mailbox_ops, cxl_dstate,
> > +                          "mailbox", CXL_MAILBOX_REGISTERS_LENGTH);
> >  
> >      memory_region_add_subregion(&cxl_dstate->device_registers, 0,
> >                                  &cxl_dstate->caps);
> >      memory_region_add_subregion(&cxl_dstate->device_registers,
> >                                  CXL_DEVICE_REGISTERS_OFFSET,
> >                                  &cxl_dstate->device);
> > +    memory_region_add_subregion(&cxl_dstate->device_registers,
> > +                                CXL_MAILBOX_REGISTERS_OFFSET,
> > +                                &cxl_dstate->mailbox);
> >  }
> >  
> >  static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
> >  
> > +static void mailbox_reg_init_common(CXLDeviceState *cxl_dstate)
> > +{
> > +    /* 2048 payload size, with no interrupt or background support */
> > +    ARRAY_FIELD_DP32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CAP,
> > +                     PAYLOAD_SIZE, CXL_MAILBOX_PAYLOAD_SHIFT);
> > +    cxl_dstate->payload_size = CXL_MAILBOX_MAX_PAYLOAD_SIZE;
> > +}
> > +
> >  void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> >  {
> >      uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
> > -    const int cap_count = 1;
> > +    const int cap_count = 2;
> >  
> >      /* CXL Device Capabilities Array Register */
> >      ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
> > @@ -105,4 +220,9 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> >  
> >      cxl_device_cap_init(cxl_dstate, DEVICE, 1);
> >      device_reg_init_common(cxl_dstate);
> > +
> > +    cxl_device_cap_init(cxl_dstate, MAILBOX, 2);
> > +    mailbox_reg_init_common(cxl_dstate);
> > +
> > +    assert(cxl_initialize_mailbox(cxl_dstate) == 0);
> >  }
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > new file mode 100644
> > index 0000000000..3a39c936de
> > --- /dev/null
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -0,0 +1,173 @@
> > +/*
> > + * CXL Utility library for mailbox interface
> > + *
> > + * Copyright(C) 2020 Intel Corporation.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. See the
> > + * COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/cxl/cxl.h"
> > +#include "hw/pci/pci.h"
> > +#include "qemu/log.h"
> > +#include "qemu/uuid.h"
> > +
> > +/*
> > + * How to add a new command, example. The command set FOO, with cmd BAR.
> > + *  1. Add the command set and cmd to the enum.
> > + *     FOO    = 0x7f,
> > + *          #define BAR 0
> > + *  2. Forward declare the handler.
> > + *     declare_mailbox_handler(FOO_BAR);
> > + *  3. Add the command to the cxl_cmd_set[][]
> > + *     CXL_CMD(FOO, BAR, 0, 0),
> > + *  4. Implement your handler
> > + *     define_mailbox_handler(FOO_BAR) { ... return CXL_MBOX_SUCCESS; }
> > + *
> > + *
> > + *  Writing the handler:
> > + *    The handler will provide the &struct cxl_cmd, the &CXLDeviceState, and the
> > + *    in/out length of the payload. The handler is responsible for consuming the
> > + *    payload from cmd->payload and operating upon it as necessary. It must then
> > + *    fill the output data into cmd->payload (overwriting what was there),
> > + *    setting the length, and returning a valid return code.
> > + *
> > + *  XXX: The handler need not worry about endianess. The payload is read out of
> > + *  a register interface that already deals with it.
> > + */
> > +
> > +/* 8.2.8.4.5.1 Command Return Codes */
> > +typedef enum {
> > +    CXL_MBOX_SUCCESS = 0x0,
> > +    CXL_MBOX_BG_STARTED = 0x1,
> > +    CXL_MBOX_INVALID_INPUT = 0x2,
> > +    CXL_MBOX_UNSUPPORTED = 0x3,
> > +    CXL_MBOX_INTERNAL_ERROR = 0x4,
> > +    CXL_MBOX_RETRY_REQUIRED = 0x5,
> > +    CXL_MBOX_BUSY = 0x6,
> > +    CXL_MBOX_MEDIA_DISABLED = 0x7,
> > +    CXL_MBOX_FW_XFER_IN_PROGRESS = 0x8,
> > +    CXL_MBOX_FW_XFER_OUT_OF_ORDER = 0x9,
> > +    CXL_MBOX_FW_AUTH_FAILED = 0xa,
> > +    CXL_MBOX_FW_INVALID_SLOT = 0xb,
> > +    CXL_MBOX_FW_ROLLEDBACK = 0xc,
> > +    CXL_MBOX_FW_REST_REQD = 0xd,
> > +    CXL_MBOX_INVALID_HANDLE = 0xe,
> > +    CXL_MBOX_INVALID_PA = 0xf,
> > +    CXL_MBOX_INJECT_POISON_LIMIT = 0x10,
> > +    CXL_MBOX_PERMANENT_MEDIA_FAILURE = 0x11,
> > +    CXL_MBOX_ABORTED = 0x12,
> > +    CXL_MBOX_INVALID_SECURITY_STATE = 0x13,
> > +    CXL_MBOX_INCORRECT_PASSPHRASE = 0x14,
> > +    CXL_MBOX_UNSUPPORTED_MAILBOX = 0x15,
> > +    CXL_MBOX_INVALID_PAYLOAD_LENGTH = 0x16,
> > +    CXL_MBOX_MAX = 0x17
> > +} ret_code;
> > +
> > +struct cxl_cmd;
> > +typedef ret_code (*opcode_handler)(struct cxl_cmd *cmd,
> > +                                   CXLDeviceState *cxl_dstate, uint16_t *len);
> > +struct cxl_cmd {
> > +    const char *name;
> > +    opcode_handler handler;
> > +    ssize_t in;
> > +    uint16_t effect; /* Reported in CEL */
> > +    uint8_t *payload;
> > +};
> > +
> > +#define define_mailbox_handler(name)                \
> > +    static ret_code cmd_##name(struct cxl_cmd *cmd, \
> > +                               CXLDeviceState *cxl_dstate, uint16_t *len)
> > +#define declare_mailbox_handler(name) define_mailbox_handler(name)
> > +
> > +#define CXL_CMD(s, c, in, cel_effect) \
> > +    [s][c] = { stringify(s##_##c), cmd_##s##_##c, in, cel_effect }
> > +
> > +static struct cxl_cmd cxl_cmd_set[256][256] = {};
> > +
> > +#undef CXL_CMD
> > +
> > +QemuUUID cel_uuid;
> > +
> > +void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> > +{
> > +    uint16_t ret = CXL_MBOX_SUCCESS;
> > +    struct cxl_cmd *cxl_cmd;
> > +    uint64_t status_reg;
> > +    opcode_handler h;
> > +
> > +    /*
> > +     * current state of mailbox interface
> > +     *  mbox_cap_reg = cxl_dstate->reg_state32[R_CXL_DEV_MAILBOX_CAP];
> > +     *  mbox_ctrl_reg = cxl_dstate->reg_state32[R_CXL_DEV_MAILBOX_CTRL];
> > +     *  status_reg = *(uint64_t *)&cxl_dstate->reg_state[A_CXL_DEV_MAILBOX_STS];
> > +     */
> > +    uint64_t command_reg =
> > +        *(uint64_t *)&cxl_dstate->mbox_reg_state[A_CXL_DEV_MAILBOX_CMD];
> > +
> > +    /* Check if we have to do anything */
> > +    if (!ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL,
> > +                          DOORBELL)) {
> > +        qemu_log_mask(LOG_UNIMP, "Corrupt internal state for firmware\n");
> > +        return;
> > +    }
> > +
> > +    uint8_t set = FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND_SET);
> > +    uint8_t cmd = FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND);
> > +    uint16_t len = FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, LENGTH);
> > +    cxl_cmd = &cxl_cmd_set[set][cmd];
> > +    h = cxl_cmd->handler;
> > +    if (!h) {
> > +        goto handled;
> > +    }
> > +
> > +    if (len != cxl_cmd->in) {
> > +        ret = CXL_MBOX_INVALID_PAYLOAD_LENGTH;
> > +    }
> > +
> > +    cxl_cmd->payload = cxl_dstate->mbox_reg_state + A_CXL_DEV_CMD_PAYLOAD;
> > +    ret = (*h)(cxl_cmd, cxl_dstate, &len);
> > +    assert(len <= cxl_dstate->payload_size);
> > +
> > +handled:
> > +    /*
> > +     * Set the return code
> > +     * XXX: it's a 64b register, but we're not setting the vendor, so we can get
> > +     * away with this
> > +     */
> > +    status_reg = FIELD_DP64(0, CXL_DEV_MAILBOX_STS, ERRNO, ret);
> > +
> > +    /*
> > +     * Set the return length
> > +     */
> > +    command_reg = FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND_SET, 0);
> > +    command_reg = FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND, 0);
> > +    command_reg = FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, LENGTH, len);
> > +
> > +    stq_le_p(cxl_dstate->mbox_reg_state + A_CXL_DEV_MAILBOX_CMD, command_reg);
> > +    stq_le_p(cxl_dstate->mbox_reg_state + A_CXL_DEV_MAILBOX_STS, status_reg);
> > +
> > +    /* Tell the host we're done */
> > +    ARRAY_FIELD_DP32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL,
> > +                     DOORBELL, 0);
> > +}
> > +
> > +int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate)
> > +{
> > +    const char *cel_uuidstr = "0da9c0b5-bf41-4b78-8f79-96b1623b3f17";
> > +
> > +    for (int i = 0; i < 256; i++) {
> > +        for (int j = 0; j < 256; j++) {
> > +            if (cxl_cmd_set[i][j].handler) {
> > +                struct cxl_cmd *c = &cxl_cmd_set[i][j];
> > +
> > +                cxl_dstate->cel_log[cxl_dstate->cel_size].opcode = (i << 8) | j;
> > +                cxl_dstate->cel_log[cxl_dstate->cel_size].effect = c->effect;
> > +                cxl_dstate->cel_size++;
> > +            }
> > +        }
> > +    }
> > +
> > +    return qemu_uuid_parse(cel_uuidstr, &cel_uuid);
> > +}
> > diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> > index 47154d6850..0eca715d10 100644
> > --- a/hw/cxl/meson.build
> > +++ b/hw/cxl/meson.build
> > @@ -1,4 +1,5 @@
> >  softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
> >    'cxl-component-utils.c',
> >    'cxl-device-utils.c',
> > +  'cxl-mailbox-utils.c',
> >  ))
> > diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> > index 23f52c4cf9..362cda40de 100644
> > --- a/include/hw/cxl/cxl.h
> > +++ b/include/hw/cxl/cxl.h
> > @@ -14,5 +14,8 @@
> >  #include "cxl_component.h"
> >  #include "cxl_device.h"
> >  
> > +#define COMPONENT_REG_BAR_IDX 0
> > +#define DEVICE_REG_BAR_IDX 2
> > +
> >  #endif
> >  
> > diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> > index 3380fc9e7a..bdf990cec2 100644
> > --- a/include/hw/cxl/cxl_device.h
> > +++ b/include/hw/cxl/cxl_device.h
> > @@ -70,9 +70,10 @@
> >      (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
> >  
> >  typedef struct cxl_device_state {
> > -    /* Boss container and caps registers */
> > +    /* Main register container */
> >      MemoryRegion device_registers;
> >  
> > +    MemoryRegion device;
> >      struct {
> >          MemoryRegion caps;
> >          union {
> > @@ -80,8 +81,19 @@ typedef struct cxl_device_state {
> >              uint32_t caps_reg_state32[CXL_DEVICE_CAP_REG_SIZE >> 2];
> >          };
> >      };
> > -    MemoryRegion device;
> > -    MemoryRegion mailbox;
> > +    struct {
> > +        MemoryRegion mailbox;
> > +        uint16_t payload_size;
> > +        union {
> > +            uint8_t mbox_reg_state[CXL_MAILBOX_REGISTERS_LENGTH];
> > +            uint32_t mbox_reg_state32[CXL_MAILBOX_REGISTERS_LENGTH >> 2];
> > +        };
> > +        struct {
> > +            uint16_t opcode;
> > +            uint16_t effect;
> > +        } cel_log[1 << 16];
> > +        size_t cel_size;
> > +    };
> >  
> >      MemoryRegion *pmem;
> >      MemoryRegion *vmem;
> > @@ -122,6 +134,9 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
> >  CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
> >                                                 CXL_DEVICE_CAP_REG_SIZE)
> >  
> > +int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate);
> > +void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
> > +
> >  #define cxl_device_cap_init(dstate, reg, cap_id)                                   \
> >      do {                                                                           \
> >          uint32_t *cap_hdrs = dstate->caps_reg_state32;                             \
> > @@ -149,6 +164,12 @@ REG32(CXL_DEV_MAILBOX_CTRL, 4)
> >      FIELD(CXL_DEV_MAILBOX_CTRL, INT_EN, 1, 1)
> >      FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
> >  
> > +/* XXX: actually a 64b register */
> > +REG32(CXL_DEV_MAILBOX_CMD, 8)
> > +    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND, 0, 8)
> > +    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND_SET, 8, 8)
> > +    FIELD(CXL_DEV_MAILBOX_CMD, LENGTH, 16, 20)
> > +
> >  /* XXX: actually a 64b register */
> >  REG32(CXL_DEV_MAILBOX_STS, 0x10)
> >      FIELD(CXL_DEV_MAILBOX_STS, BG_OP, 0, 1)
> 

