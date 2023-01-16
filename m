Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C166CA0B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:59:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSoV-0002lf-DJ; Mon, 16 Jan 2023 11:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHSoS-0002lI-0k; Mon, 16 Jan 2023 11:58:24 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHSoQ-0006v3-9w; Mon, 16 Jan 2023 11:58:23 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MLRDv-1p0CwT0lV5-00IYVW; Mon, 16 Jan 2023 17:58:18 +0100
Message-ID: <d410e592-acb8-af23-3a71-21cbd7a47547@vivier.eu>
Date: Mon, 16 Jan 2023 17:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/7] Trivial: Mark some more files as target-independant
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20230112134928.1026006-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230112134928.1026006-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ORwA9WpDFkUa6HcTCV1L++5+VPbqATaHmXrdZ+Sl85HWK+kIU6A
 SajTjlM7YG02YAbzpDJ7nYI+YJmllZ6zDriiiWCnmegMmyEE2fQXNfmvzAdoaiAl1RmlVcc
 bzQooQgeEmdA+Mo89YKBWThKs1Hi/2zmhgywAwhBir/oKUQqHq2MxJNFt69a4h9y+kjhklT
 sfi6zPASL3WLschAuHa5g==
UI-OutboundReport: notjunk:1;M01:P0:646/efj4mxw=;vqTGNtlbC2cqGttn27idrmktugz
 EOJynP/foXeTw4Ll33PiFKQlqkRzD7wxwsV2OT8XLdj3x8amMDETZEkraCyUX+D9g5EzfruVj
 2mwHFxV2v6cE0Rm2F0l0z2iPRG7ficnCmxch3IaZvdtNby3gGtRTVYYNPREnt4zn/F6hUFqW6
 3Q/bm1Z/hX5fqf5dVQB3hqVbNPDkknxUdSSMsnJLOEXZnnJ6GgZ2IQU7Z25kUQLR+CilAMN8g
 W1b90FK7xvmC8jk9vW36dgY6To0EUx1YFumhPuzcm+aD5P10IjMfa4o5GQGzaC50CiRuGAnAI
 jHXaTSKrLdUjuPu+lwZYxQsCDHafFB0Yu7OTQZmKR4S71gkIZsi9+G7aW5Orm82f9mHXVJW0R
 /fKy/nvhoV964gMOxFK+3OZVlqTn4Q7kgLz1ILGQvgA1vgcE3QvHZ2Wg+xKQfnZ/75wWoaEiC
 WRhJgcDQJ2/MXXaEghi9lSh/E3QnoaIpiRmbV71QZDlCI9J605rsHFfXBDM5CgcGwQKW/4dPP
 hn1UWDdx8eOjvcWtArvNS3D339wc7mlJ0Ywg+vnN4YPeE5dkQENWNxDI0uwPvuEOInfAjN0ti
 da5NCLvB0hChKOLSv4HVgFUJ/VO2LkKRHsbAJAVnxZscrv3uy5dP/ssrodXIcgO3e4UqJWTUK
 rjwpJf0KnazUFZzgy4MmAmGKJtYB8d8E0elobyDVcw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 12/01/2023 à 14:49, Thomas Huth a écrit :
> Here's a collection of low-hanging fruits to mark some more files
> as target-independent (so that they do not have to be compiled twice,
> once for qemu-system-arm and once for qemu-system-aarch64).
> 
> Philippe's patches have been on the list before, but I slightly
> modified some of them (like fixing typos in the subject etc.).
> My patches are new.
> 
> Philippe Mathieu-Daudé (4):
>    hw/display: Move omap_lcdc.c out of target-specific source set
>    hw/intc: Move some files out of the target-specific source set
>    hw/tpm: Move tpm_ppi.c out of target-specific source set
>    hw/arm: Move various units to softmmu_ss[]
> 
> Thomas Huth (3):
>    hw/cpu: Mark arm11 and realview mpcore as target-independent code
>    hw/intc: Mark more interrupt-controller files as target independent
>    hw/usb: Mark the XLNX_VERSAL-related files as target-independent
> 
>   hw/arm/meson.build     | 11 +++++++----
>   hw/cpu/meson.build     |  4 ++--
>   hw/display/meson.build |  2 +-
>   hw/intc/meson.build    | 12 ++++++------
>   hw/tpm/meson.build     |  4 ++--
>   hw/usb/meson.build     |  4 ++--
>   6 files changed, 20 insertions(+), 17 deletions(-)
> 

Series applied to my trivial-patches branch.

Thanks,
Laurent


