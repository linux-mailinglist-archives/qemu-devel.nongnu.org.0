Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7887D2BB0EC
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:50:29 +0100 (CET)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9cC-0001C7-HB
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg9YI-0005oi-SK
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:46:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg9YD-0002EV-Ax
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605890780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgVVVz1nFKtyfiNjZ4hud/GYFEHTxmSbUvXvPjPTX40=;
 b=hwTdWwGY/SILDi4ItDPR2kz39BPfEyv55Y+3LjZSL7DQ8UoQMi382Oj4MXYl19Ft6oC+9v
 PGlLJWP2+ecy5HOnm2Ci2w96UIiTI/HjpHA4rv/1PzxycOnSsLTh6yrcfu5OT9u0NzIAsO
 clVeAWXHsaauei6ggIYpq2/OWNvG9tg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-iH58FmZHM2OXuj-_pLMF_w-1; Fri, 20 Nov 2020 11:46:18 -0500
X-MC-Unique: iH58FmZHM2OXuj-_pLMF_w-1
Received: by mail-ej1-f71.google.com with SMTP id e7so3692038eja.15
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wgVVVz1nFKtyfiNjZ4hud/GYFEHTxmSbUvXvPjPTX40=;
 b=o5WRjTwsxhXNbFIAfFHWF4XEMP6AV8roSk2mW1S3j96sCbT0xGRwuVafiFl9zBrka5
 ZrU0rgCeAKBRQMsqGIpAr2PzAwqnEtXnV8WWeln+mouV8DR68C16e8iEwbG7YIUhpf+S
 40O11sLW5e2uSNCCFmTf8BqyG3hsrGuuMYnVs9BoxS7vwIvI/C7AUti2udjt77qm1LOt
 WXcmHRUf2XFIkTeJlaXWGb+vy8pmZdzwC482YF1+uWFh9uL7eiDXdX2I4NlciDnZsRIY
 9cC5zk+R+68PWvjjtwG7q/BVtY6mWwIb3t8/6ua0DtWVqC17X1TG5GaBmd/Ho7eCgx4w
 KRgw==
X-Gm-Message-State: AOAM530Nl+AjckFi1f1k+HFA4TdyIUtxpJh6opAsd9dW0ccDV7VCcY68
 DvOERiQ5NWRN7GrJ9m+HE7TUKKMta1NgJk6qfydIXcSGIsDOMlh8FnMeWYEf5DG43KMoUe6Z8Ko
 JSzpu+LWFwAEnkPpU+M/loxTPsfEkOqRyjpg3DypBJa3njRKfCK5tkZltr8AfnVZ6pdg=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr37257415edb.100.1605890776847; 
 Fri, 20 Nov 2020 08:46:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxi+qP85hPlgSNQvzHthSMzSE44d0Viylft9+hGsNtTa1B9a1rX8uLjgWzKsY6opEj9m25BmQ==
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr37257394edb.100.1605890776643; 
 Fri, 20 Nov 2020 08:46:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gl23sm1323248ejb.113.2020.11.20.08.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 08:46:15 -0800 (PST)
Subject: Re: [PATCH 22/29] vl: initialize displays before preconfig loop
To: Igor Mammedov <imammedo@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-23-pbonzini@redhat.com>
 <20201120161148.0dc2bdcf@redhat.com>
 <85980ae2-9da0-d432-6825-85782f4beee5@redhat.com>
 <20201120173252.743b4208@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50b90afd-6a41-61d8-44c1-273858cd4947@redhat.com>
Date: Fri, 20 Nov 2020 17:46:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120173252.743b4208@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 17:32, Igor Mammedov wrote:
> On Fri, 20 Nov 2020 16:53:41 +0100
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> On 20/11/20 16:11, Igor Mammedov wrote:
>>> On Tue, 27 Oct 2020 14:21:37 -0400
>>> Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>    
>>>> Displays should be available before the monitor starts, so that
>>>> it is possible to use the graphical console to interact with
>>>> the monitor itself.
>>>>
>>>> This patch is quite ugly, but all this is temporary.  The double
>>>> call to qemu_init_displays will go away as soon we can unify machine
>>>> initialization between the preconfig and "normal" flows, and so will
>>>> the preconfig_exit_requested variable (that is only preconfig_requested
>>>> remains).
>>>>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>
>>> Doesn't apply to yer for-6.0 branch
>>
>> I updated the branch.
> 
> it probably won't help,
> what I do review/test is drop these patches on branch
> and reapply them from this thread.
> Having v2 on list that applies to master would be better.

Yes, of course.  I meant that the for-6.0 branch already _is_ the v2, 
I'll send it out as soon as I integrate all your feedback.

Thanks,

Paolo


