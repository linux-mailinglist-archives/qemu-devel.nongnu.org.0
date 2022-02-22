Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DE54BFDCE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:55:13 +0100 (CET)
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXVQ-0004h1-Gs
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:55:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMXOH-0001Ng-9q; Tue, 22 Feb 2022 10:47:49 -0500
Received: from [2a00:1450:4864:20::32d] (port=43709
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMXOF-0000xj-Ov; Tue, 22 Feb 2022 10:47:49 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso2172710wmj.2; 
 Tue, 22 Feb 2022 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TEpm2oxtfl0jDjmtIAib0mWlqOcLvjZSehewkaj9dpc=;
 b=ebhkR4VBmg+kt3QwoT6x8FD0T6NUi6XcWXsNfhSLu75tUjcot1LRjOOAV6l/NMTSOZ
 9naPEpKRwGmtQ1ZB8EyZ8wBlIn2AAACWhm44xsRagTrL6vMXMjC4xiAl00dvzJETK1eT
 /JdYsfY8lqAZqgVsP1EWphYJHk8P7K4jW8edTnHxndloaEf2rGWV0bht8T3+Lx+DtmZK
 7526WJajO6ca58vLih1jx7oTppOQbzpzGAz4MJe0zEgpTjFAJq7hxcq13BxfADZhxtXW
 7P7kjE27ytk3J/D1t6BUgSDByRUOPR2VtIZ4ciEJajnNj1OhQMapE4aH9ES/ejOXKaLY
 j4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TEpm2oxtfl0jDjmtIAib0mWlqOcLvjZSehewkaj9dpc=;
 b=BeNADDJy+T5Ys/09ms1MtO9kphUSzpWiOygwGTRhOheVf5p0TZy/rOdL2OFSFSi5Me
 Ugv6dXfX/SDxUMnSaspnwXerrR5qCsrOKmz9x2XuidgEmjjM+hHhMhaXTftw9hQ6lz22
 zSOJ5UkUHqG72Lza542WJzd35VL69Bygg2DUQLrTODuYxz/n2qe5vUxNfp3Qi9Y2jB9h
 R4dMLXtBOqGdvu5aSWNaAIFEKmKWv+7RXRtz0lnxjjB5YjsU4GaFvODkPKrgAYObopGR
 LAAa4Lv8sfFO9Xj7FBfr6T+YZsKM2LyekTLK1UZcfC0Sy+lsOOAulgX++7W6e3n2hui6
 8o9Q==
X-Gm-Message-State: AOAM530CT0JxD1DP2Qg/gJHgAynkWXNVrQ4h1LlJEoH8zCs3Cob5NtNK
 dJ2ZE2iU63JNyfuWoK3n+LE=
X-Google-Smtp-Source: ABdhPJyGydkOfo1CnbEUkQQL2iY6YbIK/8hAag2RX+3mjlMeYv0JKEggzUoOVEMlylhqXpaI7fTbzw==
X-Received: by 2002:a05:600c:4ec6:b0:352:cc24:1754 with SMTP id
 g6-20020a05600c4ec600b00352cc241754mr3800951wmq.184.1645544864496; 
 Tue, 22 Feb 2022 07:47:44 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id n15sm25861737wri.33.2022.02.22.07.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 07:47:44 -0800 (PST)
Message-ID: <dd7d1e02-937c-c80c-da7e-5bf6f4c796bf@gmail.com>
Date: Tue, 22 Feb 2022 16:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH RFC 4/4] rtc: Have event RTC_CHANGE identify the RTC by
 QOM path
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <87a6ejnm80.fsf@pond.sub.org>
 <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com>
 <877d9nkknw.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <877d9nkknw.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/2/22 16:04, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> writes:
> 
>> Hi Markus,
>>
>> On 22/2/22 13:02, Markus Armbruster wrote:
>>> Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
>>> the RTC supports the event).  What if there's more than one RTC?
>>
>> w.r.t. RTC, a machine having multiple RTC devices is silly...
>>
>> Assuming one wants to emulate that; shouldn't all QMP events have a
>> qom-path by default? Or have a generic "event-from-multiple-sources"
>> flag which automatically add this field?
> 
> Not all events originate from a device, or even a QOM object.

OK.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> The ones that do could all use a qom-path member, I guess.
> 
> [...]
> 

