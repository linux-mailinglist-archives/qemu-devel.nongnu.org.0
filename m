Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BFE3337BF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:46:59 +0100 (CET)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuUc-00067p-F9
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuQq-0003JV-Lq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:43:04 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:45273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuQo-0004TV-QL
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:43:04 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEmAV-1lVnCh3KKh-00GG1P; Wed, 10 Mar 2021 09:43:00 +0100
Subject: Re: [PATCH 1/7] mac_via: switch rtc pram trace-events to use hex
 rather than decimal for addresses
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <711384d8-00f3-f530-72f5-fffe2e99e3a0@vivier.eu>
Date: Wed, 10 Mar 2021 09:42:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310080908.11861-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8W0CZuEfYiCiVwcQnqONewGhjUIaogrEZWLtW/UIBFlvBmOFK46
 +djKmG6eePOrT0LiBk3lZACneLU/QSZx7NmVNBf4lNjj8IadEWXkLhZz3xCWMnVRIx21xxd
 lBuyND73QkbaTJgG6znN4AiYW6LquyLUdrtnzlShLKniYhqV4mEfX1RW857qkIIipK+6gRj
 NIdu2PDmzGWGZLn3xgKrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FMc12OtSzgo=:OP37wlGcBzDqRqa6iyDW9Y
 YkfWsIOwgDBavY+NMxuadAiBYMh7m5aQXuhBjoKzHA6v1UTWFNstz/0ayv0kbyPw/vw5mClvF
 OjzTfOr+xPZKLgTEvyZl5SEeNh9QnSS14xKfrO+QT2rn2OgA+bapQgB6owwfcS5A4oidfcvuR
 WXYE8DWu7avAbU4QkXNeXOu+0gu7ypRHe6BirTk4nZw0MNk/craBPEC7cIXZWMV3D9cM4vc0/
 z2SDmQi4QQUx5PKcVWFdqAHqjf4uPvbatj70vHjPxZVLehfJfHlXh7Uz2KeTxLMpPpxe7nXDL
 jPux6MErqr8iKmJ1LfLLOy9j206M7mQ13DJalfCekbemGGzVuKPRjsaG+dIrysm0oAZ1iCMNm
 7eydcObh4PzUUHOI8617hKZe0cFq8Pd4i79kVwT+IJGLZDBPFYYFA540ZsJmPtGh4eWGTYz6x
 nTX0Ez72Ww==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
> Since all the documentation uses the hex offsets, this makes it much easier
> to see what is going on.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/trace-events | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index d626b9d7a7..73191b5e9d 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -221,8 +221,8 @@ via1_rtc_cmd_test_write(int value) "value=0x%02x"
>  via1_rtc_cmd_wprotect_write(int value) "value=0x%02x"
>  via1_rtc_cmd_pram_read(int addr, int value) "addr=%u value=0x%02x"
>  via1_rtc_cmd_pram_write(int addr, int value) "addr=%u value=0x%02x"
> -via1_rtc_cmd_pram_sect_read(int sector, int offset, int addr, int value) "sector=%u offset=%u addr=%d value=0x%02x"
> -via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "sector=%u offset=%u addr=%d value=0x%02x"
> +via1_rtc_cmd_pram_sect_read(int sector, int offset, int addr, int value) "sector=%u offset=%u addr=0x%x value=0x%02x"
> +via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "sector=%u offset=%u addr=0x%x value=0x%02x"
>  via1_adb_send(const char *state, uint8_t data, const char *vadbint) "state %s data=0x%02x vADBInt=%s"
>  via1_adb_receive(const char *state, uint8_t data, const char *vadbint, int status, int index, int size) "state %s data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
>  via1_adb_poll(uint8_t data, const char *vadbint, int status, int index, int size) "data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

