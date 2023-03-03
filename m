Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C41D6A9B24
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7fU-0006Ir-1E; Fri, 03 Mar 2023 10:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY7fI-0006I3-AC
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:49:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY7fC-0007q2-EB
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:49:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677858581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hREe3i6GMtbMaAp9UWBSK7ih5Q/QrYpJ8W4WEY3jUAI=;
 b=R60zAhJZIhAIVJR8ZjzJavu2vmd063VhOb9zaBysOgolgp8CmKy2Y9Ul3B0u/wtSogoKLN
 ETVF6fBwBr/wtY8wVdEFGHlqXvUNmV5hj/QebCz3MWs15QzOkDqL5Mj8tNFlhWAlrTYycx
 IJrQlwPXkj0EhSWXsALLELwQOf8U+b8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-H5zb6_2KM8-9gG34NmRNaQ-1; Fri, 03 Mar 2023 10:49:40 -0500
X-MC-Unique: H5zb6_2KM8-9gG34NmRNaQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso3027587wmc.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 07:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hREe3i6GMtbMaAp9UWBSK7ih5Q/QrYpJ8W4WEY3jUAI=;
 b=Tn8QgbWVe8KIXylqioA4u4m/lVwAWJcI7E1nA2ojVBR6tLW5JsnIA3oiDTvkFWsgUR
 3+I0VOXEQ15ZX5BLdHJQJAmRR0WDH26zLCVwIdmOhMhwo4lGmTnqGhFiiIGjVDrksjxf
 unwBuNIjnoHvFGnCMQTThCf4IudGQHGUZTvMk/lpMgvEfJvwnw2u3kipZ/stiDomCwqR
 g8yJdwAUjhROV/LG0N4Ll3/rcNFk39s7UMfWdtHR3DdUCcKnKm7+WyHoIfifZmwcUM9H
 WTTfOJ+sM+Bt4S+apNmPQxiJaR9jIPUCj/QQT4N7w96V+789rYY2P1XC+s2B6Il4g86y
 pb1w==
X-Gm-Message-State: AO0yUKUD/9mVS1Ob3wFOpmo4/dYOEcw/wfN6R1YlQzJgrpnDk+eYiTtK
 L4pchnpDN+NuFBNZpL1wPLaOk1k9wWcTEMItaziP0wJONqrCBmHHV8+2qJszfBqOFfv6cWtqA6I
 QX05jVrTHBXUs//A=
X-Received: by 2002:a05:600c:1c20:b0:3dc:5b88:e6dd with SMTP id
 j32-20020a05600c1c2000b003dc5b88e6ddmr2238877wms.10.1677858579260; 
 Fri, 03 Mar 2023 07:49:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+YplBOTwM4pYLuuy7+Rm68+YNYswPjF1yuTNbhd1I8e52LIy1uQszj1YkLsJucYu92AbnP8g==
X-Received: by 2002:a05:600c:1c20:b0:3dc:5b88:e6dd with SMTP id
 j32-20020a05600c1c2000b003dc5b88e6ddmr2238856wms.10.1677858578965; 
 Fri, 03 Mar 2023 07:49:38 -0800 (PST)
Received: from [192.168.8.103] (tmo-099-97.customers.d1-online.com.
 [80.187.99.97]) by smtp.gmail.com with ESMTPSA id
 j40-20020a05600c1c2800b003dd1bd0b915sm7053661wms.22.2023.03.03.07.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 07:49:38 -0800 (PST)
Message-ID: <c8893694-f842-9731-6b23-f2b43187db69@redhat.com>
Date: Fri, 3 Mar 2023 16:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/5] iotests: make meson aware of individual I/O tests
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
 <44d571e7-05b6-b2a1-7eb7-44bf2912ec69@redhat.com>
 <ZAHP1I82r/cbuUo4@redhat.com> <ZAHwyFhy+shNjfav@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZAHwyFhy+shNjfav@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/03/2023 14.06, Daniel P. Berrangé wrote:
> On Fri, Mar 03, 2023 at 10:45:40AM +0000, Daniel P. Berrangé wrote:
>> On Fri, Mar 03, 2023 at 09:30:39AM +0100, Thomas Huth wrote:
>>> On 02/03/2023 19.46, Daniel P. Berrangé wrote:
>>> 3) When I tried this last year, I had a weird problem that
>>>     the terminal sometimes gets messed up ... I wasn't able
>>>     to track it down back then - could you check by running
>>>     "make check-block" many times (>10 times) to see whether
>>>     it happens with your series or not?
>>
>> I've just seen this - echo got disabled on my terminal.
> 
> The problem is that testrunner.py script doing
> 
> # We want to save current tty settings during test run,
> # since an aborting qemu call may leave things screwed up.
> @contextmanager
> def savetty() -> Iterator[None]:
>      isterm = sys.stdin.isatty()
>      if isterm:
>          fd = sys.stdin.fileno()
>          attr = termios.tcgetattr(fd)
> 
>      try:
>          yield
>      finally:
>          if isterm:
>              termios.tcsetattr(fd, termios.TCSADRAIN, attr)
> 
> 
> When invoking 'check' this wraps around execution of the entire
> 'check' script. IOW it saves/restores the terminal once.
> 
> When we invoke 'check' in parallel it will save/restore the same
> terminal for each invokation.
> 
> If the 'termios.tcgetattr' call runs at the same time as there is
> a QEMU running which has put the terminal in raw mode, then when
> 'check' exits it'll "restore" the terminal to raw mode.
> 
> IOW, this savetty() logic is fundamentally unsafe when invoking
> 'check' in parallel.

Hmm, couldn't we e.g. also simply skip this termios stuff when running with 
"--tap" ?

  Thomas


