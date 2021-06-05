Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A5339CAB8
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:23:21 +0200 (CEST)
Received: from localhost ([::1]:57890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbtA-0001It-1A
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbs7-0000Oj-PB; Sat, 05 Jun 2021 15:22:15 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:50591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbs6-0003Zv-7A; Sat, 05 Jun 2021 15:22:15 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MkHIV-1l51hr0vur-00kfKb; Sat, 05 Jun 2021 21:22:10 +0200
Subject: Re: [PATCH] hw/display/macfb: Classify the "nubus-macfb" as display
 device
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210531073255.46286-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6602eb6a-fa5f-8c7d-9658-d6fbcc3d6aa6@vivier.eu>
Date: Sat, 5 Jun 2021 21:22:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210531073255.46286-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q8Vc1Cuji3HejJm8DD+OH+Qh6um+ow6tYV+5R7lZtef7Fhg7Rui
 +Tn0m9XI+XzWL3fNRQ2s7/Rst+9+nE/Yyng6aN6VmKL1ePvjl7Ij2loA31y0g9+KNd4qKpb
 tzCGpJbP0pCPV+TrMSZGdNvrINXmCpGl6Hnp8PZPGv1sL5TGju3w6r5i7Z69LlaRBHXTD0o
 UHNARyvnMHqfXYTLdl/uA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cEb4ugzFvAc=:WsieSwESoy3ypV3d3DoixS
 l1t6LlGIMkLECSlG0GVkRQzTCMAW464El6h2ChmHMLz8vQ0UTkrwntyzGGAtRcxC/ftiF+zVi
 SgQu5i4OyluATaaLhftG5fYWQtZrdzbjxtSw9vewGeGTRe4FH4JXeDHzblx3LWRQdo6aMzM0Z
 oWSRTTcWV06pxfMSmDJn9fgMncYwkPIuVfCtrSJrluHG/+80MZ0kXSHkXicw+Qjzzw4fhB4P6
 EUzXwpXOflTLajxLarFmdxPlK42I3I309+nPz+icHvyotdw22b+GsuFX1lQX238VKJzowtoam
 848wBoroMwSOerVLSs9HwmRbeLIJt7WDYB01RIrpZKUJjAkTHI0W4sjV/PZkJq2ieNIHlDZ4N
 /TqgM4Puh/D9/vXmXSaKlipSgCnhvJQx/odctP0ww3spXxtCLV+mTzelxbATytxnxbBN+xdO6
 pl1pPZKvNpIA1xWV11EE4FZDFWSPG7m72dE945jGRi/opQKq07DkQLeTUoC3FR7vm6CsYIYYc
 cMtgNc/Evm3JkBPDrsoS7Q=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 31/05/2021 à 09:32, Thomas Huth a écrit :
> The "nubus-macfb" currently shows up as uncategorized device in
> the output of "-device help". Put it into the display category
> to fix this ugliness.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/display/macfb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index ff8bdb846b..d8183b9bbd 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -450,6 +450,7 @@ static void macfb_nubus_class_init(ObjectClass *klass, void *data)
>      dc->desc = "Nubus Macintosh framebuffer";
>      dc->reset = macfb_nubus_reset;
>      dc->vmsd = &vmstate_macfb;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>      device_class_set_props(dc, macfb_nubus_properties);
>  }
>  
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

