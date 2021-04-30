Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D336FBE7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:10:08 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTqH-00013S-S2
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcSzm-0008PI-8l; Fri, 30 Apr 2021 09:15:53 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcSzi-0005ZR-Sr; Fri, 30 Apr 2021 09:15:49 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJmbB-1lsDco48kb-00K7Q3; Fri, 30 Apr 2021 15:15:32 +0200
Subject: Re: [PATCH 2/3] hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210424222057.3434459-1-f4bug@amsat.org>
 <20210424222057.3434459-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2d261477-1c80-2bf4-b9a7-c4a8c6f96204@vivier.eu>
Date: Fri, 30 Apr 2021 15:15:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210424222057.3434459-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RwoVAG/kMqlrAUiGUgtxmkMw2dLGS9jKgk+F10RwzZgcWr334RP
 OYLNJp9uItOEUAoiyt52LZG2j3Kktl+NYwrc+3aeyGljgL+Z/aJongdSfV/mid/zOWVHsIQ
 gJJz4k99P+BZ0SSim8RZUEloRQ4O1WNa0GEB8N3e7p0rg/DOl6KMWV7WzONxL2wwSdUi14H
 w1Wn6yNjdUuBKYZEXoSFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J3+friCS7MI=:F28/MohQFr7c/3o5kjxOlW
 99Ts07lo83e+85emw9gHf2u7cbHzVs/ECH1MBTsU8+GP1PiMmE80hpATkPegcnDgWYx+bwoeN
 W5eKPcuczzv0ttEmBtTE7ZWr3k/lPN4Gnrt74yson8n/0By8oV67OsJCKnwPlZi2sQ7lrb3tl
 EKsjOEv+kYAvLrgie6eXOwnQiF7lCFBokdBca7fy2ls7sfrdZoTe0S0ndJGxVohbw7JUBT3ty
 z2Fx5a3TzVCVAfLbqqyjfJragfNuvnaE35qkjkctRORg6ymuz9iGFdDkEFM16ztowhXJseU+U
 OrIQUAmFEAIYIHckvc0qxpthY3wCbl8a4/zunImdoixYqNei2X0F2FvgYVnaplJ5sbg3SH8D/
 fcYoI5E2+4o9fua01rFyV73JNptH7uW7cM8VZgD6Dom5zwEXWwXt1FXEt1oaYG8A/mRs8yp83
 mi7FVZwnKX4L8q/KWSrWWKLwsBt3x0wkoD6uNy/24oH/XRNX6d3fvXkE8ckmu7VZ2rX1Vu9AG
 tMJO+xSehM//a9BNYh9MY4=
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/04/2021 à 00:20, Philippe Mathieu-Daudé a écrit :
> The Microdrive Compact Flash can be plugged on a PCMCIA bus.
> Express the dependency using the 'depends on' Kconfig expression.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/ide/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index 5d9106b1ac2..8e2c8934549 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -41,6 +41,7 @@ config IDE_VIA
>  config MICRODRIVE
>      bool
>      select IDE_QDEV
> +    depends on PCMCIA
>  
>  config AHCI
>      bool
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


