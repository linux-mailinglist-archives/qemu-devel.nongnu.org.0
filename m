Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4DC319BE4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 10:31:52 +0100 (CET)
Received: from localhost ([::1]:55172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAUnn-0003TS-Sw
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 04:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lAUlq-0002vG-0R
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:29:50 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lAUlo-0007nN-6n
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:29:49 -0500
Received: by mail-wm1-x336.google.com with SMTP id u14so337935wmq.4
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 01:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=bH/UiGz0n9r8PxheOnVtGIxbVoV+xOs1HB5Wn6jPUFw=;
 b=XLoOPPHvxuLhzvbGlCQ2pG2ddl5GozX8c8gypeqgc0IWEYxXdHGZAWRCXDH/RKdO+P
 ziMgOhxgPuizshMzPZN8Vd2QAEHW0wWEpcYyGnS36Ft2lgkBEje+Wt5w0oTpij3OsWEV
 WBnrXIRKvKb/QNBPgkH7QInd5phSnVmDGVKQpNpmSZ9QfD9JX8WhY9FBKIFwtTzXbirW
 DTyDjOLeSXHBvuwrUfFdgw0x2v98ZSA10yOD6TXh/iSDU5V5dqYjvKWcsb5/8tVZe3No
 Q+rMPE5LNBOAhxXEuoVjRL9G0upleEeYLfhwntNB1Zpv9n3/nJMbyeJv7ac0lRKqleva
 mBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=bH/UiGz0n9r8PxheOnVtGIxbVoV+xOs1HB5Wn6jPUFw=;
 b=Ghkfp/7L9Tx3nLYsKGO0s3wnjiABEIQmRVR1oojc67tr6FESmu1x/BKVJm4Q0NNIH7
 Ft4ELy9jji9Gkcc2QeDP/etL1HqndVyM3LPuwljxmgLe4Z0p2ibV61aclxEo7cm2Jwxc
 ttO2O2SxUbWocRziSKqi2Ur3dsJH+U7buofERD6xjA5GLek+ldfPu7M8+a3F1goYurfl
 IBXM0ZCUUkaBnT/l4ajZC7XiJcP/j18cUAQ4jWXDOI9T7YexlUvUvacKlB3x3PsX7gwj
 f0bqX+z2YuZ72vuVP6cVXvcyTT+IOruWQEUfRA0MjxSGLCa0QFegPEczYhV/hfgfoR2k
 rOOw==
X-Gm-Message-State: AOAM5338vrwvbdPzaAy+CUZjLtGqsi8jJnvsSmxiRw6i5G5ac5sDwAPJ
 br9ZWBNE1x4EL8RvBPcid03UyNuVwtEKuQ2P
X-Google-Smtp-Source: ABdhPJyQ2LOR47op9Ah5ZhT+bzStU73ZKn8da93aQ+ixw2J65+fplLr+8Wn4m+OMbx/0v2twTCNFZA==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr1792611wmk.70.1613122186014; 
 Fri, 12 Feb 2021 01:29:46 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id m5sm11002287wmc.25.2021.02.12.01.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 01:29:45 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 4fe57fe2;
 Fri, 12 Feb 2021 09:29:44 +0000 (UTC)
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 17/21] i386: support 'hv-passthrough, hv-feature=off'
 on the command line
In-Reply-To: <87r1llllg5.fsf@vitty.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-18-vkuznets@redhat.com>
 <20210211181459.08f14c22@redhat.com> <87r1llllg5.fsf@vitty.brq.redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Fri, 12 Feb 2021 09:29:44 +0000
Message-ID: <cuneehliqgn.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::336;
 envelope-from=dme@dme.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-02-12 at 09:49:46 +01, Vitaly Kuznetsov wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
>
>> On Wed, 10 Feb 2021 17:40:29 +0100
>> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>>> Currently, we support 'hv-passthrough,hv-feature=on' enablement, this
>>> is supposed to mean "hv-feature is mandatory, don't start without it". Add
>>> support for 'hv-passthrough,hv-feature=off' meaning "enable everything
>>> supported by the host except for hv-feature".
>>> 
>>> While on it, make 'hv-passthrough' parse semantics in-line with other
>>> options in qemu: when specified, it overrides what was previously set with
>>> what's supported by the host. This can later be modified with 'hv-feature=on'/
>>> 'hv-feature=off'.
>>> 
>>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>>> ---
>>>  target/i386/cpu.c     | 28 +++++++++++++++++++++++++++-
>>>  target/i386/kvm/kvm.c |  4 ++++
>>>  2 files changed, 31 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>> index e8a004c39d04..f8df2caed779 100644
>>> --- a/target/i386/cpu.c
>>> +++ b/target/i386/cpu.c
>>> @@ -4725,6 +4725,29 @@ static void x86_hv_stimer_direct_set(Object *obj, bool value, Error **errp)
>>>      x86_hv_feature_set(obj, value, HYPERV_FEAT_STIMER_DIRECT);
>>>  }
>>>  
>>> +static bool x86_hv_passthrough_get(Object *obj, Error **errp)
>>> +{
>>> +    X86CPU *cpu = X86_CPU(obj);
>>> +
>>> +    return cpu->hyperv_passthrough;
>>> +}
>>> +
>>> +static void x86_hv_passthrough_set(Object *obj, bool value, Error **errp)
>>> +{
>>> +    X86CPU *cpu = X86_CPU(obj);
>>> +
>>> +    cpu->hyperv_passthrough = value;
>>> +
>>> +    /* hv-passthrough overrides everything with what's supported by the host */
>>> +    if (value) {
>>> +        cpu->hyperv_features = 0;
>>> +        cpu->hyperv_features_on = 0;
>>> +        cpu->hyperv_features_off = 0;
>>
>> why do we have _on|_off fields?
>>
>
> You mean 'why do we have them at all' or 'why do we reset them here'?
> For the former, we need to distinguish between
> 'hv-passthroug,hv-feature=off' and just 'hv-passthrough';
> 'hv-passthrough,hv-evmcs=on' and just 'hv-passthrough'. For the later,
> I'd like to make the samentics you've asked for:
> 'hv-feature,hv-passthrough' == 'hv-passthrough'
> (though I still see it as a gotcha for an unprepared user)

Either approach will confuse *someone*, I think.

This way at least behaves better if someone/something is composing the
feature strings via concatenation.

>>> +    }
>>> +
>>> +    return;
>>> +}
>>> +
>>>  /* Generic getter for "feature-words" and "filtered-features" properties */
>>>  static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
>>>                                        const char *name, void *opaque,
>>> @@ -7281,7 +7304,6 @@ static Property x86_cpu_properties[] = {
>>>                         HYPERV_SPINLOCK_NEVER_NOTIFY),
>>>      DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
>>>                              hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
>>> -    DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
>>>  
>>>      DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
>>>      DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
>>> @@ -7460,6 +7482,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>>>                                     x86_hv_stimer_direct_get,
>>>                                     x86_hv_stimer_direct_set);
>>>  
>>> +    object_class_property_add_bool(oc, "hv-passthrough",
>>> +                                   x86_hv_passthrough_get,
>>> +                                   x86_hv_passthrough_set);
>>> +
>>>      for (w = 0; w < FEATURE_WORDS; w++) {
>>>          int bitnr;
>>>          for (bitnr = 0; bitnr < 64; bitnr++) {
>>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>>> index 30013f0d7cee..fca088d4d3b5 100644
>>> --- a/target/i386/kvm/kvm.c
>>> +++ b/target/i386/kvm/kvm.c
>>> @@ -1153,6 +1153,10 @@ static int hv_cpuid_check_and_set(CPUState *cs, int feature, Error **errp)
>>>          return 0;
>>>      }
>>>  
>>> +    if (cpu->hyperv_passthrough && (cpu->hyperv_features_off & BIT(feature))) {
>>> +        return 0;
>>> +    }
>>> +
>>>      deps = kvm_hyperv_properties[feature].dependencies;
>>>      while (deps) {
>>>          dep_feat = ctz64(deps);
>>
>
> -- 
> Vitaly

dme.
-- 
J'aurais toujours faim de toi.

