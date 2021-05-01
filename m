Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF753707F3
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 18:49:25 +0200 (CEST)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcso0-0005e2-3n
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 12:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcslO-0004Bk-F8; Sat, 01 May 2021 12:46:42 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:36099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcslM-0003Ey-M7; Sat, 01 May 2021 12:46:42 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N3bb3-1lUK7X25r9-010gRe; Sat, 01 May 2021 18:46:24 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210423233652.3042941-1-f4bug@amsat.org>
 <20210423233652.3042941-2-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 1/2] hw/timer/etraxfs_timer: Qdev'ify reset()
Message-ID: <cb232237-3fa9-c170-2bde-941a6193b90b@vivier.eu>
Date: Sat, 1 May 2021 18:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423233652.3042941-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MsDYfT38XxBD8rkKYrzdn7Fp/K61G2t43mQaVdQgeRveN4rD3/S
 k8YURX04h3Stzmf3bmJhLEJrBWRI4gBCDIyUZ1wADygKdMSrpXb69OCRvoofXjzmHVVPtVf
 xSEj+XbJzUHsAVgRMQeVdW/96lOGyRTwSFnNccWSyArpJlNglEz+hQjulZgzmwvdomtlcIm
 VZ01H57rGpf7RKhppISoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uhD1IqN9BAs=:XIzVBfNtIzyVDh55OTmXmM
 iccoGN+wGuc5rDqVNUxTpiEDIO5AeUrq8pWNTVct3EuAsIuni8vlRtSULzXm/VZf0sZngDjJB
 t6RMaXPi9Mw/p1vSoDI5qjpuoD7B95Q6pI1/kGY4J9ZlWjpKanNXo06xOcRlRlSsMxuNNm93v
 9O1iW47nTzjrXaGcI7846+WkfvavXernjJxlb0XQlLWFbxaN1e0NLp0gzDSJKuk9ZfbfBC3KX
 KHLnoJ/5XR5SdRsBSTYdo/vvCmtQbninBv1iYHQ4tCBufIbaIiNvDMXOLoS81PJX/eWp9sKn/
 +rxNV3DYYPFaz4nPpI2l6TTJBjg34lY4e6xKVSU27YqAwHPGyGP7SGwiq4GMUIOs6OvKpgnsm
 UqM78NLFwLcwvGsgHcMGXt0WPBU2jBhwCd0qShTH/Wx1IobQc8yyt18irGQW8Xa/LIO89QnZ/
 j2UtM0u909yTvXvEpKkTIAqnyzcDdHVCgh/tYXm9MFpXArW/gfsWpPc1ASEebMsS0Kv/fgLcu
 G8IB0KoU4fOtO8luzivh2U=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/04/2021 à 01:36, Philippe Mathieu-Daudé a écrit :
> TYPE_ETRAX_FS_TIMER is a sysbus device, so its DeviceClass::reset()
> handler is called automatically when its qbus parent is reset.
> Convert the generic reset to a qdev one, and remove the
> qemu_register_reset() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/timer/etraxfs_timer.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
> index 5379006086f..3cfab3e3284 100644
> --- a/hw/timer/etraxfs_timer.c
> +++ b/hw/timer/etraxfs_timer.c
> @@ -309,9 +309,9 @@ static const MemoryRegionOps timer_ops = {
>      }
>  };
>  
> -static void etraxfs_timer_reset(void *opaque)
> +static void etraxfs_timer_reset(DeviceState *dev)
>  {
> -    ETRAXTimerState *t = opaque;
> +    ETRAXTimerState *t = ETRAX_TIMER(dev);
>  
>      ptimer_transaction_begin(t->ptimer_t0);
>      ptimer_stop(t->ptimer_t0);
> @@ -343,7 +343,6 @@ static void etraxfs_timer_realize(DeviceState *dev, Error **errp)
>      memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
>                            "etraxfs-timer", 0x5c);
>      sysbus_init_mmio(sbd, &t->mmio);
> -    qemu_register_reset(etraxfs_timer_reset, t);
>  }
>  
>  static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
> @@ -351,6 +350,7 @@ static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->realize = etraxfs_timer_realize;
> +    dc->reset = etraxfs_timer_reset;
>  }
>  
>  static const TypeInfo etraxfs_timer_info = {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

But according to the comment in DeviceClass, we should use the resettable interface now:

docs/devel/reset.rst

Thanks,
Laurent

