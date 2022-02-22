Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368BA4BF8B3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 14:04:19 +0100 (CET)
Received: from localhost ([::1]:42224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMUq1-0006PH-8f
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 08:04:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMUiR-00039y-0g; Tue, 22 Feb 2022 07:56:27 -0500
Received: from [2a00:1450:4864:20::32c] (port=45642
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMUiD-0000c2-6w; Tue, 22 Feb 2022 07:56:15 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso1746104wmb.4; 
 Tue, 22 Feb 2022 04:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Iah40A1SFHkIFZB5vYT6jrRzqwQ5PoS37XlIWydOnRE=;
 b=lvLJ1Z1sztPORD6IDuhAR40ThraTwjNm293U8lTyQUbctLgLCibyk1CMLlzFDjMTXH
 b3Y4tF2r7c5Gl+JE0KTQfb50YLorypTkalGPo/yibJt2xG0ngnTrxo+jXwsqvygCAbJ/
 DHMNbI7TEyQUX0wMTmqWAk9hvED6qczac82ISs2csaKaHtamz8t8gP6QPwi9bRWVrU5s
 tcwl+qg0QYNjhjAza5eUl/2AbyqgKkhGi0YTOVRxYrS2BZ/SWz2FTPfVIhhVayjWBiul
 RDEBTP15BlingsAVF+NqyoupwfQkHJiuyAd2Fhesq60SDVmMOS5zT0v1NynGueknXy5n
 CCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Iah40A1SFHkIFZB5vYT6jrRzqwQ5PoS37XlIWydOnRE=;
 b=l8OxBQ/qiTRwwxrehX13reDJvQb33COgSpCF6HGDtxRaAdL/qI/tgPcsAawa1Vm+Zi
 2x1RIlDfzy1Ts6AD0hzrOeu+fKTEgMMZJ79MKdO/ThsbG2ly8rF9Iy+FTLwhnd0dJ3y6
 K76F0ugYsAO0taAoK0JF4N7WwkxQmPi+wKhqI8PFCCKZ/VxvxDS5XvImubM8yiwP+Rk6
 hiY+iUj3BpLOE9Nx9opMnRBeZ7AtPu5c3uzROASK7esjQV6UR+/RvW/h2mxADdPJHbpo
 8kYjxxsg3dogUeVxK67+7gNSgqxCod8yjNgjNJmsCbYq8bVY8LsJGXvbsE4BzHXepBkF
 JYPg==
X-Gm-Message-State: AOAM530QL4BDj+putSuquVEaHRaXpuf4fZWMJh2fqDCJTldQ2SFBJS20
 Nu/OZv52YSWg+EQxBE1LAbc=
X-Google-Smtp-Source: ABdhPJz3HeRR07F1YPzrUFCNYeF34PHlwTHnnrv1xFVA+6Tfa5G4PcjaWVI+L+CXdrtzJ32SPZ3wIA==
X-Received: by 2002:a1c:26c3:0:b0:37b:b566:4c46 with SMTP id
 m186-20020a1c26c3000000b0037bb5664c46mr3307419wmm.42.1645534563608; 
 Tue, 22 Feb 2022 04:56:03 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id c5sm22250186wrq.102.2022.02.22.04.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 04:56:03 -0800 (PST)
Message-ID: <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com>
Date: Tue, 22 Feb 2022 13:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH RFC 4/4] rtc: Have event RTC_CHANGE identify the RTC by
 QOM path
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <87a6ejnm80.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <87a6ejnm80.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

On 22/2/22 13:02, Markus Armbruster wrote:
> Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
> the RTC supports the event).  What if there's more than one RTC?

w.r.t. RTC, a machine having multiple RTC devices is silly...

Assuming one wants to emulate that; shouldn't all QMP events have a
qom-path by default? Or have a generic "event-from-multiple-sources"
flag which automatically add this field?

> Which one changed?  New @qom-path identifies it.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> RFC because it's compile-tested only.  Worthwhile?  Let me know what you
> think.
> 
>   qapi/misc.json       | 4 +++-
>   hw/ppc/spapr_rtc.c   | 4 +++-
>   hw/rtc/mc146818rtc.c | 3 ++-
>   hw/rtc/pl031.c       | 3 ++-
>   4 files changed, 10 insertions(+), 4 deletions(-)

