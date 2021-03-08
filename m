Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FE6330AA0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 10:54:37 +0100 (CET)
Received: from localhost ([::1]:49682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJCay-0004Mw-2e
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 04:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lJCZj-0003tI-V3
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 04:53:19 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:15336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lJCZh-0005cW-G7
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 04:53:19 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615197193; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=P4j6OB/SixeyHI/JPgjEIzy0hdctzjUbED5CqFJobXkZRmn2NjhmWVo/vwSCASpUtz
 T8qHtHgiAPb1NGHrEa7UiaWL2EV3MC8bP6QRD1wRAlg4FCLAmguP2259yKrUR9WUNxwY
 v7K8O+TsNUEqrf/hDodUxZjk14Jep0bHrwDrV4++7UQYbKIRVojqHxYnqSldjyKXfe1c
 gwJdmXJokRRDwi9lI5Tt2C8hRRIU1nI12x3TZ4LigOZaw3I5LYSrig7D6UdRjQ7s1qTU
 8C75VM9arJNhViReJZepTlpkkZpblD+QSKYDETGDu0T5PkHOklTtHboaxGBXo/BnGGkz
 Yu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1615197193;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=fhkLxFUmNm8ZRUZ6ejkxZsjoZPF6qiNKwYZEwZfWqPs=;
 b=UZjoW8s5b3ozJ4LFRlJuuwlgenMgcHL55ZjqS8aI/O1/PX7XdJWiIG2Gu2hv80Ij9k
 s4HdjQJB3Zu4wW5dxEmU8O8hvSw861d+cyTw2IN6Y75WV1alG10MpEAa37r3z8nZgTsy
 BU8TFqUBtCbNypapA+9h3Bra8ZCrVXh4R/NbxYPGU2RuDNuiV33xpJbEHpI5HkQlnRiy
 K0xBmfTfGZl92ttmb/gZbz4NosC9PmI3N2r/62QasfzOFltNMYbdkdN5iOYP9a0y9jVg
 lp35mwgznYnFyg6ADVxsg62vwzV6aWRue0X1wn/LEBQLTBsMRlv5hPyYUXSpG1xYFfmN
 Jm0A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1615197193;
 s=strato-dkim-0002; d=ulal.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=fhkLxFUmNm8ZRUZ6ejkxZsjoZPF6qiNKwYZEwZfWqPs=;
 b=sFzPcVhvdCPZAXKaZJZ/jw4f3lraXz+RFkYjvpOxlx85wkYux1LfHNZykAEz55dwKe
 VGd3qCZc9JcOg6CtIGq8BGB4WhjCbnp/v1McGOsZKMWd9wtQ02chOHKk4tN2RddUvskw
 lF6dussQK06YRCvwGdR500m1N69llWnDdYMJpf9ibD7hSQ3iJtD16TGORWFC9HetCs8p
 tu3ih6AsOpOf66p88oGYCqJRPQCoYfymjUq5q8YX6rgio4wZS50Y5OP6fneOKZPjufV/
 JokFsXMNu69H58uWOmQF0Caow/mTOmXIsMODlvvZt5u4AWrob1vhBLxTxEmKIjjI0Hc1
 Z1Tg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":LWABbUGmf/p3d3fx281mbpk9zOkHG9L8L9MnY9md4b2JSSHyzkN3ON0Uun6F+zrkVqc/ZmTClqkOE9IdMVvnQ2O6vlW7Z+qlJRBbUq68WzKpoQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:c3:9719:3d00:bb52:98ae:ee53:17cd]
 by smtp.strato.de (RZmta 47.20.3 AUTH)
 with ESMTPSA id c075a1x289rCBfE
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Mar 2021 10:53:12 +0100 (CET)
Subject: Re: [PATCH] hw/char: disable ibex uart receive if the buffer is full
To: qemu-devel@nongnu.org
References: <20210215231528.2718086-1-alexander.wagner@ulal.de>
From: Alexander Wagner <alexander.wagner@ulal.de>
Message-ID: <3adead10-7eb4-86e2-a81a-7b3e7fde49c5@ulal.de>
Date: Mon, 8 Mar 2021 10:53:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215231528.2718086-1-alexander.wagner@ulal.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=81.169.146.219;
 envelope-from=alexander.wagner@ulal.de; helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, Alistair.Francis@wdc.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

https://patchew.org/QEMU/20210215231528.2718086-1-alexander.wagner@ulal.de/

On 16.02.21 00:15, Alexander Wagner wrote:
> Not disabling the UART leads to QEMU overwriting the UART receive buffer with
> the newest received byte. The rx_level variable is added to allow the use of
> the existing OpenTitan driver libraries.
>
> Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
> ---
>   hw/char/ibex_uart.c         | 20 +++++++++++++++-----
>   include/hw/char/ibex_uart.h |  4 ++++
>   2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> index 89f1182c9b..dac09d53d6 100644
> --- a/hw/char/ibex_uart.c
> +++ b/hw/char/ibex_uart.c
> @@ -66,7 +66,8 @@ static int ibex_uart_can_receive(void *opaque)
>   {
>       IbexUartState *s = opaque;
>   
> -    if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
> +    if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK)
> +           && !(s->uart_status & R_STATUS_RXFULL_MASK)) {
>           return 1;
>       }
>   
> @@ -83,6 +84,8 @@ static void ibex_uart_receive(void *opaque, const uint8_t *buf, int size)
>   
>       s->uart_status &= ~R_STATUS_RXIDLE_MASK;
>       s->uart_status &= ~R_STATUS_RXEMPTY_MASK;
> +    s->uart_status |= R_STATUS_RXFULL_MASK;
> +    s->rx_level += 1;
>   
>       if (size > rx_fifo_level) {
>           s->uart_intr_state |= R_INTR_STATE_RX_WATERMARK_MASK;
> @@ -199,6 +202,7 @@ static void ibex_uart_reset(DeviceState *dev)
>       s->uart_timeout_ctrl = 0x00000000;
>   
>       s->tx_level = 0;
> +    s->rx_level = 0;
>   
>       s->char_tx_time = (NANOSECONDS_PER_SECOND / 230400) * 10;
>   
> @@ -243,11 +247,15 @@ static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
>   
>       case R_RDATA:
>           retvalue = s->uart_rdata;
> -        if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
> +        if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) && (s->rx_level > 0)) {
>               qemu_chr_fe_accept_input(&s->chr);
>   
> -            s->uart_status |= R_STATUS_RXIDLE_MASK;
> -            s->uart_status |= R_STATUS_RXEMPTY_MASK;
> +            s->rx_level -= 1;
> +            s->uart_status &= ~R_STATUS_RXFULL_MASK;
> +            if (s->rx_level == 0) {
> +                s->uart_status |= R_STATUS_RXIDLE_MASK;
> +                s->uart_status |= R_STATUS_RXEMPTY_MASK;
> +            }
>           }
>           break;
>       case R_WDATA:
> @@ -261,7 +269,8 @@ static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
>       case R_FIFO_STATUS:
>           retvalue = s->uart_fifo_status;
>   
> -        retvalue |= s->tx_level & 0x1F;
> +        retvalue |= (s->rx_level & 0x1F) << R_FIFO_STATUS_RXLVL_SHIFT;
> +        retvalue |= (s->tx_level & 0x1F) << R_FIFO_STATUS_TXLVL_SHIFT;
>   
>           qemu_log_mask(LOG_UNIMP,
>                         "%s: RX fifos are not supported\n", __func__);
> @@ -364,6 +373,7 @@ static void ibex_uart_write(void *opaque, hwaddr addr,
>           s->uart_fifo_ctrl = value;
>   
>           if (value & R_FIFO_CTRL_RXRST_MASK) {
> +            s->rx_level = 0;
>               qemu_log_mask(LOG_UNIMP,
>                             "%s: RX fifos are not supported\n", __func__);
>           }
> diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
> index 03d19e3f6f..546f958eb8 100644
> --- a/include/hw/char/ibex_uart.h
> +++ b/include/hw/char/ibex_uart.h
> @@ -62,6 +62,8 @@ REG32(FIFO_CTRL, 0x1c)
>       FIELD(FIFO_CTRL, RXILVL, 2, 3)
>       FIELD(FIFO_CTRL, TXILVL, 5, 2)
>   REG32(FIFO_STATUS, 0x20)
> +    FIELD(FIFO_STATUS, TXLVL, 0, 5)
> +    FIELD(FIFO_STATUS, RXLVL, 16, 5)
>   REG32(OVRD, 0x24)
>   REG32(VAL, 0x28)
>   REG32(TIMEOUT_CTRL, 0x2c)
> @@ -82,6 +84,8 @@ struct IbexUartState {
>       uint8_t tx_fifo[IBEX_UART_TX_FIFO_SIZE];
>       uint32_t tx_level;
>   
> +    uint32_t rx_level;
> +
>       QEMUTimer *fifo_trigger_handle;
>       uint64_t char_tx_time;
>   

