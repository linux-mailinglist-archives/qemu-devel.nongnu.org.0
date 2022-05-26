Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D47534F9F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:53:08 +0200 (CEST)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCzD-0001Yp-JY
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCYc-0008P3-Qu; Thu, 26 May 2022 08:25:42 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:35789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCYb-0003FV-6F; Thu, 26 May 2022 08:25:38 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MMGZM-1oA5Xm1vIE-00JHTA; Thu, 26 May 2022 14:25:24 +0200
Message-ID: <1d4a27b0-a24e-a222-6797-6d2dc150fec1@vivier.eu>
Date: Thu, 26 May 2022 14:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 06/11] q800: implement compat_props to enable
 quirk_mode_sense_rom_force_dbd for scsi-cd devices
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220424164935.7339-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2u7V5TJZfF1TXQTZOu79rOVbPVMncs385iZbbTyW4z9U+HvocNs
 p1Gd1XVx3vR648QAn61f4a7Iw2gwIT3xSjcGtYe48q+uQZjBJoXsKL4oInEd0tWZd0DG+TN
 80aQc+eFZXYMcSbNBUBIxa9E7Sz16I6wYfNYL55GhDNll9HMmGRq+w/cUWY+O379A44wokf
 7KIiSLT8I2RdnHqKEKOSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qnZ8tXEdkZE=:3qCxdzJFO7dT7JaxARFnxy
 IHCSk+dDFHk+wlQ7tzPF9xnHw8WW8OGKtEseJlmIWkbuzvqBmcqflEmDGBjYa3AGrPNTxcbAw
 g6H3PbTRmzY3HicZN6fWX2EpV5hsU58QScyYWxriHsU6RplXoW8oCenpcKRD/ACJCnaux0Il3
 5R7NwQ0bdij/UD9eG6XAOWZFba7zqGnNj3i8RGLRCYCxndQ9jYVQaAhjy2DWU6wSQemBgINU4
 xITyzXHXDOuLIrjU8ZTsCaZW7jLztQ7RSFJ+Nf1zN/r1N7V+IM9VTMgGWdCe7cfTDgh6R2DH0
 dC75v+pSlmQFp1ZtDUhaOkSPbIs3QYsbXSirREOrFbwcLgNzxrGFJKmJJsXD/xO+2CCtEN94t
 S8DmS1rUX0xfwS3aUdd+1FuG9Bzye6goddVq3L9npRGmeeo0xpqh123Kxbxi8JZMhooWIHmiJ
 qQ0ThIBm2EH6UMf1IBkEeI7Kb+s22nDlCpnpCXsRWiC2Q43L4xzCDevvLhOMd3/gkPW5V1aIW
 eoN0mAiT1Mo2J0svFpGSNmr/sdKN7GU9P5oMTWA4xME9COTzpr9R2FfSccJNNIIuQ3k19YVXg
 2MXhpNx78txJ7mGSE9Zqw3FSF20i58uRKmxpT3XNUq/3u+eMeXQYxUmg9DsJTXSvR3Ny8mS4h
 6FZopoCQMd7Ee8zlxow4BWICZOkb3kz9sj3GRj7pGtCfCaUNLxazki63EqefyQEfVzV0YAbrz
 JG5BlcW7et8HGZ4VNdncnw7VncJqtVCgVyhf+Q==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 24/04/2022 à 18:49, Mark Cave-Ayland a écrit :
> By default quirk_mode_sense_rom_force_dbd should be enabled for all scsi-cd devices
> connected to the q800 machine to correctly report the CDROM block descriptor back
> to A/UX.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/m68k/q800.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 42bf7bb4f0..f27ed01785 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -688,6 +688,7 @@ static void q800_init(MachineState *machine)
>   
>   static GlobalProperty hw_compat_q800[] = {
>       { "scsi-hd", "quirk_mode_page_apple_vendor", "on"},
> +    { "scsi-cd", "quirk_mode_sense_rom_force_dbd", "on"},
>   };
>   static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
>   

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

