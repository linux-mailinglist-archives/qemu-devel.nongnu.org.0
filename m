Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5C866DE6C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:13:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHlkr-0000Jg-O7; Tue, 17 Jan 2023 08:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHlkp-0000JN-7G
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:11:55 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHlkn-0006tO-M2
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:11:54 -0500
Received: by mail-wm1-x32c.google.com with SMTP id g10so22197017wmo.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 05:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+NWlPEpsogKNyJA9DIzI0yQQVVQnj8fWD1gAx12zKh8=;
 b=jopAmPfPq7+lzZagBSyVbJLWDA6Mbqu909XVFoJTk9QVf0A92ldAZpCQV0lgAOdnbt
 sR0PSxx0EvLL85A9cFm3UQdghi1AB+DOSwc6FzxdFvOE3tu2eBkcbqJIoKlWEzKO5qqL
 bQPLa2WqlQNkUWfx8NcZvO4wMvcsLi2pTHjY84uPvWJdGSOXAg+DGxqcrTIRd4nnO5ao
 MWlK4JU6bwC3K6U5xOFROq7gmEzxNpMeq7m/nhNt0crZJivo250uwu3x7Yob74GkZbHa
 D7EbAhgIheUPwXR4bp+6QzXxbtLcbhj2tTr2gCnA61bOQBumpAJuJdKIquq8o6ImLOQa
 8WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+NWlPEpsogKNyJA9DIzI0yQQVVQnj8fWD1gAx12zKh8=;
 b=zxl1UsNJ7lLfOjCZFTcMNUe4c/4wpk5Z3+UOz3wT8X4/e++gPbOWGD/Ca+TZZxvAzO
 xxtbHcis/vvAEKF2FJhF6dIvP0BQQeLRHmGiQWL2Ku2IrAf7PoueiNVwCLPbKDBAkzYI
 LOb63otLKqh8On0562W/ESWDAzBP1l53MSs4HL4Do9t0G+X3zvobuxg2/mIqVdOmaNPE
 2Od+PXSjctIirS9PzURGiB0BstlgTHE+PFTWGZVtcCZ7PpSvxOteZswE83hM0JOX6HCX
 DBsBrzI9RCMzS1C2YSm141WnKR1f26bF69judLvqysGLmN/jmNdsG4yUcIkGpqpcMfN+
 M7rQ==
X-Gm-Message-State: AFqh2kqVT8nN8v3TDqR893qpQAds9NgJhjppfebAvy8gr5stmQ+RY9bo
 FdznlwOEgGYKRdczfOec8+k=
X-Google-Smtp-Source: AMrXdXso/Mr7F4XAzKTG39lT3xGy1eMN7u90q/oFTVxUJ6IZFXO27UnbEEFF6Qt9mkAkeypRt6XVvQ==
X-Received: by 2002:a05:600c:4f83:b0:3db:eab:a600 with SMTP id
 n3-20020a05600c4f8300b003db0eaba600mr45651wmq.7.1673961112133; 
 Tue, 17 Jan 2023 05:11:52 -0800 (PST)
Received: from [192.168.8.108] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cfa622a18asm40542302wmb.3.2023.01.17.05.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 05:11:51 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c906ec10-5958-db2a-56af-67a39206dac0@xen.org>
Date: Tue, 17 Jan 2023 13:11:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 27/51] i386/xen: Add support for Xen event channel
 delivery to vCPU
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-28-dwmw2@infradead.org>
 <823d166c-a00e-6c46-a8e9-eb8734200401@xen.org>
 <12e20660f2c7bbe6f667650618254b06175b451a.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <12e20660f2c7bbe6f667650618254b06175b451a.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/01/2023 12:31, David Woodhouse wrote:
> On Tue, 2023-01-17 at 11:11 +0000, Paul Durrant wrote:
>>
>> Ick. Do we really want cross-block gotos? For me it would look a lot
>> nicer if you did a forward jump here and later and put the label+code
>> after the `return 0`.
> 
> How's this?

 From my PoV, much better. Thanks.

> 
> static int set_vcpu_info(CPUState *cs, uint64_t gpa)
> {
>      X86CPU *cpu = X86_CPU(cs);
>      CPUX86State *env = &cpu->env;
>      MemoryRegionSection mrs = { .mr = NULL };
>      void *vcpu_info_hva = NULL;
>      int ret;
> 
>      ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
>      if (ret || gpa == INVALID_GPA) {
>          goto out;
>      }
> 
>      mrs = memory_region_find(get_system_memory(), gpa, sizeof(struct vcpu_info));
>      if (!mrs.mr) {
>          ret = -EINVAL;
>      } else if (!mrs.mr->ram_block || mrs.size < sizeof(struct vcpu_info) ||
>                 !(vcpu_info_hva = qemu_map_ram_ptr(mrs.mr->ram_block,
>                                                    mrs.offset_within_region))) {
>          ret = -EINVAL;
>          memory_region_unref(mrs.mr);
>          mrs.mr = NULL;
>      }
> 
>   out:
>      if (env->xen_vcpu_info_mr) {
>          memory_region_unref(env->xen_vcpu_info_mr);
>      }
>      env->xen_vcpu_info_hva = vcpu_info_hva;
>      env->xen_vcpu_info_mr = mrs.mr;
>      return ret;
> }
> 
> 


