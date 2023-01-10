Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FAA664F22
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 23:53:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFNUL-00018p-RI; Tue, 10 Jan 2023 17:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNUJ-00018H-Dp; Tue, 10 Jan 2023 17:52:59 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNUG-00047e-UU; Tue, 10 Jan 2023 17:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+bKNA3YyZT/zMMVEIFPjESH2mm7RBlGpSI4327mAKs=; b=XuQvd6jHYOQzTMYS5lfRxq1fy9
 klzND+CccLtQ6l3/VcC2o03GDwLV7zAvs6EPFCAIGKFTXQZhs5CMgJfyq4a4ZMu+vDSH66rKiTRwW
 OWQXljV0l2gTBlKARuR6Y1DbzleaVXMMVCNnh2/Zc6l01oU0p2ZL7BhiyWmTNv5pLXn6SooZgANes
 1k3g5EDMl9XNzAA181aA2UC+4E32plQyRGA0uJDXQ/Nuarc0xu4JOjiycLhvX3M8UGwoWj5Ir0Tzi
 6dp9oXxhk3g2sjSaD/F1KgxX+OPVPEywFLa7TxvZn59FVyC13ptsGRIWGos8b8Hv3LWYsU2WlSgkc
 kOTg3/PvaiEPPFO+LuqroPoiVo4YGPHsLRaIV5Kc/cI6B8FHnbtcGaxePLDJSqM6XCtksG1j9MIWP
 IsBrkFrjKsn1M1dnX2anfWe63/NqDrZup1qpl5rpTt9LvplkTnbWf7vAtoRg3IHGr5ASmR6mX5i1c
 QstRuYATrXCHqVhkIimLJ0rD9QZjhoc8f68P1BV9aksDq4ZD3x29vl3Zc+PJNu0ferWOA50q4Qw6w
 K7o8ZfLacXUJuGzZa26qYtiXanhKHriftwuyJy2PFCqFj3QnZ4U+mAeQQ4Vaj9Q0ShSaEksKwigxI
 FUFL66CXWR0i+H4mSn+uvBJotd2Lsd8Flg4TFCqKk=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNTp-0008sz-DT; Tue, 10 Jan 2023 22:52:33 +0000
Message-ID: <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
Date: Tue, 10 Jan 2023 22:52:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/01/2023 21:59, BALATON Zoltan wrote:

> Setting emulated machine type with a property called "via" is
> confusing users so deprecate the "via" option in favour of newly added
> explicit machine types. The default via=cuda option is not a valid
> config (no real Mac has this combination of hardware) so no machine
> type could be defined for that therefore it is kept for backwards
> compatibility with older QEMU versions for now but other options
> resembling real machines are deprecated.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

I believe that people do use -M mac99,via=cuda to run some rare versions of MacOS in 
QEMU (I think possibly OS X DP and Workgroup Server?), so we would want to keep this 
option somewhere.

> ---
>   hw/ppc/mac_newworld.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index f07c37328b..adf185bd3a 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -169,6 +169,15 @@ static void ppc_core99_init(MachineState *machine)
>           if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
>               warn_report("mac99 with G5 CPU is deprecated, "
>                           "use powermac7_3 instead");
> +        } else {
> +            if (core99_machine->via_config == CORE99_VIA_CONFIG_PMU) {
> +                warn_report("mac99,via=pmu is deprecated, "
> +                            "use powermac3_1 instead");
> +            }
> +            if (core99_machine->via_config == CORE99_VIA_CONFIG_PMU_ADB) {
> +                warn_report("mac99,via=pmu-adb is deprecated, "
> +                            "use powerbook3_2 instead");
> +            }
>           }
>       }
>       /* allocate RAM */


ATB,

Mark.

