Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC58312134
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 04:46:43 +0100 (CET)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8b21-0003jJ-T7
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 22:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8b0g-0003Cw-Be
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 22:45:18 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8b0e-0006m7-0w
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 22:45:17 -0500
Received: by mail-pg1-x532.google.com with SMTP id o21so6651373pgn.12
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 19:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=IHdjoeIlepbmD2QRfbHWlODLn3Lf9Angw9yh7oZdOzE=;
 b=G1GOjK1SrGymRM+aTfzE1/5F2IOPPkZNPPpTzfxhkBOYJp6crQ1WxTa0vvlqej9rh9
 JquECCceAFXveiEKROwDqvzJ0w34EBerS5S17dLtEpS2FHbsR12fHl0hQXQQPWsYSUp1
 HyqpSYMAsaT+Si8kKgoWwDwIxTl3pYosbP8XJbBDNzsQuBc3qjElQSADqnsc384THfIN
 7qre03gwA3EYBoKwln2Y4i7QsXmmv4Jamj/tkfGyfKf1n8czteR+n/sDn77ZL/MSq/Qe
 YKMVnUSKRJi4Gw+p//ShzPDsiU1vJ8LyT8NXf4GQHXTcur/rdV3NmvrlyBPUv3fE5yhV
 JDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IHdjoeIlepbmD2QRfbHWlODLn3Lf9Angw9yh7oZdOzE=;
 b=V8wWQ/WTyNg13mgoukTbGoCpYQRUBjrwWFk/7NaQ5N6KGooYr7WaHZu6naGLpCYFZt
 LBUrGOY36VZOPtlzo43Yg2HepE6EhbGZZw3KnlVszxG0rF/Rw4foCN8YlwKI8yyW7q6x
 21WAbApCfLjPTs6WeQiuiIiBpLXXXp1v4c2Cd02Ik0dpXaH+mqGhLFO3nANozppA+jAF
 SnDYCEqteCJwp2VickdZwU2AWXa7gCOzdFy0jZWG2aPEa52AGPk06qTlVuKs8Uqo5ACX
 zZwV/2aUMpPv2VjT4/B3LFdfWkeg+9lTgfJKnI+6/0XS7clcDwnRwVxkVaXWVvxpp2SP
 LN5A==
X-Gm-Message-State: AOAM530iixIur/nr8fJmXYU5qkKUKUuxwwqBYn4uIFgalWCWv/RlN9zj
 3dLDTEbZwFIkLUZiY4p6nwQEROaH+DIoqg==
X-Google-Smtp-Source: ABdhPJyZWJQjDINrMJEDkLOq6BtmDHo0HM1dOI+5R1xfB0AgUZQ+5jVbUtuTpymw3ownW0Pm6fM9ag==
X-Received: by 2002:a63:574c:: with SMTP id h12mr11827252pgm.79.1612669513750; 
 Sat, 06 Feb 2021 19:45:13 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 123sm14437971pfd.91.2021.02.06.19.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Feb 2021 19:45:12 -0800 (PST)
Subject: Re: Increased execution time with TCI in latest git master (was: Re:
 [PULL 00/46] tcg patch queue)
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
 <02ad8dba-48a5-b547-05ba-d7fa1150b1d0@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <95d0b17b-b1ed-6b4f-f26a-69ec6a2e6e03@linaro.org>
Date: Sat, 6 Feb 2021 19:45:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <02ad8dba-48a5-b547-05ba-d7fa1150b1d0@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.105,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/6/21 11:38 AM, Stefan Weil wrote:
> I am still searching what caused this detoriation. My first suspect was thread
> local storage, but that wasn't it. Do you have any idea?

No, but since it's 1/3 of a complete patch set, I don't care to investigate the
intermediate result either.


r~

