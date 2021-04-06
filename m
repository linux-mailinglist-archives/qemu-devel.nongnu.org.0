Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6123E355575
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 15:42:03 +0200 (CEST)
Received: from localhost ([::1]:50200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTlxy-0006p4-FI
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 09:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTlwq-0005xr-2M
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTlwo-0008HQ-39
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617716449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TrcoiUUAp7NEJDlMpxHZ47jrZdgxdqg13qNV9sRPQ8=;
 b=XxMrnAEf/+VOQzLj9vNs7q/Vsov3OWQ/Aeb68sG1c4Mc/stG8sdwDa3bfywYCSx2Jgbv4L
 ielNsDwe7YPpi5oBXASOhPEfyXotyYGX3BRB9STu+1idZtzZgAM6/Zs4rT/THRswIIi2DO
 qvxhEVxu5fhjfxVcaeHHw8LHJ9lTR30=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-pKYPTJrMNaWpfvATmayBiQ-1; Tue, 06 Apr 2021 09:40:45 -0400
X-MC-Unique: pKYPTJrMNaWpfvATmayBiQ-1
Received: by mail-ej1-f71.google.com with SMTP id k26so1873459ejs.5
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 06:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7TrcoiUUAp7NEJDlMpxHZ47jrZdgxdqg13qNV9sRPQ8=;
 b=G3vW7yvab/Ugw1xdDhCEUPPaa5zObhzwXBlUY8f+zw1q8BJpDCNvtRtxkhr93MzGsw
 6ERnFWbSL/gCxIrpzTztXp4EWtitjyH/U3FIG1GQdDmaVXgtvNo01y4gBSqfn46CQP+C
 AtkIAZ7mIOh09lZSx07a9/MsV02SmCXHV//8km2p7+96FprBtPd8YV6M2k4FY49q6XtH
 CQvPJdbP2EFu9kYeQ8yfGB+cZ7/0+IAd2oxCw7UBLXRCHfWn57zJzMie6seJYU1r8bHj
 TMR6hFSBnYmiJTkpTwxasE4TlqzKKy0VGgA9y88Pc86mn3oy2gQD12BVPQPDtkYKjp5Z
 Lm5A==
X-Gm-Message-State: AOAM530aKI66pJ2LgJOPTBniTnv3s4D2AOAcKViUj9rNHfhJZMAcbkJT
 HTbawxKVhAVX9YEYACkOEyY7HpbYD2YTsYTap2fDqM/MQsfr3lFOXMXVzlZOGCm1toWNX52Ylzr
 MSa/o3beFdGf6AmA=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr33832889ejh.4.1617716444756; 
 Tue, 06 Apr 2021 06:40:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRJOGILaGh3XWabWiVyMxD0dUm7s9XLTUTOTCY+X7qiMeGDLqWeR7rGkZhB75/OI1LJXuqzg==
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr33832877ejh.4.1617716444630; 
 Tue, 06 Apr 2021 06:40:44 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id gg5sm6120747ejb.93.2021.04.06.06.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 06:40:44 -0700 (PDT)
Subject: Re: [PATCH-for-6.0] hw/mem/meson: Fix linking sparse-mem device with
 fuzzer
To: qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>
References: <20210406133944.4193691-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <587827a0-838b-4ed4-d6aa-5c11b0389067@redhat.com>
Date: Tue, 6 Apr 2021 15:40:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210406133944.4193691-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Darren Kenny <darren.kenny@oracle.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Alex

On 4/6/21 3:39 PM, Philippe Mathieu-Daudé wrote:
> sparse-mem.c is added to the 'mem_ss' source set, which itself
> is conditionally added to softmmu_ss if CONFIG_MEM_DEVICE is
> selected.
> But if CONFIG_MEM_DEVICE isn't selected, we get a link failure
> even if CONFIG_FUZZ is selected:
> 
>   /usr/bin/ld: tests_qtest_fuzz_generic_fuzz.c.o: in function `generic_pre_fuzz':
>   tests/qtest/fuzz/generic_fuzz.c:826: undefined reference to `sparse_mem_init'
>   clang-10: error: linker command failed with exit code 1 (use -v to see invocation)
> 
> Fix by adding sparse-mem.c directly to the softmmu_ss set.
> 
> Fixes: 230376d285b ("memory: add a sparse memory device for fuzzing")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/mem/meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index ef79e046787..3c8fdef9f9e 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -1,8 +1,9 @@
>  mem_ss = ss.source_set()
>  mem_ss.add(files('memory-device.c'))
> -mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
>  
>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
> +
> +softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
> 


