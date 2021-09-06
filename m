Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC99C40194B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 11:52:24 +0200 (CEST)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBId-0004R3-Fc
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 05:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBHW-0003cT-V5
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBHU-0003GI-CQ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630921871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Xmaje7ga6aesLGfasGRK4f6vmhKmz2X6ft+3BV8Cls=;
 b=G0C82LP+TPQWgWyk1GDKa0Nyd2H0PWiIXa7Ww4SXBBCscNVM63KhDDz/WOBZob7GuUmJ+2
 e7L1VgfsXFfWL82tDJr94hNDPDJirSSNvNgloSnbIe4LHMpLt9t643zgnOyQC3dR5HdO+s
 cxBdRbV4ChWWriITurr5Ob3nT3jU7uo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-XORWgSiKOCGqn2IVZboikg-1; Mon, 06 Sep 2021 05:51:07 -0400
X-MC-Unique: XORWgSiKOCGqn2IVZboikg-1
Received: by mail-wr1-f72.google.com with SMTP id
 u2-20020adfdd42000000b001579f5d6779so1045852wrm.8
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 02:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Xmaje7ga6aesLGfasGRK4f6vmhKmz2X6ft+3BV8Cls=;
 b=Skj3DE2h0kTP9QRPBbjxzNO3KblSf+OhXxNq7rnhrT01YlrKzSYtV0gtyT6yVUKtRU
 0U9PP1m5PtsaoV2FpHGRrPAnORXlRhOf/tJsW58siUkkocHUbaVKYoLMVORVRv8/0UlK
 qlc6yYVQugjpBpSFLgh+TByWyEa1sKYCssbDgR7vZcotN794tZAxOApoYuaJYhlgyDdH
 qOcdakHhU7WgHMYm1nUAc51uphZVPmlqrMceRgKq1lS+8f9qdA6cuuCl/wxuwV0XxEGF
 T3WHiwK9VE90vQN5BY8IiUz+1KdsbBbvkIVjXAK/a202e+XTWId6bgQ5KwwnyHLQ5SsN
 KgEw==
X-Gm-Message-State: AOAM531gwsFdmCMYd0MJpiKMM4NVjsnoDaRRkFTtiIp7gKbafLzulqY1
 qK0ZOTHu4e+7lDSTDlCUEKFx8SsRfIUmKEBTOobgyLAF2MKIdny7v2U0dS64s5qtyfRNRNtfofO
 8wvjtvcYe4E0ocGM=
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr11933686wrg.151.1630921866741; 
 Mon, 06 Sep 2021 02:51:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnRZrdiJKzqLRcJ7Ynw/PpGL3nAAk67snvSRmN0rPwiAWRato5COGrCs8zqsBz+dETVG+eUA==
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr11933663wrg.151.1630921866488; 
 Mon, 06 Sep 2021 02:51:06 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831a0.dip0.t-ipconnect.de.
 [217.232.49.160])
 by smtp.gmail.com with ESMTPSA id k17sm6222660wmj.0.2021.09.06.02.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 02:51:06 -0700 (PDT)
Subject: Re: [PULL 00/13] Testing, build system and misc patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210902124911.822423-1-thuth@redhat.com>
 <CAFEAcA89mGzirJWyzH+-c3WtH3G=XYV0MqRfBK+5SnA+Hob-eA@mail.gmail.com>
 <3090f5dd-d03d-bd2a-ce4d-ff0d796d9c5f@redhat.com> <87v93hpqdj.fsf@linaro.org>
 <CAFEAcA9eWukPg87mBCA-UfGuy6i-HdOyjnOpYF1eRsbCHfUjvg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2afbb10f-b813-e1b6-8b61-5c7874994813@redhat.com>
Date: Mon, 6 Sep 2021 11:51:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9eWukPg87mBCA-UfGuy6i-HdOyjnOpYF1eRsbCHfUjvg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 18.49, Peter Maydell wrote:
> On Fri, 3 Sept 2021 at 17:37, Alex Bennée <alex.bennee@linaro.org> wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>> On 03/09/2021 15.22, Peter Maydell wrote:
>>>> This provokes a new warning from meson on a linux-static build:
>>>> Run-time dependency appleframeworks found: NO (tried framework)
>>>> Library rt found: YES
>>>> Found pkg-config: /usr/bin/pkg-config (0.29.1)
>>>> WARNING: Static library 'gbm' not found for dependency 'gbm', may not
>>>> be statically linked
>>>> Run-time dependency gbm found: YES 20.0.8
>>>> Dependency libpng found: YES 1.6.34 (cached)
>>>> Dependency libjpeg found: YES unknown (cached)
>>>> If we're building statically and we can't find a static
>>>> library then (a) we shouldn't print a WARNING and
>>>> (b) we shouldn't then conclude that we've found gdm.
>>>
>>> Hmmm, no clue what's wrong here, since I basically did declare it like
>>> all other libraries are declared, too (so this problem should have
>>> shown up somewhere else already?)... Paolo, do you have any ideas
>>> what's going on here?
>>
>> In attempting to replicate I found all the dynamic libs blow up:
> 
>>    WARNING: Static library 'xkbcommon' not found for dependency 'xkbcommon', may not be statically l
>>    Run-time dependency xkbcommon found: YES 1.0.3
> 
> I do vaguely recall complaining about new meson warnings for
> static library detection in the past as well:
> https://lore.kernel.org/qemu-devel/CAFEAcA8chPqS0keyGv0vBgNgacnMo95gA3LZDU2QfmteQ=4UZg@mail.gmail.com/
> https://lore.kernel.org/qemu-devel/CAFEAcA_-cNmt-sY3nqnGkpUqET86M6-82rf-Uv3QkwCR14kYsw@mail.gmail.com/
> https://lore.kernel.org/qemu-devel/CAFEAcA8xHxCGhh2hibsdCxZrYRRU+xcwVsa85O7KL9BsmW7ohw@mail.gmail.com/
> 
>> So is this a general problem with static libs. BTW I didn't catch this
>> because I only build user with --static as I thought system --static was
>> flakey anyway.
> 
> I'm not doing a system build in this case... Looking at some of
> those older threads, it looks like part of the answer is that
> for dependencies that we don't need for linux-user mode we should
> guard the test with some suitable if condition so we don't create
> the dependency unless we're going to use it, eg the brlapi check
> uses "if not get_option('brlapi').auto() or have_system", rbd
> has a similar thing involving have_block, etc.

Ok, thanks, that seems to work, I'll change the patch accordingly.

> But I think there is an underlying meson bug here which that kind of
> use of an if is merely working around: if we ask for a static library
> it should not give us a dynamic library.

Agreed. Actually, when I run configure with "--static --disable-system" on 
my laptop, I'm also getting some warnings:

WARNING: Static library 'z' not found for dependency 'zlib', may not be 
statically linked
Run-time dependency zlib found: YES 1.2.11
Run-time dependency appleframeworks found: NO (tried framework)
Library rt found: YES
WARNING: Static library 'png16' not found for dependency 'libpng', may not 
be statically linked
WARNING: Static library 'z' not found for dependency 'libpng', may not be 
statically linked

... and linking then later fails while running "make".

Paolo, could the behavior of meson be changed to fail already the 
configuration step in this case instead of only printing a warning?

  Thomas


