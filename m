Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC38340A32
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:27:01 +0100 (CET)
Received: from localhost ([::1]:35790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvUC-0006zy-LP
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMvFy-0000u6-1N
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:12:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMvFw-0006bi-GU
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616083935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b97IivOSAAdAu8POM/6Rc556P7HToVEJuGbJ3VW78N4=;
 b=bWedbmKt4Ne4RpcY7Q476D+DTXllZlfAzAvTOafA5RSY7bKN7wF9kAusOhH5NrqCuAhSrB
 4VYYIcI+Xtg7Uxu2uTpYcCp4peKEcGwu9fFCh8h3cv5SSWvTAVB1rA/5gjTEb9Mfe+pEkB
 Astmnm98InIrkU0IAa8xATrWkh3qzbM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-DGN-X6lROQODzP1us062jg-1; Thu, 18 Mar 2021 12:12:14 -0400
X-MC-Unique: DGN-X6lROQODzP1us062jg-1
Received: by mail-ej1-f71.google.com with SMTP id au15so16981504ejc.8
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b97IivOSAAdAu8POM/6Rc556P7HToVEJuGbJ3VW78N4=;
 b=DVFyTf6HbS5cEz8j4hd11XJq8/ZnHGcyT+/KU+OXUJ9r3ncZm9U5MstAtF4lld0SEj
 nBIPOlnkrmQNr/9k+ffJ+owoTZprilwIe6lTAWAb1GR7hN9UfKeIns2D1nW9F4OvV/Ne
 qmTtCtTEdn2vuEpTn2Qs4qA7d0hKy6NxBlpgvii4Gmy9E4u59oQXFeZyU28PCA6USODn
 7HksSTF+2RfWbwbRe1lOAR0Rb/c+DtaYMrjhQTWE6mSFYRLjEZUD7WjsU+2In6OdzN9O
 SOUXJ65K5qh//GoT72Kwsh3HMGrEXEACYv7ylzVP9w5hQdZig6Ee+J2yfRvCytkt35AS
 AKbA==
X-Gm-Message-State: AOAM532bu1Fvi42ZPDiBA0QNoPJPrfKEQMUFWJMW+cLQ8NJl19NOaSEX
 cen6wQVmKhkSPOYyiPxFKg1FUwoeHXVbbnGV1+oG16fTgGA6r8czzHt4ya6Xavw7RuiZ4DGJvQQ
 07MjiF4eiIAlqpiM=
X-Received: by 2002:a17:906:95d1:: with SMTP id
 n17mr40622559ejy.394.1616083932888; 
 Thu, 18 Mar 2021 09:12:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweFWHJNziziK9sfHaPaFBQ+EMqSPV0OYg/o5Sz4rrQ2Uw3brO0Lrs6AzpQJSulhnZk3fFSRg==
X-Received: by 2002:a17:906:95d1:: with SMTP id
 n17mr40622542ejy.394.1616083932724; 
 Thu, 18 Mar 2021 09:12:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gq25sm2243509ejb.85.2021.03.18.09.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 09:12:12 -0700 (PDT)
Subject: Re: [PATCH 3/3] i386: Make sure kvm_arch_set_tsc_khz() succeeds on
 migration when 'hv-reenlightenment' was exposed
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-4-vkuznets@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2f377397-0427-95dc-6617-5dedf6533bc4@redhat.com>
Date: Thu, 18 Mar 2021 17:12:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210318160249.1084178-4-vkuznets@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 17:02, Vitaly Kuznetsov wrote:
> KVM doesn't fully support Hyper-V reenlightenment notifications on
> migration. In particular, it doesn't support emulating TSC frequency
> of the source host by trapping all TSC accesses so unless TSC scaling
> is supported on the destination host and KVM_SET_TSC_KHZ succeeds, it
> is unsafe to proceed with migration.
> 
> Normally, we only require KVM_SET_TSC_KHZ to succeed when 'user_tsc_khz'
> was set and just 'try' KVM_SET_TSC_KHZ without otherwise.
> 
> Introduce a new vmstate section (which is added when the guest has
> reenlightenment feature enabled) and add env.tsc_khz to it. We already
> have env.tsc_khz packed in 'cpu/tsc_khz' but we don't want to be dependent
> on the section order.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Could we instead fail to load the reenlightenment section if 
user_tsc_khz was not set?  This seems to be user (well, management) 
error really, since reenlightenment has to be enabled manually (or with 
hv-passthrough which blocks migration too).

Paolo


