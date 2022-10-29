Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127D612198
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:50:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oohX2-0007IU-MW; Sat, 29 Oct 2022 04:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oohWx-0007Ga-0Q; Sat, 29 Oct 2022 04:49:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oohWv-0006V1-LF; Sat, 29 Oct 2022 04:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A+Dbbz7M/9rZqq+Ble/xXJjm+G0LGxBsu8ivy79oMMo=; b=Mmczdb7f5oA5Z52L6X/USLAksj
 Ij+mEmVDk4qAw20jLBe9x98Dy1A19lw7DWvBXGT8TYHwxP/NeSC1GP6Gt3cFIL6S8zlHZBtnlzlUU
 NmFKgUiRxCBg4tMLxWT1Je/hqyFMr8CsusnDSt/+44Q5f0g10bv+Jg86UKEDZ5DXE7riSkps1DW0N
 w5avEXNjJ2Q9PI6cobf8tLxTOeMDXdX/pmG26Jldlhq95Qp2eocpArCJC3TyhOcN7Z/A6H5UGN3wF
 uBTvVysNNlf/zWbIHzkbminrA4KIZoRguHeu2sYB6trvP62eGm2j3E9P6dH9Us1s2KbKpGSJqR9r+
 M7d0z6b6zhPOfpL2UlCaIG599IvMmXOuPqwXNQPcDZXrUEYOYNdETMNmEoycFxj9GgrMgCn7WJuKV
 2UGo1s4Uj4oOYswSQNUgrj1TE1NayxQMD4ggovGulKGNZl1JGFgCXWUmgFyGHILQTufwJevvM+/mL
 z7HAN92ZRBpdeUHsMs7GI1+MPX0kjvmWYl0ONnNow68KgDIbyJBi4kimkzqtyjMefw763qI99+ukm
 gLHnVgf2KMJjx6Rf45eIbaA9cYztxcD5BmJ46xsybL8ho5JQ3JKRZTrjEhWfA8a/m/XvPymlqPF0M
 vIu7ApBcMQyE2H0eJTFR1N5aAAtNHHwlmQbgII/IY=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oohWn-0008Rd-9I; Sat, 29 Oct 2022 09:49:21 +0100
Message-ID: <0f3c8bce-6a10-f971-89b6-97b0500f3dfd@ilande.co.uk>
Date: Sat, 29 Oct 2022 09:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1666957578.git.balaton@eik.bme.hu>
 <f9da172e486c1f57f8542c7c3cb0223cffa89b1f.1666957578.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <f9da172e486c1f57f8542c7c3cb0223cffa89b1f.1666957578.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v6 14/19] mac_newworld: Turn CORE99_VIA_CONFIG defines
 into an enum
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 12:56, BALATON Zoltan wrote:

> This might allow the compiler to check values.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 37123daa6b..601ea518f8 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -95,15 +95,17 @@ typedef struct Core99MachineState Core99MachineState;
>   DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
>                            TYPE_CORE99_MACHINE)
>   
> -#define CORE99_VIA_CONFIG_CUDA     0x0
> -#define CORE99_VIA_CONFIG_PMU      0x1
> -#define CORE99_VIA_CONFIG_PMU_ADB  0x2
> +typedef enum {
> +    CORE99_VIA_CONFIG_CUDA = 0,
> +    CORE99_VIA_CONFIG_PMU,
> +    CORE99_VIA_CONFIG_PMU_ADB
> +} Core99ViaConfig;
>   
>   struct Core99MachineState {
>       /*< private >*/
>       MachineState parent;
>   
> -    uint8_t via_config;
> +    Core99ViaConfig via_config;
>   };
>   
>   static void fw_cfg_boot_set(void *opaque, const char *boot_device,

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

