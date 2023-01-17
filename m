Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84F66DBDC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:07:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjo1-0003ZZ-4j; Tue, 17 Jan 2023 06:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHjny-0003Z6-8v
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:07:02 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHjnw-0002qW-1l
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:07:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso4235966wms.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lWzTkpuPQoRhP4ke3wAF8Y/ncxMxiE/nwMutz67Sc9g=;
 b=pR0QB+NVLFwefzuJ/KCFgjEcGTXuRy1LGZQSpmOJgg8b66mKPgXmsLW+rmGzLP/oSL
 jF5vBxX6+AXWC6mAdbJKNAcGlld7/asojjSEnZQ4gKSjaaHavERG+aiwHwGO2QcBDaor
 tVM1Usg5CF04YhEe51GuDkE+oO+zFTX1ptwJCwaV4/XcegRsV+p5vSqWRqMOFknJNdJP
 gYvlvm/hgkZknIaHX8D8Gi46xkplAlDlX6ciJRIU5K7BRbNbLM3jXr+5Lk9j/GL21FKu
 q7GuA/+Qo7xDk1daQfQIt0w5xai9qu/nfE+RaRNkim0+ndOAtIjU8fYITrZtCVypPipe
 kLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lWzTkpuPQoRhP4ke3wAF8Y/ncxMxiE/nwMutz67Sc9g=;
 b=aw7nQPMokmNXiOHHPDJOHwiW5HFyyT8P3eLloyLMRh0HcdjHNGeocCAj2NivwYxxRL
 aZoY9MWw/gxcJ3nl/9xRwXSJjxTiPDCaF2r4oaMDL9fExv4je/AGJgqrSg8WDSz+EaKs
 PWFdBH8NEm1ZRzJwYtUlIKI02hYeLITKlp7Bn0tPoE0FPnDCLABH1ekYQ007oI+LwXZG
 KAdfgMa4qbW4ogqqp0lgcgZ/K1mgeuxEC8MAKwDnyy+DOJ70K0RPX9n3LICj0khHjlIu
 wbQN8tGrCAkpZhtP4I5uUxOSShg235AeGsdrCWwjo7Z3dGC4y0e1ppBjdfs5hs+EfmDL
 mAyg==
X-Gm-Message-State: AFqh2kousUt2TmcMbgRlW6fXiFvha6gunlTbQ+cI0AnF77+ahzih6dPY
 +VXAVbauSSt5Ip7GueyE+wQ=
X-Google-Smtp-Source: AMrXdXsMUfLg2mQSO8ppXAlobCT4zYq20wOCc3+nKQDoFLZSuIdInjjbcQceVqWlGgrtA8jqcLaH4w==
X-Received: by 2002:a1c:7907:0:b0:3cf:a39f:eb2a with SMTP id
 l7-20020a1c7907000000b003cfa39feb2amr2627490wme.11.1673953618323; 
 Tue, 17 Jan 2023 03:06:58 -0800 (PST)
Received: from [192.168.8.108] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm43913601wmo.24.2023.01.17.03.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:06:57 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <6234afac-b260-37ab-6f3b-17ed5e3ba6a2@xen.org>
Date: Tue, 17 Jan 2023 11:06:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 26/51] hw/xen: Add xen_evtchn device for event channel
 emulation
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
 <20230116215805.1123514-27-dwmw2@infradead.org>
 <ea0a98e2-14e4-620a-60ee-86cfbe76403e@xen.org>
 <8ab2cfafa5636d7f084e8a75d273d7bf7b6b7579.camel@infradead.org>
 <726f2f63-dc74-619e-4cb0-205f9a542b99@xen.org>
 <f5fe9f4e6bc301e4fa0065e17cc0bbdcb3e06668.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <f5fe9f4e6bc301e4fa0065e17cc0bbdcb3e06668.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32d.google.com
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

On 17/01/2023 11:02, David Woodhouse wrote:
> On Tue, 2023-01-17 at 10:56 +0000, Paul Durrant wrote:
>>
>> I'm just having a hard time seeing why passing 0 to
>> xen_evtchn_set_callback_param() does anything useful...
>>
>> +    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
>> +    case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
>> +        struct kvm_xen_hvm_attr xa = {
>> +            .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
>> +            .u.vector = (uint8_t)param,
>> +        };
>>
>> HVM_PARAM_CALLBACK_TYPE_VECTOR is 2 AFAICT, so it won't hit that case.
>> Also, you appear to be passing the unshifted param to kernel anyway.
>>
>> What is the call trying to achieve?
> 
> Zero is HVM_PARAM_CALLBACK_TYPE_GSI, with GSI==0. It's basically
> disabling event channel delivery for the new kernel.
> 

AFAICT it is doing nothing at this point. Unless I am going insane it 
results in this codepath:

+    default:
+        ret = -ENOSYS;
+        break;
+    }
+
+    if (!ret) {
+        s->callback_param = param;
+        s->evtchn_in_kernel = in_kernel;
+    }

So it doesn't result in any cleanup. What am I missing?

   Paul

