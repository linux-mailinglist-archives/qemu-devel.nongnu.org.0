Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE9325A1B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 00:17:50 +0100 (CET)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFPtD-0004z8-EI
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 18:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFPrt-0004Xl-Sj
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:16:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFPro-0003si-7B
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614294978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxLdUe5FjH7H87Yv0LWWAh6qHE4DW28K+xG2lV4vKyk=;
 b=i/ZjGM3ygEHJ2O77U6++DsQ6FmhiQwJCMCKqXC4l4wdUH0R+K2Gb8kmiygc/lE8kE2l67i
 mkEdXwjOCmPO/fHxCsuY9YqVylAga38tbk7BK/KjtcuBV171Zp0NEErdjPGQAMZkWq11AZ
 QJw/qXvdmPCRTDJJZYUB0R3wY/OySeg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-N9UL1zjpP-yxkZBF2xgbhQ-1; Thu, 25 Feb 2021 18:16:15 -0500
X-MC-Unique: N9UL1zjpP-yxkZBF2xgbhQ-1
Received: by mail-ed1-f69.google.com with SMTP id q2so3604567edt.16
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 15:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AxLdUe5FjH7H87Yv0LWWAh6qHE4DW28K+xG2lV4vKyk=;
 b=jJgaFK0aEEBcKSnraQIBUvTpS6YRhrMtOzjK9LnsVMv9Lf6xYEJ0R3Det+5a9kYLV6
 qZynZxaSXSGkCXObS16Jvr9s0sISKg5L85gh/x/2T7hvUeGni6ZzOT+CxCCGgDPpQ3u+
 hbfSzTeZeMs8J4GCWB3fUXCGtCOIRTJea4QrytexL9r+MtVe/ZP/VVPHDq59dKxJUQHg
 QjoctrLQ8qZ9E8qglD9bl8x5tJbMkgUr9FfkZYfnc/Kx1TMfADTbCIBELGJJ+9AiETL3
 7r3JB5dyCA6jX3xGtOyU3mv2fb3i6wnHdAOEBGP/rsGVbYmEdLQtMqYKuiA3SQ+/B34G
 ycSQ==
X-Gm-Message-State: AOAM533qAGLq2fG9k/AB19BVF4AvaCkxQIdyj5StTyGzoGjS7H7OC3fG
 mI8Yy8tnRo/winz/QIzP9M3mDxYlscj7B8yW9/VVzfvZI25qvXoGPKgk2GR1k2+MzT2REpU4Tch
 XBcz4giCTAq53U+0=
X-Received: by 2002:a05:6402:1118:: with SMTP id
 u24mr321576edv.386.1614294973869; 
 Thu, 25 Feb 2021 15:16:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxa9NefHEtEktJY0dEa+KjKYrXEvDrt8YT9LjXzIY0cXzqgclvsBQfAo8GJvCcH7fA9Hm3xMA==
X-Received: by 2002:a05:6402:1118:: with SMTP id
 u24mr321555edv.386.1614294973679; 
 Thu, 25 Feb 2021 15:16:13 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id lk12sm1243966ejb.14.2021.02.25.15.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 15:16:13 -0800 (PST)
Subject: Re: [PATCH] multiprocess: move feature to meson_options.txt
To: Jag Raman <jag.raman@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210224122306.451764-1-pbonzini@redhat.com>
 <72fc7d76-f8e3-2c0f-e890-99509bb6230d@redhat.com>
 <e89873e7-d996-0161-8c4f-587aadd2208f@redhat.com>
 <YDfRz3zhkoTiyoKt@stefanha-x1.localdomain>
 <C3EAD382-8A3B-4DC7-9982-CC1DDAEEF4B7@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cd96210d-58bc-2978-02bc-b7ca794f7274@redhat.com>
Date: Fri, 26 Feb 2021 00:16:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <C3EAD382-8A3B-4DC7-9982-CC1DDAEEF4B7@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 6:50 PM, Jag Raman wrote:
> 
> 
>> On Feb 25, 2021, at 11:35 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>> On Thu, Feb 25, 2021 at 01:15:53PM +0100, Paolo Bonzini wrote:
>>> On 25/02/21 11:38, Philippe Mathieu-Daudé wrote:
>>>> On 2/24/21 1:23 PM, Paolo Bonzini wrote:
>>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>>> ---
>>>>>  configure         | 12 ++++--------
>>>>>  meson.build       |  9 +++++++--
>>>>>  meson_options.txt |  2 ++
>>>>>  3 files changed, 13 insertions(+), 10 deletions(-)
>>>> ...
>>>>
>>>>> @@ -2535,6 +2540,7 @@ endif
>>>>>  summary_info += {'target list':       ' '.join(target_dirs)}
>>>>>  if have_system
>>>>>    summary_info += {'default devices':   get_option('default_devices')}
>>>>> +  summary_info += {'Multiprocess QEMU': multiprocess_allowed}
>>>>
>>>> Since you are changing this, it is a good opportunity to find a
>>>> better description to this feature (similarly how we recently clarified
>>>> the TCI description).
>>>>
>>>> The current description is confusing with multiprocessing (which is
>>>> by default on QEMU and every developer want to exploit that).
>>>>
>>>> So the main multiprocess code resides in hw/remote/mpqemu*.
>>>>
>>>> I have the impression "monolithic application" is common in
>>>> software engineering. What about "polylithic QEMU"?
>>>>
>>>> Stefan once described it as "out of (main) process device emulation".
>>>
>>> Out of process emulation?
>>
>> When Multiprocess QEMU switches to the vfio-user protocol the feature
>> could be renamed to "vfio-user device backends".
> 
> I personally don’t have any preference for the name.

Great.

So with the summary/description updated as:

summary_info += {'Multiprocess QEMU (vfio-user device backends)':
multiprocess_allowed}

option('multiprocess', type: 'feature', value: 'auto',
       description: 'Multiprocess QEMU (vfio-user device backends) support')

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Like Stefan pointed out, this would be merged with the
> vfio-user model for emulating devices in a separate
> process. We could probably rename this during that change.
> 
> Thank you very much!
> —
> Jag
> 
>>
>> Stefan
> 


