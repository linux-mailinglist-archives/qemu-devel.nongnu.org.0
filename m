Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72EC5F5416
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 13:58:20 +0200 (CEST)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og32Z-00027f-Km
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 07:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1og2yq-0008VP-GL
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 07:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1og2yo-0002fC-4y
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 07:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664970864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNSB7u7S7DM2z4JeNI1ixVq5EHPj/CnyKegZaT3nBL4=;
 b=F3rwkI9XXGEgiXIyuq5y3VOxrFTiYNX/UF9/Reor66s56+ZLYqCBT1Wto5FeWLCqXIzMeL
 Jj0msx8PAiQMY9s7dTQwrOhodGLAjtzhs2Dc2U0HzpXKUFQtcsXrz2254h8P6dO84zvcex
 5NJXd/m60fNPF64+jG115saSNslnY1E=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-XQa6P8HRPJipERcpWtjMsg-1; Wed, 05 Oct 2022 07:54:23 -0400
X-MC-Unique: XQa6P8HRPJipERcpWtjMsg-1
Received: by mail-qt1-f199.google.com with SMTP id
 l11-20020ac848cb000000b0038f4394d93aso1604934qtr.21
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 04:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cNSB7u7S7DM2z4JeNI1ixVq5EHPj/CnyKegZaT3nBL4=;
 b=x0bByNxmy+QqwbpWHKybY/gC9pfMHDQqKN99aQCR66B1/5BbIEAtq3dPtbYkxUTHts
 ylM9Kw8sXgj2qRp3TuLGFVD6dqmNwiLJuKCikR3MUVTWJJKXZuXrg/OQEvXjoAzoZ3Cs
 0QVb77hkZtu0rKCMfzzDfq2TVA5BvGEtiwnH/iSFadAS8f5xJSB7mqwk1nhw93RHIskH
 O/fmLIJA1LHzeMZEK92OisNOvwPlaKy9C10zWNyY7p+ltUGaWuJarbPx1jWTK6HI/v5y
 SpgvyKNgUxC8QDgj6PRJ11usB/qx6gjzp0pfs2Lhav07kXdxVl4o2qeoqXKyp+CvlE2a
 ej+Q==
X-Gm-Message-State: ACrzQf1j3ajhxgJRSAuau8xDIvDuoTzl63qqeK/2KcWrzj8pwipxM4Uc
 411oThu72UN6SRBc1Fj4C/iLi3sttM7Hr38/2asB3oMJqyfN2WN9h3fwYwh9wTTC+KwZMIEau+d
 gFnSAsdKOwCvLHwA=
X-Received: by 2002:a05:620a:269a:b0:6cf:3f0b:8fb4 with SMTP id
 c26-20020a05620a269a00b006cf3f0b8fb4mr19950071qkp.100.1664970862650; 
 Wed, 05 Oct 2022 04:54:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6gmYf7EgJVAT7DFz75r8qkT0l9l49m+D27vyJDK/u9si4nmnCVXUFrYUTihMu84p3VrP4YXA==
X-Received: by 2002:a05:620a:269a:b0:6cf:3f0b:8fb4 with SMTP id
 c26-20020a05620a269a00b006cf3f0b8fb4mr19950064qkp.100.1664970862427; 
 Wed, 05 Oct 2022 04:54:22 -0700 (PDT)
Received: from [172.20.5.108] (rrcs-66-57-248-11.midsouth.biz.rr.com.
 [66.57.248.11]) by smtp.googlemail.com with ESMTPSA id
 y20-20020ac87c94000000b0038cdc487886sm2511794qtv.80.2022.10.05.04.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 04:54:21 -0700 (PDT)
Message-ID: <432d57e3-7559-1fac-9397-2441358b131a@redhat.com>
Date: Wed, 5 Oct 2022 13:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/3] Add TCG & KVM support for MSR_CORE_THREAD_COUNT
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20221004225643.65036-1-agraf@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221004225643.65036-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.435, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 10/5/22 00:56, Alexander Graf wrote:
> Commit 027ac0cb516 ("target/i386/hvf: add rdmsr 35H
> MSR_CORE_THREAD_COUNT") added support for the MSR_CORE_THREAD_COUNT MSR
> to HVF. This MSR is mandatory to execute macOS when run with -cpu
> host,+hypervisor.
> 
> This patch set adds support for the very same MSR to TCG as well as
> KVM - as long as host KVM is recent enough to support MSR trapping.
> 
> With this support added, I can successfully execute macOS guests in
> KVM with an APFS enabled OVMF build, a valid applesmc plus OSK and
> 
>    -cpu Skylake-Client,+invtsc,+hypervisor
> 
> 
> Alex
> 
> Alexander Graf (3):
>    x86: Implement MSR_CORE_THREAD_COUNT MSR
>    i386: kvm: Add support for MSR filtering
>    KVM: x86: Implement MSR_CORE_THREAD_COUNT MSR
> 
>   target/i386/kvm/kvm.c                | 145 +++++++++++++++++++++++++++
>   target/i386/kvm/kvm_i386.h           |  11 ++
>   target/i386/tcg/sysemu/misc_helper.c |   5 +
>   3 files changed, 161 insertions(+)
> 

Queued, thanks!

Paolo


