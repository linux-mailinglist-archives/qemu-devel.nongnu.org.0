Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B74694B2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:03:47 +0100 (CET)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBmb-0001PP-Ij
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:03:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBZq-0008Gd-Ar
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:50:34 -0500
Received: from [2a00:1450:4864:20::32f] (port=33429
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBZo-0008Qr-Oo
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:50:34 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso7903712wmh.0
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 02:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=d3JR1dci7O+kUEd3CLOXQlH7BFuaOUFERg63l9l1re8=;
 b=DI3vIcpLh/zLy5NsUlxLQJoQbOXGtfO/lIKI5+aSz8tBTaqPkXwDzzmCakC2Yisvum
 xGXNo1iKLEMNnoMNjDbqzd5V4pmHqRGTlKv4ZUDm01fADop2QP31jiHq/rfZYt83W7Po
 3zI+UzMKCUazCFEphEPEG5/EFGbDIfxW90piXoQ7d0y6UqW8f23lnE9eTUQMH/f6eSwK
 /ThYXeWFFPxvxOH8LqAWt/wqJS9zCmmzX+PucUwC/Xu6fSxM+vLoIBrbw+7kU5r7jRtV
 vXfH8DljVekvt3Dz7Xla7JW544YPc3hAjo5K/yIraUfJjZJcVzike4qvcekBQ09rJVI0
 bmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=d3JR1dci7O+kUEd3CLOXQlH7BFuaOUFERg63l9l1re8=;
 b=CC22Po/9eWFo3DEZdlwrJFWhDgqMjKGLj2kyz1YjPrPOah9CFvV/YvY4hdz/jybpNz
 wAcpnBqtBsq0gU3rI8tYvTsHfP4Ubn8JwyGU8jWI8CQs5LXBHwmt+vjrvrGLVex6NjnA
 hN3j6CPutRQZ4loW6Mrp6EYPbP7kS81n/t69rPWB89KliQWEh/80ZY3Yng4vmZcuik74
 CpuASyQQd5TVqk57vo3qnwnFa9xIwBd3aljXg86VF64vTThkmkExPdtuhhcWqSNO7lLR
 kfzxO3VVuFsP0iXW9lbAGBSnpubX61iKRT07/gPgnM64pTUk7qJmfO0fVTHN77QKUU5n
 gj/A==
X-Gm-Message-State: AOAM533KD2rP8iUOrbDPMR1OCuARX6oNZyqzzXZ58kSRI0pvLHpDb5fa
 2hQvvhVjtga8XYo7IHSo8lw=
X-Google-Smtp-Source: ABdhPJw/2YNZ9vYLksrYR9Sgs9I0WmVcrJtCBFK/SbbSJf4XcdK8072I0FbkwA516X05fN35HEfV8g==
X-Received: by 2002:a1c:7d0f:: with SMTP id y15mr38853610wmc.191.1638787831049; 
 Mon, 06 Dec 2021 02:50:31 -0800 (PST)
Received: from [192.168.1.36] (82.red-83-50-95.dynamicip.rima-tde.net.
 [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id p19sm11831462wmq.4.2021.12.06.02.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 02:50:30 -0800 (PST)
Message-ID: <6d014e00-59f8-1f52-883f-384dfc016f19@amsat.org>
Date: Mon, 6 Dec 2021 11:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for 6.2? v2] Revert "vga: don't abort when adding a
 duplicate isa-vga device"
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211206095209.2332376-1-alex.bennee@linaro.org>
 <5523cd8d-ef7c-e9a1-d04d-67e6db01f688@amsat.org>
In-Reply-To: <5523cd8d-ef7c-e9a1-d04d-67e6db01f688@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.076,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 11:43, Philippe Mathieu-Daudé wrote:
> On 12/6/21 10:52, Alex Bennée wrote:
>> This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.
>>
>> The check is bogus as it ends up finding itself and falling over.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/733
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Message-Id: <20211202164929.1119036-1-alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - fixed bug link
> 
> IIUC Cornelia & Mark said the correct fix is simply:
> 
> -- >8 --
> -    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
> +    if (!object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
> ---

Bah I just noticed your update on v1:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg854596.html

So:

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

and queued to mips-fixes, thanks.

