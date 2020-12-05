Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A02CFC2C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 17:52:08 +0100 (CET)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klan1-0003L3-UD
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 11:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klaUr-0001Zi-59
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:33:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klaUm-0005te-FT
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607185990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WqbYfAvoggupqUYMBpL6SLtS0M5JBkoN9Dq6RsZz8g=;
 b=gZvystr5sWWab/fdYS6Jmq7ciYVke5bcGrUeUIFTR3iFkH6UrJ/XhdlIaJI0E8DpswcTb4
 7654qlQ7GJBtEiMGmkGFqlX/DZSehJtnIzNReKQ/B1Qy3MBD8QmX3wWnimz4JT9hFJmqlm
 fIxBCi9iKXS6LKf5g9oyALe+JRw4n20=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-O3zseCOGOe-Kc20RRVzY8w-1; Sat, 05 Dec 2020 11:33:08 -0500
X-MC-Unique: O3zseCOGOe-Kc20RRVzY8w-1
Received: by mail-ed1-f70.google.com with SMTP id c24so3708926edx.2
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 08:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+WqbYfAvoggupqUYMBpL6SLtS0M5JBkoN9Dq6RsZz8g=;
 b=bpGsIjSw7Jmw0Hp2iYq0Z/opNnbD+TowtJumyix0ztxFTiu+35P0b4+czxsqj5VciQ
 dH+A0pRsu7Fjch4EA/eqQvWAokQVL5Azooq70k2Kf71YkJPcx3NOBCIn3Fj3XmMTaPU0
 fjYRV6BofrmSY++8hM/fF4OI/7I2z4NxwK2RwBWNaC3wYrYB23KfWpQvMVdFMNppGE+X
 ctRUq4FjyGEAlV/c9e1XkK2r23Yo2g54BtHx2xC67GSu04ZOCa+XQWYr+lCY0R0P2pYH
 09YKcrHQf6n6RAYzw+1cewEyJapSqyOu69TceV8h1+4VIX8dNW6efl2WxbpJM6Np1ONw
 RZVQ==
X-Gm-Message-State: AOAM5308RqQ3qeedQycXOwIJqL+kia1fp75jHMYNC+3CPkkRCaNuhE8Q
 eE12e3fhjoi95cvi4cuouPH2oFzULSFyv/7SqZQlBSHWk6SApLuNrIDAMorp1sk4mLhxlGHDiRw
 VQdioFaB86d7IrB4=
X-Received: by 2002:aa7:dbc3:: with SMTP id v3mr13269236edt.199.1607185986899; 
 Sat, 05 Dec 2020 08:33:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzg1PONICllyqZ2TiNp7yIZxYENW5qMCQemyVbfNhtv0RzHk5DZJOelBIjFLG8kL/u1EwVlgQ==
X-Received: by 2002:aa7:dbc3:: with SMTP id v3mr13269198edt.199.1607185986697; 
 Sat, 05 Dec 2020 08:33:06 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id d13sm5323231ejc.44.2020.12.05.08.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 08:33:05 -0800 (PST)
Subject: Re: [RFC v8 15/27] cpu: Introduce TCGCpuOperations struct
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201205161518.14365-1-cfontana@suse.de>
 <20201205161518.14365-16-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a03320de-f4f8-9b66-c160-d3cbbfe4b5ad@redhat.com>
Date: Sat, 5 Dec 2020 17:33:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201205161518.14365-16-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/5/20 5:15 PM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> The TCG-specific CPU methods will be moved to a separate struct,
> to make it easier to move accel-specific code outside generic CPU
> code in the future.  Start by moving tcg_initialize().
> 
> The new CPUClass.tcg_opts field may eventually become a pointer,
> but keep it an embedded struct for now, to make code conversion
> easier.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> [claudio: make the tcg code build for CONFIG_TCG only]
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS                     |  1 +
>  cpu.c                           |  6 +++++-
>  include/hw/core/cpu.h           |  9 ++++++++-
>  include/hw/core/tcg-cpu-ops.h   | 25 +++++++++++++++++++++++++
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  2 +-
>  target/avr/cpu.c                |  2 +-
>  target/cris/cpu.c               | 12 ++++++------
>  target/hppa/cpu.c               |  2 +-
>  target/i386/tcg-cpu.c           |  2 +-
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  2 +-
>  target/moxie/cpu.c              |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/ppc/translate_init.c.inc |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/tricore/cpu.c            |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  27 files changed, 67 insertions(+), 30 deletions(-)
>  create mode 100644 include/hw/core/tcg-cpu-ops.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53f2678d8..d876f504a6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1535,6 +1535,7 @@ F: qapi/machine.json
>  F: qapi/machine-target.json
>  F: include/hw/boards.h
>  F: include/hw/core/cpu.h
> +F: include/hw/core/tcg-cpu-ops.h
>  F: include/hw/cpu/cluster.h
>  F: include/sysemu/numa.h
>  T: git https://github.com/ehabkost/qemu.git machine-next
> diff --git a/cpu.c b/cpu.c
> index 0be5dcb6f3..27ad096cc4 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -174,14 +174,18 @@ void cpu_exec_initfn(CPUState *cpu)
>  void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cpu);
> +#ifdef CONFIG_TCG
>      static bool tcg_target_initialized;
> +#endif /* CONFIG_TCG */

Maybe worth extract as tcg_target_initialized() method.

>  
>      cpu_list_add(cpu);
>  
> +#ifdef CONFIG_TCG
>      if (tcg_enabled() && !tcg_target_initialized) {
>          tcg_target_initialized = true;
> -        cc->tcg_initialize();
> +        cc->tcg_ops.initialize();
>      }
> +#endif /* CONFIG_TCG */
>      tlb_init(cpu);
[...]


