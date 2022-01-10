Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097A489C3F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:34:55 +0100 (CET)
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6whC-00075K-2H
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:34:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6wda-0005mH-RL
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:31:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6wdX-0000Qy-Bg
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641828663;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAsOCNUk4gJy3xfkTWxDnJ/ocn/Hng6/ay6Zh+ITS5o=;
 b=T2mc/62GSKP3ieXzS7WSKU9qed2WVgtysOHeLH2QntQeEe3cIm8DX1Cz8BMsmIyi+B6Pqd
 Uli2ZyTieTL/o/DJ7IReZkHIDbB3fVEpmM2/sTTZKEbcg3C6pakDYWthUiYvvPj2YeirE1
 szHxWDHaCu4bRY6Yp5hubNCKyUuY/FA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-Rv_fiLLSOnekuqHcaR_YYA-1; Mon, 10 Jan 2022 10:31:01 -0500
X-MC-Unique: Rv_fiLLSOnekuqHcaR_YYA-1
Received: by mail-wm1-f69.google.com with SMTP id
 20-20020a05600c22d400b00349067fe7b7so163205wmg.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 07:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=hAsOCNUk4gJy3xfkTWxDnJ/ocn/Hng6/ay6Zh+ITS5o=;
 b=DzD3R7TNIA6MloednLEdGeYGu6iGxKSkNCmPXSEeIzzObUwku5TUOnTPXUCyQ67nrK
 rL78eY1uVAaIpGwvbAopB3D9n5zrkfnHV95wabX6r7+gyg+mH5rnwhHe5faHR+EpuQTX
 1BdqPnk4qwVjhpJ16/lN6LlpOTCF2VEDdyh3jMSznS/YbvyhDOe9M6CRHp5DQbGSAJlA
 S1NUlYzEWjURZNq/t+RlAxxiUBajmRMFTOipswi97kd5ubchaS9dF9/5JnGZ9cGgQGoG
 yzPW7rCl8Sf6Pd66faPN6wLyE74FRlN31e6Mgt2WIre1PkkHf8WYwy1TW65YnCds3O/O
 RQhw==
X-Gm-Message-State: AOAM5325KTidp52icoS/wXunGfIY7N0wLThahHB6JSF9/Ecz4zI+c9p4
 QC7Ml0sQ9NRWJuWaZoNDav3jFN4ojQAyLhMLyeldiXCfQXP+ycGvE3hpQGr/7MuVTy8dj+LcqO9
 f6aVar2pnBdg19lE=
X-Received: by 2002:a05:600c:34c4:: with SMTP id
 d4mr22837834wmq.53.1641828660571; 
 Mon, 10 Jan 2022 07:31:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZ5PbKWG2o82UtfdwF8YlHmCQ3IAN9akDTuLFh8hqRxJQpStKQ1peYtx8PsS1Wl2ACmE2rXQ==
X-Received: by 2002:a05:600c:34c4:: with SMTP id
 d4mr22837815wmq.53.1641828660301; 
 Mon, 10 Jan 2022 07:31:00 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id g5sm7517121wrd.100.2022.01.10.07.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 07:30:59 -0800 (PST)
Subject: Re: [PATCH v4 3/6] hw/arm/virt: Honor highmem setting when computing
 the memory map
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20220107163324.2491209-1-maz@kernel.org>
 <20220107163324.2491209-4-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a72846d6-d559-9f12-154f-20c04821747e@redhat.com>
Date: Mon, 10 Jan 2022 16:30:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220107163324.2491209-4-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 1/7/22 5:33 PM, Marc Zyngier wrote:
> Even when the VM is configured with highmem=off, the highest_gpa
> field includes devices that are above the 4GiB limit.
> Similarily, nothing seem to check that the memory is within
> the limit set by the highmem=off option.
>
> This leads to failures in virt_kvm_type() on systems that have
> a crippled IPA range, as the reported IPA space is larger than
> what it should be.
>
> Instead, honor the user-specified limit to only use the devices
> at the lowest end of the spectrum, and fail if we have memory
> crossing the 4GiB limit.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4d1d629432..57c55e8a37 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1663,7 +1663,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  static void virt_set_memmap(VirtMachineState *vms)
>  {
>      MachineState *ms = MACHINE(vms);
> -    hwaddr base, device_memory_base, device_memory_size;
> +    hwaddr base, device_memory_base, device_memory_size, memtop;
>      int i;
>  
>      vms->memmap = extended_memmap;
> @@ -1690,7 +1690,11 @@ static void virt_set_memmap(VirtMachineState *vms)
>      device_memory_size = ms->maxram_size - ms->ram_size + ms->ram_slots * GiB;
>  
>      /* Base address of the high IO region */
> -    base = device_memory_base + ROUND_UP(device_memory_size, GiB);
> +    memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
> +    if (!vms->highmem && memtop > 4 * GiB) {
> +        error_report("highmem=off, but memory crosses the 4GiB limit\n");
> +        exit(EXIT_FAILURE);
> +    }
>      if (base < device_memory_base) {
>          error_report("maxmem/slots too huge");
>          exit(EXIT_FAILURE);
> @@ -1707,7 +1711,7 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i].size = size;
>          base += size;
>      }
> -    vms->highest_gpa = base - 1;
> +    vms->highest_gpa = (vms->highmem ? base : memtop) - 1;
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>          ms->device_memory->base = device_memory_base;


