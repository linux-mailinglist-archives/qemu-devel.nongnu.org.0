Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5EA91AF2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 04:06:02 +0200 (CEST)
Received: from localhost ([::1]:44098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzX3Z-0000IT-Id
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 22:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hzX2k-0008FD-C9
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 22:05:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hzX2j-0007lW-C5
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 22:05:10 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36310)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1hzX2j-0007kx-6f
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 22:05:09 -0400
Received: by mail-wm1-x341.google.com with SMTP id g67so194800wme.1
 for <qemu-devel@nongnu.org>; Sun, 18 Aug 2019 19:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g6dI5BdvtjU8z17AF96KyQ0SDFufQXz6orPeilT5Ke4=;
 b=ESdKcZUeVjJC7B6N8RR3CqNN9eSGSAMO4gigvYVt+8eZVwTQFeuqw3PDNwIliR3ReP
 IElhS7xwi81Fr14mXOVmwGPRl2TjwcWvRr4lRCWfxPdGTs36XvTKrXEPFYHu+D7d5EMA
 8PEcZo76MB9ETbFitEJDbJZlHXHYq4spGWqRrXuBOOe0736+W9R2Ap9FcURmj41Bd46K
 PFzeP6FipbGsmCBfZVz+Eu32+OTJhNGVjyUEbDuGICFMAdGGVSlcnnZ7I3yse8sl53rK
 OPs9K4FfZw/WEqDGZADlI6Ok8XMlZa674ugukm7BzlDOAlvmFduBMT6IZwhioYslbXyP
 pKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g6dI5BdvtjU8z17AF96KyQ0SDFufQXz6orPeilT5Ke4=;
 b=i2rOH62QAWBMhorFWTxYJICWyWrvnFKYSpuxo1B2BwrHjaX/bdbjNSiw06xnIyVcBW
 PUrCRQAyTAE8lmFH+azcvMuyuPb0/MKyACUzP/zmvHx9gI8+OFbNoQ5lJiHxC5K50kDX
 A8OT7uybm9jll3vEFut+lJOTSWohdE1y91k5oY5nJD+LplWM1ighBBuw5eSrMyEh1bpz
 9J9GQuJVPaCFzqdzsAZPLNPRrw8fnNForM0hgytNoDDWcIr1nPzmUQQtjKjLaoq1AsfB
 zy8BOkYH+D8CWaDWR2KID5AZxJhj9KVP0CiuQ0M5YW1gC4wSlAC645M50DotLmkH/CRs
 1rzQ==
X-Gm-Message-State: APjAAAVQxMI4OQKEStzDmXfPKSfsnGOPLIkfgArc9Kewz/2ERtd1Lmw5
 COJim/EGYOmB524e5Og3GK0=
X-Google-Smtp-Source: APXvYqywJstmfXXm+8PEQagRnihyLCTWjvOhxtFbp12qRbgXy1NHG1VIDM4artu26i+DDDOMJaNNdw==
X-Received: by 2002:a1c:7c06:: with SMTP id x6mr17824965wmc.133.1566180307644; 
 Sun, 18 Aug 2019 19:05:07 -0700 (PDT)
Received: from ?IPv6:fd00:835b:d940:d4fc:1::d3?
 (2a01-036c-0113-49c9-0001-0000-0000-00d3.pool6.digikabel.hu.
 [2a01:36c:113:49c9:1::d3])
 by smtp.gmail.com with ESMTPSA id 4sm25762745wro.78.2019.08.18.19.05.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 19:05:06 -0700 (PDT)
From: "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=
 <DirtY.iCE.hu@gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <cover.1566168923.git.DirtY.iCE.hu@gmail.com>
 <ed35e9e72aa77c9376e9c8a8f3a5443703fe6fbe.1566168923.git.DirtY.iCE.hu@gmail.com>
 <4db4fa19-65f5-0bc8-3354-a1779bbdb0f3@redhat.com>
Message-ID: <5b788626-f2bd-68a2-5825-2ad5b96ff221@gmail.com>
Date: Mon, 19 Aug 2019 04:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4db4fa19-65f5-0bc8-3354-a1779bbdb0f3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v4 14/14] audio: fix memory leak reported
 by ASAN
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2019-08-19 01:25, Philippe Mathieu-Daudé wrote:
> Hi Zoltán,
> 
> On 8/19/19 1:06 AM, Kővágó, Zoltán wrote:
>> Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
>> ---
>>  audio/audio.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index 924dddf2e7..9b28abca14 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -1343,6 +1343,12 @@ static void free_audio_state(AudioState *s)
>>          qapi_free_Audiodev(s->dev);
>>          s->dev = NULL;
>>      }
>> +
>> +    if (s->ts) {
>> +        timer_free(s->ts);
>> +        s->ts = NULL;
>> +    }
> 
> Why not directly fix audio_cleanup() previous to your series?

I didn't really think about it.  When I found the memory leak and
figured out it wasn't made by one of my patches, I just patched it on
top of my worktree.

> 
>> +
>>      g_free(s);
>>  }
>>  
>>

Regards,
Zoltan

