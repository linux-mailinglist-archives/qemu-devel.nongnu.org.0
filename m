Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C560240D2C3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 07:05:01 +0200 (CEST)
Received: from localhost ([::1]:57590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQja0-0007wZ-L0
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 01:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQjYX-0007F0-AT
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:03:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQjYU-0003X4-U8
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631768606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T174Lh8LW5NdWJhNUMW26liHTOP9w0ESLnmxoK6vAXM=;
 b=XS+L/vOwFjvA0Q8C+e2LhZItJTKIYcKqbE1mOvlfQu/oWsszJFwyDCEWnHFxPbOK4EosVB
 Y8t0fgTmRZ5KW5eYXJe69M0tXBSRVUKKPscmjo/hDCsi6rD+QtcuXDcjv7kAuJasBHTVUX
 djGxtaof0g22ZLLHup27BSqCoBRQQwM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-bTRz0cQQOGqY2GmI488kaQ-1; Thu, 16 Sep 2021 01:03:25 -0400
X-MC-Unique: bTRz0cQQOGqY2GmI488kaQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x2-20020a5d54c2000000b0015dfd2b4e34so1926312wrv.6
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 22:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T174Lh8LW5NdWJhNUMW26liHTOP9w0ESLnmxoK6vAXM=;
 b=8ArQcl7UxMLHO+Xx0TKsG3/zuTMWQvC1ieTZ9MpuMzDZXdS57LgDnvlVfuxh6AN6OA
 vTthBbXqsZjhDwVrkVxK+RrB1L7KvUjBtDOxLyZrqMt8kUoYYnGXXNj0sTPPzXGLlfv+
 mQ4mmLtepqcB17CwmUhQGgbw8GzpIsdwTLYTKLC83g0NORHKp13wVTWpmWk76rOZ6bos
 IDBe2Dlazee7c9XEl6fAK5Z4U52GEH3kJs/SfEJw8F5hboCvB7fPgM+lfH7yHlM48GCj
 cLYWFM/50CGWOothhcrWItjV6S8GxvULYGkWTXOquUAwa1NA99IIvxcMxxEElkkRIWOv
 OAAQ==
X-Gm-Message-State: AOAM530eff9tFMop3T94iTn1upgaQhHS72EYO4GY0zfw2Uu+6BparVHi
 8ZDxt0S/7S5CzRP73yvCh5jTJNKSy3sdfFTxmPwdNSidp/eYNDesXfRLq9E423f4pA30NccvWxs
 LGzTvM4wXdMh38xY=
X-Received: by 2002:adf:b741:: with SMTP id n1mr3809443wre.354.1631768603233; 
 Wed, 15 Sep 2021 22:03:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVOn0QsKaA2B0Q890MM8I1yVg3rak9PThnv8SSnbV8j9ayrtsLxD72E0kJStaD84wV/+imow==
X-Received: by 2002:adf:b741:: with SMTP id n1mr3809420wre.354.1631768603007; 
 Wed, 15 Sep 2021 22:03:23 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id s14sm1936053wrp.84.2021.09.15.22.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 22:03:22 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Gemfile: Add webrick bundle dependency
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210913182927.1022862-1-philmd@redhat.com>
 <9f52b00e-0189-8f44-96d4-cbb398c4514f@redhat.com>
 <YUBbjbJwpcpxjDmt@redhat.com>
 <574a9927-9a2d-f606-5192-3b66a1847b12@redhat.com>
 <9f2ea524-1718-a454-050f-af558ad380c0@redhat.com>
 <ddb8181c-2653-180f-4460-c8626a613101@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <412ec355-3347-d59b-348b-cf4cfc1b1b76@redhat.com>
Date: Thu, 16 Sep 2021 07:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ddb8181c-2653-180f-4460-c8626a613101@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 6:55 AM, Thomas Huth wrote:
> On 16/09/2021 06.24, Philippe Mathieu-Daudé wrote:
>> On 9/16/21 12:27 AM, Paolo Bonzini wrote:
>>> On 14/09/21 10:21, Daniel P. Berrangé wrote:
>>>> Yes, this is needed to fix Ruby 3.
>>>>
>>>> I didn't propose it myself as I'm not sure if it in turn breaks people
>>>> with Ruby 2.x ?
>>>
>>> Does it pass the GitLab CI (which uses 2.5)?
>>
>> Yes:
>> https://gitlab.com/philmd/qemu-web/-/jobs/1594757246#L466
>> Installing webrick 1.7.0
>> Bundle complete! 5 Gemfile dependencies, 32 gems now installed.
> 
> The patch is also not breaking anything for me here (with Ruby 2.5.9).
> Pushed now.

That was fast! Thanks :)


