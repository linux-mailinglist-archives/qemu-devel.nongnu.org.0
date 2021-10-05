Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E34222CC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 11:54:09 +0200 (CEST)
Received: from localhost ([::1]:33544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXh9E-0003s7-4y
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 05:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXh69-000292-Uk
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:50:57 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXh67-0003Ta-IB
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:50:57 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MAOVx-1mf8nw3Ya3-00BvQI; Tue, 05 Oct 2021 11:50:51 +0200
Subject: Re: [PATCH v2 08/12] macfb: add common monitor modes supported by the
 MacOS toolbox ROM
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211004211928.15803-1-mark.cave-ayland@ilande.co.uk>
 <20211004211928.15803-9-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7994e73e-cbda-1bd1-68c4-250dd951ed51@vivier.eu>
Date: Tue, 5 Oct 2021 11:50:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211004211928.15803-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qclRKxPwpxwzJPjdAcGWVdiPm5vBcMgrbQcGi78NyzIyS7dW6TL
 4QuyVWWgn8RDsQLdBvUMJwyNSH04l6OlMH7D6rms40mNIzT2NCQhZNzI3ZNH8H+dtgIQOHF
 oJNeEUiIlK/z20FI7K5zj4PAjfdyqMp8bGwKXtbR/XMk1iJNwwbLniaS+76fmPqZZFmbImW
 FmNahtd+k6HooE5XW+UPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VCCeH3vyFnk=:oqqIqN3fT8EMyYYI/03Ec7
 bYkPp0jOBSz57yiDL0H355+MeggVc3702lGjo75Y88/xz+XAFQmVpXJDOloXK0CkLYfZL0P/6
 YvmPWbHD5XZFGKynEkIeIR6o9PDm1nlwyWRnq6x+5cXdYC301iXGJZR6OpclTnjMkfv4t+dpb
 D712Obx8/V7h+DDMR7ALjG3e0VJCp5r4QEPPLPJjR9aPtuhoNNFFYnrdW28FZJ8idts60q2Bf
 NRPeO9i4CRmitaUsQqTI/iWjUNPtnN4P3cSWnanleGGt6AuW4OXdXRl2uroYL0AqFkgStMHwG
 q7B4ZWyQh5Xw49Eww5AdFaXPZ/xI5KBFDCmkeNoww30ept5ToQdyV7wow6RpOZNjeGxYKojJY
 zc6bAF5cCxBYJyYOLcyGYSczDoOpE4ZSnCCz7DtUulErPLUZb1L4DooHTFeJdNVvP5md+z0aK
 QhOubPSpsaGqqSUw8ezuN5w+HqEg6nB/iPO5QKIf2CPVWa24l4a9eUWDtu1eU+Juq/pfwXoGc
 0qGKgx/qq8B1iShBIvMTAOERHB+oG5BstoHz9U/OO/Au7PwIFKgIbDcwL3mI4f/Fo+ODsUESX
 72JobhqoLzeodvRNCkCcat4KHMqzNV4pSjuxDGDczf2Gyl98rmZGMwkql8GY/2fgZXgl2cQa6
 vLRDDbTxBSk8pwG9GhaFk7XfLLRzT1xfVOAwt1AmwXM728prYln0g1JWMOjgCAbToMQFJV29U
 kLQ42XoEdcdQemaNbZhSU8Hlj+diwG+05qBK4Q==
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

Le 04/10/2021 à 23:19, Mark Cave-Ayland a écrit :
> The monitor modes table is found by experimenting with the Monitors Control
> Panel in MacOS and analysing the reads/writes. From this it can be found that
> the mode is controlled by writes to the DAFB_MODE_CTRL1 and DAFB_MODE_CTRL2
> registers.
> 
> Implement the first block of DAFB registers as a register array including the
> existing sense register, the newly discovered control registers above, and also
> the DAFB_MODE_VADDR1 and DAFB_MODE_VADDR2 registers which are used by NetBSD to
> determine the current video mode.
> 
> These experiments also show that the offset of the start of video RAM and the
> stride can change depending upon the monitor mode, so update macfb_draw_graphic()
> and both the BI_MAC_VADDR and BI_MAC_VROW bootinfo for the q800 machine
> accordingly.
> 
> Finally update macfb_common_realize() so that only the resolution and depth
> supported by the display type can be specified on the command line.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/display/macfb.c         | 124 ++++++++++++++++++++++++++++++++-----
>  hw/display/trace-events    |   1 +
>  hw/m68k/q800.c             |  11 ++--
>  include/hw/display/macfb.h |  16 ++++-
>  4 files changed, 131 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index f98bcdec2d..357fe18be5 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
>
...
> +static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
> +                                  uint16_t width, uint16_t height,
> +                                  uint8_t depth)
> +{
> +    MacFbMode *macfb_mode;
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
> +        macfb_mode = &macfb_mode_table[i];
> +
> +        if (display_type == macfb_mode->type && width == macfb_mode->width &&
> +                height == macfb_mode->height && depth == macfb_mode->depth) {
> +            return macfb_mode;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +

I misunderstood this part when I reviewed v1...

It means you have to provide the monitor type to QEMU to switch from the default mode?

But, as a user, how do we know which modes are allowed with which resolution?

Is possible to try to set internally the type here according to the resolution?

Could you provide an command line example how to start the q800 with the 1152x870 resolution?

Thanks,
Laurent


