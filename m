Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F8865777E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 15:07:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAX41-0003U3-81; Wed, 28 Dec 2022 09:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAX3z-0003TH-9h
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 09:05:47 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAX3x-0000sl-I5
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 09:05:47 -0500
Received: by mail-ej1-x632.google.com with SMTP id qk9so38592095ejc.3
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 06:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qa1Un2aD6MzOChXpW2lvo7PrB2fYJUYolba5PD+0kxU=;
 b=bgdgeIEN0ymgrgBkrlPWoAACMkGVFu3yQCTxD1XFVC/9Bm1nMbIWaE65ImRQnmVORk
 YivS6/NCdAIcbx+eHLaJNfJj2UF8VSmTTZhl8/K8Sb+cJFhm+7lbAGgiXiUd0A8+5a8R
 vIBOoaF9cGZkaDaSuPAZNksQeewxwYr2XCJ7YPZXT6DyDX73EggMCwcoLKDguPpW6oLQ
 R4w4l4Za6UdBmkJlTWFY4jSqein+5h7XVU+hPxZ9aMlvcIV25x1J1/FJ9D/8VsNrKpOo
 7mgRj2IkOPASy2ur//3aRBQp1jadZN78WsyW56joBTMomDVPfZaEiCKO+MjEtVRJ13xL
 sEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qa1Un2aD6MzOChXpW2lvo7PrB2fYJUYolba5PD+0kxU=;
 b=ruOWQE+9WesYcUYy8c409smce3rj03MQ2ChqpYBDJ9lr75jM05DpZbCS/0ohD4MbMV
 GUv0PT+bh60qzfjlNgIus8J8sNicoizxwQXOKPiwxU+N/B+VCYsdPBkH2/YkrfzxoLEC
 sLXiu/IWT+Lmq33f5nJ7CNeRp412rjUs7M52jFADSPjiSJK4cO8l7M9NOhLrrXie8aCO
 11xg5EQ/xEiAFaZW45Ev4gkb6nETFyHFqmq72pbS/wQKkUYYGepVTJrvrMLbIPVzAuMm
 Gg2qRlsm1lvTd46ZqqceNG4zXRlkJXvtAUFZy8nyuXRGLRGCGvqqJJ/e8RFPkyJ3gXo9
 LE0A==
X-Gm-Message-State: AFqh2kpiIPIC5+IMqpuEMIxUc7sGYMd4dgrRuo2pGQWEpK2FOqWnXoRH
 nUMN0cSlNo5x0fmGiM6MYnKokw==
X-Google-Smtp-Source: AMrXdXvInCyxWng1spL2lajh1TX2U28tgdxPwTbUS+oJTeLxMkgde1znoo+79B+GZpG03BEObk+x4Q==
X-Received: by 2002:a17:907:214d:b0:837:4378:dbd6 with SMTP id
 rk13-20020a170907214d00b008374378dbd6mr21853776ejb.22.1672236333905; 
 Wed, 28 Dec 2022 06:05:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003c701c12a17sm27698540wmc.12.2022.12.28.06.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 06:05:33 -0800 (PST)
Message-ID: <8a2fb7aa-316d-b6bc-1e8d-da5678008825@linaro.org>
Date: Wed, 28 Dec 2022 15:05:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 10/12] virtio-mem: Fix typo in
 virito_mem_intersect_memory_section() function name
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hui Zhu <teawater@gmail.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>,
 kvm@vger.kernel.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-11-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20211027124531.57561-11-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/10/21 14:45, David Hildenbrand wrote:
> It's "virtio", not "virito".
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/virtio/virtio-mem.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index d5a578142b..0f5eae4a7e 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -177,7 +177,7 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
>    *
>    * Returns false if the intersection is empty, otherwise returns true.
>    */
> -static bool virito_mem_intersect_memory_section(MemoryRegionSection *s,
> +static bool virtio_mem_intersect_memory_section(MemoryRegionSection *s,
>                                                   uint64_t offset, uint64_t size)
>   {
>       uint64_t start = MAX(s->offset_within_region, offset);
> @@ -215,7 +215,7 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
>                                         first_bit + 1) - 1;
>           size = (last_bit - first_bit + 1) * vmem->block_size;
>   
> -        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
> +        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
>               break;
>           }
>           ret = cb(&tmp, arg);
> @@ -247,7 +247,7 @@ static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
>                                    first_bit + 1) - 1;
>           size = (last_bit - first_bit + 1) * vmem->block_size;
>   
> -        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
> +        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
>               break;
>           }
>           ret = cb(&tmp, arg);
> @@ -283,7 +283,7 @@ static void virtio_mem_notify_unplug(VirtIOMEM *vmem, uint64_t offset,
>       QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
>           MemoryRegionSection tmp = *rdl->section;
>   
> -        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
> +        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
>               continue;
>           }
>           rdl->notify_discard(rdl, &tmp);
> @@ -299,7 +299,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
>       QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
>           MemoryRegionSection tmp = *rdl->section;
>   
> -        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
> +        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
>               continue;
>           }
>           ret = rdl->notify_populate(rdl, &tmp);
> @@ -316,7 +316,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
>               if (rdl2 == rdl) {
>                   break;
>               }
> -            if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
> +            if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
>                   continue;
>               }
>               rdl2->notify_discard(rdl2, &tmp);


