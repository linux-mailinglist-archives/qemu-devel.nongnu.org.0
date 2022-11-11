Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906C6257AF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:10:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otQz4-0007A1-Bb; Fri, 11 Nov 2022 05:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otQz2-00079C-HE
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:10:00 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otQyz-0001GO-KO
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:10:00 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o4so5832502wrq.6
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 02:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mAXZwJJeek1IFoETgep4+V3vz9V2Gye1ryzlOjgOfO8=;
 b=e6FQ5bAYucC+eQQMrXJ6ZrGTs9fOMDZ0bLhW9UAidv8SeslZLdf7wkXOCkdT7/DnN6
 UfJhon3Y2EcHnhgp8b4LB6VmJy8TYDhgLDcaClVyECSSCneJiOmWD6rctNVgprIbYOIn
 W7Y4yJkXc3w6c6XH0AVdVVclWeIQxmijs3BbsZIiHktbCekDy/uqF1DWiV9kg/wl/UiL
 gC7E5vCAariQ8KIaMhRB8ImqGrRMpV2Yr2sx7l8QlSqqNVBkDXK6WoS3zUsA1hrz74Of
 9ek8/pMGzGxMk/dwZ2iSYOyzZijnpTl+6K2eliTCRM0n7IAqM9G3nZksaKge3Q5kM3h0
 4EZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mAXZwJJeek1IFoETgep4+V3vz9V2Gye1ryzlOjgOfO8=;
 b=4tIjbDJgrZlEnSvrCX5jgzuUf2ApEwvBgxPMQQZitE/iUbEPYYVYppgR+mAWTv09wf
 NiGYLbp73BWHDJLRjSOytcvJ3moUTLYf8wHHlGPuXuhNF1k63hITXHR0mk2BQeOAZSP4
 LmO8nEEUE346GH93VmWZLjT8es+y1M1QgeCumvfuxnJ6tsvyDV5lCPZbZ9t0xwsh3VPz
 x1R7JnhNQVejE6eHmwdY7PyusHww6YICGdwFcaMPlztrQWr3xoCJBYj4ApR7k1Bo72o4
 Y0duXNYzUdFSIxl/tGZQq7TIwsBjNV25PuzmVMwHjp/3pOro47fBwg20mqE8UAEYa9QR
 rbUQ==
X-Gm-Message-State: ANoB5pnJrQ0y87CPuDBOYXEQEabHLiCsSJHfy4pPdOZYEukNJ/GVDk8B
 krUcY8G5uzUCrQJjCOfgM3aazQ==
X-Google-Smtp-Source: AA0mqf4HXaAzRYlrqqeZPuV1kKI1kj/vZoWNmZlYm7A3MV82TotCuEIkRZYRdoqd7D+4SnwbdrA+Hw==
X-Received: by 2002:adf:ee10:0:b0:241:717e:fbea with SMTP id
 y16-20020adfee10000000b00241717efbeamr755364wrn.77.1668161395673; 
 Fri, 11 Nov 2022 02:09:55 -0800 (PST)
Received: from [192.168.7.115] ([109.111.120.167])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a5d6b81000000b0022ac672654dsm1473248wrx.58.2022.11.11.02.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 02:09:55 -0800 (PST)
Message-ID: <2b8b33be-9c87-d609-8557-945b58170326@linaro.org>
Date: Fri, 11 Nov 2022 11:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] libdecnumber/dpd/decimal64: Fix compiler warning from
 Clang 15
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org, mrezanin@redhat.com,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221110131112.104283-1-thuth@redhat.com>
 <eb8745ad-8075-c6ea-6fac-4437530c63b4@linaro.org>
 <37ed2651-936b-3ce3-2df4-f5a151e95971@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <37ed2651-936b-3ce3-2df4-f5a151e95971@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/11/22 08:43, Thomas Huth wrote:
> On 10/11/2022 21.00, Philippe Mathieu-Daudé wrote:
>> On 10/11/22 14:11, Thomas Huth wrote:
>>> Clang 15 from Fedora 37 complains:
>>>
>>>   ../libdecnumber/dpd/decimal64.c:620:8: error: variable 'n' set but
>>>   not used [-Werror,-Wunused-but-set-variable]
>>>     Int  n;                     /* output bunch counter */
>>>          ^
>>>   1 error generated.
>>>
>>> Remove the unused variable to silence the compiler warning.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   libdecnumber/dpd/decimal64.c | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)

>>
>> Or we could we backport the upstream fix :)
>>
>> https://gcc.gnu.org/git/?p=gcc.git;a=blobdiff;f=libdecnumber/dpd/decimal64.c;h=f72c5730ac3b473e2c334f604e7e52da9711fa72;hp=269eaecade5115a62e979897742cd5decec0681e;hb=8a79685989bff33f479d0ac2df0e18d55d3ba78b;hpb=e1d1842b5432472330384d1523bb3c3132c4fea0 
> 
> I did not look on that code on purpose - it's licensed under the GPLv3, 
> so we should not mix that back into our GPLv2 version.

Sigh, right. So:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


