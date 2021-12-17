Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3F7478951
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 11:58:48 +0100 (CET)
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myAwp-00010S-NB
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 05:58:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAv6-0007aR-VN; Fri, 17 Dec 2021 05:57:00 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:44243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAv5-0006RX-08; Fri, 17 Dec 2021 05:57:00 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8XDT-1mThhG2h9d-014VqR; Fri, 17 Dec 2021 11:56:47 +0100
Message-ID: <af2c49ea-69c8-32cd-0cf0-571640ab3cb6@vivier.eu>
Date: Fri, 17 Dec 2021 11:56:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 24/28] tests/qtest: Replace g_memdup() by g_memdup2()
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-25-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20210903174510.751630-25-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SL+pO6j1OrP191s1v9vkjW0/R5XANarHdOJfeNnG49iHt5V016K
 gLJwacv0PQi+V1s4xBClosJoXy+AeVKrozPZKzKYMKv8Y8KZ/g45+oMkP+GaGmU983Dw2dp
 63z/PRGnWKTwaOIKQLx93w6vIzNzw8pDftQQffakIdKhufPY6dyDqVp/uGG+c8uSD+QKPxM
 V4tH8LpzyMv2bfGvN5lYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q+CKb5EiIDg=:dYE43IFdu0ii7IOli4vLu2
 w7guNIWC3qacK9naUD/v2GcfYTqr6w4pBfIiFPTVvc69DDonAjxNjfbXSQwEWG8Tl7kdNVPnR
 1BM6Q2+LN9lL4x7PlsGO++T1p4n331kN9BGzZKS36XuTRXEY+oV6S68spu/UNqDZPqDPFPMLr
 R9e0HONYFkMCjtbCKa4m8lpO9BmMlM8i6tUnDF9c60Kq9cQsgCN518Y+TrRG1FXXWiQKRzeyZ
 KTqVCpxkeakAF2MQGC3U8uFB+yYsAVBDvDsHID35WDr9NXXAaeudNk06EFCMHF2xL6hvcyCuC
 u4q/Y8QO4/sXGsySyZQ/lLQOBM5hznQxFl6SKouKW1ibE5RxdgpsjEHVbt+m3eNESQEU3bc/8
 LD4a8wnR1Wz+qjgs5XILdhZA0VNWLnpt7eRb/CqlIJVHskebURXFungHYjtmIORLf/tDfiiz3
 dnOWNIQKASR+d7TSG+nx60olHlmxljt2Vdh7QuSt8SLK/2rP7KJJFGQK6PsKIk5/59kwtrbqO
 9zNfmLOVWG1zmtIanlFtElOb0ri0CfeHC96JIG+SM+pQ0MEoplYQkU863djEk24MJLbXuT+WT
 RyOufvE2yFh3HMIGq8ksT3abiAp8yPSSjCSx12FM3ABq89EQ7ND4DSeBUfw51gLR4xSZhfow/
 E+f1hy8LZ0SLv4PW/978IBDPi8a/SZ595vhqx+TnIhhgxG5gyq5+WVBG+tDBJvIY2Aa8=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/09/2021 à 19:45, Philippe Mathieu-Daudé a écrit :
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
>    The old API took the size of the memory to duplicate as a guint,
>    whereas most memory functions take memory sizes as a gsize. This
>    made it easy to accidentally pass a gsize to g_memdup(). For large
>    values, that would lead to a silent truncation of the size from 64
>    to 32 bits, and result in a heap area being returned which is
>    significantly smaller than what the caller expects. This can likely
>    be exploited in various modules to cause a heap buffer overflow.
> 
> Replace g_memdup() by the safer g_memdup2() wrapper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/libqos/ahci.c   | 6 +++---
>   tests/qtest/libqos/qgraph.c | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
> index fba3e7a954e..eaa2096512e 100644
> --- a/tests/qtest/libqos/ahci.c
> +++ b/tests/qtest/libqos/ahci.c
> @@ -639,8 +639,8 @@ void ahci_exec(AHCIQState *ahci, uint8_t port,
>       AHCIOpts *opts;
>       uint64_t buffer_in;
>   
> -    opts = g_memdup((opts_in == NULL ? &default_opts : opts_in),
> -                    sizeof(AHCIOpts));
> +    opts = g_memdup2((opts_in == NULL ? &default_opts : opts_in),
> +                     sizeof(AHCIOpts));
>   
>       buffer_in = opts->buffer;
>   
> @@ -860,7 +860,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
>       g_assert(!props->ncq || props->lba48);
>   
>       /* Defaults and book-keeping */
> -    cmd->props = g_memdup(props, sizeof(AHCICommandProp));
> +    cmd->props = g_memdup2(props, sizeof(AHCICommandProp));
>       cmd->name = command_name;
>       cmd->xbytes = props->size;
>       cmd->prd_size = 4096;
> diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
> index d1dc4919305..109ff04e1e8 100644
> --- a/tests/qtest/libqos/qgraph.c
> +++ b/tests/qtest/libqos/qgraph.c
> @@ -93,7 +93,7 @@ static void add_edge(const char *source, const char *dest,
>       edge->type = type;
>       edge->dest = g_strdup(dest);
>       edge->edge_name = g_strdup(opts->edge_name ?: dest);
> -    edge->arg = g_memdup(opts->arg, opts->size_arg);
> +    edge->arg = g_memdup2(opts->arg, opts->size_arg);
>   
>       edge->before_cmd_line =
>           opts->before_cmd_line ? g_strconcat(" ", opts->before_cmd_line, NULL) : NULL;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

