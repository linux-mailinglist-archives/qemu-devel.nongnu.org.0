Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE3D17B911
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 10:15:14 +0100 (CET)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA94b-0000u5-G1
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 04:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jA93b-0000IR-EN
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 04:14:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jA93Y-0005xT-Sm
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 04:14:11 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39579
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jA93Y-0005vV-NV
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 04:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583486048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//eiJpmPkBJykwZGCYPlxZ7B4SOK/gX5ZfgScuSVslw=;
 b=Ae+Nd9x/D/mAvilNd06/vT3oT+V7J1pjPkpCOE5LOi3+64wmpsKe00VrWYm1+KTMjNh9wZ
 CGx8bQJKMDYLPnZhiI2M42sncdEyTAEzqh1TUwLSxS+vQY5mnwyBjLY5bWL+Yuo0xx4Qz4
 Foi2AnyJpNjMMEOUy7c2voA6PNJ1XE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-JK7L4NkIMZmAWTkY4zO4ig-1; Fri, 06 Mar 2020 04:14:05 -0500
X-MC-Unique: JK7L4NkIMZmAWTkY4zO4ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF006802CB0;
 Fri,  6 Mar 2020 09:14:03 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCB8673885;
 Fri,  6 Mar 2020 09:13:56 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v3 10/14] arm/arm64: ITS: commands
To: Andrew Jones <drjones@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
 <20200128103459.19413-11-eric.auger@redhat.com>
 <20200207133752.3dsmty3y37wirsda@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4b121af7-6f9a-1164-55fd-fad1f42f1a3c@redhat.com>
Date: Fri, 6 Mar 2020 10:13:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200207133752.3dsmty3y37wirsda@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, kvm@vger.kernel.org,
 maz@kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 andre.przywara@arm.com, yuzenghui@huawei.com, alexandru.elisei@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 2/7/20 2:37 PM, Andrew Jones wrote:
> On Tue, Jan 28, 2020 at 11:34:55AM +0100, Eric Auger wrote:
>> Implement main ITS commands. The code is largely inherited from
>> the ITS driver.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> - do not use report() anymore
>> - assert if cmd_write exceeds the queue capacity
>>
>> v1 -> v2:
>> - removed its_print_cmd_state
>> ---
>>  arm/Makefile.arm64       |   2 +-
>>  lib/arm/asm/gic-v3-its.h |  38 +++-
>>  lib/arm/gic-v3-its-cmd.c | 454 +++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 492 insertions(+), 2 deletions(-)
>>  create mode 100644 lib/arm/gic-v3-its-cmd.c
>>
>> diff --git a/arm/Makefile.arm64 b/arm/Makefile.arm64
>> index 2571ffb..d12aea5 100644
>> --- a/arm/Makefile.arm64
>> +++ b/arm/Makefile.arm64
>> @@ -19,7 +19,7 @@ endef
>>  cstart.o = $(TEST_DIR)/cstart64.o
>>  cflatobjs += lib/arm64/processor.o
>>  cflatobjs += lib/arm64/spinlock.o
>> -cflatobjs += lib/arm/gic-v3-its.o
>> +cflatobjs += lib/arm/gic-v3-its.o lib/arm/gic-v3-its-cmd.o
>>  
>>  OBJDIRS += lib/arm64
>>  
>> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
>> index acd97a9..0e5c5b6 100644
>> --- a/lib/arm/asm/gic-v3-its.h
>> +++ b/lib/arm/asm/gic-v3-its.h
>> @@ -45,6 +45,8 @@ struct its_collection {
>>  	u16 col_id;
>>  };
>>  
>> +struct its_cmd_block;
>> +
> 
> This isn't necessary. If it was, then it should have been added in a
> previous patch.
removed
> 
>>  struct its_data {
>>  	void *base;
>>  	struct its_typer typer;
>> @@ -107,6 +109,24 @@ extern struct its_data its_data;
>>  #define GITS_BASER_TYPE_DEVICE		1
>>  #define GITS_BASER_TYPE_COLLECTION	4
>>  
>> +/*
>> + * ITS commands
>> + */
>> +#define GITS_CMD_MAPD                   0x08
>> +#define GITS_CMD_MAPC                   0x09
>> +#define GITS_CMD_MAPTI                  0x0a
>> +/* older GIC documentation used MAPVI for this command */
>> +#define GITS_CMD_MAPVI                  GITS_CMD_MAPTI
>> +#define GITS_CMD_MAPI                   0x0b
>> +#define GITS_CMD_MOVI                   0x01
>> +#define GITS_CMD_DISCARD                0x0f
>> +#define GITS_CMD_INV                    0x0c
>> +#define GITS_CMD_MOVALL                 0x0e
>> +#define GITS_CMD_INVALL                 0x0d
>> +#define GITS_CMD_INT                    0x03
>> +#define GITS_CMD_CLEAR                  0x04
>> +#define GITS_CMD_SYNC                   0x05
> 
> Please use tabs.
done
> 
>> +
>>  struct its_cmd_block {
>>  	u64 raw_cmd[4];
>>  };
>> @@ -119,11 +139,27 @@ extern void its_enable_defaults(void);
>>  extern struct its_device *its_create_device(u32 dev_id, int nr_ites);
>>  extern struct its_collection *its_create_collection(u32 col_id, u32 target_pe);
>>  
>> +extern void its_send_mapd(struct its_device *dev, int valid);
>> +extern void its_send_mapc(struct its_collection *col, int valid);
>> +extern void its_send_mapti(struct its_device *dev, u32 irq_id,
>> +			   u32 event_id, struct its_collection *col);
>> +extern void its_send_int(struct its_device *dev, u32 event_id);
>> +extern void its_send_inv(struct its_device *dev, u32 event_id);
>> +extern void its_send_discard(struct its_device *dev, u32 event_id);
>> +extern void its_send_clear(struct its_device *dev, u32 event_id);
>> +extern void its_send_invall(struct its_collection *col);
>> +extern void its_send_movi(struct its_device *dev,
>> +			  struct its_collection *col, u32 id);
>> +extern void its_send_sync(struct its_collection *col);
>> +
>> +#define ITS_FLAGS_CMDQ_NEEDS_FLUSHING           (1ULL << 0)
>> +#define ITS_FLAGS_WORKAROUND_CAVIUM_22375       (1ULL << 1)
>> +#define ITS_FLAGS_WORKAROUND_CAVIUM_23144       (1ULL << 2)
> 
> What are these flags for?
removed
> 
>> +
>>  #else /* __arm__ */
>>  
>>  static inline void its_init(void) {}
>>  
>>  #endif
>> -
>>  #endif /* !__ASSEMBLY__ */
>>  #endif /* _ASMARM_GIC_V3_ITS_H_ */
>> diff --git a/lib/arm/gic-v3-its-cmd.c b/lib/arm/gic-v3-its-cmd.c
>> new file mode 100644
>> index 0000000..fb4364c
>> --- /dev/null
>> +++ b/lib/arm/gic-v3-its-cmd.c
>> @@ -0,0 +1,454 @@
>> +/*
>> + * Copyright (C) 2020, Red Hat Inc, Eric Auger <eric.auger@redhat.com>
>> + *
>> + * Most of the code is copy-pasted from:
>> + * drivers/irqchip/irq-gic-v3-its.c
>> + * This work is licensed under the terms of the GNU LGPL, version 2.
>> + */
>> +#include <asm/io.h>
>> +#include <asm/gic.h>
>> +#include <asm/gic-v3-its.h>
>> +
>> +#define ITS_ITT_ALIGN           SZ_256
> 
> tabs
done
> 
>> +
>> +static const char * const its_cmd_string[] = {
>> +	[GITS_CMD_MAPD]		= "MAPD",
>> +	[GITS_CMD_MAPC]		= "MAPC",
>> +	[GITS_CMD_MAPTI]	= "MAPTI",
>> +	[GITS_CMD_MAPI]		= "MAPI",
>> +	[GITS_CMD_MOVI]		= "MOVI",
>> +	[GITS_CMD_DISCARD]	= "DISCARD",
>> +	[GITS_CMD_INV]		= "INV",
>> +	[GITS_CMD_MOVALL]	= "MOVALL",
>> +	[GITS_CMD_INVALL]	= "INVALL",
>> +	[GITS_CMD_INT]		= "INT",
>> +	[GITS_CMD_CLEAR]	= "CLEAR",
>> +	[GITS_CMD_SYNC]		= "SYNC",
>> +};
>> +
>> +struct its_cmd_desc {
>> +	union {
>> +		struct {
>> +			struct its_device *dev;
>> +			u32 event_id;
>> +		} its_inv_cmd;
>> +
>> +		struct {
>> +			struct its_device *dev;
>> +			u32 event_id;
>> +		} its_int_cmd;
>> +
>> +		struct {
>> +			struct its_device *dev;
>> +			bool valid;
>> +		} its_mapd_cmd;
>> +
>> +		struct {
>> +			struct its_collection *col;
>> +			bool valid;
>> +		} its_mapc_cmd;
>> +
>> +		struct {
>> +			struct its_device *dev;
>> +			u32 phys_id;
>> +			u32 event_id;
>> +			u32 col_id;
>> +		} its_mapti_cmd;
>> +
>> +		struct {
>> +			struct its_device *dev;
>> +			struct its_collection *col;
>> +			u32 event_id;
>> +		} its_movi_cmd;
>> +
>> +		struct {
>> +			struct its_device *dev;
>> +			u32 event_id;
>> +		} its_discard_cmd;
>> +
>> +		struct {
>> +			struct its_device *dev;
>> +			u32 event_id;
>> +		} its_clear_cmd;
>> +
>> +		struct {
>> +			struct its_collection *col;
>> +		} its_invall_cmd;
>> +
>> +		struct {
>> +			struct its_collection *col;
>> +		} its_sync_cmd;
>> +	};
>> +};
>> +
>> +typedef void (*its_cmd_builder_t)(struct its_cmd_block *,
>> +				  struct its_cmd_desc *);
>> +
>> +/* ITS COMMANDS */
>> +
>> +static void its_encode_cmd(struct its_cmd_block *cmd, u8 cmd_nr)
>> +{
>> +	cmd->raw_cmd[0] &= ~0xffUL;
>> +	cmd->raw_cmd[0] |= cmd_nr;
>> +}
>> +
>> +static void its_encode_devid(struct its_cmd_block *cmd, u32 devid)
>> +{
>> +	cmd->raw_cmd[0] &= BIT_ULL(32) - 1;
>> +	cmd->raw_cmd[0] |= ((u64)devid) << 32;
>> +}
>> +
>> +static void its_encode_event_id(struct its_cmd_block *cmd, u32 id)
>> +{
>> +	cmd->raw_cmd[1] &= ~0xffffffffUL;
>> +	cmd->raw_cmd[1] |= id;
>> +}
>> +
>> +static void its_encode_phys_id(struct its_cmd_block *cmd, u32 phys_id)
>> +{
>> +	cmd->raw_cmd[1] &= 0xffffffffUL;
>> +	cmd->raw_cmd[1] |= ((u64)phys_id) << 32;
>> +}
>> +
>> +static void its_encode_size(struct its_cmd_block *cmd, u8 size)
>> +{
>> +	cmd->raw_cmd[1] &= ~0x1fUL;
>> +	cmd->raw_cmd[1] |= size & 0x1f;
>> +}
>> +
>> +static void its_encode_itt(struct its_cmd_block *cmd, u64 itt_addr)
>> +{
>> +	cmd->raw_cmd[2] &= ~0xffffffffffffUL;
>> +	cmd->raw_cmd[2] |= itt_addr & 0xffffffffff00UL;
>> +}
>> +
>> +static void its_encode_valid(struct its_cmd_block *cmd, int valid)
>> +{
>> +	cmd->raw_cmd[2] &= ~(1UL << 63);
>> +	cmd->raw_cmd[2] |= ((u64)!!valid) << 63;
>> +}
>> +
>> +static void its_encode_target(struct its_cmd_block *cmd, u64 target_addr)
>> +{
>> +	cmd->raw_cmd[2] &= ~(0xfffffffffUL << 16);
>> +	cmd->raw_cmd[2] |= (target_addr & (0xffffffffUL << 16));
>> +}
>> +
>> +static void its_encode_collection(struct its_cmd_block *cmd, u16 col)
>> +{
>> +	cmd->raw_cmd[2] &= ~0xffffUL;
>> +	cmd->raw_cmd[2] |= col;
>> +}
>> +
>> +static inline void its_fixup_cmd(struct its_cmd_block *cmd)
>> +{
>> +	/* Let's fixup BE commands */
>> +	cmd->raw_cmd[0] = cpu_to_le64(cmd->raw_cmd[0]);
>> +	cmd->raw_cmd[1] = cpu_to_le64(cmd->raw_cmd[1]);
>> +	cmd->raw_cmd[2] = cpu_to_le64(cmd->raw_cmd[2]);
>> +	cmd->raw_cmd[3] = cpu_to_le64(cmd->raw_cmd[3]);
>> +}
>> +
>> +static u64 its_cmd_ptr_to_offset(struct its_cmd_block *ptr)
>> +{
>> +	return (ptr - its_data.cmd_base) * sizeof(*ptr);
>> +}
>> +
>> +static struct its_cmd_block *its_post_commands(void)
>> +{
>> +	u64 wr = its_cmd_ptr_to_offset(its_data.cmd_write);
>> +
>> +	writeq(wr, its_data.base + GITS_CWRITER);
>> +	return its_data.cmd_write;
>> +}
>> +
>> +
> 
> extra blank line
removed
> 
>> +static struct its_cmd_block *its_allocate_entry(void)
>> +{
>> +	struct its_cmd_block *cmd;
>> +
>> +	assert((u64)its_data.cmd_write < (u64)its_data.cmd_base + SZ_64K);
>> +	cmd = its_data.cmd_write++;
>> +	return cmd;
>> +}
>> +
>> +static void its_wait_for_range_completion(struct its_cmd_block *from,
>> +					  struct its_cmd_block *to)
>> +{
>> +	u64 rd_idx, from_idx, to_idx;
>> +	u32 count = 1000000;    /* 1s! */
>> +
>> +	from_idx = its_cmd_ptr_to_offset(from);
>> +	to_idx = its_cmd_ptr_to_offset(to);
>> +	while (1) {
>> +		rd_idx = readq(its_data.base + GITS_CREADR);
>> +		if (rd_idx >= to_idx || rd_idx < from_idx)
>> +			break;
>> +
>> +		count--;
>> +		if (!count) {
>> +			unsigned int cmd_id = from->raw_cmd[0] & 0xFF;
>> +
>> +			assert_msg(false, "%s timeout!",
>> +			       cmd_id <= 0xF ? its_cmd_string[cmd_id] :
>> +			       "Unexpected");
>> +			return;
> 
> No need for 'return' after assert.
removed
> 
>> +		}
>> +		cpu_relax();
> 
> no need for cpu_relax right before udelay which calls cpu_relax
removed
> 
>> +		udelay(1);
>> +	}
>> +}
>> +
>> +static void its_send_single_command(its_cmd_builder_t builder,
>> +				    struct its_cmd_desc *desc)
>> +{
>> +	struct its_cmd_block *cmd, *next_cmd;
>> +
>> +	cmd = its_allocate_entry();
>> +	builder(cmd, desc);
>> +	next_cmd = its_post_commands();
>> +
>> +	its_wait_for_range_completion(cmd, next_cmd);
>> +}
>> +
>> +
>> +static void its_build_mapd_cmd(struct its_cmd_block *cmd,
>> +			       struct its_cmd_desc *desc)
>> +{
>> +	unsigned long itt_addr;
>> +	u8 size = 12; /* 4096 eventids */
>> +
>> +	itt_addr = (unsigned long)desc->its_mapd_cmd.dev->itt;
>> +	itt_addr = ALIGN(itt_addr, ITS_ITT_ALIGN);
>> +
>> +	its_encode_cmd(cmd, GITS_CMD_MAPD);
>> +	its_encode_devid(cmd, desc->its_mapd_cmd.dev->device_id);
>> +	its_encode_size(cmd, size - 1);
>> +	its_encode_itt(cmd, itt_addr);
>> +	its_encode_valid(cmd, desc->its_mapd_cmd.valid);
>> +
>> +	its_fixup_cmd(cmd);
>> +	printf("ITS: MAPD devid=%d size = 0x%x itt=0x%lx valid=%d\n",
>> +		desc->its_mapd_cmd.dev->device_id,
>> +		size, itt_addr, desc->its_mapd_cmd.valid);
>> +
>> +}
>> +
>> +static void its_build_mapc_cmd(struct its_cmd_block *cmd,
>> +			       struct its_cmd_desc *desc)
>> +{
>> +	its_encode_cmd(cmd, GITS_CMD_MAPC);
>> +	its_encode_collection(cmd, desc->its_mapc_cmd.col->col_id);
>> +	its_encode_target(cmd, desc->its_mapc_cmd.col->target_address);
>> +	its_encode_valid(cmd, desc->its_mapc_cmd.valid);
>> +
>> +	its_fixup_cmd(cmd);
>> +	report_info("MAPC col_id=%d target_addr = 0x%lx valid=%d",
>> +		    desc->its_mapc_cmd.col->col_id,
>> +		    desc->its_mapc_cmd.col->target_address,
>> +		    desc->its_mapc_cmd.valid);
> 
> printf, but better yet, leave the printing to the callers. We're in
> library code here, so if a unit test doesn't want this verbosity
> then they shouldn't have to have it. Same comment for the above printf
> and all the below report_infos.
I switched to printf. I added a verbose field to desc so that send*
function can pass a verbose argument. It is easier to trace at low
levels as all the fields are resolved there.
> 
>> +}
>> +
>> +static void its_build_mapti_cmd(struct its_cmd_block *cmd,
>> +				struct its_cmd_desc *desc)
>> +{
>> +	its_encode_cmd(cmd, GITS_CMD_MAPTI);
>> +	its_encode_devid(cmd, desc->its_mapti_cmd.dev->device_id);
>> +	its_encode_event_id(cmd, desc->its_mapti_cmd.event_id);
>> +	its_encode_phys_id(cmd, desc->its_mapti_cmd.phys_id);
>> +	its_encode_collection(cmd, desc->its_mapti_cmd.col_id);
>> +
>> +	its_fixup_cmd(cmd);
>> +	report_info("MAPTI dev_id=%d event_id=%d -> phys_id=%d, col_id=%d",
>> +		    desc->its_mapti_cmd.dev->device_id,
>> +		    desc->its_mapti_cmd.event_id,
>> +		    desc->its_mapti_cmd.phys_id,
>> +		    desc->its_mapti_cmd.col_id);
>> +}
>> +
>> +static void its_build_invall_cmd(struct its_cmd_block *cmd,
>> +			      struct its_cmd_desc *desc)
>> +{
>> +	its_encode_cmd(cmd, GITS_CMD_INVALL);
>> +	its_encode_collection(cmd, desc->its_invall_cmd.col->col_id);
>> +
>> +	its_fixup_cmd(cmd);
>> +	report_info("INVALL col_id=%d", desc->its_invall_cmd.col->col_id);
>> +}
>> +
>> +static void its_build_clear_cmd(struct its_cmd_block *cmd,
>> +				struct its_cmd_desc *desc)
>> +{
>> +	its_encode_cmd(cmd, GITS_CMD_CLEAR);
>> +	its_encode_devid(cmd, desc->its_clear_cmd.dev->device_id);
>> +	its_encode_event_id(cmd, desc->its_clear_cmd.event_id);
>> +
>> +	its_fixup_cmd(cmd);
>> +	report_info("CLEAR col_id=%d", desc->its_invall_cmd.col->col_id);
>> +}
>> +
>> +static void its_build_discard_cmd(struct its_cmd_block *cmd,
>> +				  struct its_cmd_desc *desc)
>> +{
>> +	its_encode_cmd(cmd, GITS_CMD_DISCARD);
>> +	its_encode_devid(cmd, desc->its_discard_cmd.dev->device_id);
>> +	its_encode_event_id(cmd, desc->its_discard_cmd.event_id);
>> +
>> +	its_fixup_cmd(cmd);
>> +	report_info("DISCARD col_id=%d", desc->its_invall_cmd.col->col_id);
>> +}
>> +
>> +static void its_build_inv_cmd(struct its_cmd_block *cmd,
>> +			      struct its_cmd_desc *desc)
>> +{
>> +	its_encode_cmd(cmd, GITS_CMD_INV);
>> +	its_encode_devid(cmd, desc->its_inv_cmd.dev->device_id);
>> +	its_encode_event_id(cmd, desc->its_inv_cmd.event_id);
>> +
>> +	its_fixup_cmd(cmd);
>> +	report_info("INV dev_id=%d event_id=%d",
>> +		    desc->its_inv_cmd.dev->device_id,
>> +		    desc->its_inv_cmd.event_id);
>> +}
>> +
>> +static void its_build_int_cmd(struct its_cmd_block *cmd,
>> +			      struct its_cmd_desc *desc)
>> +{
>> +	its_encode_cmd(cmd, GITS_CMD_INT);
>> +	its_encode_devid(cmd, desc->its_int_cmd.dev->device_id);
>> +	its_encode_event_id(cmd, desc->its_int_cmd.event_id);
>> +
>> +	its_fixup_cmd(cmd);
>> +	report_info("INT dev_id=%d event_id=%d",
>> +		    desc->its_int_cmd.dev->device_id,
>> +		    desc->its_int_cmd.event_id);
>> +}
>> +
>> +static void its_build_sync_cmd(struct its_cmd_block *cmd,
>> +			       struct its_cmd_desc *desc)
>> +{
>> +	its_encode_cmd(cmd, GITS_CMD_SYNC);
>> +	its_encode_target(cmd, desc->its_sync_cmd.col->target_address);
>> +	its_fixup_cmd(cmd);
> 
> All the rest of the blocks have a blank line before its_fixup_cmd,
> but I actually like this one better. The blanks are unnecessary.
removed
> 
>> +	report_info("SYNC target_addr = 0x%lx",
>> +		    desc->its_sync_cmd.col->target_address);
>> +}
>> +
>> +static void its_build_movi_cmd(struct its_cmd_block *cmd,
>> +			       struct its_cmd_desc *desc)
>> +{
>> +	its_encode_cmd(cmd, GITS_CMD_MOVI);
>> +	its_encode_devid(cmd, desc->its_movi_cmd.dev->device_id);
>> +	its_encode_event_id(cmd, desc->its_movi_cmd.event_id);
>> +	its_encode_collection(cmd, desc->its_movi_cmd.col->col_id);
>> +
>> +	its_fixup_cmd(cmd);
>> +	report_info("MOVI dev_id=%d event_id = %d col_id=%d",
>> +		    desc->its_movi_cmd.dev->device_id,
>> +		    desc->its_movi_cmd.event_id,
>> +		    desc->its_movi_cmd.col->col_id);
>> +}
>> +
>> +void its_send_mapd(struct its_device *dev, int valid)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_mapd_cmd.dev = dev;
>> +	desc.its_mapd_cmd.valid = !!valid;
>> +
>> +	its_send_single_command(its_build_mapd_cmd, &desc);
>> +}
>> +
>> +void its_send_mapc(struct its_collection *col, int valid)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_mapc_cmd.col = col;
>> +	desc.its_mapc_cmd.valid = !!valid;
>> +
>> +	its_send_single_command(its_build_mapc_cmd, &desc);
>> +}
>> +
>> +void its_send_mapti(struct its_device *dev, u32 irq_id,
>> +		    u32 event_id, struct its_collection *col)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_mapti_cmd.dev = dev;
>> +	desc.its_mapti_cmd.phys_id = irq_id;
>> +	desc.its_mapti_cmd.event_id = event_id;
>> +	desc.its_mapti_cmd.col_id = col->col_id;
>> +
>> +	its_send_single_command(its_build_mapti_cmd, &desc);
>> +}
>> +
>> +void its_send_int(struct its_device *dev, u32 event_id)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_int_cmd.dev = dev;
>> +	desc.its_int_cmd.event_id = event_id;
>> +
>> +	its_send_single_command(its_build_int_cmd, &desc);
>> +}
>> +
>> +void its_send_movi(struct its_device *dev,
>> +		   struct its_collection *col, u32 id)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_movi_cmd.dev = dev;
>> +	desc.its_movi_cmd.col = col;
>> +	desc.its_movi_cmd.event_id = id;
>> +
>> +	its_send_single_command(its_build_movi_cmd, &desc);
>> +}
>> +
>> +void its_send_invall(struct its_collection *col)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_invall_cmd.col = col;
>> +
>> +	its_send_single_command(its_build_invall_cmd, &desc);
>> +}
>> +
>> +void its_send_inv(struct its_device *dev, u32 event_id)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_inv_cmd.dev = dev;
>> +	desc.its_inv_cmd.event_id = event_id;
>> +
>> +	its_send_single_command(its_build_inv_cmd, &desc);
>> +}
>> +
>> +void its_send_discard(struct its_device *dev, u32 event_id)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_discard_cmd.dev = dev;
>> +	desc.its_discard_cmd.event_id = event_id;
>> +
>> +	its_send_single_command(its_build_discard_cmd, &desc);
>> +}
>> +
>> +void its_send_clear(struct its_device *dev, u32 event_id)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_clear_cmd.dev = dev;
>> +	desc.its_clear_cmd.event_id = event_id;
>> +
>> +	its_send_single_command(its_build_clear_cmd, &desc);
>> +}
>> +
>> +void its_send_sync(struct its_collection *col)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_sync_cmd.col = col;
>> +
>> +	its_send_single_command(its_build_sync_cmd, &desc);
>> +}
>> +
>> -- 
>> 2.20.1
>>
>>
> 
> Thanks,
> drew 
> 
Thanks

Eric


