Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB4B2C617B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 10:19:43 +0100 (CET)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiZuo-0007T2-Pt
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 04:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiZrR-0006IY-NM
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:16:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiZrJ-00017l-N4
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606468565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpHKH5UKFYkJ34a5ICutUaTauj9tgSqQGawG0kX15mI=;
 b=K1GWlOOCWvAaMBR8JB2SlQWrBYBEhHp/5iLgjxcJs0E4o1dxhHcjn8cCeEzvyDZGpNUmW+
 diWObAaKGf7cV5XTfGcbwbmyTq/MaCgRPzbu3iVW/1wPSmxUrudQuPO8MDVD4y2X84Rb8r
 Cu1Pec4sKD5+c2Qm2SVqMraxwuG1sIU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-nWf1ZIJzO5a24a71d1udmg-1; Fri, 27 Nov 2020 04:16:01 -0500
X-MC-Unique: nWf1ZIJzO5a24a71d1udmg-1
Received: by mail-ej1-f69.google.com with SMTP id p18so1781144ejl.14
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 01:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cpHKH5UKFYkJ34a5ICutUaTauj9tgSqQGawG0kX15mI=;
 b=LLzp6P/P9Pd3nHXj4pBS7iMfn/Waso8Ew53OuATjGRktMaebuGidjVQJsswKHU/w99
 W/yu5uY994kgMbJEL/+u2u/Do8fPShATs6bi6GT6+UBhX/5yjMdsDVFng/8CmKdtXhwE
 kL/LYFpg+y/IX+vkGEoOmdn70pi5Cc6Alnb+u+YRcqL3X6Cv3Ag5/Gzc4smrRjEqkti1
 yU7tv/9AMxW1G4wua7uiV8RrQn201tQnVYkCTU1yUcY9uxlzHLEKnX70WpI0BJeHwzjy
 YbY0zozNJxGm2HM+nRVRGZ6Ty2xbcGiEYJ8sOV+oFTRRdVnnee9gxVg0ovg7Jz/jeMJm
 LFjw==
X-Gm-Message-State: AOAM533+4XBM+vxOYBaBUHB03aVOAKZEdcFeCAD81VnW1uV9lEi6H9J2
 8r6kInvJP9xMZKJTYFoLW6ENrL+OVaoMGbedp3u4URya4TaIUtQYtCsg2QuSf9YKibUDB1Cviis
 j+6NtS7btoWC9K6xegEqH0vVGJae3PUXj9E4Gr61IyA7Pc5L4kxlyq29ofVJvvRDVKV0=
X-Received: by 2002:a17:906:9588:: with SMTP id
 r8mr5360624ejx.148.1606468559384; 
 Fri, 27 Nov 2020 01:15:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAOiHxO1Kurmr+6lT3rk9v7gTAwNJr/oLX29z2Xx3oZaGjCgZd1sRt+tYSfE+3yuWQYH07tw==
X-Received: by 2002:a17:906:9588:: with SMTP id
 r8mr5360602ejx.148.1606468559104; 
 Fri, 27 Nov 2020 01:15:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s4sm490573ejo.81.2020.11.27.01.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 01:15:58 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>
References: <20201111104521.1179396-1-pbonzini@redhat.com>
 <20201111104521.1179396-2-pbonzini@redhat.com>
 <87h7pburdf.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] keyval: accept escaped commas in implied option
Message-ID: <0a15b86b-9ab8-d378-7578-a8304b32870a@redhat.com>
Date: Fri, 27 Nov 2020 10:15:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87h7pburdf.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[huge snip]

On 27/11/20 09:38, Markus Armbruster wrote:
> The suboptimal error message is due to the way I coded the parser, not
> due to the grammar.

Small digression: a different grammar influences how the parser is 
written.  You coded the parser like this because you thought of implied 
options as "key without ="; instead I thought of them as "value not 
preceded by key=".

> 
>   --nbd key=val,=,fob=
> 
>     master:       Invalid parameter ''
>     your patch:   Expected parameter before '='
> 
>     Improvement, but which '='?  Possibly better:
> 
>                   Expected parameter before '=,fob='

Yup, easy.

>    --nbd .key=
> 
>      master:       Invalid parameter '..key'
>      your patch:   same
> 
>      Better, I think:
> 
>                    Name expected before '..key'
> 
>    Odd: if I omit the '=', your patch's message often changes to
> 
>                    Expected '=' after parameter ...
> 
>    This means the parser reports a non-first syntax error.  Parsing
>    smell, I'm afraid :)

Nah, just lazy cut-and-paste of the existing error message.  I should 
rename that error to something "No implicit parameter name for '.key'" 
(again, different grammar -> different parser -> different error).  That 
error message actually makes sense: "--object .key" would create an 
object of type ".key" both without or with these changes.

> * Invalid key fragment
> 
>    --nbd key.1a.b=
> 
>      master:       Invalid parameter 'key.1a.b'
>      your patch:   same
> 
>      Slightly better, I think:
> 
>                    'key.1a' is not a valid parameter name

Or just "Invalid parameter '1a'".  I'm not going to do that in v2 
though, since parameter parsing is not being

> I believe there are two, maybe three reasons for this series:
> 
> 1. Support ',' in values with an implicit keys.
> 
> 2. Improve error reporting.
> 
> 3. Maybe nicer code.
> 
> 1. is a feature without a known use.

Breaking news: there is actually a use.  I should have pointed out in 
the commit message, but I didn't realize at the time, that this patch 
fixes device-introspect-test once device_add is switched to keyval-based 
parsing.  And why is that?  Because even though SUNW,fdtwo is not 
user-creatable, you can still do "device_add SUNW,,fdtwo,help".  It even 
works from the command line:

$ qemu-system-sparc -device SUNW,,fdtwo,help
SUNW,fdtwo options:
   drive=<str>            - Node name or ID of a block device to use as 
a backend
   fallback=<FdcDriveType> - FDC drive type, 144/288/120/none/auto 
(default: "144")
   ...

This invocation is useful (for some value of useful) to see which 
properties you can pass with -global.  So there *is* a valid (for some 
value of valid) use of escaped commas in implied options.  It can be 
fixed with deprecation etc. but that would be a more complicated 
endeavor than just adjusting keyval.

> 2. can be had with much less churn
> (I'm ready to back that up with a patch).  Since I haven't looked at
> PATCH 2, I'm reserving judgement on 3.

FWIW I think this patch is already an improvement in code niceness, 
though I accept that it's in the eye of the beholder.

Paolo


