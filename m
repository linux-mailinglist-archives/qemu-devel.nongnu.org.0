Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760192C3193
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 21:03:40 +0100 (CET)
Received: from localhost ([::1]:59748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kheXL-0007hr-1u
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 15:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kheVe-0007FH-If
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 15:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kheVb-0000m8-St
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 15:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606248108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DulRrvVWNiJloQqxO3Lv4vxZPeWim06UXsx+mjuFs68=;
 b=eWz7T2sHuZr0DQ8O0I0FvAQ4IJ0vn4KGKqXU51GD+DLoNhuTNZCl4x347x3GmVlHOrNQHY
 PR6mY35gO9ArKWTBPy1VM3lVX8jxOB3ahnELtRSN8wFIJpTQVuHF0F2yiUlsloI/5Cqs/S
 T2ZIrB0ki4menIrfT4NnnBqM48pBk2I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-nkpUSI4cNyiTSK4PMtri2w-1; Tue, 24 Nov 2020 15:01:47 -0500
X-MC-Unique: nkpUSI4cNyiTSK4PMtri2w-1
Received: by mail-wm1-f71.google.com with SMTP id y1so58214wma.5
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 12:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DulRrvVWNiJloQqxO3Lv4vxZPeWim06UXsx+mjuFs68=;
 b=fX8mXtGkIZWp4vq9hK97H22LKQN+Sk+kXsoIfx7hHlrQzQ1wuV8eQESlCFpqm7PcIg
 Fvhwx31bfhDg4DZvnzyft/gybgb/sbQNVQpVjPrm7L1vQJMQnti5KhjQOhsKWb4zBv/S
 gmX17YGs2st666b+m0dXQxYKNXBMWQRVMzZBr7Pw2Afn81BnKy+l5BN0MxjtZ6LhFFTo
 AzwlsgNd5g8GdbMoJUlYd+kwvuMds1wNJyqSJqgFhuIWYXNw9T18obvHAWd98FycaXqb
 3WzCgvpB0sY57bf7aB0S7iyJzSVvHEFFAleggj4YFiA/AtMuQsauU7oLsWW7g05whl55
 LF2A==
X-Gm-Message-State: AOAM530bC9VbLG/XnZVKYp6ICAOpzoVX4QN5BVJ6S+jq/D6VfhAbrcYC
 Q+W2e7kkcFQmqcUuK4pejZCXZvTr1JVtTrGKN+Uw22JZiruT3FJ8Ts43pqFE87s6dP+J8bJku9q
 JAR9c83Y9/Dp9wtM=
X-Received: by 2002:a5d:6046:: with SMTP id j6mr121131wrt.317.1606248105977;
 Tue, 24 Nov 2020 12:01:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXULfzpZ/uf3p9WJN4lV/6txmgXOIWhLvRm6fOpD6yrSQIl3yn0t5oZ//wbQJYlA5886QJyg==
X-Received: by 2002:a5d:6046:: with SMTP id j6mr121074wrt.317.1606248105696;
 Tue, 24 Nov 2020 12:01:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m9sm16344589wrx.59.2020.11.24.12.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 12:01:44 -0800 (PST)
Subject: Re: [RFC v5 09/12] module: introduce MODULE_INIT_ACCEL_CPU
To: Eduardo Habkost <ehabkost@redhat.com>, Claudio Fontana <cfontana@suse.de>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-10-cfontana@suse.de>
 <20201124170832.GS2271382@habkost.net>
 <a7bed792-5c6f-c49e-946c-f705707ce685@suse.de>
 <20201124190807.GW2271382@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <58e4d100-f096-0c41-4780-b8b7e9533b5d@redhat.com>
Date: Tue, 24 Nov 2020 21:01:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124190807.GW2271382@habkost.net>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, "Emilio G . Cota" <cota@braap.org>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Dario Faggioli <dfaggioli@suse.com>,
 Olaf Hering <ohering@suse.de>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/20 20:08, Eduardo Habkost wrote:
>> Not a big advantage I agree,
>> I think however there is one, in using the existing framework that exists, for the purposes that it was built for.
>>
>> As I understand it, the global module init framework is supposed to mark the major initialization steps,
>> and this seems to fit the bill.
> That seems to be the main source of disagreement.  I don't agree
> that's the purpose of module_init().
> 
> The module init framework is used to unconditionally register
> module-provided entities like option names, QOM types, block
> drivers, trace events, etc.  The entities registered by module
> init functions represent a passive dynamically loadable piece of
> code.

Indeed.  Think of module_init() as C++ global constructors.

Anything that has an "if" does not belong in module_init.

If you look at my review of the previous versions, I was not necessarily 
against MODULE_INIT_ACCEL_CPU, but I was (and am) strongly against 
calling it in the middle of the machine creation sequence.

Paolo


