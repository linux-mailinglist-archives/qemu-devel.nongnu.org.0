Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18812B0FED
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:19:20 +0100 (CET)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdJzz-0000U2-CV
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdJys-0008M0-N3
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:18:10 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdJyq-0008SK-Uq
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:18:10 -0500
Received: by mail-pl1-x643.google.com with SMTP id u2so3451915pls.10
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XC9/DIvt24iBaMJuDvuvoCdK9uUJzpjcIwJ/7zZlmHM=;
 b=AuF1ghDVgWLmr4A6d5r3WbYtp6QzAfQFwQls34acBRzhNMRYaDL4tk6rpDsuGfyxy0
 GG7EbK2EwqnzsQXXIv28J2/M7dpy5/D27N/mcmGzSkgf/gQ+NAnEpXQTdxTAagn62BRS
 GRzwlWCekFPxQ9RjHXr47MDEjOdIjjGvy2IRCzvHVp8uwelWkdM4PGS6zZjyk/XcznWj
 jrfQiIRy2PCU1PGHeiJiab0pbgmSFu+4bkNSATlfzi563ucSSWN5DmzPZqTQEGNSoAjH
 W2uq3enk3ettUkbmqAaoYO06E/hlqAALLSPuR1m9LreTHyYLrhngIyApZQV4VBXAkAnH
 o1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XC9/DIvt24iBaMJuDvuvoCdK9uUJzpjcIwJ/7zZlmHM=;
 b=R2ApyYWdK/WQpYoXOkwnXqsrZSU/75myC5ukUYj8H8vGe9IzqKbe6oZggoeyvqx9au
 S73tNon9oNvBxPluQ1fo9Aafjj64vpyQBBwTcvQuYn8EGy3uOPK+U+OsK30f5qTl21Yt
 In0+7l0fCfrr+pXGcQbo8uDWhphrEKwMYuvS8DTmr2mkTiW3M5PKiK9Ekwv26Xrj1DRP
 eVFAyjaKWIbH8IMeBFgWpysbtLtZkxvF/wjOES5PGQ35n1Q1wbooZPG5TOv1MBpXlEkt
 cx+qllmeF1ZMnQojPyW+WyUSFowLXr4S5IwrogDEmK6V6pS69LuPRL/SRuRVcThEsSWi
 IIeA==
X-Gm-Message-State: AOAM531JAjWR0Jjm/uhBwtoiFtVvxRX4tdCb/oVFizcO8liIfkYFTAoS
 GHBBtqLBNvc4lMdo44qii3/uTw==
X-Google-Smtp-Source: ABdhPJz2Ei15vgW+VbNw6PtLfKcBpfDTGh52peK05INoz122PHShebpmyRH4Yvr4tAKgEytzu6sG1Q==
X-Received: by 2002:a17:902:bcc6:b029:d4:db82:4439 with SMTP id
 o6-20020a170902bcc6b02900d4db824439mr1085710pls.63.1605215887235; 
 Thu, 12 Nov 2020 13:18:07 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a21sm2322881pjh.3.2020.11.12.13.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:18:05 -0800 (PST)
Subject: Re: [PATCH for-5.2?] nbd: Silence Coverity false positive
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20201111163510.713855-1-eblake@redhat.com>
 <da36e556-bc7e-70f3-73c8-3dc0ea7c48e4@linaro.org>
 <f7d1ebf0-0a7b-3546-d07d-57fda470a59e@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47d8ce8b-9db3-b0b2-c25a-e6418e67edd6@linaro.org>
Date: Thu, 12 Nov 2020 13:18:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f7d1ebf0-0a7b-3546-d07d-57fda470a59e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 1:09 PM, Eric Blake wrote:
> On 11/12/20 3:04 PM, Richard Henderson wrote:
>> On 11/11/20 8:35 AM, Eric Blake wrote:
>>> -    if (!full) {
>>> -        /* last non dirty extent */
>>> -        nbd_extent_array_add(es, end - start, 0);
>>> +    if (!full && nbd_extent_array_add(es, end - start, 0) < 0) {
>>> +        /* last non dirty extent, nothing to do if array was already full */
>>>      }
>>
>> Casting to (void) is another way to get rid of the warning.
>>
>> I dunno which makes more sense here.  Definitely the comment is helpful.
> 
> As in:
> 
> if (!full) {
>     /* last non dirty extent, nothing to do if array is now full */
>     (void) nbd_extent_array_add(es, end - start, 0);
> }

Yep.

> Yeah, that looks a little better.  Should I post that as v2, or wait for
> further comments on this?

Up to you.  You can have my
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
for either version.


r~


