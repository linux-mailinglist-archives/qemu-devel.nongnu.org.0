Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF43422ED4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:13:27 +0200 (CEST)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXo0L-0007CY-KB
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXmxg-0003R9-CO
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXmxe-0000hl-8t
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtdv0WeoqD6f4KERtqiwxNT30a8w2RWpSE6rNES9ask=;
 b=ZRo3xrGwO/nVI6kgeHYtEREK0xlhCtjy0iwZNB3hxcymup5DkyGj55qAC1jVL7q+ivT8iG
 lovW2ftuFLFqcU0t8+PceHO8cb1YvFrfC/2vYPk6pyyckv8qh1B9z1t61ygQOXbqJPv2Fp
 fIyJQvkqOSUcMNgTD5wY1vtIaYRFb7c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-s2d6JHuiPPmxvxKEg1kDbg-1; Tue, 05 Oct 2021 12:06:32 -0400
X-MC-Unique: s2d6JHuiPPmxvxKEg1kDbg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so9257305wma.4
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xtdv0WeoqD6f4KERtqiwxNT30a8w2RWpSE6rNES9ask=;
 b=vpC3BAOdcBIZxyUnU7AjJq3SjQ6JfNHAEUw5kQvRTtVAcULlT9C6+PzIi4xGKnzwx+
 cV8ggK8oz4nktqlHIWv9o3s/WY/ur4O7l4mDSHGo4FboIUg2xRH34j796ZRcX/FE+lxo
 7PdvUcxdburZJ7GsZiUIJ+piRiKbWw390yym+KFa2JwRTl2c/3Ptsy/KPyE2UWbAeIhb
 6kGTQIZK4C2FFJXSuzl4ZEBU3u3trEbZPcC/BOcExhkTHWKHN5Vc7C3gSZ6/UGqem8TN
 OShsvnM0GPohZorbp30ySOAOk+Inn8wLDALrqLmZTBebfTrroKbIo2rsPMjH/K4ItepC
 9g7w==
X-Gm-Message-State: AOAM531I2kuXv1YS92EKH4JQVqaKqPMuE9ldpUw4V0Aa558GODOy7l/z
 wIi1WryciUSbc3W7L4hWDJzp75zNNE0CiNJX2U0GJUzZLZ1vZhD27dxDJmYyHfEFLvJoxNo575Y
 0hvG0edoi5gHtDok=
X-Received: by 2002:a5d:598f:: with SMTP id n15mr22153259wri.74.1633449991545; 
 Tue, 05 Oct 2021 09:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDhVWNVlZRFJEbTHmgrR5sBBkMMVOICNNiSqSt+ewFGH7wvxEHOEhYGZwVkllytnk5MCosfw==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr22153217wri.74.1633449991296; 
 Tue, 05 Oct 2021 09:06:31 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y23sm2517415wmi.16.2021.10.05.09.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 09:06:30 -0700 (PDT)
Message-ID: <d5e44a59-13aa-6bae-3511-2f5b135fbef8@redhat.com>
Date: Tue, 5 Oct 2021 18:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: In-tree docs vs. Wiki [Was: Re: [PATCH 0/3] rSTify SubmitAPatch, 
 TrivialPatches, and SpellCheck wiki pages]
To: Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <YVxarQkCtPkhRc4Z@stefanha-x1.localdomain> <YVxdKpks4ARkVHlj@paraplu>
 <YVxgBvQTwfnBgZXI@stefanha-x1.localdomain>
 <e91b1c71-63dc-644c-bdab-308b989d5b94@redhat.com>
 <YVxxTgCxQ39nIQxc@redhat.com> <YVx3bqvVny2wdTEh@paraplu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YVx3bqvVny2wdTEh@paraplu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 18:03, Kashyap Chamarthy wrote:
> On Tue, Oct 05, 2021 at 04:37:50PM +0100, Daniel P. Berrangé wrote:
>> On Tue, Oct 05, 2021 at 05:07:06PM +0200, Philippe Mathieu-Daudé wrote:
> 
> [...]
> 
>>> One point Peter raised on IRC is it is easier to update a Wiki page
>>> than get a patch merged into the repository. IOW we are making things
>>> harder.
>>
>> There are factors to consider beyond ease of contributions.
>>
>> Certain information here is documenting a fundamental part of the
>> QEMU community operation & processes. That ought to have a high
>> trust level and be subject to review of content changes.  I'd say
>> the SubmitAPatch page falls in this category.
>>
>> Other information is essentially random adhoc user written content
>> that isn't critical to the project. This can live with a low trust
>> level and little-to-no review.
>>
>> IMHO, the wiki should only be considered for the latter type of
>> content, with any important project content being subject to
>> review.
>>
>> I also feel like docs in git is more likely to be kept upto date
>> by the regular maintainers, than wikis which can become a bit of
>> outdated mess.
> 
> I agree.  Here's an example that proves your point: had I written this
> huge 'live-block-operations.rst'[1] doc as a Wiki, pretty sure it
> would've been slowly rotting away.  Now I see 5 other contributors
> besides me (including Peter, yourself, and Paolo in this thread) that
> have patched it ... by virtue of it being in-tree.
> 
> That makes me even more convinced that having development, interface,
> and any valuable docs that are in-tree are more well-maintained.

This example is very convincing :)

> (FWIW, I seem to have more motivation to write docs in rST or similar
> formats that can be iterated over, with in-line reviews like regular
> patches.  I can't claim the same level of motivation to write Wiki pages
> somehow.)
> 
>> It is a shame that our normal contribution workflow doesn't make
>> it easy for simple docs changes to be accepted and merged :-(
> 
> Yeah; improving that can be nicer.
> 
> [1] https://qemu.readthedocs.io/en/latest/interop/live-block-operations.html
> 


