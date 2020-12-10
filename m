Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364BD2D5CBA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:04:56 +0100 (CET)
Received: from localhost ([::1]:44874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMYx-0002CU-2m
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLXu-0001oV-SW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:59:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLXp-0003oh-It
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607605178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjAFLsdsIJSoZqRmTT/hg1Lsggo/twaabBmmCaZLVwA=;
 b=LdFGUM2xTqXrMXVuqvxTlxKIlkSUIrYQr5ePCvG4Lbh/kH7x3+SdbZ6vbfEQP4vUpZyZ1P
 XDKuCvRrIitZrOt0G+S7rIGY0dYHON/tc2a6S9buWLYBdMY7up930w4KTokVVyKwOpKHhl
 uAwywmnnlz3w4BGw6E0wjTOi9m++6Gk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-Q83ixYQCOf-VGZn4leftFw-1; Thu, 10 Dec 2020 07:59:36 -0500
X-MC-Unique: Q83ixYQCOf-VGZn4leftFw-1
Received: by mail-wr1-f70.google.com with SMTP id p18so1893791wro.9
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 04:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QjAFLsdsIJSoZqRmTT/hg1Lsggo/twaabBmmCaZLVwA=;
 b=CuMeLhMGr+aLdUhfj0wKbm6FFX2b5zXGrrK1JMb2/tQZfBBd/QMMMA+X8j4mKU2c6T
 I2s99m7pbyo4YKejgEgwfKtEB7wYsUSgSfswpu6Pm1NJKwPtci3dUVN+/Qy2I9QHitdp
 dUMLLZDfLnrPCsLOSx43LZb6Mv7Wh+ujHTmZoeno9CgXqnZ5VfP1ZecAInoclYAPtIpZ
 xkGVgbdH82pDVqY5q9/W98XzZdcZVOxtcjr/moWVE8gq+XKlu7XzUx4F6gnjBb8pSJuW
 Em6N8vC0oTkvAOV7x0ZWjNQVeXgftAInDk2Hls/2UnR5gCrmf2gZAY2qDFeyeaTrBpVR
 BCOw==
X-Gm-Message-State: AOAM533ZzFbh3M1o/GILNARfzmRNohdLmHLCyK31UZKCFgieygWrmLvE
 PT5W+8d6FvWl0g9CtLrJhV7PqKLigL8nfrKR6+SUWi1Nod7FOvDkXzQUqcX/CUaJW53/2cYyq9U
 HwHz2iIJwj/sWug4=
X-Received: by 2002:a7b:cb84:: with SMTP id m4mr8118970wmi.157.1607605175745; 
 Thu, 10 Dec 2020 04:59:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8k4DTyyDz5ywkDD5Dw3/a32ddNVQILxxblk+fPw2Gi85GlbhkR89gaQtplH4l0evBfGrX0g==
X-Received: by 2002:a7b:cb84:: with SMTP id m4mr8118935wmi.157.1607605175574; 
 Thu, 10 Dec 2020 04:59:35 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b4sm9070341wrr.30.2020.12.10.04.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 04:59:34 -0800 (PST)
Subject: Re: [PATCH v10 24/32] cpu: move cc->transaction_failed to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201210121226.19822-1-cfontana@suse.de>
 <20201210121226.19822-25-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a6f8dc47-1065-e744-4119-3fa67238a687@redhat.com>
Date: Thu, 10 Dec 2020 13:59:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210121226.19822-25-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 1:12 PM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/cpu.h         | 18 +++++++-----------
>  include/hw/core/tcg-cpu-ops.h | 10 ++++++++++
>  hw/mips/jazz.c                |  9 +++++++--
>  target/alpha/cpu.c            |  2 +-
>  target/arm/cpu.c              |  4 ++--
>  target/m68k/cpu.c             |  2 +-
>  target/microblaze/cpu.c       |  2 +-
>  target/mips/cpu.c             |  2 +-
>  target/riscv/cpu.c            |  2 +-
>  target/sparc/cpu.c            |  2 +-
>  target/xtensa/cpu.c           |  2 +-
>  11 files changed, 33 insertions(+), 22 deletions(-)
...

> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index a7387b5c39..3cc2733410 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -11,6 +11,7 @@
>  #define TCG_CPU_OPS_H
>  
>  #include "hw/core/cpu.h"
> +#include "exec/memattrs.h"
>  
>  /**
>   * struct TcgCpuOperations: TCG operations specific to a CPU class
> @@ -41,6 +42,15 @@ typedef struct TcgCpuOperations {
>      /** @do_interrupt: Callback for interrupt handling. */
>      void (*do_interrupt)(CPUState *cpu);
>  

Do we want to restrict this handler to system-mode?

#ifdef CONFIG_SOFTMMU

> +    /**
> +     * @do_transaction_failed: Callback for handling failed memory transactions
> +     * (ie bus faults or external aborts; not MMU faults)
> +     */
> +    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
> +                                  unsigned size, MMUAccessType access_type,
> +                                  int mmu_idx, MemTxAttrs attrs,
> +                                  MemTxResult response, uintptr_t retaddr);

#endif

>      /**
>       * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
>       *
...


