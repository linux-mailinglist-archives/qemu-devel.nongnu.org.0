Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BEE402CA0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:09:41 +0200 (CEST)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdfI-0003gT-8W
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNdad-0006CV-CI
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNdaa-0002o2-Og
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631030687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+luF+b0VoQSJnf78hvdNnBEb5KAFXJy8v8BuE9XK+ts=;
 b=VQr9HwKu1T/JoQmJ5PvnKZQmcbFfHIZnVXwhDlCB7oIxaWD6h8VOlhNrZAhLbAugNd1NmK
 fe+sUX8UrBDloZYaqqOv31Y2kemR4pzI7RAZTMtx0Z4GKma6eogLWe1rsfh6EiY4UOwq+/
 SnLUBMAFYWIBLsnJvKv+7688FltzEQ8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-ljGETknfM1aUmV6mcb85DQ-1; Tue, 07 Sep 2021 12:04:46 -0400
X-MC-Unique: ljGETknfM1aUmV6mcb85DQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 d25-20020a056402517900b003c7225c36c2so5595229ede.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 09:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+luF+b0VoQSJnf78hvdNnBEb5KAFXJy8v8BuE9XK+ts=;
 b=inV8HvUYMhUXQE01N9y+AwlS4jvKsSA/OQBv64GARBmyJXOgATx2cD3E+HT+2sdndC
 L97gBY78QGMxMpU1lyhjDARQkZdbb8F0J6ctBHQ5PY9vwd36kHyhh3sCVfP/rnSihRtE
 d6ThD71ABRsQqHuWB5RP8iUlr0cSnupuMFkvVeOpjnY97/8WepkIT9ojyzup/q9AJ8rh
 CnTqB89RFwmc+Vm8+j8FJMsRhgU2fQBJI42QM0XDcAZoil+5w8Rl+aikgQnGf864nIhY
 /G+CNVyOq7Vb7wUXnj3yMY1hWx+CtGfWICUlImXIy+99kIPpILNNBXXOYbfxENV4UJYn
 eK2Q==
X-Gm-Message-State: AOAM530u1LFhw/A5mAw1jjiFw8XVli/1PfwxIfpR7qWLwFlyAAyVlH5K
 jwj+G9aq61hvC79h+tv02AdY1n/WHO64kwnS2Cj4B+fFdKwJnjzD+arH6/qNYiqcXHQ0FZDzo3p
 YL/Dy8r+sWAUC9ve4o4sA/2WnJxYzd1iC9cp8lQhr51d4FhEwl8AMs9Jn60ivEg7hHvc=
X-Received: by 2002:a05:6402:493:: with SMTP id
 k19mr192625edv.386.1631030684625; 
 Tue, 07 Sep 2021 09:04:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCRHg16B41eoGrSff767tW3HOmYqdzBkYRnoQJPjmeOGMsOt03Qq5x1wQf09E6Gb/K5hxcxQ==
X-Received: by 2002:a05:6402:493:: with SMTP id
 k19mr192600edv.386.1631030684335; 
 Tue, 07 Sep 2021 09:04:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id js21sm5725959ejc.35.2021.09.07.09.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 09:04:43 -0700 (PDT)
Subject: Re: [PULL v3 00/36] (Mostly) x86 changes for 2021-09-06
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210907071349.116329-1-pbonzini@redhat.com>
 <CAFEAcA84x-V8vyBQ95VKcPw=1p7pVXyywhpZWoysokyLLX_aGA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e0f3752a-567f-c00b-2e54-aaddb16debe7@redhat.com>
Date: Tue, 7 Sep 2021 18:04:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA84x-V8vyBQ95VKcPw=1p7pVXyywhpZWoysokyLLX_aGA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/21 14:23, Peter Maydell wrote:
> On Tue, 7 Sept 2021 at 08:16, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit 935efca6c246c108253b0e4e51cc87648fc7ca10:
>>
>>    Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-09-06' into staging (2021-09-06 12:38:07 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to 127c76bd1aa893122a22677b991c0f31ebef7f09:
>>
>>    doc: Add the SGX doc (2021-09-07 08:54:57 +0200)
>>
>> ----------------------------------------------------------------
> 
> Sorry to bounce this for a third time, but I only just noticed
> this in the diffstat:
> 
>>   docs/intel-sgx.txt                       | 167 +++++++++++++++++++
> 
> No new .txt files in docs, please. All documentation from now
> on needs to be in rst format and correctly integrated into
> the right place in the manual structure.

As discussed on IRC, I didn't want this series to be held by discussion 
on how to improve target-i386.rst and make room for more files, but I 
have now finished and posted a proposal for that.

Since I see that this pull request is already in the staging branch, I 
assume that I'll include the SGX conversion to reStructuredText as soon 
as that proposal is reviewed.

Paolo


