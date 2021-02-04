Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B115E30FBEC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:50:17 +0100 (CET)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jho-0000hS-JV
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7inZ-00009R-Sg
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:52:09 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7inY-0003AM-FM
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:52:09 -0500
Received: by mail-pl1-x62d.google.com with SMTP id a16so2154919plh.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vL6DDCXXLhA6gnK/nh/J90QnRVfx5yWov1iFOd/2M/s=;
 b=ILHCNmw1UCFe5hncRuPpcT45Z7nXo3D4mG69iC0sOf9T24GUW6gV7KbLTamckz3bUf
 FXKgKM1inZ7mIsnIXxQ3vbtXqMFg/M6EtgtnLFsHeU/4pv5YuKlv8sQ3YSE3qMyauhDI
 f7q/hnkCE63ujXFWzFDJrbygd9xQ64hNXoPzpBDOz+dBLderIfZfax8oXDyf5rYsfBN+
 Dq9W1tQ6SFEmtIZOtcGqIhlK8YXutJSGdDKi6D3TbmFwB3ubrR4D4U94yq+iURPs6QIZ
 pPw4g8w27JqbekM9NxBa/5i8gf8i9TDiHz7PIsQ75gXJA4bRDd8K6cvNw9SudVNabbmL
 sl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vL6DDCXXLhA6gnK/nh/J90QnRVfx5yWov1iFOd/2M/s=;
 b=OJFINaoAU+zerb2Y4XMqBiI/AShoYsBkkjzbdFlE6In29WysFQNyBHkXqjVbCbQT8P
 bx6ZQ8PKNjJ9KBwcX+KCo5ul/CpHQm65alr7h58X2MLum4ec2qvIjfvBTZix+nSwjU09
 rzV505vDHk2UnfuADUCIoJLhi0HVTOjt7S6gDIhnM5wU6cncSOWW070h//6cmwQ+LUQN
 oE+K4UC5TeNhCqCQec8IjPhrJXYECHF29CxApyw+eFaMYt3x9bqJSK6r9bZazbJ0oQ8f
 HmHp4/KoSbzdTkIEV3NXIGAhEnS8vh/1ZV1hXqdy6/PyLXnJXZ17n6nuXFKMTJ8mFZV6
 ukQg==
X-Gm-Message-State: AOAM530Qx4BDy+tmdT72bW/MUHwjvaGPRsehlIcqBE9p8Qb5SZv1ugEk
 wmGEF/p6QdpaxRxtehEzL2NlpLEZEeJcVEW6
X-Google-Smtp-Source: ABdhPJzsBuq0sdV5HWxTyUXtsU9ZuZbRYd15+gxqwEi/GENHfkr5F8GzuW/agjfw5RoUHJ/dOgrFEw==
X-Received: by 2002:a17:902:f686:b029:de:18c7:41f8 with SMTP id
 l6-20020a170902f686b02900de18c741f8mr470507plg.65.1612461125820; 
 Thu, 04 Feb 2021 09:52:05 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id r7sm6137685pfc.26.2021.02.04.09.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:52:05 -0800 (PST)
Subject: Re: [PATCH v2 29/93] tcg/tci: Remove TCG_CONST
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-30-richard.henderson@linaro.org>
 <87czxfq1t0.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8651dd2-3cb5-30f2-d8fd-632717a764e3@linaro.org>
Date: Thu, 4 Feb 2021 07:52:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87czxfq1t0.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 5:39 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Only allow registers or constants, but not both, in any
>> given position.
> 
> Aren't we switching to all registers (there are no more _i functions
> after this)? I guess you mean the registers can have constants in them?

Ah, bad wording.  I think I was thinking of movi, which would be r,i if it
actually existed in this list (which it doesn't).

Better as

  Restrict all operands to registers.  All constants will be
  forced into registers by the middle-end.

?


r~

