Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A8934D5AC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:05:25 +0200 (CEST)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvKO-0002s5-Ef
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQvIP-0002Bt-Kt
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:03:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQvIN-0002Li-9U
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:03:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id j7so13629919wrd.1
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N0L6LZQwKih3LWl5szauwV/OzIhFTF0LPe9oeR+13LU=;
 b=e9GEnrQFzuUXuy/XB74I97DHeWu1/E49sRqRnk++HmjML4+V/18fq5OjbyTvSKbUEY
 UMUBRyER7nvarkDRv/DVpBbkEVEONJvdoQUlhoAj8/JUXlMAuLD3Ff1PW6F2HdomT3eJ
 imc4aNYNwgf/7pjKIJO3wmljMS4kMVAOFuj3edJ6DWiA6KvIDWQ7MD5/8Oj2rlmd30QO
 HVWRHDp0jmzq7C4RYqjdY0SgPRHxN81QKrLqv1IHsGvxOHJa+AaM2+Ipn2Af6N5/qA+u
 YEoYrFcIMa8XYKhiJaK4gbsfIZsBfu6P7+veeaaJGgI/3H6c4JD2XsFI9hOb6zvBUU0F
 DSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N0L6LZQwKih3LWl5szauwV/OzIhFTF0LPe9oeR+13LU=;
 b=MKSwlHYZnMyreX0kMNhzbE33LEqBE1jpqO9i0vhVLDFMj+y/WXX2IZ1a/P2tHzayNP
 zXHC8O77HqC5wpB+BeRX0X9toWr4qRe1jHlOXMlC+GP6cZmyVLqbDPGgr5XbkhCokenz
 RR0AJ6VWZdGk4YT2MPdAUYI3DWQBsrYUNG+vE3+5Q0SktrFRzZaXj/iSDetJaEqMETg4
 OmPQ8HChpXetXB14aUtizzmSfHo3goPyByPhbbNiAZJb65Bx/ugRQfT8X5gi5BUCnEKR
 RxK+jDyez2YbHW10jzYAMCilSue8/EiTaQgErclwV8Ci1P3u9sjHzodtIq5OOXZxXuJc
 n2Ew==
X-Gm-Message-State: AOAM532gj3coPNwEBXYL9t73GV9MlKWhVNPVMZBreOmU/X8kzzo75Vz7
 UrNRAehy3zJMVn6plIQi8Bk=
X-Google-Smtp-Source: ABdhPJzfyz7OmvymUU0V3nT7C5Agstxox7HxCbma9T++nNiSfLvGuHUP7reeJGXKxnmZZ81gsxnxkQ==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr29803582wrd.195.1617037396544; 
 Mon, 29 Mar 2021 10:03:16 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c2sm53106wme.15.2021.03.29.10.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 10:03:15 -0700 (PDT)
Subject: Re: [PATCH for-6.0] hw/timer/renesas_tmr: Add default-case asserts in
 read_tcnt()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210319162458.13760-1-peter.maydell@linaro.org>
 <CAFEAcA9hz5ZsetCWMGJd+aX0td6vE7YiAW+x2C=K3mCsdWiJ8w@mail.gmail.com>
 <aafa7c42-333e-60ce-1323-5623536d7af8@amsat.org>
Message-ID: <fb33eabd-7592-581b-cc71-1f5f436951de@amsat.org>
Date: Mon, 29 Mar 2021 19:03:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <aafa7c42-333e-60ce-1323-5623536d7af8@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

If you are preparing a qemu-arm pull request, can you
squeeze this patch in?

On 3/26/21 7:49 PM, Philippe Mathieu-Daudé wrote:
> On 3/26/21 2:34 PM, Peter Maydell wrote:
>> ping for review?
> 
> FYI:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg790977.html
> 
>> On Fri, 19 Mar 2021 at 16:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> In commit 81b3ddaf8772ec we fixed a use of uninitialized data
>>> in read_tcnt(). However this change wasn't enough to placate
>>> Coverity, which is not smart enough to see that if we read a
>>> 2 bit field and then handle cases 0, 1, 2 and 3 then there cannot
>>> be a flow of execution through the switch default. Add explicit
>>> default cases which assert that they can't be reached, which
>>> should help silence Coverity.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  hw/timer/renesas_tmr.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

