Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D77651002
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 17:12:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IkB-0001xs-OH; Mon, 19 Dec 2022 11:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7Ik9-0001vU-Pg
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:11:57 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7Ik6-0004wF-Qv
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:11:57 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 130so6579954pfu.8
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 08:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RnvsVgfC/alcGV8Ew7+KD7ZFV/Td7VS0f0luHX+ubsw=;
 b=biVt9I2fXBWFaMBiTQaD7ZbG8L3INzaJmCxH1HVe9WzNEXfPWxH4veBWK4bNZMrDy1
 DzRepkg7C5J6/nFuNPua77i6mkohIFTTtVbgJY3awj26slzxQzsUXaolgePWFxWBH5Lh
 WaEGG8s1P6GewPPbGClfRfu+8KeQlvtMEfADYUPJvNfV9ut0/23o08MZCaolu2WaDB9Q
 WFynFPUHLWnLwG2BG4SJ7afkyftbmwBct0XGtZ+QQ9O2hvqJtuYVvRpCRbzWAfcxYQSm
 eiNGA3Lj5fGxFu61UbhKJACjL29aSyR5r5uT+nEPmMOA1rMzBPOx3O2AQ2glTNJblYeO
 JAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RnvsVgfC/alcGV8Ew7+KD7ZFV/Td7VS0f0luHX+ubsw=;
 b=GuUX7h5PWYazL21IcDTKeAQm3YD/EVtH7whhqGGp+jPDBa1n0IQAKtLAphWf4wZa83
 tjCkbMLFmG9gNRDRgBKdgHSoz3Dcbitksz0BtyIhckp9UKNJoqztv4C9SP9JmdkhLhoV
 QfJtEe0p3V/IVyeBZ1S/w94+5oGH5snnKTvpIUpznLTPE7YjXfG8JOQqBfQ+TInl4GTD
 SAzF9QijcAr+foKwuzPT9VEwJGXpJNge875D22QUS/7zAycM8J5kOd+QvsS9zWDPKsYh
 Vb7mxmYOv1ZUKQ1PucjLCBTl4eeFT/hypZsYbjvy/W/5KRZAir6TBuYwT7JgOOTOqoVk
 2ApQ==
X-Gm-Message-State: ANoB5pl885ofbDzlAjTrY2vWVDDMGjX3ESCqPRqbCRlfykppQ9Gq3Yej
 kqDS9pU2kSDc1NS2JMmgkNOmDtIAqVp2cW+ZjCYGbA==
X-Google-Smtp-Source: AA0mqf4qZDsMkUOtH42O4TNTI4c4UJdz63L+Wa6VYMMieAiW/4yqGghxSxxKK+SRLDvGCZERVIrxA8fTcCSWpBFWaQM=
X-Received: by 2002:a63:c149:0:b0:477:86c1:640f with SMTP id
 p9-20020a63c149000000b0047786c1640fmr2165014pgi.231.1671466312891; Mon, 19
 Dec 2022 08:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20221207021322.16165-1-vikram.garhwal@amd.com>
 <20221207021322.16165-3-vikram.garhwal@amd.com>
In-Reply-To: <20221207021322.16165-3-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 16:11:41 +0000
Message-ID: <CAFEAcA_9DX24u4-C_5RcL4ZqHpdCDg3Spd4Ksp9vJQHXSqBRcw@mail.gmail.com>
Subject: Re: [QEMU][PATCH v3 2/4] hw/net/can: Introduce Xilinx Versal CANFD
 controller
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com, 
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Vikram Garhwal <fnu.vikram@xilinx.com>, 
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 7 Dec 2022 at 02:13, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> The Xilinx Versal CANFD controller is developed based on SocketCAN, QEMU CAN bus
> implementation. Bus connection and socketCAN connection for each CAN module
> can be set through command lines.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  hw/net/can/meson.build             |    1 +
>  hw/net/can/trace-events            |    7 +
>  hw/net/can/xlnx-versal-canfd.c     | 2121 ++++++++++++++++++++++++++++
>  include/hw/net/xlnx-versal-canfd.h |   90 ++
>  4 files changed, 2219 insertions(+)
>  create mode 100644 hw/net/can/xlnx-versal-canfd.c
>  create mode 100644 include/hw/net/xlnx-versal-canfd.h
>




> @@ -0,0 +1,2121 @@
> +/*
> + * QEMU model of the Xilinx Versal CANFD device.
> + *
> + * This implementation is based on the following datasheet:
> + * https://docs.xilinx.com/v/u/2.0-English/pg223-canfd
> + *
> + * Copyright (c) 2022 AMD Inc.
> + *
> + * Written-by: Vikram Garhwal<vikram.garhwal@amd.com>

Missing space before '<'.

> +static void canfd_config_reset(XlnxVersalCANFDState *s)
> +{
> +
> +    unsigned int i;
> +
> +    /* Reset all the configuration register. */

"registers"

> +    for (i = 0; i < R_RX_FIFO_WATERMARK_REGISTER; ++i) {
> +        register_reset(&s->reg_info[i]);
> +    }
> +
> +    canfd_update_irq(s);
> +}



> +static void store_rx_sequential(XlnxVersalCANFDState *s,
> +                                const qemu_can_frame *frame,
> +                                uint32_t fill_level, uint32_t read_index,
> +                                uint32_t store_location, uint8_t rx_fifo,
> +                                bool rx_fifo_id, uint8_t filter_index)
> +{
> +    int i;
> +    bool is_canfd_frame;
> +    uint8_t dlc = frame->can_dlc;
> +    uint32_t dlc_reg_val = 0;
> +    uint32_t data_reg_val = 0;
> +
> +    /* Getting RX0/1 fill level */
> +    if ((fill_level) > rx_fifo - 1) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: RX%d Buffer is full. Discarding the"
> +                      " message\n", path, rx_fifo_id);
> +
> +        /* Set the corresponding RF buffer overflow interrupt. */
> +        if (rx_fifo_id == 0) {
> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW, 1);
> +        } else {
> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW_1, 1);
> +        }
> +    } else {
> +        uint16_t rx_timestamp = CANFD_TIMER_MAX -
> +                                    ptimer_get_count(s->canfd_timer);
> +
> +        if (rx_timestamp == 0xFFFF) {
> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TSCNT_OFLW, 1);
> +        } else {
> +            ARRAY_FIELD_DP32(s->regs, TIMESTAMP_REGISTER, TIMESTAMP_CNT,
> +                             rx_timestamp);
> +        }
> +
> +        if (rx_fifo_id == 0) {
> +            ARRAY_FIELD_DP32(s->regs, RX_FIFO_STATUS_REGISTER, FL,
> +                             fill_level + 1);
> +            assert(store_location <=
> +                              R_RB_ID_REGISTER + (s->cfg.rx0_fifo *
> +                                                  NUM_REGS_PER_MSG_SPACE));
> +        } else {
> +            ARRAY_FIELD_DP32(s->regs, RX_FIFO_STATUS_REGISTER, FL_1,
> +                             fill_level + 1);
> +            assert(store_location <=
> +                              R_RB_ID_REGISTER_1 + (s->cfg.rx1_fifo *
> +                                                    NUM_REGS_PER_MSG_SPACE));
> +        }
> +
> +        s->regs[store_location] = frame->can_id;
> +
> +        if (frame->flags == QEMU_CAN_FRMF_TYPE_FD) {
> +            is_canfd_frame = true;
> +
> +            for (i = 0; i < ARRAY_SIZE(canfd_dlc_array); i++) {
> +                if (canfd_dlc_array[i] == frame->can_dlc) {
> +                    dlc = 8 + i;
> +                }
> +
> +            dlc_reg_val = FIELD_DP32(0, RB_DLC_REGISTER, DLC, dlc);
> +            }
> +        } else {
> +            is_canfd_frame = false;
> +            if (frame->can_dlc > 8) {
> +                dlc = 8;
> +            }
> +
> +            dlc_reg_val = FIELD_DP32(0, RB_DLC_REGISTER, DLC, frame->can_dlc);
> +        }
> +
> +        dlc_reg_val |= FIELD_DP32(0, RB_DLC_REGISTER, FDF, is_canfd_frame);
> +        dlc_reg_val |= FIELD_DP32(0, RB_DLC_REGISTER, TIMESTAMP, rx_timestamp);
> +        dlc_reg_val |= FIELD_DP32(0, RB_DLC_REGISTER, MATCHED_FILTER_INDEX,
> +                                  filter_index);
> +        s->regs[store_location + 1] = dlc_reg_val;
> +
> +        for (i = 0; i <= dlc; i++) {
> +            data_reg_val = FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES3,
> +                                      frame->data[4 * i]);
> +            data_reg_val |= FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES2,
> +                                       frame->data[4 * i + 1]);
> +            data_reg_val |= FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES1,
> +                                       frame->data[4 * i + 2]);
> +            data_reg_val |= FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES0,
> +                                       frame->data[4 * i + 3]);
> +            s->regs[store_location + i + 2] = data_reg_val;
> +        }

This loop will read more than dlc bytes of data out of the frame
if dlc happens not to be a multiple of 4.

> +        /* set the interrupt as RXOK. */
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
> +    }
> +}



> +static gint g_cmp_ids(gconstpointer data1, gconstpointer data2)
> +{
> +    tx_ready_reg_info *tx_reg_1 = (tx_ready_reg_info *) data1;
> +    tx_ready_reg_info *tx_reg_2 = (tx_ready_reg_info *) data2;
> +
> +    return tx_reg_1->can_id - tx_reg_2->can_id;
> +}
> +
> +static void free_list(GSList *list)
> +{
> +    GSList *iterator = NULL;
> +
> +    for (iterator = list; iterator != NULL; iterator = iterator->next) {
> +        g_free((tx_ready_reg_info *)iterator->data);
> +    }
> +
> +    g_slist_free(list);
> +
> +    return;
> +}
> +
> +static GSList *prepare_tx_data(XlnxVersalCANFDState *s)
> +{
> +    uint8_t i = 0;
> +    GSList *list = NULL;
> +    uint32_t reg_num = 0;
> +    uint32_t reg_ready = s->regs[R_TX_BUFFER_READY_REQUEST_REGISTER];
> +
> +    /* First find the messages which are ready for transaction. */
> +    for (i = 0; i < s->cfg.tx_fifo; i++) {
> +        if (reg_ready) {
> +            reg_num = R_TB_ID_REGISTER + (NUM_REGS_PER_MSG_SPACE * i);
> +            tx_ready_reg_info *temp = g_new(tx_ready_reg_info, 1);
> +            if (temp == NULL) {

g_new always succeeds, so you never need to check its return value.

> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: Couldn't allocate memory\n",
> +                               __func__);
> +                free_list(list);
> +                return NULL;
> +            }
> +
> +            temp->can_id = s->regs[reg_num];
> +            temp->reg_num = reg_num;
> +            list = g_slist_append(list, temp);

The glib documentation points out that g_slist_append() has to traverse
the whole list in order to put an element on the end, which makes
this algorithm accidentally quadratic. If you need to use append,
use a different data structure than a singly linked list.
Since we're sorting the list anyway, you could use g_slist_prepend()
instead, which is fast because it doesn't need to walk the list.

Overall, though, looking at what we do here (create the list of
tx_ready_reg_info structs, sort it, walk through it processing them,
free the list) I think this would be better done with a GArray.
That provides all the operations we need here, and it will make
much better use of memory because it just allocates (and re-allocates
as necessary) one block of memory for the array, rather than two
separate allocations for each list element and pointer-walking.

> +        }
> +
> +        list = g_slist_sort(list, g_cmp_ids);
> +        reg_ready >>= 1;
> +        s->regs[R_TX_BUFFER_READY_REQUEST_REGISTER] &= ~(1 << i);
> +        s->regs[R_TX_BUFFER_CANCEL_REQUEST_REGISTER] &= ~(1 << i);
> +    }
> +
> +    return list;
> +}
> +
> +static void transfer_data(XlnxVersalCANFDState *s)
> +{
> +    bool canfd_tx = tx_ready_check(s);
> +    GSList *list, *iterator = NULL;
> +
> +    if (canfd_tx) {
> +        qemu_can_frame frame;
> +
> +        list = prepare_tx_data(s);
> +        if (list == NULL) {
> +            return;
> +        }
> +
> +        for (iterator = list; iterator != NULL; iterator = iterator->next) {
> +            regs2frame(s, &frame,
> +                       ((tx_ready_reg_info *)iterator->data)->reg_num);
> +
> +            if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, LBACK)) {
> +                update_rx_sequential(s, &frame);
> +                tx_fifo_stamp(s,
> +                              ((tx_ready_reg_info *)iterator->data)->reg_num);
> +
> +                ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
> +            } else {
> +                g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +                trace_xlnx_canfd_tx_data(path, frame.can_id, frame.can_dlc,
> +                                         frame.flags);
> +                can_bus_client_send(&s->bus_client, &frame, 1);
> +                tx_fifo_stamp(s,
> +                              ((tx_ready_reg_info *)iterator->data)->reg_num);
> +
> +                ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXRRS, 1);
> +
> +                if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP)) {
> +                    canfd_exit_sleep_mode(s);
> +                }
> +            }
> +        }
> +
> +        s->tx_busy_bit = 0;
> +
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXOK, 1);
> +        free_list(list);
> +    } else {
> +          g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +          qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller not enabled for"
> +                        " data transfer\n", path);
> +    }

This sort of code reads more easily if you structure it as
  if (early-exit-condition) {
      error handling;
      return;
  }
  big lump of code that does the work;

rather than
  if (!early-exit-condition) {
      big lump of code that does the work;
  } else {
      error handling;
  }

> +
> +    canfd_update_irq(s);
> +}

> +static ssize_t canfd_xilinx_receive(CanBusClientState *client,
> +                                    const qemu_can_frame *buf,
> +                                    size_t buf_size)
> +{
> +    XlnxVersalCANFDState *s = container_of(client, XlnxVersalCANFDState,
> +                                           bus_client);
> +    const qemu_can_frame *frame = buf;
> +
> +    /* Update the status register that we are receiving message. */
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, BBSY, 1);
> +
> +    if (buf_size <= 0) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Error in the data received.\n",
> +                      path);

This isn't a guest error; this function is called by other parts of
QEMU. Also, buf_size is an unsigned type, so it can never be less
than zero. Either the CanBusClientInfo::can_receive API says that you
might be passed zero, in which case you have to handle it; or else
it doesn't, in which case it would be an error in the caller, and
you can assert if you like.

> +        return 0;
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, LBACK)) {
> +        /*
> +         * XlnxVersalCANFDState will not participate in normal bus communication
> +         * and does not receive any messages transmitted by other CAN nodes.
> +         */
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller  is in loopback mode."
> +                      " It will not receive data.\n", path);

This doesn't seem like an error ?

> +    } else if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SNOOP)) {
> +        /* Snoop Mode: Just keep the data. no response back. */
> +        update_rx_sequential(s, frame);
> +    } else {
> +        if ((ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP))) {
> +            /*
> +             * XlnxVersalCANFDState is in sleep mode. Any data on bus will bring
> +             * it to the wake up state.
> +             */
> +            canfd_exit_sleep_mode(s);
> +        }
> +
> +        update_rx_sequential(s, frame);
> +    }
> +
> +    /* Message processing done. Update the status back to !busy */
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, BBSY, 0);
> +    return 1;
> +}
> +
> +static CanBusClientInfo canfd_xilinx_bus_client_info = {
> +    .can_receive = can_xilinx_canfd_receive,
> +    .receive = canfd_xilinx_receive,
> +};
> +
> +static int xlnx_canfd_connect_to_bus(XlnxVersalCANFDState *s,
> +                                     CanBusState *bus)
> +{
> +    s->bus_client.info = &canfd_xilinx_bus_client_info;
> +
> +    if (can_bus_insert_client(bus, &s->bus_client) < 0) {
> +        return -1;
> +    }
> +    return 0;

We call this only once and that callsite only cares about
"< 0 means error", so you could make this simply

    return can_bus_insert_client(bus, &s->bus_client);


> +}
> +
> +#define NUM_REG_PER_AF      ARRAY_SIZE(canfd_af_regs)
> +#define NUM_AF              32
> +#define NUM_REG_PER_TXE     ARRAY_SIZE(canfd_txe_regs)
> +#define NUM_TXE             32
> +
> +static int canfd_populate_regarray(XlnxVersalCANFDState *s,
> +                                  RegisterInfoArray *r_array, int pos,
> +                                  const RegisterAccessInfo *rae,
> +                                  int num_rae)
> +{
> +    int i;
> +
> +    for (i = 0; i < num_rae; i++) {
> +        int index = rae[i].addr / 4;
> +        RegisterInfo *r = &s->reg_info[index];
> +
> +        object_initialize((void *)r, sizeof(*r), TYPE_REGISTER);

You don't need to cast r to void*, because object_initialize()
already takes a void* and that cast is implicit. But calling
object_initialize() directly looks weird -- almost no other
device needs to do that, and nobody else is creating TYPE_REGISTER
objects directly. What's going on here ?

> +
> +        *r = (RegisterInfo) {
> +            .data = &s->regs[index],
> +            .data_size = sizeof(uint32_t),
> +            .access = &rae[i],
> +            .opaque = OBJECT(s),
> +        };
> +
> +        r_array->r[i + pos] = r;
> +    }
> +    return i + pos;
> +}
> +
> +static void canfd_create_rai(RegisterAccessInfo *rai_array,
> +                                const RegisterAccessInfo *canfd_regs,
> +                                int template_rai_array_sz,
> +                                int num_template_to_copy)
> +{
> +    int i;
> +    int reg_num;
> +
> +    for (reg_num = 0; reg_num < num_template_to_copy; reg_num++) {
> +        int pos = reg_num * template_rai_array_sz;
> +
> +        memcpy(rai_array + pos, canfd_regs,
> +               template_rai_array_sz * sizeof(RegisterAccessInfo));
> +
> +        for (i = 0; i < template_rai_array_sz; i++) {
> +            const char *name = canfd_regs[i].name;
> +            uint64_t addr = canfd_regs[i].addr;
> +            rai_array[i + pos].name = g_strdup_printf("%s%d", name, reg_num);
> +            rai_array[i + pos].addr = addr + pos * 4;
> +        }
> +    }
> +}
> +
> +static void canfd_finalize(Object *obj)
> +{
> +    XlnxVersalCANFDState *s = XILINX_CANFD(obj);
> +    g_free(s->tx_regs);
> +    g_free(s->rx0_regs);
> +    g_free(s->af_regs);
> +    g_free(s->txe_regs);
> +    g_free(s->rx1_regs);

instance_finalize is the opposite of instance_init, so you only
need to clean up things you allocated there (which in this device
is nothing, because memory regions are refcounted). All these
arrays are only allocated in realize. (The opposite of realize
is unrealize, but we don't need to try to implement it for
this device, because this device will be created once and
exist for the lifetime of the simulation; unrealize only really
matters for hot-unpluggable devices.)

> +}

> +static void canfd_realize(DeviceState *dev, Error **errp)
> +{
> +    XlnxVersalCANFDState *s = XILINX_CANFD(dev);
> +    RegisterInfoArray *reg_array;
> +
> +    reg_array = canfd_create_regarray(s);
> +    memory_region_add_subregion(&s->iomem, 0x00, &reg_array->mem);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq_canfd_int);
> +
> +    if (s->canfdbus) {
> +        if (xlnx_canfd_connect_to_bus(s, s->canfdbus) < 0) {
> +            g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +            error_setg(errp, "%s: xlnx_canfd_connect_to_bus failed", path);
> +            return;
> +        }
> +
> +    } else {
> +        /* If no bus is set. */
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: canfdbus property not set\n", path);

This can't be a guest error, because it's the board/SoC that's
responsible for wiring up the device properties. Either
 * not setting the bus is an OK config, in which case we should
   just accept it and create the device
 * or it's an error not to set the property, in which case we
   should return an error and not realize the device

> +    }
> +
> +    /* Allocate a new timer. */
> +    s->canfd_timer = ptimer_init(xlnx_versal_canfd_ptimer_cb, s,
> +                                 PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD |
> +                                 PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT |
> +                                 PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
> +
> +    ptimer_transaction_begin(s->canfd_timer);
> +
> +    ptimer_set_freq(s->canfd_timer, s->cfg.ext_clk_freq);
> +    ptimer_set_limit(s->canfd_timer, CANFD_TIMER_MAX, 1);
> +    ptimer_run(s->canfd_timer, 0);
> +    ptimer_transaction_commit(s->canfd_timer);
> +}
> +

> +    SysBusDevice            parent_obj;
> +    MemoryRegion            iomem;
> +
> +    qemu_irq                irq_canfd_int;
> +    qemu_irq                irq_addr_err;
> +
> +    RegisterInfo            reg_info[XLNX_VERSAL_CANFD_R_MAX];
> +    RegisterAccessInfo      *tx_regs;
> +    RegisterAccessInfo      *rx0_regs;
> +    RegisterAccessInfo      *rx1_regs;
> +    RegisterAccessInfo      *af_regs;
> +    RegisterAccessInfo      *txe_regs;
> +    RegisterAccessInfo      *rx_mailbox_regs;
> +    RegisterAccessInfo      *af_mask_regs_mailbox;
> +
> +    uint32_t                regs[XLNX_VERSAL_CANFD_R_MAX];
> +    uint8_t                 tx_busy_bit;

tx_busy_bit is only touched once, to clear it; it
is never set. Is there some missing code, or can it
simply be deleted? (If there's real state here, it needs
to go in the vmstate.)

> +    uint8_t                 modes;

This field seems to never be used.

> +    ptimer_state            *canfd_timer;
> +
> +    CanBusClientState       bus_client;
> +    CanBusState             *canfdbus;
> +
> +    struct {
> +        uint8_t             ctrl_idx;

ctrl_idx seems to be unused.

> +        uint8_t             rx0_fifo;
> +        uint8_t             rx1_fifo;
> +        uint8_t             tx_fifo;
> +        bool                enable_rx_fifo1;
> +        uint32_t            ext_clk_freq;

Ideally this would use a Clock, rather than an integer property.
But updating the SoC model to use Clocks is probably best
done as a separate patchset.

> +   } cfg;
> +
> +} XlnxVersalCANFDState;
> +
> +typedef struct tx_ready_reg_info {
> +    uint32_t can_id;
> +    uint32_t reg_num;
> +} tx_ready_reg_info;
> +
> +#endif
> --

thanks
-- PMM

