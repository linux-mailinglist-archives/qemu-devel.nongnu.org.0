Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBAE2C07F1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:46:15 +0100 (CET)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khBET-0003Ew-KD
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khBBH-0002BQ-U3
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:42:55 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khBBE-0007vQ-Fb
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:42:53 -0500
Received: by mail-wm1-x342.google.com with SMTP id 1so17096911wme.3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 04:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5tbxapmjFLi8feus0wHs349grbFa30VIUANdvjVlovY=;
 b=s0DEqvtjoWS+tzTkfCIIEVgQwgrDiaYLChzSypGzPYjOixrSEMkkZwWsNz0/saZHU9
 ZWHwhwLHoJm3hYku25wLpj+4x+MEqXx04x0AlY9J4sRpmoITRgBxmzmUsHPaH1mVwxvc
 IMEv/nwrdUyLbEy1oN25+4mkUXEhX2pZow09RoTUhCexjq8QUuu+ntY7LciHHzjWXcN4
 agpqa3a3OrvekjCfU7vlwRmNknqtmk6ME3TOVn1Fvd+3DPisgO1HnA54Q9CSpz1GQpx+
 DzOlcdV/mWYySyvLijTQNHKeKI8YHricvnEBJqncEXTTLYSuohpLs2GzHmefLi+cuFQh
 Atiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5tbxapmjFLi8feus0wHs349grbFa30VIUANdvjVlovY=;
 b=qjvZA/gqkwSmTa6rrTMNfHtO6/Yhv7sfydXM13jf4p73qwqFAYpkR90cvaCPO6fwNN
 YBZk9wRNBW02Jg82p3ZOLovTD924s31kvVlqXVoW8OtwVqTIqR6lHo1VRtjxVWjYH3b7
 BsYgPz+a766yUFyAl/zieG0WUZHcb9sNp602Mhj8m3GRw2rBS4sJz/itKvUSrSrQKD8P
 DXDd2iZElV+7pTEOe1Uu6gq0uAMO3GLxftYE6fH8C+kmQJOEXWP5M8Jl3Zpz8R1SduLa
 g3XydMQJ6Cr0Q0f2PwduzGLnMjrkhDkOrFogpOm7351L9zBEzvG7GidkGT4mX+ZHCYFz
 VThQ==
X-Gm-Message-State: AOAM531Y2Qk0OCrrRLrZ6oCgfTgUfdmpm/yKJErzHQpC1q722bK04lIi
 qNOVJUh/7PLOtTkM2XWy/Is=
X-Google-Smtp-Source: ABdhPJwHh7HibxKS4nW2geV1B2Y8uwt+tqfIHY94CorqyHRkU8DOSNTobTeQP3Rgp5sjj0mllyjuHA==
X-Received: by 2002:a7b:ce05:: with SMTP id m5mr25656149wmc.16.1606135370392; 
 Mon, 23 Nov 2020 04:42:50 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id z8sm12625898wrv.0.2020.11.23.04.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 04:42:49 -0800 (PST)
Subject: Re: [PATCH-for-5.2] docs/user: Display linux-user binaries nicely
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20201119160838.1981709-1-f4bug@amsat.org>
 <e3801a87-8eb7-fae2-5118-8669b696e610@amsat.org>
Message-ID: <673cb0ff-cceb-7f07-9d8a-9c956105d816@amsat.org>
Date: Mon, 23 Nov 2020 13:42:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e3801a87-8eb7-fae2-5118-8669b696e610@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 11/19/20 5:21 PM, Philippe Mathieu-Daudé wrote:
> On 11/19/20 5:08 PM, Philippe Mathieu-Daudé wrote:
>> linux-user binaries are displayed altogether. Use the '*'
>> character to force displaying them as bullet list (one list
>> per architecture).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  docs/user/main.rst | 99 ++++++++++++++++++++++++++--------------------
>>  1 file changed, 56 insertions(+), 43 deletions(-)
> 
> Patch easier to review using 'git-diff --word-diff=porcelain'.

