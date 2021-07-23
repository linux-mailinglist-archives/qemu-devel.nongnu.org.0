Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365F3D38AD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:31:17 +0200 (CEST)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6sSZ-0003WB-TX
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6sQ4-0001ot-7S
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6sQ2-0001Vu-08
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627036116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99mp4EV4oOpBqWCMzQ+dq3sOmLXhFYeaf6tBFcYleEA=;
 b=iy3w1zJVPuoUWnf467WaQplFwBKB+JotnHmoiSIZR0qtr25duyZI5byUQFeon/m+QfYoOW
 RO0z4NVgu0QIfng7OnJp3zKNYbn1McRbQXOu0tfISe+TueeYlrBMVzDGSfOnMKRmm5d3nQ
 e7l+ovs5JZErBO5aHeaPxtXpR7N9TkI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-FccKp1oROo6U_B6L8yetlw-1; Fri, 23 Jul 2021 06:28:33 -0400
X-MC-Unique: FccKp1oROo6U_B6L8yetlw-1
Received: by mail-wm1-f69.google.com with SMTP id
 a1-20020a7bc1c10000b0290225338d8f53so626420wmj.8
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 03:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=99mp4EV4oOpBqWCMzQ+dq3sOmLXhFYeaf6tBFcYleEA=;
 b=ez6Qlwy8sX3+eDW+Ztp+fi7Ul4Lg3cTuyMlmOjAImLvysOfvHfTUExUtzxYBuS0YZL
 EYBdsvTduEnW+Cct3IPB36lyjla1uYokPSijEiKpAxiC8WjQ5x6y5v+7r2MDTWk6Ia7B
 5YoU3OIzWgTFZRg3kOPiKf3H7r1P4Jq7s51p6brwzUAklDuN1X0NuW3plyk3w/xMQb73
 mZilis5rAZj9RvDgkCMgobD9A+h9MHwsX3NqKxe9x7tMebI7nU2WfMBcTX9DUbTyVn54
 4kPCnnCPmNduJp0ZOOOsgvtJRInOdVBr4qMLHKHYKbTkAJsokvKvWk1M6HclIq36ms/0
 tjmQ==
X-Gm-Message-State: AOAM531DCv+AolJCSxtuO3UyfsVPiQeYKPjYgEDysN6uzoRsRzFmGoB6
 lBtC6Pq0/wSlYt9/dOo4j2PqiegPwvV4XgBu5y75i8x0WjqoB9KLrJDHxbHqG2zd/lpty23GD91
 rH97YpMlRWuXp3T8nWdss/rZ8xqTBNAse2YxIgc4c/PWyMbBOoqKSqFmW1lNklq20
X-Received: by 2002:a5d:4a0f:: with SMTP id m15mr4515591wrq.350.1627036112263; 
 Fri, 23 Jul 2021 03:28:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwM+MgHCw4nB7XO4HDnDs60dcGmK/ZLtPsR3XtXRdt+t3PK44EmFJ7avwYAC8vktJ3rGnL+g==
X-Received: by 2002:a5d:4a0f:: with SMTP id m15mr4515573wrq.350.1627036112135; 
 Fri, 23 Jul 2021 03:28:32 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id a207sm5659267wme.27.2021.07.23.03.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 03:28:31 -0700 (PDT)
Subject: Re: [PATCH 2/3] MAINTAINERS: Add Peter Xu and myself as co-maintainer
 of "Memory API"
To: David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210723100532.27353-1-david@redhat.com>
 <20210723100532.27353-3-david@redhat.com>
 <f703ed50-de43-8943-2a07-fb6babf85ae5@redhat.com>
 <68af7a38-9e0a-586e-7c6f-2f4c2aa7cd9c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b0485ab7-3dfc-c454-64b8-7cdd39ac4a6f@redhat.com>
Date: Fri, 23 Jul 2021 12:28:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <68af7a38-9e0a-586e-7c6f-2f4c2aa7cd9c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 12:24 PM, David Hildenbrand wrote:
> On 23.07.21 12:23, Philippe Mathieu-Daudé wrote:
>> On 7/23/21 12:05 PM, David Hildenbrand wrote:
>>> Peter and myself volunteered to help out co-maintaining "Memory API"
>>> with Paolo, so let's update the MAINTAINERS file.
>>
>> I'm very interested in following changes in this area
>> (although I'm not assigned to work on it, I have genuine
>> interest and found some flaws I'd like to fix one day).
>>
>> Might I be listed as R:?
> 
> Sure thing, thanks! I can either send a v2 or you'll simply add a patch
> adding yourself (preferred) :)

I'll send a patch later if the other recipient don't object ;)


