Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55240A6C5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 08:40:50 +0200 (CEST)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ27d-00074C-7D
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 02:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ25x-0006Ll-QN
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ25w-0003cv-75
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631601543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ionTWrfNJj1tXs7Y8q6IiEvZHk9nXrh9rXCb4fAXEx4=;
 b=hfImdvhElaX7FwgtVNELaV1TDGDsdx5LSlfG0U39M2Uf2aELgcJkA+lDHGd+IDZYpRX09f
 R45enFHvEp81vs7Z704YFfZrfePnsce58IVhXRNhsemGY8iO7zecPfO45Qoi1+dM4zpFNc
 AZRRnTKnCDJnDaUmVwujG3fPv4CPX6U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-1ZH3IexjMIyoL7CplHixRA-1; Tue, 14 Sep 2021 02:39:02 -0400
X-MC-Unique: 1ZH3IexjMIyoL7CplHixRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so6014675wmj.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 23:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ionTWrfNJj1tXs7Y8q6IiEvZHk9nXrh9rXCb4fAXEx4=;
 b=uxqNgELl+ksNzmLU4sYMThlAo+hcNRHT4Rxb6WM61ZvAKC9lj3wPSJHDLjOvNPpx67
 CjqxXJNGkuyGhUm9mTmLgt/D48jak2YLyh7j2TVSvRy2g7dzm0m8Deyw98Wo0y+g7BiX
 9d6TH0kncQQi8i0Jt3GVu/oI9MbWBFeHSAiMbd3QwUsFxbIqKOy8ArwYc3Zr0+UbihKR
 zFsb3TtAVlKewDYBeMaYDV9u0nbNmwCGjHTQT+XNA0H4RgfmKKZoOiah/1dMMYVcSA7w
 rn1voXYZySmmkHpCmeQXFTDyfa0/422CWz4E5ZuB3/57BzVDjFBV1nMLmc/3H1t+Qmcs
 upYA==
X-Gm-Message-State: AOAM532PiDcsVeI1O2a7XhjJ+hKOkw3IPMYlGM+IqX1YxB/zzu4X617A
 jz8u/9dTvLRgoZrz6MTKuwx3S3frXH4XiIXwi3+zCNgT12g30LWQF10du+OkEL3+rUTNy/AvNx5
 iqCNCybMa08xHExo=
X-Received: by 2002:adf:ef07:: with SMTP id e7mr12292572wro.56.1631601541203; 
 Mon, 13 Sep 2021 23:39:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6sQCZs3K0rkogJbRc8cxjI5xF8tIwMd8qlhDq05NqOK/NU2HzfYzMa3ikpaLXFR+xEjJipg==
X-Received: by 2002:adf:ef07:: with SMTP id e7mr12292553wro.56.1631601540986; 
 Mon, 13 Sep 2021 23:39:00 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id m4sm11089764wrx.81.2021.09.13.23.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 23:39:00 -0700 (PDT)
Subject: Re: [PATCH v4 10/33] i386: Add get/set/migrate support for
 SGX_LEPUBKEYHASH MSRs
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-11-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7f81ee2f-1876-3f84-8415-51031e1fd887@redhat.com>
Date: Tue, 14 Sep 2021 08:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719112136.57018-11-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: seanjc@google.com, kai.huang@intel.com, eblake@redhat.com,
 jarkko@kernel.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 1:21 PM, Yang Zhong wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> On real hardware, on systems that supports SGX Launch Control, those
> MSRs are initialized to digest of Intel's signing key; on systems that
> don't support SGX Launch Control, those MSRs are not available but
> hardware always uses digest of Intel's signing key in EINIT.
> 
> KVM advertises SGX LC via CPUID if and only if the MSRs are writable.
> Unconditionally initialize those MSRs to digest of Intel's signing key
> when CPU is realized and reset to reflect the fact. This avoids
> potential bug in case kvm_arch_put_registers() is called before
> kvm_arch_get_registers() is called, in which case guest's virtual
> SGX_LEPUBKEYHASH MSRs will be set to 0, although KVM initializes those
> to digest of Intel's signing key by default, since KVM allows those MSRs
> to be updated by Qemu to support live migration.
> 
> Save/restore the SGX Launch Enclave Public Key Hash MSRs if SGX Launch
> Control (LC) is exposed to the guest. Likewise, migrate the MSRs if they
> are writable by the guest.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  target/i386/cpu.c     | 17 ++++++++++++++++-
>  target/i386/cpu.h     |  1 +
>  target/i386/kvm/kvm.c | 22 ++++++++++++++++++++++
>  target/i386/machine.c | 20 ++++++++++++++++++++
>  4 files changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 840f825431..cea4307930 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5673,6 +5673,16 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>      }
>  }
>  
> +#ifndef CONFIG_USER_ONLY
> +static void x86_cpu_set_sgxlepubkeyhash(CPUX86State *env)
> +{
> +    env->msr_ia32_sgxlepubkeyhash[0] = 0xa6053e051270b7acULL;
> +    env->msr_ia32_sgxlepubkeyhash[1] = 0x6cfbe8ba8b3b413dULL;
> +    env->msr_ia32_sgxlepubkeyhash[2] = 0xc4916d99f2b3735dULL;
> +    env->msr_ia32_sgxlepubkeyhash[3] = 0xd4f8c05909f9bb3bULL;
> +}
> +#endif

Maybe easier to move the #ifdef'ry inside the function.

Where these values come from btw?

> @@ -6186,6 +6198,10 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>             & CPUID_EXT2_AMD_ALIASES);
>      }
>  
> +#ifndef CONFIG_USER_ONLY
> +    x86_cpu_set_sgxlepubkeyhash(env);
> +#endif
> +


