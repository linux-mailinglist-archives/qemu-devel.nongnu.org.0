Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4EC4DDFA8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:12:39 +0100 (CET)
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVG9V-0006Eu-FB
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:12:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nVG8I-00054U-RY
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:11:22 -0400
Received: from [2607:f8b0:4864:20::634] (port=40471
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nVG8H-000701-5h
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:11:22 -0400
Received: by mail-pl1-x634.google.com with SMTP id h5so7442874plf.7
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 10:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xQt4nxSGPU+SWrpDFe8+9LX68lS5/Y6gNspZauNXIUs=;
 b=BKv5w7ZzqV0yDs+BE/tWbCStm2nbClE4dNAmmog6pNIHmhQHYkEHaGPQmvOsC/DM3h
 yQyTpWAenK+bIxdypy0Ts1T6q1ycOqsgLIyBjgV6FrZq1ulyk22tddpXPKL+6zB811W1
 ghsIadLd5dl4NFydecq4R84Ss5zL0X+wtdRaAkHbjn3fZwEiHkVEztUPNjoGdCLShjcL
 GveFESbkIlDUeFGv9OhzADtw1mLjPAyW4opukXBVzPapn3AN+ZAfS7q5Rw+aNea5GKvO
 oOEVzS+kNL4IkPR2KhZVpDi2WHzRQLYRYb5PLFYECFn+W4wtQhm7qFxdPZ5qak/AtFEb
 GRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xQt4nxSGPU+SWrpDFe8+9LX68lS5/Y6gNspZauNXIUs=;
 b=WiOE5J3lhOJEcDqy15vsF8LDBQGREI7zTRsSZJNYoeDnFsml7d6/+g0wPN3QAZVABy
 UJ2fZ0QAdkBD01HldEiN/moRBXb2wxK8FEzn3rTPYVBOe7Gcz7WXrhPAQplF2MpZ/0Jv
 985z2S3miuQaIEvCBRRj5a30RVNG8Nv8FjjqwXZhGpFWj8+C/ofstCfWlim9SqCHdlCN
 QrlKSNXsqHRAaVC1Oj8FcoTr3vN0hYfUQu769ziZ7Y0r3iyCz3EC/EnCxK8nqJMe+PaP
 9II6C+nskv5zDRxS5VMDzHT476NNjr0oBrg3+7qCmv0j1XeNPZCrPVUDICASSRFuAR8+
 fuwA==
X-Gm-Message-State: AOAM531KTUhsIPTdIw7J2uYF9a5cd93vYaVmsM1OA8c3COH3++zkWGZD
 IWx8NCX2453vt6gJTnyIAVc=
X-Google-Smtp-Source: ABdhPJyplph433Axs2Y4KyJvIqtdkGuf8AiLcHRl8fn6QSf5SJN+27zsxGmljbNKoHQMLr8iJnrjbQ==
X-Received: by 2002:a17:90b:4a11:b0:1bf:7fbe:258d with SMTP id
 kk17-20020a17090b4a1100b001bf7fbe258dmr23163463pjb.79.1647623479565; 
 Fri, 18 Mar 2022 10:11:19 -0700 (PDT)
Received: from localhost ([192.55.54.52]) by smtp.gmail.com with ESMTPSA id
 b2-20020a639302000000b003808dc4e133sm8157561pge.81.2022.03.18.10.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:11:19 -0700 (PDT)
Date: Fri, 18 Mar 2022 10:11:17 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 16/36] i386/tdx: Set kvm_readonly_mem_enabled to
 false for TDX VM
Message-ID: <20220318171117.GC4049379@ls.amr.corp.intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-17-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317135913.2166202-17-xiaoyao.li@intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 09:58:53PM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> TDX only supports readonly for shared memory but not for private memory.
> 
> In the view of QEMU, it has no idea whether a memslot is used by shared
> memory of private. Thus just mark kvm_readonly_mem_enabled to false to
> TDX VM for simplicity.
> 
> Note, pflash has dependency on readonly capability from KVM while TDX
> wants to reuse pflash interface to load TDVF (as OVMF). Excuse TDX VM
> for readonly check in pflash.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  hw/i386/pc_sysfw.c    | 2 +-
>  target/i386/kvm/tdx.c | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index c8b17af95353..75b34d02cb4f 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -245,7 +245,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
>          /* Machine property pflash0 not set, use ROM mode */
>          x86_bios_rom_init(MACHINE(pcms), "bios.bin", rom_memory, false);
>      } else {
> -        if (kvm_enabled() && !kvm_readonly_mem_enabled()) {
> +        if (kvm_enabled() && (!kvm_readonly_mem_enabled() && !is_tdx_vm())) {

Is this called before tdx_kvm_init()?

Thanks,


>              /*
>               * Older KVM cannot execute from device memory. So, flash
>               * memory cannot be used unless the readonly memory kvm
> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
> index 94a9c1ea7e9c..1bb8211e74e6 100644
> --- a/target/i386/kvm/tdx.c
> +++ b/target/i386/kvm/tdx.c
> @@ -115,6 +115,15 @@ int tdx_kvm_init(MachineState *ms, Error **errp)
>          get_tdx_capabilities();
>      }
>  
> +    /*
> +     * Set kvm_readonly_mem_allowed to false, because TDX only supports readonly
> +     * memory for shared memory but not for private memory. Besides, whether a
> +     * memslot is private or shared is not determined by QEMU.
> +     *
> +     * Thus, just mark readonly memory not supported for simplicity.
> +     */
> +    kvm_readonly_mem_allowed = false;
> +
>      tdx_guest = tdx;
>  
>      return 0;
> -- 
> 2.27.0
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

