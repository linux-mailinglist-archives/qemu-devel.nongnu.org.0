Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC032917B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:27:43 +0100 (CET)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGp8o-00065s-T6
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGp6D-0004wX-37
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:25:01 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGp6B-00080Q-If
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:25:00 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MuUza-1m8Exq1WPy-00rbbN; Mon, 01 Mar 2021 21:24:52 +0100
Subject: Re: [PATCH v2 05/42] esp: add trace event when receiving a TI command
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-6-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cc3cc315-5027-0537-b99c-d5a242c630d7@vivier.eu>
Date: Mon, 1 Mar 2021 21:24:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NSbTUtdZ1jUDeR0JGeRXuN/20QTHDAQjkmTXNBAtn+MoNj1AWQN
 T5MTMdf9DjxreNKz81hVmSlP1GA/v0lHSJCSYuZe1EOYWQ5NK7jmBXVbUy7jgFJpjke/+y/
 ftqUYy81MpyxnuiHxxgYXL+QAn9kMhycL/ByYKcbuhX/4FZsHld1fEQjIxsUAbDcvDUAuVJ
 dBJ/S9+SFVBVCXbck0HxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:38lS9sGNKT8=:i3qJYirFpZ7LisA9pKwx02
 m4Dd4AofkptBB0lvgPcwBytHIhu2lLn4Ls25S8YDd4KSItpad1XKf3PIUQJO0gNlzir5CYPq+
 Q9P4+6E1VsRgycLI2fYG015JWQ1o1VEnR7DWxdP+AHw3buqrTJGkblcbJsWYjptRorVEDTkF1
 dWOSXVsJFIHI5aR7Mc5Y3BrK618Nsusk313rhkeeHsX82JY36eZ/SCWrebLXaYGdtQF8jcNP3
 flUJZQ9WVGzE5TEfKqshRRwYiIrk8AaEiBf0wpGTkVL8UXumYI1ZmO/568Sm2aSlEpnpsB/Dk
 8sSksketbn5W9yJ+15maZ3JknXULjvdCezTWfpEo4TH1VOokUWiRLIClGEcS4XuHes++NTeO/
 qEy1M3E4dnTJ/kQdNvWfIXpa6jFvZl3qkrtJIcdYO3XzDMPPRuwhvfZbi3WpYQDY+O13mDG8o
 onvmzDTSyQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
> This enables us to determine whether the command being issued is for a DMA or a
> non-DMA transfer.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/scsi/esp.c        | 1 +
>  hw/scsi/trace-events | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 9427c55d1d..9951472ee6 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -698,6 +698,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>              }
>              break;
>          case CMD_TI:
> +            trace_esp_mem_writeb_cmd_ti(val);
>              handle_ti(s);
>              break;
>          case CMD_ICCS:
> diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
> index 0e0aa9847d..762849c7b6 100644
> --- a/hw/scsi/trace-events
> +++ b/hw/scsi/trace-events
> @@ -189,6 +189,7 @@ esp_mem_writeb_cmd_selatn(uint32_t val) "Select with ATN (0x%2.2x)"
>  esp_mem_writeb_cmd_selatns(uint32_t val) "Select with ATN & stop (0x%2.2x)"
>  esp_mem_writeb_cmd_ensel(uint32_t val) "Enable selection (0x%2.2x)"
>  esp_mem_writeb_cmd_dissel(uint32_t val) "Disable selection (0x%2.2x)"
> +esp_mem_writeb_cmd_ti(uint32_t val) "Transfer Information (0x%2.2x)"
>  
>  # esp-pci.c
>  esp_pci_error_invalid_dma_direction(void) "invalid DMA transfer direction"
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

