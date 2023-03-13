Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE836B7F9C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 18:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbm6w-000184-Fw; Mon, 13 Mar 2023 13:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pbm6j-00013X-FL; Mon, 13 Mar 2023 13:37:15 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pbm6h-0007G7-RF; Mon, 13 Mar 2023 13:37:13 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7AEs-1qcXoj2JRs-017TJt; Mon, 13 Mar 2023 18:37:05 +0100
Message-ID: <d28906cb-42da-ac28-5609-281ce91245f9@vivier.eu>
Date: Mon, 13 Mar 2023 18:37:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] qemu-options.hx: remove stray quote
Content-Language: fr
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20230202223121.252073-1-jsnow@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230202223121.252073-1-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b5iq/fyX0fOLwqvKb7G32DW/5Px9yTQxmV8UMuLTU8EsLQ0UVzw
 aU4ncddF7HvLdEjI39vcqSpJDi8TMwjl47KgdltnUrLODQwgp2L9dyrccaXBZ/rFjLv1zCC
 2ElJ3QvaFGnUCK/XMzvuzLZdnglgtqxA42EqrZdmqrgja1AJY+SffaCv6W3DnYgcC0hVgL0
 Vv4iqDpcR7OCagg6+HqVg==
UI-OutboundReport: notjunk:1;M01:P0:c0ERZz0tOR4=;ZPnPwcmx0nWBDaw7PXgD4514xlL
 yA+YzmKRAXzWZ6AHHhE7D9fMfkSyUx8Xj6yFpqbSc6iVlMoZJZETE5HkS946GYmVWQEioNzOg
 0tG0yD2b52OyepqgR8oFBbUNd2F02CGN4lgV9ZhExf9Q+760tNr779gNp6E5dKNKpTttcx2pU
 RhqEHFOgnT5NCq9a+IVmTmloQrpoI1kVLVKsQjY0M/MByfiSGhMtoN6D69OK5HZqX5k5wMpaU
 pnCavjDuL0dqToFnXfSao333GDgc91G5PkcTNcPuEZNCgFyEz2ETmkWloDj1kXQ0bdP9+SOef
 Rq5L2sfquc30AZcRJzuLNg56VhVoGxaHrmu3N4ajtYgPJs3tvLheysqCjlzUmS4LVJahIAbno
 hIfdlasrdS0Ry8+Mqm7mFXiGWzdnozAJ0j1FQNfJrDOqnmm0lxFtMQSTki+8SlLALDwCN4+qK
 S8DPiC3ex5hSzcz/RVRYQGkfHUxZFvQtwCuvJxdSdx7vYEb7cX0DACLPr/lS2PVb0BxvWt+Rb
 iYDcfFcv1hzyRAf5/gUlkyFRMc/sQcKIFZm2610E8Aj5UlL+b3R1eqxkbdDYTZ4CMihB/DBmI
 CPtUFwUYk8lI7zteQsbgdD1ErB9MciR/uvTj6MExpbZhcIukTecs5JjTQbY4k1FnSxMYfCljJ
 wI7KAzZp4nKUFr/eBL/yp/8XSVuspQ+wE9kERKZAnQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 02/02/2023 à 23:31, John Snow a écrit :
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   qemu-options.hx | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index d59d19704bc..52d477547f5 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1606,7 +1606,7 @@ SRST
>   
>       .. parsed-literal::
>   
> -        |qemu_system_x86| -drive file=a -drive file=b"
> +        |qemu_system_x86| -drive file=a -drive file=b
>   
>       is interpreted like:
>   

Applied to my trivial-patches branch.

Thanks,
Laurent


