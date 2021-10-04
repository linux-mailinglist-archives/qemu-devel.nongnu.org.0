Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A184207F3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:11:58 +0200 (CEST)
Received: from localhost ([::1]:50978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXK0r-0005Tb-Lu
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXJmb-0001dm-14
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:57:13 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:34133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXJmY-00016Z-QJ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:57:12 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MY6TD-1mJHw14ApR-00YQ4P; Mon, 04 Oct 2021 10:57:09 +0200
Subject: Re: [PATCH 05/12] macfb: add trace events for reading and writing the
 control registers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-6-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <950e797e-f791-eec1-718f-79e6b2f3793a@vivier.eu>
Date: Mon, 4 Oct 2021 10:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002110007.30825-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3Ty1+ei0LTk561a0vtj6B3INdsaVBJIIC3ZgJcgbFzp3Sl6G8UV
 JvC79An3NXOroIRFbWorgLEKAO/JsvpZtfVIGoDgudJYqsAiGZtMo7yUtOJ/uhMMOhV5F9J
 eA7KMcKNyBsgAOBgN6PXgh+xxAxUAlIfKhrr3W6ufdiFU5cw3famNy3+L1KY2WoHuSSPpj6
 JbsATpgnj3XexcKq0jcGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pdVh5ViafFk=:6HKPMrWXw7xDDu4TQ+Hc6B
 YkxGu8q0ZxSjJAYQijhkH6O1cbdIQ42dfs/yTLGr2rmADqgOPfd2OSYYqDa1O++itEZHvvqw8
 t2GSKfKtu9mhSKLtctSo7uR1v2jXk3YdfIA2y5ZzLwvYJQDldwTn4CvKP8It09CQ61ApHNFfk
 LK32EXO7+CAicrMTv350aB3+iskJA6q07TqPqQmZRMPG9AE0MwZz+/yPFO8/R5j2nMoWjxCz0
 1Wu4iLKieUfZi2aYPAVz/3kee9DMHxAaB40v1ZwtVC0+31pbIcW3fqwrGzibXhRIjc6vWjQ5f
 0Ub2XkWlmyjFZlCnErgsx92CNOUzo0TVTd0hbSGgD6JQ0c9dLeyJVs/420+/q7xAU2DNP0QNF
 8+NXpUa/swnL+BuCUW5rjMOkq9hre4Yh3HPOUEHVnXaMZDXQ5wqylacl+uqUireKtEecwSplz
 D/0n+L2zNMK/pz1nnwGXvDSNWBeymjlYnD29EDy1LdSCOViabijX8sfLcZ9MqtmerDPq8kUur
 H6ufNfRLZ/ASDW6HoP1PCsrVW3w3y0DgqcLLC/9Kj4Kl3jPXnHAVUB0zq3YgRtlKWQz0rjOt5
 adEsadx7liyHWgD3H0wqM+hmUHCtGPPW0NkSJjHVppEFo1fZpCDS3V9gFVEjFRuNy/Bd64/jb
 3F2puBaKOs/oDmhXIYn8Sss1Cb6R9hOMdCPfCf5z/8UUoY/7dZuaKdXEMHzynM3u5H1dlF9iM
 YLu3XdoxGf6VqIBtVgL0VClX1Wd8XApd863iYQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 02/10/2021 à 13:00, Mark Cave-Ayland a écrit :
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c      | 8 +++++++-
>  hw/display/trace-events | 4 ++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index e86fbbbb64..62c2727a5b 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -20,6 +20,7 @@
>  #include "qapi/error.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
> +#include "trace.h"
>  
>  #define VIDEO_BASE 0x00001000
>  #define DAFB_BASE  0x00800000
> @@ -289,7 +290,10 @@ static uint64_t macfb_ctrl_read(void *opaque,
>                                  hwaddr addr,
>                                  unsigned int size)
>  {
> -    return 0;
> +    uint64_t val = 0;
> +
> +    trace_macfb_ctrl_read(addr, val, size);
> +    return val;
>  }
>  
>  static void macfb_ctrl_write(void *opaque,
> @@ -312,6 +316,8 @@ static void macfb_ctrl_write(void *opaque,
>          }
>          break;
>      }
> +
> +    trace_macfb_ctrl_write(addr, val, size);
>  }
>  
>  static const MemoryRegionOps macfb_ctrl_ops = {
> diff --git a/hw/display/trace-events b/hw/display/trace-events
> index f03f6655bc..be1353e8e7 100644
> --- a/hw/display/trace-events
> +++ b/hw/display/trace-events
> @@ -167,3 +167,7 @@ sm501_disp_ctrl_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
>  sm501_disp_ctrl_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
>  sm501_2d_engine_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
>  sm501_2d_engine_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
> +
> +# macfb.c
> +macfb_ctrl_read(uint64_t addr, uint64_t value, int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
> +macfb_ctrl_write(uint64_t addr, uint64_t value, int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
> 

As suggested by Philippe: size is unsigned

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

