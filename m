Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9DD57122D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:16:35 +0200 (CEST)
Received: from localhost ([::1]:47812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9CD-0001TM-Tk
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB96P-00064a-PF
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:10:33 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:42633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB96N-0006xS-UN
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:10:33 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d10so6633548pfd.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 23:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=QDrCfZQnp4HnFXL8SrXu/mt5ClwnuQKdJ3vYR9AgSEc=;
 b=x8kmsVLQVpJkMiczYzLL7gak7klEAptPinE2qZFrUQiOfI7WUh8hn6ipIjAluTFcAx
 v29x37XC139zXXOAlfdv7sPGpcydwXogJRf6t2I/cQW2Tbk9qEFGdscofPtYyqRIiL1p
 fakFZQmddQ7RNXc6anzE/xCvdhrlX4pEaEg2hfyYUzwmSR6d99NDxyxWVzBQZifqLI8o
 Nk/lfqiNTudw4hrGPExv+cqLEJeeEsKU9X0ZH6QcTFAMrIiE/rg6m19/qTwyEJSKoRJS
 IELSGVH21W4uN+e9k40JSYjZeF4PgebskQv9Bm9AZ08sinGeBxu3Asc5K6sHAB4jcNHE
 eJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=QDrCfZQnp4HnFXL8SrXu/mt5ClwnuQKdJ3vYR9AgSEc=;
 b=5PFXfZ91A2Ra7IKca1FntdLZ+Q+LQfkMGvasKejmWj4i1kedIkEXbPb/zNOrpG/9Jk
 XZsJbWNhz40DFr1eIhfxRUlREb7Y/hQuZKdHrjxlEKp6IR4T6H5JfGp8M2JS9q8oduug
 6WKmQyBP/OwuOS7z2rp3McK1JTZu3WmnFBn8mwNtfHYOjou75CTZ/Shb8tILsvBN1qDR
 vUBjOojfxCB+8X7EnzL5Kk7vJpUR+Uihc6T/cjx40Lby1fUS7oyg2rLlR/WB5KJUXlAi
 ErHdM+q4W+cjePsHc/lIEvbPuImGmydcTyw6z6MmsaR2tBQeGACr0rb0mfDv8DXhaWL7
 HWXw==
X-Gm-Message-State: AJIora/WqNSrl6JXOdAesa7tHKpHVztBD3rZ3y/rjId0Ens+Dr4f42CB
 VulfHOiky5REXU0nhuSdAq0OZQ==
X-Google-Smtp-Source: AGRyM1uTkc+64VfTwFjUJimxGqphX3gvD0951hr8yYzxNXH8FHhAAhsOCS3nhKjDOj0psHXDc0/akg==
X-Received: by 2002:a05:6a00:b8c:b0:525:6391:1139 with SMTP id
 g12-20020a056a000b8c00b0052563911139mr21909547pfj.80.1657606230450; 
 Mon, 11 Jul 2022 23:10:30 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a1709026f0100b0016bd8fb1fafsm5777119plk.307.2022.07.11.23.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 23:10:29 -0700 (PDT)
Message-ID: <61f9c4ac-5600-46ef-9c4d-724c1d7bf400@linaro.org>
Date: Tue, 12 Jul 2022 11:40:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] gitlab-ci: msys2 improvements
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220711075643.3744153-1-marcandre.lureau@redhat.com>
 <ec9ce92e-4e91-6ff6-49d0-bc694eef5fa8@linaro.org>
In-Reply-To: <ec9ce92e-4e91-6ff6-49d0-bc694eef5fa8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 7/12/22 09:24, Richard Henderson wrote:
> On 7/11/22 13:26, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Hi
>>
>> This is a small series to attempt to debug "Intermittent meson failures on
>> msys2" and improve a bit msys2/gitlab reports.
> 
> Thanks.  I've pushed this to staging for a test run:
> 
> https://gitlab.com/qemu-project/qemu/-/pipelines/585473909

Amusingly, both msys2 jobs passed the first time, but I reran and now have a failure for 
your investigation:

https://gitlab.com/qemu-project/qemu/-/jobs/2707801937


r~

