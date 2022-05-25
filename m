Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720035336C3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 08:32:44 +0200 (CEST)
Received: from localhost ([::1]:47106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntkZX-0006I2-21
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 02:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ntjsL-0006YX-Pg; Wed, 25 May 2022 01:48:06 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:60429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ntjsI-0005wa-8P; Wed, 25 May 2022 01:48:05 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24P5XESv024065;
 Wed, 25 May 2022 13:33:14 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.123) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 May
 2022 13:47:19 +0800
Date: Wed, 25 May 2022 13:47:11 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, Peter Delevoryas <pdel@fb.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH v1 1/1] hw/gpio: Add ASPEED GPIO model for AST1030
Message-ID: <20220525054709.GA27426@aspeedtech.com>
References: <20220321091453.17113-1-jamin_lin@aspeedtech.com>
 <20220321091453.17113-2-jamin_lin@aspeedtech.com>
 <55b7b867-4510-824a-7ce1-8cbe24e7287d@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55b7b867-4510-824a-7ce1-8cbe24e7287d@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.123]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24P5XESv024065
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 05/11/2022 06:14, Cédric Le Goater wrote:
Hi Cerdic,
> Hello Jamin,
> 
> (Adding a few people that could help with the review)
> 
> On 3/21/22 10:14, Jamin Lin wrote:
> 
> > 1. Add GPIO read/write trace event.
> 
> Do we really need the "DEVICE(s)->canonical_path" parameter ?
> That would be patch 1.
> 
Fixed in v2 patch
> > 2. Support GPIO index mode for write operation.
> > It did not support GPIO index mode for read operation.
> 
> these changes would be in patch 2.
> 
Fixed in v2 patch
> > 3. AST1030 integrates one set of Parallel GPIO Controller
> > with maximum 151 control pins, which are 21 groups
> > (A~U, exclude pin: M6 M7 Q5 Q6 Q7 R0 R1 R4 R5 R6 R7 S0 S3 S4
> > S5 S6 S7 ) and the group T and U are input only.
> 
> and a last patch 3.
> 
Fixed in v2 patch
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> 
> 
> Some minor comments below,
> 
> Thanks,
> 
> C.
> 
I created v2-patches to fix above issues, please help to review.
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=301873
Thanks-Jamin
> 
> > ---
> >   hw/gpio/aspeed_gpio.c         | 250 ++++++++++++++++++++++++++++++++--
> >   hw/gpio/trace-events          |   5 +
> >   include/hw/gpio/aspeed_gpio.h |  16 ++-
> >   3 files changed, 255 insertions(+), 16 deletions(-)
> > 
> > diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> > index c63634d3d3..3f0bd036b7 100644
> > --- a/hw/gpio/aspeed_gpio.c
> > +++ b/hw/gpio/aspeed_gpio.c
> > @@ -15,6 +15,8 @@
> >   #include "qapi/visitor.h"
> >   #include "hw/irq.h"
> >   #include "migration/vmstate.h"
> > +#include "trace.h"
> > +#include "hw/registerfields.h"
> >   
> >   #define GPIOS_PER_GROUP 8
> >   
> > @@ -203,6 +205,28 @@
> >   #define GPIO_1_8V_MEM_SIZE            0x1D8
> >   #define GPIO_1_8V_REG_ARRAY_SIZE      (GPIO_1_8V_MEM_SIZE >> 2)
> >   
> > +/*
> > + * GPIO index mode support
> > + * It only supports write operation
> > + */
> > +REG32(GPIO_INDEX_REG, 0x2AC)
> > +    FIELD(GPIO_INDEX_REG, NUMBER, 0, 8)
> > +    FIELD(GPIO_INDEX_REG, COMMAND, 12, 1)
> > +    FIELD(GPIO_INDEX_REG, TYPE, 16, 4)
> > +    FIELD(GPIO_INDEX_REG, DATA_VALUE, 20, 1)
> > +    FIELD(GPIO_INDEX_REG, DIRECTION, 20, 1)
> > +    FIELD(GPIO_INDEX_REG, INT_ENABLE, 20, 1)
> > +    FIELD(GPIO_INDEX_REG, INT_SENS_0, 21, 1)
> > +    FIELD(GPIO_INDEX_REG, INT_SENS_1, 22, 1)
> > +    FIELD(GPIO_INDEX_REG, INT_SENS_2, 23, 1)
> > +    FIELD(GPIO_INDEX_REG, INT_STATUS, 24, 1)
> > +    FIELD(GPIO_INDEX_REG, DEBOUNCE_1, 20, 1)
> > +    FIELD(GPIO_INDEX_REG, DEBOUNCE_2, 21, 1)
> > +    FIELD(GPIO_INDEX_REG, RESET_TOLERANT, 20, 1)
> > +    FIELD(GPIO_INDEX_REG, COMMAND_SRC_0, 20, 1)
> > +    FIELD(GPIO_INDEX_REG, COMMAND_SRC_1, 21, 1)
> > +    FIELD(GPIO_INDEX_REG, INPUT_MASK, 20, 1)
> 
> That's a good idea. We should start switching the models to the registerfields
> interface.
> 
> >   static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int gpio)
> >   {
> >       uint32_t falling_edge = 0, rising_edge = 0;
> > @@ -523,11 +547,16 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
> >       uint64_t idx = -1;
> >       const AspeedGPIOReg *reg;
> >       GPIOSets *set;
> > +    uint32_t value = 0;
> > +    uint64_t debounce_value;
> >   
> >       idx = offset >> 2;
> >       if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
> >           idx -= GPIO_DEBOUNCE_TIME_1;
> > -        return (uint64_t) s->debounce_regs[idx];
> > +        debounce_value = (uint64_t) s->debounce_regs[idx];
> > +        trace_aspeed_gpio_read(DEVICE(s)->canonical_path,
> > +                               offset, debounce_value);
> > +        return debounce_value;
> >       }
> >   
> >       reg = &agc->reg_table[idx];
> > @@ -540,38 +569,193 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
> >       set = &s->sets[reg->set_idx];
> >       switch (reg->type) {
> >       case gpio_reg_data_value:
> > -        return set->data_value;
> > +         value = set->data_value;
> > +         break;
> >       case gpio_reg_direction:
> > -        return set->direction;
> > +        value = set->direction;
> > +        break;
> >       case gpio_reg_int_enable:
> > -        return set->int_enable;
> > +        value = set->int_enable;
> > +        break;
> >       case gpio_reg_int_sens_0:
> > -        return set->int_sens_0;
> > +        value = set->int_sens_0;
> > +        break;
> >       case gpio_reg_int_sens_1:
> > -        return set->int_sens_1;
> > +        value = set->int_sens_1;
> > +        break;
> >       case gpio_reg_int_sens_2:
> > -        return set->int_sens_2;
> > +        value = set->int_sens_2;
> > +        break;
> >       case gpio_reg_int_status:
> > -        return set->int_status;
> > +        value = set->int_status;
> > +        break;
> >       case gpio_reg_reset_tolerant:
> > -        return set->reset_tol;
> > +        value = set->reset_tol;
> > +        break;
> >       case gpio_reg_debounce_1:
> > -        return set->debounce_1;
> > +        value = set->debounce_1;
> > +        break;
> >       case gpio_reg_debounce_2:
> > -        return set->debounce_2;
> > +        value = set->debounce_2;
> > +        break;
> >       case gpio_reg_cmd_source_0:
> > -        return set->cmd_source_0;
> > +        value = set->cmd_source_0;
> > +        break;
> >       case gpio_reg_cmd_source_1:
> > -        return set->cmd_source_1;
> > +        value = set->cmd_source_1;
> > +        break;
> >       case gpio_reg_data_read:
> > -        return set->data_read;
> > +        value = set->data_read;
> > +        break;
> >       case gpio_reg_input_mask:
> > -        return set->input_mask;
> > +        value = set->input_mask;
> > +        break;
> >       default:
> >           qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
> >                         HWADDR_PRIx"\n", __func__, offset);
> >           return 0;
> >       }
> > +
> > +    trace_aspeed_gpio_read(DEVICE(s)->canonical_path, offset, value);
> > +    return value;
> > +}
> > +
> > +static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
> > +                                                uint64_t data, uint32_t size)
> > +{
> > +
> > +    AspeedGPIOState *s = ASPEED_GPIO(opaque);
> > +    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
> > +    const GPIOSetProperties *props;
> > +    GPIOSets *set;
> > +    uint32_t reg_idx_number = FIELD_EX32(data, GPIO_INDEX_REG, NUMBER);
> > +    uint32_t reg_idx_type = FIELD_EX32(data, GPIO_INDEX_REG, TYPE);
> > +    uint32_t reg_idx_command = FIELD_EX32(data, GPIO_INDEX_REG, COMMAND);
> > +    uint32_t set_idx = reg_idx_number / ASPEED_GPIOS_PER_SET;
> > +    uint32_t pin_idx = reg_idx_number % ASPEED_GPIOS_PER_SET;
> > +    uint32_t group_idx = pin_idx / GPIOS_PER_GROUP;
> > +    uint32_t reg_value = 0;
> > +    uint32_t cleared;
> > +
> > +    set = &s->sets[set_idx];
> > +    props = &agc->props[set_idx];
> > +
> > +    if (reg_idx_command)
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: offset 0x%" HWADDR_PRIx "data 0x%"
> > +            HWADDR_PRIx "index mode wrong command 0x%x\n",
> 
> The format should use PRIx64 for the data
> 
> > +            __func__, offset, data, reg_idx_command);
> > +
> > +    switch (reg_idx_type) {
> > +    case gpio_reg_idx_data:
> > +        reg_value = set->data_read;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, DATA_VALUE));
> > +        reg_value &= props->output;
> > +        reg_value = update_value_control_source(set, set->data_value,
> > +                                                reg_value);
> > +        set->data_read = reg_value;
> > +        aspeed_gpio_update(s, set, reg_value);
> > +        return;
> > +    case gpio_reg_idx_direction:
> > +        reg_value = set->direction;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, DIRECTION));
> > +        /*
> > +         *   where data is the value attempted to be written to the pin:
> > +         *    pin type      | input mask | output mask | expected value
> > +         *    ------------------------------------------------------------
> > +         *   bidirectional  |   1       |   1        |  data
> > +         *   input only     |   1       |   0        |   0
> > +         *   output only    |   0       |   1        |   1
> > +         *   no pin         |   0       |   0        |   0
> > +         *
> > +         *  which is captured by:
> > +         *  data = ( data | ~input) & output;
> > +         */
> > +        reg_value = (reg_value | ~props->input) & props->output;
> > +        set->direction = update_value_control_source(set, set->direction,
> > +                                                     reg_value);
> > +        break;
> > +    case gpio_reg_idx_interrupt:
> > +        reg_value = set->int_enable;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, INT_ENABLE));
> > +        set->int_enable = update_value_control_source(set, set->int_enable,
> > +                                                      reg_value);
> > +        reg_value = set->int_sens_0;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, INT_SENS_0));
> > +        set->int_sens_0 = update_value_control_source(set, set->int_sens_0,
> > +                                                      reg_value);
> > +        reg_value = set->int_sens_1;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, INT_SENS_1));
> > +        set->int_sens_1 = update_value_control_source(set, set->int_sens_1,
> > +                                                      reg_value);
> > +        reg_value = set->int_sens_2;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, INT_SENS_2));
> > +        set->int_sens_2 = update_value_control_source(set, set->int_sens_2,
> > +                                                      reg_value);
> > +        /* set interrupt status */
> > +        reg_value = set->int_status;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, INT_STATUS));
> > +        cleared = ctpop32(reg_value & set->int_status);
> > +        if (s->pending && cleared) {
> > +            assert(s->pending >= cleared);
> > +            s->pending -= cleared;
> > +        }
> > +        set->int_status &= ~reg_value;
> > +        break;
> > +    case gpio_reg_idx_debounce:
> > +        reg_value = set->debounce_1;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, DEBOUNCE_1));
> > +        set->debounce_1 = update_value_control_source(set, set->debounce_1,
> > +                                                      reg_value);
> > +        reg_value = set->debounce_2;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, DEBOUNCE_2));
> > +        set->debounce_2 = update_value_control_source(set, set->debounce_2,
> > +                                                      reg_value);
> > +        return;
> > +    case gpio_reg_idx_tolerance:
> > +        reg_value = set->reset_tol;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, RESET_TOLERANT));
> > +        set->reset_tol = update_value_control_source(set, set->reset_tol,
> > +                                                     reg_value);
> > +        return;
> > +    case gpio_reg_idx_cmd_src:
> > +        reg_value = set->cmd_source_0;
> > +        reg_value = deposit32(reg_value, GPIOS_PER_GROUP * group_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, COMMAND_SRC_0));
> > +        set->cmd_source_0 = reg_value & ASPEED_CMD_SRC_MASK;
> > +        reg_value = set->cmd_source_1;
> > +        reg_value = deposit32(reg_value, GPIOS_PER_GROUP * group_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, COMMAND_SRC_1));
> > +        set->cmd_source_1 = reg_value & ASPEED_CMD_SRC_MASK;
> > +        return;
> > +    case gpio_reg_idx_input_mask:
> > +        reg_value = set->input_mask;
> > +        reg_value = deposit32(reg_value, pin_idx, 1,
> > +                              FIELD_EX32(data, GPIO_INDEX_REG, INPUT_MASK));
> > +        /*
> > +         * feeds into interrupt generation
> > +         * 0: read from data value reg will be updated
> > +         * 1: read from data value reg will not be updated
> > +         */
> > +        set->input_mask = reg_value & props->input;
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: offset 0x%" HWADDR_PRIx "data 0x%"
> > +            HWADDR_PRIx "index mode wrong type 0x%x\n",
> > +            __func__, offset, data, reg_idx_type);
> > +        return;
> > +    }
> > +    aspeed_gpio_update(s, set, set->data_value);
> > +    return;
> >   }
> >   
> >   static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
> > @@ -585,7 +769,16 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
> >       GPIOSets *set;
> >       uint32_t cleared;
> >   
> > +    trace_aspeed_gpio_write(DEVICE(s)->canonical_path, offset, data);
> > +
> >       idx = offset >> 2;
> > +
> > +    /* check gpio index mode */
> > +    if (idx == R_GPIO_INDEX_REG) {
> > +        aspeed_gpio_write_index_mode(opaque, offset, data, size);
> > +        return;
> > +    }
> > +
> >       if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
> >           idx -= GPIO_DEBOUNCE_TIME_1;
> >           s->debounce_regs[idx] = (uint32_t) data;
> > @@ -795,6 +988,15 @@ static GPIOSetProperties ast2600_1_8v_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
> >       [1] = {0x0000000f,  0x0000000f,  {"18E"} },
> >   };
> >   
> > +static GPIOSetProperties ast1030_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
> > +    [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
> > +    [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
> > +    [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
> > +    [3] = {0xffffff3f,  0xffffff3f,  {"M", "N", "O", "P"} },
> > +    [4] = {0xff060c1f,  0x00060c1f,  {"Q", "R", "S", "T"} },
> > +    [5] = {0x000000ff,  0x00000000,  {"U"} },
> > +};
> > +
> >   static const MemoryRegionOps aspeed_gpio_ops = {
> >       .read       = aspeed_gpio_read,
> >       .write      = aspeed_gpio_write,
> > @@ -947,6 +1149,16 @@ static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
> >       agc->reg_table = aspeed_1_8v_gpios;
> >   }
> >   
> > +static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
> > +{
> > +    AspeedGPIOClass *agc = ASPEED_GPIO_CLASS(klass);
> > +
> > +    agc->props = ast1030_set_props;
> > +    agc->nr_gpio_pins = 151;
> > +    agc->nr_gpio_sets = 6;
> > +    agc->reg_table = aspeed_3_3v_gpios;
> > +}
> > +
> >   static const TypeInfo aspeed_gpio_info = {
> >       .name           = TYPE_ASPEED_GPIO,
> >       .parent         = TYPE_SYS_BUS_DEVICE,
> > @@ -984,6 +1196,13 @@ static const TypeInfo aspeed_gpio_ast2600_1_8v_info = {
> >       .instance_init  = aspeed_gpio_init,
> >   };
> >   
> > +static const TypeInfo aspeed_gpio_ast1030_info = {
> > +    .name           = TYPE_ASPEED_GPIO "-ast1030",
> > +    .parent         = TYPE_ASPEED_GPIO,
> > +    .class_init     = aspeed_gpio_1030_class_init,
> > +    .instance_init  = aspeed_gpio_init,
> > +};
> > +
> >   static void aspeed_gpio_register_types(void)
> >   {
> >       type_register_static(&aspeed_gpio_info);
> > @@ -991,6 +1210,7 @@ static void aspeed_gpio_register_types(void)
> >       type_register_static(&aspeed_gpio_ast2500_info);
> >       type_register_static(&aspeed_gpio_ast2600_3_3v_info);
> >       type_register_static(&aspeed_gpio_ast2600_1_8v_info);
> > +    type_register_static(&aspeed_gpio_ast1030_info);
> >   }
> >   
> >   type_init(aspeed_gpio_register_types);
> > diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
> > index 1dab99c560..717d6cf7cc 100644
> > --- a/hw/gpio/trace-events
> > +++ b/hw/gpio/trace-events
> > @@ -27,3 +27,8 @@ sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" P
> >   sifive_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
> >   sifive_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
> >   sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
> > +
> > +# aspeed_gpio.c
> > +aspeed_gpio_read(const char *id, uint64_t offset, uint64_t value) " %s offset: 0x%04" PRIx64 " value 0x%08" PRIx64
> > +aspeed_gpio_write(const char *id, uint64_t offset, uint64_t value) "%s offset: 0x%04" PRIx64 " value 0x%08" PRIx64
> > +
> > diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
> > index 801846befb..cb7671149f 100644
> > --- a/include/hw/gpio/aspeed_gpio.h
> > +++ b/include/hw/gpio/aspeed_gpio.h
> > @@ -50,10 +50,24 @@ enum GPIORegType {
> >       gpio_reg_input_mask,
> >   };
> >   
> > +/* GPIO index mode */
> > +enum GPIORegIndexType {
> > +    gpio_reg_idx_data = 0,
> > +    gpio_reg_idx_direction,
> > +    gpio_reg_idx_interrupt,
> > +    gpio_reg_idx_debounce,
> > +    gpio_reg_idx_tolerance,
> > +    gpio_reg_idx_cmd_src,
> > +    gpio_reg_idx_input_mask,
> > +    gpio_reg_idx_reserved,
> > +    gpio_reg_idx_new_w_cmd_src,
> > +    gpio_reg_idx_new_r_cmd_src,
> > +};
> > +
> >   typedef struct AspeedGPIOReg {
> >       uint16_t set_idx;
> >       enum GPIORegType type;
> > - } AspeedGPIOReg;
> > +} AspeedGPIOReg;
> >   
> >   struct AspeedGPIOClass {
> >       SysBusDevice parent_obj;
> 

