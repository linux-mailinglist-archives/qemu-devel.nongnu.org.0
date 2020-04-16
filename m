Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5A1AD099
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 21:51:27 +0200 (CEST)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPAXm-0007G5-Ov
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 15:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pauldzim@gmail.com>) id 1jPAWb-0006KJ-KN
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:50:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pauldzim@gmail.com>) id 1jPAWa-0004WB-H7
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:50:13 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40727)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pauldzim@gmail.com>) id 1jPAWa-0004Vv-8p
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:50:12 -0400
Received: by mail-pf1-x443.google.com with SMTP id x3so2140199pfp.7
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tbZNOJdVsQi8oMBbINRrrcL3yTSa0Ay1hQwGrl+0zl4=;
 b=UghIDF4PS9FbmQPUld3o4pT6aF9kwubhnmJ7ciIPy2356bic1BPrDXtyWh/H+bd5nX
 jWjH5QfBLizitPXoQcoQQiraHZSbMB5U87t6HeDFE3meM6YiB59ryi5vNmOyKdIum/DS
 Pb3KlyM1+LI/HWgBtzCBO7iOVEr2RQpApEzWuGSLwaPUM2zOZ0pood3rUAOskv3ePaeT
 owSm16orM9Pg5Y3YSms6mS4O94J+nzvsQKbJpzmtSbfclbMAKHd8bCbCCxwvPLB89CYs
 0w4Gq8fYGc9nDBQSg+sAnVABghp6N6h2eZ5WOkdgp+ok2FgpOxBYmxs90KU8Yww31Uf1
 uYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tbZNOJdVsQi8oMBbINRrrcL3yTSa0Ay1hQwGrl+0zl4=;
 b=Ifu/HxIGGxs1j0GN4n8fhjsDeW+WW/T5eycneKyHZIown1aH66uCIHZeYxxiSyVHqS
 GzcOuvy/leaz4tPU/JwzMrL6Uq38NmK+Tm52TJsC+7+W3d33zm+JaWqnalZpl2qqaGE4
 RZA4LzsUSLUc8jsY8hYRY7Sl2G3J95XnzdgENi3qXvSK1QGYUaf2oocO/qLTTzhrnXUW
 Pga9PvIuanMSLv5t4s2TtroJv2ep7CiO0DJCu3G5aD/xRaP26X3pa+LwzEEOaJAqZojY
 byomss+HUCSyvh0uZ3eq2nFVBix+OaBa02puKIkeezZS1QIhLBNNNyBtBB8/0RbPxjtT
 PMbw==
X-Gm-Message-State: AGi0PubZ3oCMVqy1n4QoHxtAoHqW4tfZom8vdJjTJdUelQIp7DuqUNBP
 sPcw0a186YZ6QHqZRB0lp70=
X-Google-Smtp-Source: APiQypLzj82+k8P93AxZetz+N/nsl8kvJQHHAMrl9oiXgUpzyWQprSmA7iT6JBLh+2rLWKIJXkazWw==
X-Received: by 2002:a65:5a8b:: with SMTP id c11mr25675539pgt.215.1587066610749; 
 Thu, 16 Apr 2020 12:50:10 -0700 (PDT)
Received: from [192.168.0.3] ([75.167.104.59])
 by smtp.gmail.com with ESMTPSA id w184sm10567123pfb.5.2020.04.16.12.50.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 12:50:10 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] dwc-hsotg USB host controller emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200329001705.15966-1-pauldzim@gmail.com>
 <20200329001705.15966-5-pauldzim@gmail.com>
 <CAFEAcA9bL=uZ3-F4bYbHW+V9REnS1OnSusGKB2UoHS0bjSbvzA@mail.gmail.com>
 <CAFEAcA-nysMVx1-xukuhaUCWaH544+2_J8AtUMru2hsyv-hPEQ@mail.gmail.com>
 <7830b8bd-efea-4987-3727-165385e6dd25@redhat.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Message-ID: <51b3a07a-a32e-f340-7294-6d15042caf1b@gmail.com>
Date: Thu, 16 Apr 2020 12:50:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7830b8bd-efea-4987-3727-165385e6dd25@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/20 9:30 AM, Philippe Mathieu-Daudé wrote:
> On 4/16/20 5:47 PM, Peter Maydell wrote:
>> On Thu, 16 Apr 2020 at 16:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Sun, 29 Mar 2020 at 00:18, Paul Zimmerman <pauldzim@gmail.com> wrote:
>>
>>>> +    s->as = &address_space_memory;
>>>
>>> Ideally this should be a device property. (hw/dma/pl080.c
>>> has an example of how to declare a TYPE_MEMORY_REGION
>>> property and then create an AddressSpace from it in
>>> the realize method. hw/arm/versatilepb.c and hw/arm/mps2-tz.c
>>> show the other end, using object_property_set_link() to pass
>>> the appropriate MemoryRegion to the device before realizing it.)
>>
>> On closer inspection you're already doing that with the dma_as/
>> dma_mr. What's this AddressSpace for if it's different?
> 
> s->as is not used, probably a leftover (s->dma_as is used).
> 
>>
>> thanks
>> -- PMM

Thanks for the reviews guys, I will take all your suggestions into
account before I post the next series.

Thanks,
Paul



