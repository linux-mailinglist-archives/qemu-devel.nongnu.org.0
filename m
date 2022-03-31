Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8259B4EE409
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 00:29:46 +0200 (CEST)
Received: from localhost ([::1]:35970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na3IX-0004hl-LQ
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 18:29:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1na3Gf-0002zA-Sq
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 18:27:49 -0400
Received: from [2001:4860:4864:20::2c] (port=33210
 helo=mail-oa1-x2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1na3Gd-0002th-TV
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 18:27:49 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso884192fac.0
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 15:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LVxlZ4KUsPaFaxSO6OB7sdsS/+p/hhDDm4t7MuUYvoQ=;
 b=XL7jJbTlilbPA3i5mU+HP4V4vxM276hrPth7Sf3MH9qskK3OS8BW+jQ1jC7OBkwixv
 NsslEi7kRUWgVZelBOuikFpBHGvGVbzo6kvR/rj5g0MgE9VKqnVFzdRxWFkcnjENkuNh
 0JgsPu3JMnQ12U2e+vRUjsKMVnLB6RHWOamW8YLFo33r3cFB60xupT47aIC1qbP3f0jD
 lwPBMtIVDMPNeYL+oQOvbr9WYm0Y7rFMLI/DvxPmyfWUB3uVONaqvmzSzx5QuK43782F
 G9YG85UL9Dl6UswCNPeayr99HHwTbp2rOrASrYhZiK2C7aeGgqwd9KqQUQOW4pEx86EY
 xyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LVxlZ4KUsPaFaxSO6OB7sdsS/+p/hhDDm4t7MuUYvoQ=;
 b=OG1O1NJKez6i//MZCzbYOYXZxFAO/q9pqd3NkWmavQCyo6qHctifX0bnVhjbK8dpnN
 ZSc0OF3KrC/4GtM80DeMeLFxGwAgYrOUX/8AU0GI105NE6bxneVVHqdoUxjpcpvUybNW
 9NRlr/iD62gEBsmm2aVw3VmJmfeoVrQPmTkoPpJrDKxi5tLv7sWJdEwjoXypJvd1FaeG
 NJUyMEQs1UnIZPPKtatWQnwILdUuyXLB3F+JDyjU4TBefwQ3FPdhT7kcBM2aIPhGvXvU
 +7cUE5ja6UkrD/an1/BbuvBGxAYQ2mWxDIxuqg3ejNUwdJKqe0k6QiCEakbUnhMgO66T
 4JgA==
X-Gm-Message-State: AOAM530lGCz1eMpgORM769Q/U/2h4zSO6rYPFVuMx6kp45QmPrc9s5u8
 XI0Et50KTN/A2TaP34oGsJE=
X-Google-Smtp-Source: ABdhPJw67hueoKa6SnFEa70JAnBO6qVsLpl+Y1H0AneNGH4XmWZo6cZz4nl5l1ibK59HsR5La3yXcg==
X-Received: by 2002:a05:6870:42d2:b0:dd:a466:a201 with SMTP id
 z18-20020a05687042d200b000dda466a201mr3807124oah.269.1648765666225; 
 Thu, 31 Mar 2022 15:27:46 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:abe8:ed:2c78:ab0c:7946?
 ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 h83-20020aca3a56000000b002ece47dce52sm304004oia.26.2022.03.31.15.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 15:27:45 -0700 (PDT)
Message-ID: <126b1d8d-2170-d6bc-9d36-f8aa3a67ab63@gmail.com>
Date: Thu, 31 Mar 2022 19:27:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: use of uninitialized variable involving visit_type_uint32() and
 friends
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2c
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/31/22 14:35, Peter Maydell wrote:
> Coverity warns about use of uninitialized data in what seems
> to be a common pattern of use of visit_type_uint32() and similar
> functions. Here's an example from target/arm/cpu64.c:
> 
> static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
>                                     void *opaque, Error **errp)
> {
>      ARMCPU *cpu = ARM_CPU(obj);
>      uint32_t max_vq;
> 
>      if (!visit_type_uint32(v, name, &max_vq, errp)) {
>          return;
>      }
> 
>      [code that does something with max_vq here]
> }
> 
> This doesn't initialize max_vq, on the apparent assumption
> that visit_type_uint32() will do so. But that function is:
> 
> 
> bool visit_type_uint32(Visitor *v, const char *name, uint32_t *obj,
>                         Error **errp)
> {
>      uint64_t value;
>      bool ok;
> 
>      trace_visit_type_uint32(v, name, obj);
>      value = *obj;
>      ok = visit_type_uintN(v, &value, name, UINT32_MAX, "uint32_t", errp);
>      *obj = value;
>      return ok;
> }
> 
> So it reads the value of *obj (the uninitialized max_vq).
> 
> What's the right way to write this kind of object-property
> setter function? Just pre-initialize the variable to 0?


This reminds me of Valgrind ppc-related warnings I sent patches yesterday. In a
code like this:

(target/ppc/kvm.c)

  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
  {
     CPUState *cs = CPU(cpu);
     uint64_t lpcr;

     kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
     /* Do we need to modify the LPCR? */
     if (!!(lpcr & LPCR_LD) != !!enable) {

Valgrind complains of "Conditional jump or move depends on uninitialised value(s)"
because we're using 'lpcr' in the conditional and 'lpcr' isn't being initialized.
Valgrind doesn't seem to care that kvm_get_one_reg() might be writing 'lpcr'.
The fix I proposed consists of initializing the vars in these cases.


My suggestion in this case is to initialize 'max_vq' as well. Apparently these static
code analysis tools don't handle the "var being initialized by being passed as reference
to another function" scenarios.


Thanks,


Daniel



> 
> thanks
> -- PMM
> 

