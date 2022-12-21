Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F0652EB7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:39:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7vXj-0002Xq-BY; Wed, 21 Dec 2022 04:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7vXh-0002Xe-60
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:37:41 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7vXf-0006Lt-CS
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:37:40 -0500
Received: by mail-wr1-x432.google.com with SMTP id a17so13157041wrt.11
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:reply-to
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sCHWygNYr9u6jPSH7xa9ZruSmBWJj/I2OL6kWmCmAgM=;
 b=QuoP8Wg/DV3lI450aYRGeWMzq8FiuKv2nR7OEZkDekZaAuZLrf161xe0iNt4S9mx81
 /24T1eyNXBb326VnQC+bYP7O0ykAektCNU+dDUEX2ohCVTYXPIPLzoEkFIj5g4GaGRxb
 s+hR9zrUYG7Ktvo0IdxeV2hsouDE5mav0+PBRO5GgE5VxIAM+Qgmf+0TnGjobJuPLSnq
 gu8xJGZIXzxYP5kBtA7zX6zKI7LDyfmabPjq8fokGqXknA8mnmsLV/lkAkYPZduyxaPb
 U9yXKE9T9C5JaxuENq+T8erHbQFG3+h9k/fnMz66oZ/tgDFjRYBTbCF63Ry/Llkm49t9
 o9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:reply-to
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCHWygNYr9u6jPSH7xa9ZruSmBWJj/I2OL6kWmCmAgM=;
 b=CaqJ3zep0t/3NGbboPNylZagfAPTgJxKze5Sbg1+ih6cuiTevaDdEsk3U8I4daOcOe
 WlKbBkS0qRFQLa/7FOa1ZxmY9iT5Ga0gtsZm1ONNC+HlSW4i43BAerbCgJ1z1fMNsETo
 xZwpImUMGl2lI/M1O+05ufvjyg/oBIytJ7TkSxb3FGe7od395b5ZXUoNzpvPrPelKWsX
 9BQl8QKPZtjWlhPkwYvXrzu3/lA4YrvnbvKZt8s74M4Mrrkk8oyTX8Wrq9PIWRQbm7aP
 HjV2aOvBDljvKVp7YU2+dtSiMITCGw2U8uXLygaKFggcS7s3F7QT8d7+NTOro/hvE1YS
 4ZrA==
X-Gm-Message-State: AFqh2ko1K42NiGTv2vrN1kFlf+BQff0BEP1jcbj/Sf7BUL5DXrHHyPAK
 LwkFJv+62TZxSTNH5Sh0uZE=
X-Google-Smtp-Source: AMrXdXuZID7iML7hGn0ykyhg1f98GXeKh/ePlvZjqtoU2OJ/9DJ5CNrgFrZUWxAoUKMY0EFP34aMMg==
X-Received: by 2002:a05:6000:4004:b0:242:bef:80a1 with SMTP id
 cy4-20020a056000400400b002420bef80a1mr3565746wrb.2.1671615457783; 
 Wed, 21 Dec 2022 01:37:37 -0800 (PST)
Received: from [192.168.6.210] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a5d5585000000b0024207478de3sm14551432wrv.93.2022.12.21.01.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 01:37:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <023d20b9-63e3-e870-facb-a424f2008622@xen.org>
Date: Wed, 21 Dec 2022 09:37:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v2 20/22] i386/xen: HVMOP_set_param /
 HVM_PARAM_CALLBACK_IRQ
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-21-dwmw2@infradead.org>
 <f4b7feff-c41a-25c6-d098-c4eab9b94eb1@xen.org>
 <a78a46825b6f726d78beeb0464a3c30cdfd0b9fa.camel@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <a78a46825b6f726d78beeb0464a3c30cdfd0b9fa.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 21/12/2022 01:41, David Woodhouse wrote:
> On Mon, 2022-12-12 at 16:16 +0000, Paul Durrant wrote:
>>
>>> @@ -287,24 +289,53 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit,
>>>        return true;
>>>    }
>>>    
>>> +static int handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
>>> +                            uint64_t arg)
>>> +{
>>> +    CPUState *cs = CPU(cpu);
>>> +    struct xen_hvm_param hp;
>>> +    int err = 0;
>>> +
>>> +    if (kvm_copy_from_gva(cs, arg, &hp, sizeof(hp))) {
>>> +        err = -EFAULT;
>>> +        goto out;
>>> +    }
>>> +
>>> +    if (hp.domid != DOMID_SELF) {
>>
>> Xen actually allows the domain's own id to be specified as well as the
>> magic DOMID_SELF.
>>
>>> +        err = -EINVAL;
>>
>> And this should be -ESRCH.
>>
> 
> Oops, fixed that after posting v4 series. Fixed in:
> 
> https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv
> 
> I fixed the similar -EPERM in evtchn_status_op() too.
> 
>>> +        goto out;
>>> +    }
>>> +
>>> +    switch (hp.index) {
>>> +    case HVM_PARAM_CALLBACK_IRQ:
>>> +        err = xen_evtchn_set_callback_param(hp.value);
>>> +        break;
>>> +    default:
>>> +        return false;
>>> +    }
>>> +
>>> +out:
>>> +    exit->u.hcall.result = err;
>>
>> This is a bit on the ugly side isn't it? Why not return the err and have
>> kvm_xen_hcall_hvm_op() deal with passing it back?
> 
> Because 'return false' means qemu will whine about it being
> unimplemented.
> 

Ah, ok. Yes, I did suggest turning that into a trace, which would mean 
that only those who cared would see such a whine.

   Paul



