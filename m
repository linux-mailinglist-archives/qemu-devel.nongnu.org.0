Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E706544CB5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:56:55 +0200 (CEST)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHiY-00069B-50
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nzFMQ-000071-7J
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nzFML-0001O6-LW
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654770349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uEO8ePGFmb+u9obluZ2Ls7Q3hRsHOuEoVr7ZKL1xIuc=;
 b=Qlx7jTs4T5ZpEbYbBWzhio2imKjCltNDEpMcaeDxmYTlNM77FTp6qMwt5nUKckdjoW0iBM
 TptJeblICsVYOvIydnr06eZILucK26X1frf1El4FqJ+/QUNqxfpLuF96D51uXkWwM32zwY
 5/4nONBNhsJAN4drcPx0jjJdWpV92xI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-xWKtSW0zMZ6PLyvO22ZJ7A-1; Thu, 09 Jun 2022 06:25:47 -0400
X-MC-Unique: xWKtSW0zMZ6PLyvO22ZJ7A-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so8111483wmr.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uEO8ePGFmb+u9obluZ2Ls7Q3hRsHOuEoVr7ZKL1xIuc=;
 b=UTEN4h5HBER1caXuF7c+GNDeLPuyFMhH+eRDkcoNPBwJe/bR3z+gAqjbSmONy0qN3k
 tGfGuO4K1plk+KIB82+5PCA4sMiJNMg5Y7wCNH9QHXP+RfApyfJYtB8Ajgp009Cbk6JD
 3EYmV3ZUfFXwdU+3ugaTbxaj61vf1HMx4OHSH6LPlcTl5GFl9shShB+7WWI9ohYKmY9U
 RJN5SLUG6L258FlYJu6aRpzd70NzuAKwK1K+X1LTsXb4cblrXx78oRMcZsSPvEwI/rqM
 GFMoCCg467SLK6AoqC9hf7qx8Nb/0Xj/B4xxp13BqE19Mp3mnXPwpfV/uzU+Ll8v+bmY
 5Opg==
X-Gm-Message-State: AOAM530awfuOaCRnuFaQehSCrNISp3zz1tYFqxRjC83BrZQUOCz9CA++
 9qgwJ5es6oLnHn99bBz7Jg13kfw8p9xMxgGqW2AyCje4q/h4XCmW4HxKfTUJtuIK+KbHH7zBMNu
 VWT6xfbbHG6JPcz0=
X-Received: by 2002:a5d:4206:0:b0:213:bb1f:b81f with SMTP id
 n6-20020a5d4206000000b00213bb1fb81fmr31526262wrq.363.1654770346786; 
 Thu, 09 Jun 2022 03:25:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze9dWkCBhTZfeEs+6iwsVmClu7qL20Pa6estDczSShDzcQ7O/wop65OO516ksgoiGJhRzbZQ==
X-Received: by 2002:a5d:4206:0:b0:213:bb1f:b81f with SMTP id
 n6-20020a5d4206000000b00213bb1fb81fmr31526235wrq.363.1654770346541; 
 Thu, 09 Jun 2022 03:25:46 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adff951000000b002103bd9c5acsm23987540wrr.105.2022.06.09.03.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 03:25:45 -0700 (PDT)
Message-ID: <7e5aea20-c447-0ffe-5da5-80c42f5c8db6@redhat.com>
Date: Thu, 9 Jun 2022 12:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL 15/18] qapi: introduce x-query-ramblock QMP command
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
 <20211102175700.1175996-16-berrange@redhat.com>
 <073c1687-d30f-8f41-b87e-83372137708a@suse.de> <YqHJKgA5OG80dljx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YqHJKgA5OG80dljx@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.06.22 12:19, Daniel P. Berrangé wrote:
> On Thu, Jun 09, 2022 at 12:07:31PM +0200, Claudio Fontana wrote:
>> Hello all,
>>
>> it would be really good to be able to rely on this command or something similar,
>> to be able to know the approximate size of a migration before starting it.
>>
>> in QEMU ram_bytes_total() returns what I would like to have,
>> but there is currently no QMP way to get it without starting a migration,
>> which when trying to optimize it/size it is just about too late.
> 
> Aside from the main VM RAM, what other RAM blocks are likely to have
> a size large enough to be of consequence to the live migration
> data copy, and whose size is not already known to the mgmt app from
> the guest config choices it made ? VGA RAM could be a few 100MB I
> guess, but the mgmt app knows about that. I've always assumed everything
> else is just noise in comparison to the main RAM region.
> 
> Still I wonder how useful this is as its just a static figure, and the
> problems with migration transfer are the bulking up of data when the
> VM is repeatedly dirtying stuff at a high rate.
> 
>> Do you think x-query-ramblock could be promoted to non-experimental?
> 
> It would have to be re-written, as this current impl is just emitting
> a huge printf formatted string. To be considered supportable, the data
> would have to be formally modelled in QAPI instead.
> 
> IOW, it would be a case of introducing a new command that emits formal
> data, convertintg 'info ramblock' to use that, and then deprecating this 
> x-query-ramblock.
> 
>> Should another one be made available instead, like :
>> query-ram-bytes-total ?

With virtio-balloon free page hinting and virtio-mem, that number does
not reflect reality (IOW, with sparse ramblocks the total size of
ramblocks is not expressive; it's rather a "worst case").

-- 
Thanks,

David / dhildenb


