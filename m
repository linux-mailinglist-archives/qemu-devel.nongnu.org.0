Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB371495E4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 01:30:54 +0200 (CEST)
Received: from localhost ([::1]:52596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd15R-0006Hi-CD
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 19:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hd149-0005fM-V0
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 19:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hd148-0006DZ-LL
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 19:29:33 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:32883)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hd148-0006C7-EZ
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 19:29:32 -0400
Received: by mail-pl1-x642.google.com with SMTP id c14so4861000plo.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 16:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L0glhUEOku/m2CZBF/K980Xl/Tc/ffR2kuSXue6rMPw=;
 b=rhkO+8FAq+PpRYc0A5OXKTjDvUzxcoBiALKMEPyeLYwTKmvTJqWilLu/IfcxyOpLUX
 PXgKBIqq1nxjk1ZbuXObSU92p/TseWL/S7ZvOx3qhrvxNUTc4yTp2ZxkaCdpUfKZOvAY
 3zw0NSx/GWB8ykuHvyrAc9oQThIkhJ0MObgWTFOIa8SgVwXR+Q9QzNw3zbvciY6soOuR
 wziB1KkgRqk6DDjeOVos0OKYJiYuowaumTwHeu0KhEozM8RMKV5nG0utn1dWaKHoS3Vw
 yYMr4HXoNCf4BIE6Xq0goktbtNMtwEMiJ/Ga6hi9q8NPlFDEMlzYYqW7KSeQ4EdFYo8s
 r7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L0glhUEOku/m2CZBF/K980Xl/Tc/ffR2kuSXue6rMPw=;
 b=j1rYakyGwwAmdXoseJRobniyH1vscR1qbzK1RX89tuDcNKtHeUtbbIpqu8VuD7RHFA
 ZUn55udZ6VTsxy4dDzuisp+Yo+o+DCylVaP9UQVgaNqX7BghvC7PZoX8kPpvb0mfJLBs
 ZTMvRpp7Z9kKIe/ettHQpOthkgeHaT+++h4PWcw6qt1uuXbDNnTZwtEuVpzdBs9FNxzx
 F6od2I+tuTkLLhxVNL3CbjaCtdM+YMK4zO9iXR6f53484xQC82uXmdk7C7Wk1ivhUbJk
 /bqPFzEoq/JpiFFHYYnu/AQbXExPFcKv7HdriybJ2ge+2N48hvWOScfeHADxlpy4cQSN
 RiDQ==
X-Gm-Message-State: APjAAAWFsvPkEe+eooUkpUbKnedlxrLtrYdGhxLiWu8jJGG9XimHbnhL
 238JCqWjwK7ZClV5kJPnAwtTkQ==
X-Google-Smtp-Source: APXvYqx2Qk9w73Mzs32lQJ8ScuNQUN5MyN2dQZXrIYwxQbi/AMd9C3lc9u4IcLMNTBdi4PlpuyvpDw==
X-Received: by 2002:a17:902:ea:: with SMTP id
 a97mr69171159pla.182.1560814171095; 
 Mon, 17 Jun 2019 16:29:31 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id g5sm343765pjt.14.2019.06.17.16.29.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 16:29:30 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-2-alex.bennee@linaro.org>
 <68f400ee-9186-f1f7-687d-9c96bde89c7d@linaro.org>
 <87y320wrif.fsf@zen.linaroharston>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3aa14040-26de-fe61-2578-46a2772347c7@linaro.org>
Date: Mon, 17 Jun 2019 16:29:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87y320wrif.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH v3 01/50] trace: expand mem_info:size_shift
 to 3 bits
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
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/19 1:22 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 6/14/19 10:11 AM, Alex Bennée wrote:
>>> From: "Emilio G. Cota" <cota@braap.org>
>>>
>>> This will allow us to trace 16B-long memory accesses.
>>>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>> Signed-off-by: Emilio G. Cota <cota@braap.org>
>>> ---
>>>  trace-events | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/trace-events b/trace-events
>>> index 844ee58dd9..037169aab3 100644
>>> --- a/trace-events
>>> +++ b/trace-events
>>> @@ -159,7 +159,7 @@ vcpu guest_cpu_reset(void)
>>>  # Access information can be parsed as:
>>>  #
>>>  # struct mem_info {
>>> -#     uint8_t size_shift : 2; /* interpreted as "1 << size_shift" bytes */
>>> +#     uint8_t size_shift : 3; /* interpreted as "1 << size_shift" bytes */
>>>  #     bool    sign_extend: 1; /* sign-extended */
>>>  #     uint8_t endianness : 1; /* 0: little, 1: big */
>>>  #     bool    store      : 1; /* wheter it's a store operation */
>>>
>>
>> Well, 128B-long memory accesses.  But SVE supports 256B memory accesses
>> already.  So why not add one more bit now.
> 
> Good point.
> 
> Do we have any architectures that do load/stores that are not power of
> 2? I guess the SVE non-faulting accesses are treated as a series of elem
> size accesses.

Yes, non-faults are in addition predicated, so each element is considered
individually.

Even the SVE non-predicated load/stores can technically be considered a
sequence of byte operations.  Which, I suppose could be helpful, because SVE
can otherwise be configured to do non-power-of-2 operations.


r~

