Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4314E679D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:17:50 +0100 (CET)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXR5p-0003df-Cn
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:17:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nXR1N-0000iT-H4
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:13:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nXR1K-0006x1-9C
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648141988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMt1iWvcLHerniaS+/xY72Ir4fapDoLOPXyH1FFwOF4=;
 b=c5oiZh9bZkUIVKTxjPZ+mjeX2xZDAzk0VCBZUirRbkCp45CLOneD3YqcqJ2kNxn8cH2Yk4
 kOblo/ZlYVqfO8ZnW41A0IuV9QTRvT88hqxY2ipZL/1fGfjg7t43Fq4Cw63UIvW0UQA0PE
 ujhBz2dAHokAmZsIftQx6YRxkNAgjiY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-iqWvfevdMfas9U9-FguLIQ-1; Thu, 24 Mar 2022 13:13:07 -0400
X-MC-Unique: iqWvfevdMfas9U9-FguLIQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso2793149eje.20
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 10:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=FMt1iWvcLHerniaS+/xY72Ir4fapDoLOPXyH1FFwOF4=;
 b=7zNXzp4wqBmuV+1GSS+lDv/o5Ennr349uXleoMETc8DMINCmkku2r5TweCEd303aVl
 8X7sV8EdO4YqwWsRcB1GSyerO7J9ftOdR2ZWx3PJb0F86bHksI05ArtP/2GKAOb3NJx2
 knQvKLzd/j5oF8S8vQXOQHHMCISbvxeyFJlD89n1SBaVH95Yu8IOaPGhJFBCzxsEBKSl
 bNHX/vFKNrRh2+f787olYn03mOd/T8FOt9Vm1eFkfWrQjG3pFsvDpHtIfKgx8ksUSVyC
 7nTvA0rtWJBW9Y+/OggcoW8xUCZpiHIj5EEdhGvSEue8JDZz+HheI8YOfY4qVBCcuKLm
 GCUQ==
X-Gm-Message-State: AOAM533xHKxdFaU0AprqtuXrjVcahdD23H5KuwEwkO6FYl/Inc60uLBl
 IPBhE7s8N09cXwDe5cPeXafakI4ouePfVfNVnC2XlyCqqUq2hKWYu9wC11ui7f0m5xtUhRPYUBN
 2qKspUfTmQXJjc/8=
X-Received: by 2002:a17:907:c05:b0:6db:f118:8834 with SMTP id
 ga5-20020a1709070c0500b006dbf1188834mr7004165ejc.536.1648141986403; 
 Thu, 24 Mar 2022 10:13:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBTHSsGXuJ0Z7X/fZ+XvUt3NVrJjg41LQJS66ibdwEpJo9Efd0CoQ1OM7bNOgXXsSZMuRIjg==
X-Received: by 2002:a17:907:c05:b0:6db:f118:8834 with SMTP id
 ga5-20020a1709070c0500b006dbf1188834mr7004130ejc.536.1648141986102; 
 Thu, 24 Mar 2022 10:13:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 w2-20020a50d982000000b00410dc0889b9sm1715644edj.63.2022.03.24.10.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 10:13:05 -0700 (PDT)
Message-ID: <78c4b687-473f-e3db-fcfd-9525e9a5c8f9@redhat.com>
Date: Thu, 24 Mar 2022 18:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] target/i386: introduce CPU property to work around
 Windows reset bug
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220324082346.72180-1-pbonzini@redhat.com>
 <Yjw2KG4y8fK5Dw4F@redhat.com> <Yjw2yvN1OHkmBb2X@redhat.com>
 <e0a39a1e-abef-722b-eed7-8bb79e7c151d@redhat.com>
 <YjxQAKKKBR3oHdRN@redhat.com>
 <6bad2204-4a21-19e7-e2f6-3ef30632bda4@redhat.com>
In-Reply-To: <6bad2204-4a21-19e7-e2f6-3ef30632bda4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Vadim Rozenfeld <vrozenfe@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/22 12:24, Paolo Bonzini wrote:
> That said, the VMware kbase does paint a slightly different picture.  It 
> implies that starting with hardware version 11 rebooting Windows is done 
> through a hard reset instead of INIT.  I'm not sure how that would be 
> done, but in the meanwhile our fix should take care of do_cpu_init as well.

Ok, so here are my findings:

- Windows resets the system by writing 0xFE to port 0x64.  This is a 
hard reset on QEMU, but presumably it was a soft reset (INIT) on VMware 
until version 10.

- QEMU _does_ try to write 0 to the TSC on hard reset.  But KVM special 
cases 0 as "somebody is trying to hot-plug a new CPU" and wants to help 
out, so it keeps the CPU synchronized with the previous TSC.

So this is a pretty clear-cut QEMU bug.  It can be fixed by e.g. writing 
1 to the TSC instead of 0.

Paolo


