Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5252A66DCE7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:54:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkWi-0007fi-Kp; Tue, 17 Jan 2023 06:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHkWg-0007fZ-T8
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:53:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHkWf-0007bg-2x
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:53:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso1183234wmb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/MXNumRR13p9Qo0Dcad1PDxV6zGwPYljY9j1EoaeUdE=;
 b=dXDCHi1MEUr+4jD+BAne3q3jIjJdZvDa4hPNANj/qusYB5qrVYorhXMZMlr5rc5LEN
 MgmEdIUQoFU0zoK/mTS293KTeUbhwTTM6wV1tnxvypMtPovdHiWjpzTxqceImXbVsq1q
 guq0P8vKCABh5DLbzP/RpAkJ00ZUCIKQHQqy0kNgpFKB9nT5XQrxE5AAcE0vSdIsQaXp
 iAdfOMPIYvuESGVn0gwLwlAwBEs/BRM+E9JDkJfWu+tU4bDr/eNqjzjC1AzrQ7hE0DK4
 0fGN0g4ufUjB/989NAkb4YT6liRoABvpKLLUbxieRQ3LzF3bVPb28+3ji6g36NnZ4TGy
 a76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/MXNumRR13p9Qo0Dcad1PDxV6zGwPYljY9j1EoaeUdE=;
 b=g4VMJNEwydZkYX4KiMhK6t3FriVw907650EDXnubCFXmzmqedcsnH7lzqygs5eQIpM
 Nwkmd4rnbDo+DOQApwDFJaYF94TcgAUEFWgLE9YyWz2t8Jgq3ZZbXNRnsKWJP2sMa27R
 cJvbdk981UrQI9XHyBb9kjRrYZnLkq+yUMbglGMOvFZet0vRGfbXHtSAQfXVelVKgovL
 y/kb8sIwxna7z5nrYuAFcPXJ6xOMO7EcmM7XY9Dtik97h4HA3igHZHcHkcVGE20zLPTq
 QVxbfk55HdsR6ODN2IG2CeHtvQn3LTcw5M+isILcpnCuN8Ew4zY9Blv4MM++k3xwPSa5
 ftsQ==
X-Gm-Message-State: AFqh2kr8ph3e5fPPACcbdFkbpt/lsmK33pMNddRgzozKvovF4l5i5ubx
 O9wpycKTUqon2Gl+TkR2j/g=
X-Google-Smtp-Source: AMrXdXu2ht30Pxrev2AZT/GwahisDe+jEFfc6/j44U8S9CWGQCQFGvgGQRXLzVjupvut+EyUkWL54A==
X-Received: by 2002:a05:600c:4928:b0:3d2:2043:9cb7 with SMTP id
 f40-20020a05600c492800b003d220439cb7mr2816873wmp.5.1673956390366; 
 Tue, 17 Jan 2023 03:53:10 -0800 (PST)
Received: from [192.168.8.108] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003c6f8d30e40sm46532196wms.31.2023.01.17.03.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:53:10 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <59f4e3c3-0939-134b-596b-ebfc5d06a11d@xen.org>
Date: Tue, 17 Jan 2023 11:53:07 +0000
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
 <6234afac-b260-37ab-6f3b-17ed5e3ba6a2@xen.org>
 <555a94eb3b65d45bae7d2da6571d072e773c2d50.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <555a94eb3b65d45bae7d2da6571d072e773c2d50.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 17/01/2023 11:24, David Woodhouse wrote:
> On Tue, 2023-01-17 at 11:06 +0000, Paul Durrant wrote:
>> On 17/01/2023 11:02, David Woodhouse wrote:
>>> On Tue, 2023-01-17 at 10:56 +0000, Paul Durrant wrote:
>>>>
>>>> I'm just having a hard time seeing why passing 0 to
>>>> xen_evtchn_set_callback_param() does anything useful...
>>>>
>>>> +    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
>>>> +    case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
>>>> +        struct kvm_xen_hvm_attr xa = {
>>>> +            .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
>>>> +            .u.vector = (uint8_t)param,
>>>> +        };
>>>>
>>>> HVM_PARAM_CALLBACK_TYPE_VECTOR is 2 AFAICT, so it won't hit that
>>>> case.
>>>> Also, you appear to be passing the unshifted param to kernel
>>>> anyway.
>>>>
>>>> What is the call trying to achieve?
>>>
>>> Zero is HVM_PARAM_CALLBACK_TYPE_GSI, with GSI==0. It's basically
>>> disabling event channel delivery for the new kernel.
>>>
>>
>> AFAICT it is doing nothing at this point. Unless I am going insane it
>> results in this codepath:
>>
>> +    default:
>> +        ret = -ENOSYS;
>> +        break;
>> +    }
>> +
>> +    if (!ret) {
>> +        s->callback_param = param;
>> +        s->evtchn_in_kernel = in_kernel;
>> +    }
>>
>> So it doesn't result in any cleanup. What am I missing?
> 
> Indeed, it doesn't result in any cleanup at *this* point in the series
> because HVM_PARAM_CALLBACK_TYPE_GSI hasn't been implemented yet; it's
> in a later patch.
> 
> The series is broken up into sensible individual patches for review,
> not so people can actually *run* with some partial subset of them.
> 

That's fine. It's just confusing for a reviewer to know whether you are 
intentionally introducing code that has no effect, or whether that is a bug.

> Otherwise I'd have to implement vmstate migration versioning for every
> change in the series, and that way lies madness :)
> 
> I *will* add a comment in the code explaining what zero means though,
> and note in the commit message that it doesn't actually have any effect
> will, but will do in a few patches' time.

That would certainly help, thanks.


