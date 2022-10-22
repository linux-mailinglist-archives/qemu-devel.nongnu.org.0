Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67005609934
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 06:37:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omjYU-0004gN-L2
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 18:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLSI-0006Im-Cu; Sat, 22 Oct 2022 16:50:54 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLSD-0005Xo-38; Sat, 22 Oct 2022 16:50:53 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mnqfc-1pSqwD3gwU-00pJd9; Sat, 22 Oct 2022 22:50:44 +0200
Message-ID: <b5a02733-c6cd-b3e4-aac0-4db1190ffbc4@vivier.eu>
Date: Sat, 22 Oct 2022 22:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/3] hw/core: Tidy up unnecessary casting away of const
Content-Language: fr
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220923120025.448759-1-armbru@redhat.com>
 <20220923120025.448759-2-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220923120025.448759-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kuG1vvnWXqugm2bGBdgBSLZmxO7UyUuVRGCI3pwB9PDG0J1hI+Z
 UgX9reB11jvLPoxa59Q/CjVHfnNb9xB4NFudRE4JZ0hk+rm7hrMRDhTiQFCrbgifjd0vR5V
 DrDDf5o8OUOxwC5hInkmG09RLdswH6EORwW/tvRPh+76/CHdcTPAo6KMdIdACqg08AK8kZo
 VnbXglsDXm4Do3N+BJdrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sOznZ3IkF7w=:C00F2Hfudeofsi/jBRJOZ3
 46x1kHD894ANqcImdqzbOEoN1pb82FS1MDe996/uoYPvRu1a7XrtgZd6j+uMoiC0hAlCMpirP
 Wlshv+vGYVS7ijdshlBGiuvZcI51AEoVsoN0456GYE1evCPvL60rCbSlvjN1E0HxHoKR0QV0J
 NYdhAwPgIgGhTgAkcEh2QZSC8I1zBRBvAe9bH14R8fw4hazg1xLwrfPTTg2hZoeOmoqNJVPgK
 BuaRnW8M9c/N58Bg76J8l/Nqu0zYvaZUbxqv2ShMytCAiF+b43dXHMStwKiOfkFhSR0GtIZbB
 1eLeJ6PpgSWR9K6kTuPXxcQx3kdLcRYiRF1qv93JYBicFBeZCOg9OD+UKN4hIHwMnZVE7TZH0
 l4VTxeu3xmF/vxm0lb3K6vg2NNerf2nk8yoeABAfIdsedIcnp3wscO957e6RLDAMPpGr/i9ED
 SXPD6uw3lSiZB/k90I/NVf57/2eSK/TPuGNxyuS3FkO3l0xLWCOi9Hqxp5E7YZCyGFK/TNvrg
 x0wGo2z8JfYyNUvhGhZmWCTxTtsdbfunZhi7YQzdcoWskZ4bJE/Qev0keG6n9MPTeUgQLpx7M
 CSbykN44X+qdf2MCaRKc332lLblrlLbcs6yJy9fVXZLbuAN6gpUrcEi5gs9QW1cnCCMiIDwkz
 4VV2mOO8LecCcm9vM/FZFMDJsUXtmcZK8mzyhebRawQ0vdjGegqoJcLul+JM9TFho80Xdu23E
 sR/4+MOk4ntBCKHBZdVvmRBXiVhBB+i0WyPMTkOrCkGpR7TC4JnZO05+V3ep9CmohrMTpUvyD
 QXKqxAx
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 23/09/2022 à 14:00, Markus Armbruster a écrit :
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/core/sysbus-fdt.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> index edb0c49b19..eebcd28f9a 100644
> --- a/hw/core/sysbus-fdt.c
> +++ b/hw/core/sysbus-fdt.c
> @@ -299,7 +299,8 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>       void *guest_fdt = data->fdt, *host_fdt;
>       const void *r;
>       int i, prop_len;
> -    uint32_t *irq_attr, *reg_attr, *host_clock_phandles;
> +    uint32_t *irq_attr, *reg_attr;
> +    const uint32_t *host_clock_phandles;
>       uint64_t mmio_base, irq_number;
>       uint32_t guest_clock_phandles[2];
>   
> @@ -339,7 +340,7 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>           error_report("%s clocks property should contain 2 handles", __func__);
>           exit(1);
>       }
> -    host_clock_phandles = (uint32_t *)r;
> +    host_clock_phandles = r;
>       guest_clock_phandles[0] = qemu_fdt_alloc_phandle(guest_fdt);
>       guest_clock_phandles[1] = qemu_fdt_alloc_phandle(guest_fdt);
>   

Applied to my trivial-patches branch.

Thanks,
Laurent



