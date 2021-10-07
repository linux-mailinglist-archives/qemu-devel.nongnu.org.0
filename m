Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD183425357
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:44:43 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSlO-0000lK-T8
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYSfn-0003cT-Ie
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:38:55 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:45237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYSfk-00011D-Tg
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:38:54 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MFKCV-1mauaA0Rqr-00Fk6a; Thu, 07 Oct 2021 14:38:51 +0200
Subject: Re: [PATCH v3 06/13] macfb: add trace events for reading and writing
 the control registers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211007093407.3329-1-mark.cave-ayland@ilande.co.uk>
 <20211007093407.3329-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f85ab6a9-1911-ef40-420d-69e29f59c5fd@vivier.eu>
Date: Thu, 7 Oct 2021 14:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007093407.3329-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FVWK0sGMGi+0w22guDgyZDHZ2F8EGq9JXX9IXdkEk3SWfugCC+w
 FSxfjx5aA/m3QQI+dJZGwEcFunC5fTMxjDin/Vu/ud1asgL79wN0rWco2Rq7BT2+NEkZ42T
 9Gj1x35ZY8OXPkFalepdnEmbTLStrlNFwTfkcI1pbWmynHHHcv0j9vr2JEw4Wx3oCQVFq5j
 dhwKpSd1PpXwctHyPGdgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pRP3aqDEE0s=:4H1hYdF5T9eWwo1zW9RJn5
 5aUqG56LQzr3NkH+Mg6Gxj785naQIumV7HY33WZ6mo/la0R/0vgqFAgTVrwIlpnyyJNk1Z3ms
 ngMAW7MKF6IoIIVi7zKG5icNxR3sODMHOADrwh6zRuCGoO1ulTFDgA1gulYLSFso7Le5vCuzr
 tHKWzeoIBZluJOB7HlgGJZ/ySY3+WbkT4pLcBZFmlytelSEEPMNP/9y31VyAvqbsLCFyPOb4G
 VmsuTGxGse0OgXits5+Zq1sxJZkig26SJQTi0QvxuncWxQrRHXtj6WCefXRo+yNA2eAvDJ+Hr
 rqYRH4dNNS9Js0kD9qMOzfFQ+1j3SjZV5Qvbx6bmzl7BInLpSxVsR/LNxSD91G2kHSRcnvtne
 uO+/JqqQyyCQzamQYu5LjCAl8OGQy19hce28ttqJwWXKT/EOqASpZrhI+BMlLnzBfxuRWYS/T
 k3TwTGftCNpbebzL1RCQycLI4hEjNAjycCtNjhJQX15SsjPMW5P1k1OlFCTFBrxWXiNhMVMjF
 6cenuYj0l/365JZI9VNRw8bMsp6nyx6bTuKIT3863A8DsDQXTEX/4k6meiE7CyCumwsxkijHp
 BBOrN20vEDkwQnIpiQignH8Hy2yRvdl37tNpBeEXfed9ruGgQz7/uE4vm53HDLI7nDMOl+nYj
 E4hU8JLnrfX8xjIqkYwBgV4TqcduznAgXe+CvdB0M1jbPqR7VEAkju860+/xio7PY06zeCOxy
 z5Pvmmuh27bhjuGqHiuyOm2cRFTy8x7BLg+jgQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.964,
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

Le 07/10/2021 à 11:34, Mark Cave-Ayland a écrit :
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/display/macfb.c      | 8 +++++++-
>  hw/display/trace-events | 4 ++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index f88f5a6523..1128a51c98 100644
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
> @@ -311,6 +315,8 @@ static void macfb_ctrl_write(void *opaque,
>          }
>          break;
>      }
> +
> +    trace_macfb_ctrl_write(addr, val, size);
>  }
>  
>  static const MemoryRegionOps macfb_ctrl_ops = {
> diff --git a/hw/display/trace-events b/hw/display/trace-events
> index f03f6655bc..6c460aaa4c 100644
> --- a/hw/display/trace-events
> +++ b/hw/display/trace-events
> @@ -167,3 +167,7 @@ sm501_disp_ctrl_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
>  sm501_disp_ctrl_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
>  sm501_2d_engine_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
>  sm501_2d_engine_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
> +
> +# macfb.c
> +macfb_ctrl_read(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
> +macfb_ctrl_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"

You changed the "int" to "unsigned int", you should change the "%d" to "%u"

Thanks,
Laurent

