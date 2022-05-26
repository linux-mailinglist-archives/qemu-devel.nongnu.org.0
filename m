Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A481E534FA8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:54:54 +0200 (CEST)
Received: from localhost ([::1]:52528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuD0v-0003si-Pl
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCZB-0000az-4g; Thu, 26 May 2022 08:26:13 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:43183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCZ7-0003Jv-EY; Thu, 26 May 2022 08:26:12 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mg6mG-1nLgkr3sn0-00hfDB; Thu, 26 May 2022 14:26:00 +0200
Message-ID: <ab4fad01-4a37-bbd8-40e7-6b69b1c7374f@vivier.eu>
Date: Thu, 26 May 2022 14:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 04/11] q800: implement compat_props to enable
 quirk_mode_page_apple_vendor for scsi-hd devices
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220424164935.7339-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gz9wOnVof/QnIuxKJ0iWKxMHt+eB61+Ezlb2kdug+0nqAWDByiU
 5GbesosX+GFnFrGEU5JbynQodOVlaiA7Khlr/ky1xsBDGyRziTUxgwWUMBidBLTkSIhIgMO
 YfA/cQYxoB289YOjjxE0EwCnyqgYQ5XmCVeybHMfXvJl2N9N8eaNRlAe4vmM7d6PW6m+02S
 O7FN1gPiJlYUrrXNsVZEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EHP0zbbS1l4=:fGx7yCgTm7JpdoGIEOff4E
 jJgBdg8H3gbJxBMpctsmK9Fpujm3ElQml/idFgyMtdDh+ZVnNAj8XG2/XQhROzs+cN0nVJ/4t
 b5ErKgbme9cGUpyqbvIuyb7W5BcRB+rHJaavdcKj6vPm/QxvROGdUHdehHM+E8l26uhfDe/ub
 zWdvlh6g2dNr26O9Q2DYgP/+daqO1kf4mUAYnEv/1MFqjfkUbaMchNAzEbcRvc16mmWzLFAX6
 ot4goRjSn5t+v0XrbDoooJhFRf9aqmWk9Fz7YDiK84qNrWsb8UOQIzWkDvVDlvZCvCyIx6qlu
 UGwCe9LYQxW/mUI5CBz9ENOCyT+grPLuP2Lr0MliPZR0QJWFh1gwOgYlXUPsmaKnf8DQQOknV
 tLwioW90ZHyUrEceqcte2QtvvJbhrhr8rXpVWyB+hCntRq9Jl0Fa+K6xK0Rg7bwi0TbtgCyIV
 TuD0mND18S3f5hHC/vS5KcPBtpU5csE0Olkw3Dg0M1PQu0EVom2lyxQ2PCQfA8CynyKuXCTKC
 Xar5o+u03KDECoeLjXSkm2kAwyFWIorDoSPDGHbcBnHirY810fn5QvtKoOMRfcoLy8AevlQCn
 4sevgwrdjF06p6p3t+z0aB/x8BY9BNv6U6pxX7CppMdRj/Dt+dW1VWh+CvlFqJ+YhCKUYqS3C
 PnfTOZDwh0pFUGTsdU52n4ta6ITyc2y7YnTZ0EsBGFZNaUXQwOTWTQxb1JjODwDY2L5sUOFS7
 wNrC35GVXbnU6qCgnEugH8XPhkbOsjktAy7tUA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
> By default quirk_mode_page_apple_vendor should be enabled for all scsi-hd devices
> connected to the q800 machine to enable MacOS to detect and use them.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/m68k/q800.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 099a758c6f..42bf7bb4f0 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -686,6 +686,11 @@ static void q800_init(MachineState *machine)
>       }
>   }
>   
> +static GlobalProperty hw_compat_q800[] = {
> +    { "scsi-hd", "quirk_mode_page_apple_vendor", "on"},
> +};
> +static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
> +
>   static void q800_machine_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -695,6 +700,7 @@ static void q800_machine_class_init(ObjectClass *oc, void *data)
>       mc->max_cpus = 1;
>       mc->block_default_type = IF_SCSI;
>       mc->default_ram_id = "m68k_mac.ram";
> +    compat_props_add(mc->compat_props, hw_compat_q800, hw_compat_q800_len);
>   }
>   
>   static const TypeInfo q800_machine_typeinfo = {

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

