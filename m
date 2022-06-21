Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7405534DC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:49:03 +0200 (CEST)
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fBe-0008ID-BT
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3f0H-0000rT-R8
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:37:19 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:44712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3f0F-0005ob-1K
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:37:16 -0400
Received: by mail-pf1-x432.google.com with SMTP id s37so13274765pfg.11
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=HtijAlC2ssuSuNeWFYcM+8XrkjoqLwcagm9dONp2Zxo=;
 b=fHlO0hHeZapBo8L4bkhY2aYhIuVSAN2vwyVw6n7oB6s+tNjtxNc8QG2ip3H9kOQp0p
 0wC6OUdOX4WqDohZtrgtuJhv9wywCUA6kIsLVCplv+sSIIDNCyLPtJkrXcyuheRyj22z
 mIAGaaUUqnIlkpANLtj+5XfGmB5iVxjT+OjxdxElCBGCaY0Gn9+0SmvEK3GyNlVOG3cd
 ALU7jkZjwughoQFexsk2o06YvpcMS/uN9mvJo+KTXeD8MPjw8dIxP6KQcu56839Rkvms
 s/vYLwjWaDUd82vD7hZqJWwjRWJLkFJSh7x+oqqudJ2ygUXGZhmrX3/c4NhImFKTP2qt
 5rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HtijAlC2ssuSuNeWFYcM+8XrkjoqLwcagm9dONp2Zxo=;
 b=o8AZ8biK+VYsVVVJp+3Sdbr2fjzdbKidRObP9zoa1gvv887GbueqBljET6FF42RJQc
 RoNk9GvdwtfZFKDjQsToqCXFDRcokgKtV/8yQjqT6ppJ3ZJt/3v45VGnM7DxBGFuJLtp
 l/Tap8I7XLHvo5GTk6g5z5hR4/mOdAYADdU0oFSon2EDeknHseJCHmu+fWm1PO40GtDf
 duSbn3vrFHXuwpIXpZ+chKJZ65Cs5IY1jx+UZ909v20vr8jimHkB+YWN/92uiyG5b/ZZ
 aGHfUiz22Q8LF8SrnoqBmunWvc2kUVZOcVue+6tDNwV9W5R8oQznjD0w80y6o9jcgjur
 wyew==
X-Gm-Message-State: AJIora/QLy+E8V9Z+/YcfAq/RHK6GGY0L26nrnz8OG5UceFclAaZafw5
 PuZJZHwXN83tArzZx18iW4XCRg==
X-Google-Smtp-Source: AGRyM1tgfVMMw2NJLPmLoSlS6hmxUXWpHa5zc6LPUy5oGms0TrN7j/6xHGrgPytVj9xizaPlgmqI4g==
X-Received: by 2002:a05:6a00:b8b:b0:51c:2487:57b5 with SMTP id
 g11-20020a056a000b8b00b0051c248757b5mr30457285pfj.56.1655822233374; 
 Tue, 21 Jun 2022 07:37:13 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 jh5-20020a170903328500b0015e8d4eb2a8sm5510347plb.242.2022.06.21.07.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 07:37:12 -0700 (PDT)
Message-ID: <3ead4d24-8d14-5862-b9db-268139a83bec@linaro.org>
Date: Tue, 21 Jun 2022 07:37:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 0/7] semihosting: proper QEMU exit on semihosted exit
 syscall
Content-Language: en-US
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
References: <20220621125916.25257-1-lmichel@kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220621125916.25257-1-lmichel@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/22 05:59, Luc Michel wrote:
> v2:
>    - fix linux-user compilation. Declare semihosting_exit_request "static
>      inline G_NORETURN" on CONFIG_USER_ONLY side. Use
>      g_assert_not_reached() to enforce the G_NORETURN since this function
>      is unused in linux-user mode.

Not true.  It *is* used with semihosting linux-user.

Anyway, before you go too far down this road, see

https://patchew.org/QEMU/20220607204557.658541-1-richard.henderson@linaro.org/


r~

