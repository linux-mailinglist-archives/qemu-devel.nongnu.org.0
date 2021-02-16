Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E0C31C940
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:03:24 +0100 (CET)
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBy8Z-0005wz-9n
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBy3X-0001B7-KV
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:58:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBy3U-0002T0-Dh
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613473087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcP1DWBBhVEvVNfnZqc7ic8eb0Ha38zZB1Fv1bje9Sc=;
 b=ihnuYFD+vbmOkM1RRk7lzKE2pLxlRoF7wI8MpK4wKSd2oak9cwJT+o/mySfXCfUMEsVqZR
 a+EudJKERoKcJ/QfrN6prd4jkXUD6O9dpjNdMJCJTpbDLTBp5/XZFOE8WbY2tzAfAfWdnX
 WjAdKF1qs/52ncOsdCv2ZhH2VtkqvD0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-ONcYVwxSPWKaHvs-9wYY8g-1; Tue, 16 Feb 2021 05:58:05 -0500
X-MC-Unique: ONcYVwxSPWKaHvs-9wYY8g-1
Received: by mail-ej1-f69.google.com with SMTP id hx26so5771149ejc.3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 02:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mcP1DWBBhVEvVNfnZqc7ic8eb0Ha38zZB1Fv1bje9Sc=;
 b=D+9XyPVwIpQM3UuG1+wLF01y/OtvJL6jHwlXa+92Bu7JBGQ7/8wm3gfdBtZB1O1jPL
 /PTq334LkfBqSaDf7lO55tj0Fk6maXCY7/VOHKsI581gTnmccAcTj0jbQEo2xG6UND01
 YjDp2Xn36hyd+Y29UQEZHuKpsPINt8e0+3Jb28R80vQ4FBH8Mhoq/4e67sxl+OH1y9ZM
 RbIIy6NDQxHfe9sB1y3OMievMAoMEiA2jSCNlLt+XnUI8VPvuoOc+vxUXAGvfJu1BATb
 55KTJjY4dDmQpk3665uix783pwhV9MfSvDTY40Nk1duwD5yHQLteweRkdfB9TFwyuzEe
 Xh3w==
X-Gm-Message-State: AOAM530VBXymj9ErdfOHXANJTN4VhFmUXOt1w18jqrSdFhQbqa7biymB
 4Hr1V+We0yJla7EuCiwXA2jXGLvm8wemJ6mYbJxD3r87W/c1GKhwB4Ln91JRbNCXiZ1SAH9D0nP
 oeoIvGRz6Y/MZAsDUVZYRqt1+swTX5TESsVqwGm9mRA7lPmBEFIh/5SiNuAoX0gZozfY=
X-Received: by 2002:a05:6402:497:: with SMTP id
 k23mr20062755edv.315.1613473083762; 
 Tue, 16 Feb 2021 02:58:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfAxBwbdbn4Go8n1VzBrfEH2hHsmdbw9Dk1xmE3L6RdnlzDi3Dlw8KE2ExbCqrj6LKwYRW0A==
X-Received: by 2002:a05:6402:497:: with SMTP id
 k23mr20062728edv.315.1613473083409; 
 Tue, 16 Feb 2021 02:58:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y22sm4942359ejq.122.2021.02.16.02.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 02:58:02 -0800 (PST)
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210216104647.13400-1-cfontana@suse.de>
 <20210216104647.13400-14-cfontana@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v19 13/15] i386: slit svm_helper into softmmu and stub-only
 user
Message-ID: <73ca44b0-7183-c2cc-b716-914e0d521c30@redhat.com>
Date: Tue, 16 Feb 2021 11:58:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210216104647.13400-14-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/21 11:46, Claudio Fontana wrote:
> XXX Should we assert that cpu hidden flag SVME is not set,
> when attempting to generate VMRUN and related instructions
> in CONFIG_USER_ONLY?
> 
> XXX Similarily, should we check for CONFIG_USER_ONLY when
> attempting to cpu_load_efer?

You can leave it like this for now.  But really everything that requires 
s->cpl == 0 should be impossible to trigger from user-mode emulation.

So I would add something like

static bool check_cpl0(DisasContext *s)
{
     int cpl = s->cpl;
#ifdef CONFIG_USER_ONLY
     assert(cpl == 3);
#endif
     if (cpl != 0) {
         gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
         return false;
     }
     return true;
}

and this should be enough, together with

     if (!check_cpl0(s)) {
         break;
     }

for the compiler to treat all the calls to SVM helpers as dead code and 
eliminate them.  This can be done later though, maybe add a note in the 
commit message.

Thanks,

Paolo

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/{ => softmmu}/svm_helper.c | 62 +-----------------
>   target/i386/tcg/user/svm_stubs.c           | 76 ++++++++++++++++++++++
>   target/i386/tcg/meson.build                |  1 -
>   target/i386/tcg/softmmu/meson.build        |  1 +
>   target/i386/tcg/user/meson.build           |  1 +
>   5 files changed, 80 insertions(+), 61 deletions(-)
>   rename target/i386/tcg/{ => softmmu}/svm_helper.c (96%)
>   create mode 100644 target/i386/tcg/user/svm_stubs.c
> 
> diff --git a/target/i386/tcg/svm_helper.c b/target/i386/tcg/softmmu/svm_helper.c
> similarity index 96%
> rename from target/i386/tcg/svm_helper.c
> rename to target/i386/tcg/softmmu/svm_helper.c
> index 097bb9b83d..a2c9819330 100644
> --- a/target/i386/tcg/svm_helper.c
> +++ b/target/i386/tcg/softmmu/svm_helper.c
> @@ -1,5 +1,5 @@
>   /*
> - *  x86 SVM helpers
> + *  x86 SVM helpers (softmmu-only)
>    *
>    *  Copyright (c) 2003 Fabrice Bellard
>    *
> @@ -22,66 +22,10 @@
>   #include "exec/helper-proto.h"
>   #include "exec/exec-all.h"
>   #include "exec/cpu_ldst.h"
> -#include "helper-tcg.h"
> +#include "tcg/helper-tcg.h"
>   
>   /* Secure Virtual Machine helpers */
>   
> -#if defined(CONFIG_USER_ONLY)
> -
> -void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
> -{
> -}
> -
> -void helper_vmmcall(CPUX86State *env)
> -{
> -}
> -
> -void helper_vmload(CPUX86State *env, int aflag)
> -{
> -}
> -
> -void helper_vmsave(CPUX86State *env, int aflag)
> -{
> -}
> -
> -void helper_stgi(CPUX86State *env)
> -{
> -}
> -
> -void helper_clgi(CPUX86State *env)
> -{
> -}
> -
> -void helper_skinit(CPUX86State *env)
> -{
> -}
> -
> -void helper_invlpga(CPUX86State *env, int aflag)
> -{
> -}
> -
> -void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code, uint64_t exit_info_1,
> -                uintptr_t retaddr)
> -{
> -    assert(0);
> -}
> -
> -void helper_svm_check_intercept_param(CPUX86State *env, uint32_t type,
> -                                      uint64_t param)
> -{
> -}
> -
> -void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
> -                                   uint64_t param, uintptr_t retaddr)
> -{
> -}
> -
> -void helper_svm_check_io(CPUX86State *env, uint32_t port, uint32_t param,
> -                         uint32_t next_eip_addend)
> -{
> -}
> -#else
> -
>   static inline void svm_save_seg(CPUX86State *env, hwaddr addr,
>                                   const SegmentCache *sc)
>   {
> @@ -797,5 +741,3 @@ void do_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1)
>          host's code segment or non-canonical (in the case of long mode), a
>          #GP fault is delivered inside the host. */
>   }
> -
> -#endif
> diff --git a/target/i386/tcg/user/svm_stubs.c b/target/i386/tcg/user/svm_stubs.c
> new file mode 100644
> index 0000000000..97528b56ad
> --- /dev/null
> +++ b/target/i386/tcg/user/svm_stubs.c
> @@ -0,0 +1,76 @@
> +/*
> + *  x86 SVM helpers (user-mode)
> + *
> + *  Copyright (c) 2003 Fabrice Bellard
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/helper-proto.h"
> +#include "tcg/helper-tcg.h"
> +
> +void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
> +{
> +}
> +
> +void helper_vmmcall(CPUX86State *env)
> +{
> +}
> +
> +void helper_vmload(CPUX86State *env, int aflag)
> +{
> +}
> +
> +void helper_vmsave(CPUX86State *env, int aflag)
> +{
> +}
> +
> +void helper_stgi(CPUX86State *env)
> +{
> +}
> +
> +void helper_clgi(CPUX86State *env)
> +{
> +}
> +
> +void helper_skinit(CPUX86State *env)
> +{
> +}
> +
> +void helper_invlpga(CPUX86State *env, int aflag)
> +{
> +}
> +
> +void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code, uint64_t exit_info_1,
> +                uintptr_t retaddr)
> +{
> +    assert(0);
> +}
> +
> +void helper_svm_check_intercept_param(CPUX86State *env, uint32_t type,
> +                                      uint64_t param)
> +{
> +}
> +
> +void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
> +                                   uint64_t param, uintptr_t retaddr)
> +{
> +}
> +
> +void helper_svm_check_io(CPUX86State *env, uint32_t port, uint32_t param,
> +                         uint32_t next_eip_addend)
> +{
> +}
> diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
> index ec5daa1edc..6fbac2f240 100644
> --- a/target/i386/tcg/meson.build
> +++ b/target/i386/tcg/meson.build
> @@ -8,7 +8,6 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
>     'misc_helper.c',
>     'mpx_helper.c',
>     'seg_helper.c',
> -  'svm_helper.c',
>     'tcg-cpu.c',
>     'translate.c'), if_false: files('tcg-stub.c'))
>   
> diff --git a/target/i386/tcg/softmmu/meson.build b/target/i386/tcg/softmmu/meson.build
> index f84519a213..126528d0c9 100644
> --- a/target/i386/tcg/softmmu/meson.build
> +++ b/target/i386/tcg/softmmu/meson.build
> @@ -5,4 +5,5 @@ i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
>     'bpt_helper.c',
>     'misc_helper.c',
>     'fpu_helper.c',
> +  'svm_helper.c',
>   ))
> diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
> index 30eec3f5a4..c540ca2174 100644
> --- a/target/i386/tcg/user/meson.build
> +++ b/target/i386/tcg/user/meson.build
> @@ -2,4 +2,5 @@ i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
>     'excp_helper.c',
>     'misc_helper.c',
>     'fpu_helper.c',
> +  'svm_stubs.c',
>   ))
> 


