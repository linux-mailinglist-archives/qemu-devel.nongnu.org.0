Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3034BDDE
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:07:48 +0200 (CEST)
Received: from localhost ([::1]:59786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZpD-00006x-2B
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZnX-00086r-6N
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:06:06 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:37504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZnS-0000Tq-EL
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:06:01 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so10167720otr.4
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dH5sG3RPIpIkTexiSGG8WQ8+fE1Vfl1F3m6wsRJId7E=;
 b=isI2XfExsjRpnblYQ5eX2A/01NwakAN7pNT1RJim469P4EQ6iI2zCtlLqVRkQMNC6B
 oyThf1BVPWqlBfTTYYph9lAzQYhrgGanaFkMkKYc7hPtP8Y5rd+KB4KzUOP2wDqVdfF7
 jPBPQdMY/LrwKH9M5Sw7EDhnBej9kUEBHEvuGucjCfSBnDKbjl/BtDp0zx+nENfH+Lt+
 Q17umrJitG/ShFAAs7QNE572Nks5BegTLe+6vPoUyLGMl9OM8UANn7xeBDDodey596V/
 YPlwGW4pX8R7PxmLYLdSJPChmRW4dLJOeX4hWzpGl//iKYp37YqfcQfstANE69wjEtpz
 g9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dH5sG3RPIpIkTexiSGG8WQ8+fE1Vfl1F3m6wsRJId7E=;
 b=SnxIM8BU3zBIotjAN4w5S9kq1/ril3uzpXoWgOjCHjwn4BtATbryyXyZ7f96O89dy9
 ogumjdlsgxkY7CADhz1svxH3D22S8NB9z5VuH9eJXpYRojCZJNg2cGGMt5Z5OqjY7IY4
 Wg/DmyuTJH/LJs+1Yh1/N5rF573UewHJaAGPMbd1AVC7nQjWLvCyfdUz2KEtqhsAuAZj
 NiWsDQy8iiBjAwv5PTk1f+hsOs9ah78V+nlhIGqHpjxHSKsWbJEjpzXcVmu7riGoFckY
 cj/2QPOQ2Wd6X8DG6YOQ3fjmFfjVQV75icw6oM6Jm+SP3RoIrDvct/LAwLVep5IWi8F7
 0KXg==
X-Gm-Message-State: AOAM5308pYvqgiIVP3tvcQGSaEGXbiGHhpXbPFVaBm3Fge5tRAw80HZD
 xDhG/roMty+AEkU9s8a1Sgos7w==
X-Google-Smtp-Source: ABdhPJyZNgNSOIwVYp+8eCN7SWh1i5zK+5Yc/JK6XIhEWt0DckpT3qGDaBwSbzvoU0DdjAknggN9tA==
X-Received: by 2002:a05:6830:1542:: with SMTP id
 l2mr18547480otp.95.1616954753616; 
 Sun, 28 Mar 2021 11:05:53 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id g13sm3778466otq.3.2021.03.28.11.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 11:05:53 -0700 (PDT)
Subject: Re: [RFC v12 50/65] target/arm: cpu-sve: new module
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-51-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a632184a-e2b3-d4ad-9eec-2f8b9738eed2@linaro.org>
Date: Sun, 28 Mar 2021 12:05:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-51-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> extract the SVE-related cpu object properties and functions,
> and move them to a separate module.
> 
> Disentangle SVE from pauth that is a separate, TCG-only feature.

Nit: pauth is not tcg-only, but the properties selecting the pauth hash are tcg 
only.  For kvm, you get whatever the hardware implements.

>   #ifdef TARGET_AARCH64
>   # define ARM_MAX_VQ    16
> -void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
> -void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
>   #else
>   # define ARM_MAX_VQ    1
> -static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
> -static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
> -#endif
> +#endif /* TARGET_AARCH64 */
>   
>   typedef struct ARMVectorReg {
>       uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
> @@ -219,10 +216,13 @@ typedef struct ARMPredicateReg {
>       uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
>   } ARMPredicateReg;
>   
> +void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
>   /* In AArch32 mode, PAC keys do not exist at all.  */
>   typedef struct ARMPACKey {
>       uint64_t lo, hi;
>   } ARMPACKey;
> +#else
> +static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
>   #endif

Also: you have not in fact disentangled anything.

You've merely moved the entanglement from one aarch64 block containing sve and 
pauth stuff, to another aarch64 block containing sve and pauth stuff.

> +void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)

Again with the move+rename in the same patch.  Don't.


r~

