Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F83337EF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:56:14 +0100 (CET)
Received: from localhost ([::1]:37602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJudZ-0007j9-GS
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuZ3-00047E-4n
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:51:33 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:49751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuZ1-0001Bx-Bc
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:51:32 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mzz6s-1lhVx90YgY-00x47j; Wed, 10 Mar 2021 09:51:29 +0100
Subject: Re: [PATCH 2/7] mac_via: fix up adb_via_receive() trace events
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <026461af-7084-9bd0-27cd-ab8132bb593f@vivier.eu>
Date: Wed, 10 Mar 2021 09:51:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310080908.11861-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JeSKV/zaj0RQDghZPK60cHu1AWGCCKC9qCZkEcqJjN25KWtOERw
 C2ZE1DeE9ljhRGVGcUTXUzZ9QnRC3+KJYxEMcRPwSj3tuDFbeGYtqeAjCPYI7hF8pA+izKR
 jCVAICSfP9IEWrTU57bIUp0JatNVuJsSQT2EgzbWpFgt0yPt6nU2B85GQuK89FAk/5LRquo
 D7o4abRSkLUqNslAMECHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7T3nxRBFi+8=:regpv//MZ6Oj8O/h+VLunw
 M9bPQ98w8boB3hj/sqsPNUoeCr2SOfYxkofl5SMiyyBx8HfjeNXsTmgOvCuLmQ/BbCikkp/P6
 QXeCI7LQPnvQqJA2aIhL/414/Es96x570laCHoWfNS25GNXq+ku+kXmgWCXB5IZ/swNXVPwEX
 ucWM1M1u2sV8dfnhJxlvpuiS7Ob0993O+ENsp7I1+ecFhYUAOJHYB+eFEgTq9w0miwrR0usDb
 A3K5CxSmBUmSXwA3Ow82B6nEtxsouKK/MeyOpJS0Nq2YSlpN3r/er5uMDdSiuUQOPLfc/o5tW
 PhO4etW9ymE8RoxbQ1KHb83ydiX15D421HWWKGIY6rlvE6tCxqYH3KGd500yBjTzOx/lftg3i
 eC/ev0yYT0sAfwy9Wgek6cMni/arrwq3QiYp4LFPbjCPrKnyhB7BDLT6qABnu
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/03/2021 à 09:09, Mark Cave-Ayland a écrit :
> The use of the post-increment operator on adb_data_in_index meant that the
> trace-event was accidentally displaying the next byte in the incoming ADB
> data buffer rather than the current byte.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 41 ++++++++++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
> index 488d086a17..0f6586e102 100644
> --- a/hw/misc/mac_via.c
> +++ b/hw/misc/mac_via.c
> @@ -816,33 +816,37 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
>          switch (s->adb_data_in_index) {
>          case 0:
>              /* First EVEN byte: vADBInt indicates bus timeout */
> -            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
> -                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
> -                                   adb_bus->status, s->adb_data_in_index,
> -                                   s->adb_data_in_size);
> -
> -            *data = s->adb_data_in[s->adb_data_in_index++];
> +            *data = s->adb_data_in[s->adb_data_in_index];
>              if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
>                  ms->b &= ~VIA1B_vADBInt;
>              } else {
>                  ms->b |= VIA1B_vADBInt;
>              }
> -            break;
>  
> -        case 1:
> -            /* First ODD byte: vADBInt indicates SRQ */
>              trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
>                                     *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
>                                     adb_bus->status, s->adb_data_in_index,
>                                     s->adb_data_in_size);
>  
> -            *data = s->adb_data_in[s->adb_data_in_index++];
> +            s->adb_data_in_index++;
> +            break;
> +
> +        case 1:
> +            /* First ODD byte: vADBInt indicates SRQ */
> +            *data = s->adb_data_in[s->adb_data_in_index];
>              pending = adb_bus->pending & ~(1 << (s->adb_autopoll_cmd >> 4));
>              if (pending) {
>                  ms->b &= ~VIA1B_vADBInt;
>              } else {
>                  ms->b |= VIA1B_vADBInt;
>              }
> +
> +            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
> +                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
> +                                   adb_bus->status, s->adb_data_in_index,
> +                                   s->adb_data_in_size);
> +
> +            s->adb_data_in_index++;
>              break;
>  
>          default:
> @@ -852,14 +856,9 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
>               * end of the poll reply, so provide these extra bytes below to
>               * keep it happy
>               */
> -            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
> -                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
> -                                   adb_bus->status, s->adb_data_in_index,
> -                                   s->adb_data_in_size);
> -
>              if (s->adb_data_in_index < s->adb_data_in_size) {
>                  /* Next data byte */
> -                *data = s->adb_data_in[s->adb_data_in_index++];
> +                *data = s->adb_data_in[s->adb_data_in_index];
>                  ms->b |= VIA1B_vADBInt;
>              } else if (s->adb_data_in_index == s->adb_data_in_size) {
>                  if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
> @@ -869,7 +868,6 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
>                      /* Return 0x0 after reply */
>                      *data = 0;
>                  }
> -                s->adb_data_in_index++;
>                  ms->b &= ~VIA1B_vADBInt;
>              } else {
>                  /* Bus timeout (no more data) */
> @@ -878,6 +876,15 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
>                  adb_bus->status = 0;
>                  adb_autopoll_unblock(adb_bus);
>              }
> +
> +            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
> +                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
> +                                   adb_bus->status, s->adb_data_in_index,
> +                                   s->adb_data_in_size);
> +
> +            if (s->adb_data_in_index <= s->adb_data_in_size) {
> +                s->adb_data_in_index++;
> +            }
>              break;
>          }
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

