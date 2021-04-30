Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD34370006
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:53:46 +0200 (CEST)
Received: from localhost ([::1]:53776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXKj-0006eW-Ng
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcWpV-0000kU-E3
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:21:29 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcWpT-0000qT-4n
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:21:29 -0400
Received: by mail-pl1-x631.google.com with SMTP id p17so11066078plf.12
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L3hWiXom+W/0KV0YKczmg/9YWY0ZWnAsBfH3EDX19lU=;
 b=g+RD1oFgeMCEjRYHNphArvfTNtddHaJ+bdnnZb3nLKND1ePOYq8Lj5M+OI/QjW/IH2
 cq0AlEXnJd8Hw2IR8edSK/EJ8SwWjErJMTxOKpYsLJ6LGFln4NwB/+ioQiKlredXO2jj
 FpDBP9vJXA82loNsUvpRCWrpAiHB8iUsatfiUn3yz9gRcNS0WRLvu5PmY83JSYq10e0G
 IBsVb0ZF68gcYDRe4OFsGD4WzwBSYdwi4M/CKvfKLw7MCgGWevKJ24F0quWfgf1oWSGu
 NIBD+/zXi8fD5xsqvcNEMui2zwlfWXPMgE8hixrnsIhyBsGFQhcZie9U3C6CS/KKbAqN
 LJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L3hWiXom+W/0KV0YKczmg/9YWY0ZWnAsBfH3EDX19lU=;
 b=obds5S70BjmiQV1KrKR9NNlT8G71X4HdAQ9Shz/Aqh5L+ZaZi+nf4DW+m7njoNkEyA
 BGZMIASHFVWGOM5/ZKwHSrfdaCkEav7mLTVsbQBxinvMBHBeDphLs50uwrJ/1f+uOKWU
 3JEjBsQ/pDuhf2g4Q2QG8uLgoCsI5kCOjB04p7qUOKeAumWkYmuoiMegbelL1fneJMnu
 A+p1/kl04V07s/aFahUK556m4ryCoWHjtUFMWtzS2ynABN5y2ST3081cvgsJ7M4hTGzK
 sBa1k4l2zD8cpTc3etypfr/nqhXHmyaZ6ltyKxXBmNoi5GbqpiM0ayy0KwHkNTf0aIYz
 OSMQ==
X-Gm-Message-State: AOAM530vi5UDVTH1gS/Df7UT6dScDz5am7OvKX7JW6PXiDLzi+j56KCs
 6OpA5iCmDe9CdbK7JE9CjD8D1/2GOZjAnA==
X-Google-Smtp-Source: ABdhPJzT1VGSUyHacB2j4KAC0VZwc1P0v7/7b1jBdm+PnVb5H9uiszB06tnlyP8Zcd7Z29GO6rxrkA==
X-Received: by 2002:a17:90b:f82:: with SMTP id
 ft2mr15845348pjb.0.1619803285833; 
 Fri, 30 Apr 2021 10:21:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3567006pgt.42.2021.04.30.10.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 10:21:25 -0700 (PDT)
Subject: Re: [PATCH] Remove the deprecated moxie target
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Anthony Green <green@moxielogic.com>
References: <20210430160355.698194-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8197cd02-efe9-3748-8d86-a0b335865e6e@linaro.org>
Date: Fri, 30 Apr 2021 10:21:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430160355.698194-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 9:03 AM, Thomas Huth wrote:
> There are no known users of this CPU anymore, and there are no
> binaries available online which could be used for regression tests,
> so the code has likely completly bit-rotten already. It's been
> marked as deprecated since two releases now and nobody spoke up
> that there is still a need to keep it, thus let's remov it now.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

