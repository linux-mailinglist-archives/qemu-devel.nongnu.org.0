Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6EA604A26
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 16:58:28 +0200 (CEST)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAWY-0004O6-KM
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 10:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olAST-0000gN-E4
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:54:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olASR-0006OZ-7F
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:54:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a10so29483688wrm.12
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=0yRTTVBNbj3XA+3EDNVvotZrJvbU0BGaEmHb8InPfG0=;
 b=E2vxbpUHwX77sZFJL6PBKUbeVbBH7WAAubW+1wsp/BXJgK5iWz2YRxogovWe2aDr0S
 IJFe1A5MdZ1vn1D3jQHVTfyVXPiY1Mx+pxFrno/Q6e27CWXL/O1oCxAnzcnpxfB0hEKX
 GlTQrM4S6Y0MT03oQ8ap3MU/oCZD6jsempzvHA69yS81Y2xaF1+nMdjeOACtnmIQyUR2
 I0ZrXwKrukpYCXzV93rFZkILor8/hDHDBv17SAMW66LXf+tGx0broRsoSqEISdsMuFTU
 Kpg9P+3yFGGQx0o8JxIyoGA/TFIUeoEkp38e/BA5VhKz0zN+txCDQJj4CjBJwsbsqN1e
 G8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0yRTTVBNbj3XA+3EDNVvotZrJvbU0BGaEmHb8InPfG0=;
 b=k6u83nkAr8PZ0uBdR85+oIjMaQZOCAyM5WqSztiEuORIW7XAkvgYHnPw8FhY3knZP/
 u7lxUcmJl5F25wTLrQNVJV1u/ev/eyCj4MRpUKI0tGFJIucxjUomcNhbQbJkv7JhE6jB
 bQ2TxjhYfP/yoqN85RtEjo80Zyw/xTLQBmGwKZ+xgTUbL99Y6nJ0DM8/oyaUIBr9wa4M
 TNWx/4PP+tcWwyF95FHS4KHI9cCwe07xFNJAL6fnZeWgp2AcdOdxgr/LaeXGqIJZxVli
 r//YGKkFXKZ+oxqaBuwZ6T3XDkRSx75hV/lQMxyOPHK9Lgl3ugNYIElh+p0XKMOUDcJf
 KAhw==
X-Gm-Message-State: ACrzQf0PFIYOAkx3rajOqo+hntu/xy5dYvJm4vnzai7vDxFrxClyrVTn
 Kt3aJHwRco0MQ1zmzPYWNCY=
X-Google-Smtp-Source: AMsMyM6cYbnQ89uH4UoJ1T55BKD6zyEHstSbXhd0DL+SznmT6uERxps5bwjTk3dmvYSuT212RMynQw==
X-Received: by 2002:a5d:5850:0:b0:234:27c9:8fd8 with SMTP id
 i16-20020a5d5850000000b0023427c98fd8mr2107984wrf.548.1666191240976; 
 Wed, 19 Oct 2022 07:54:00 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003b4868eb6bbsm174007wmc.23.2022.10.19.07.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 07:54:00 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f12d712c-dc47-7778-8cf5-cfd621fdb9ad@xen.org>
Date: Wed, 19 Oct 2022 15:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 02/12] hw/i386/xen/: move xen-mapcache.c to hw/xen/
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-3-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15/10/2022 06:07, Vikram Garhwal wrote:
> xen-mapcache.c contains common functions which can be used for enabling Xen on
> aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
> accessible for both aarch64 and x86.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/i386/meson.build              | 1 +
>   hw/i386/xen/meson.build          | 1 -
>   hw/i386/xen/trace-events         | 5 -----
>   hw/xen/meson.build               | 4 ++++
>   hw/xen/trace-events              | 5 +++++
>   hw/{i386 => }/xen/xen-mapcache.c | 0
>   6 files changed, 10 insertions(+), 6 deletions(-)
>   rename hw/{i386 => }/xen/xen-mapcache.c (100%)
> 
> diff --git a/hw/i386/meson.build b/hw/i386/meson.build
> index 213e2e82b3..cfdbfdcbcb 100644
> --- a/hw/i386/meson.build
> +++ b/hw/i386/meson.build
> @@ -33,5 +33,6 @@ subdir('kvm')
>   subdir('xen')
>   
>   i386_ss.add_all(xenpv_ss)
> +i386_ss.add_all(xen_ss)
>   
>   hw_arch += {'i386': i386_ss}
> diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
> index be84130300..2fcc46e6ca 100644
> --- a/hw/i386/xen/meson.build
> +++ b/hw/i386/xen/meson.build
> @@ -1,6 +1,5 @@
>   i386_ss.add(when: 'CONFIG_XEN', if_true: files(
>     'xen-hvm.c',
> -  'xen-mapcache.c',
>     'xen_apic.c',
>     'xen_platform.c',
>     'xen_pvdevice.c',
> diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
> index 5d6be61090..a0c89d91c4 100644
> --- a/hw/i386/xen/trace-events
> +++ b/hw/i386/xen/trace-events
> @@ -21,8 +21,3 @@ xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
>   cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
>   cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
>   
> -# xen-mapcache.c
> -xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
> -xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> -xen_map_cache_return(void* ptr) "%p"
> -
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index ae0ace3046..19d0637c46 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -22,3 +22,7 @@ else
>   endif
>   
>   specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
> +
> +xen_ss = ss.source_set()
> +
> +xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))

Curious as to why you couldn't just add this to the softmmu_ss list above?

   Paul

> diff --git a/hw/xen/trace-events b/hw/xen/trace-events
> index 3da3fd8348..2c8f238f42 100644
> --- a/hw/xen/trace-events
> +++ b/hw/xen/trace-events
> @@ -41,3 +41,8 @@ xs_node_vprintf(char *path, char *value) "%s %s"
>   xs_node_vscanf(char *path, char *value) "%s %s"
>   xs_node_watch(char *path) "%s"
>   xs_node_unwatch(char *path) "%s"
> +
> +# xen-mapcache.c
> +xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
> +xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> +xen_map_cache_return(void* ptr) "%p"
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> similarity index 100%
> rename from hw/i386/xen/xen-mapcache.c
> rename to hw/xen/xen-mapcache.c


