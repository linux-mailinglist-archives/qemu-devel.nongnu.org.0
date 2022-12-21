Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51A652E50
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:15:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7vBo-0006ff-V1; Wed, 21 Dec 2022 04:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vBm-0006fS-J8
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:15:02 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vBk-0001t5-RW
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:15:02 -0500
Received: by mail-wm1-x32c.google.com with SMTP id bg10so10716815wmb.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tw8oTxP+d1rYcqo4u5fuF4TTw3KErFm0gFgNSSZn7x8=;
 b=XGuXfA9F1m5V90QCw17cTX6GWs6EF8P14j2nBTV+E+DhailsGJZe1rQhuIl5AehC6G
 ObngwjLQa79pUfZ6QviVF+QHmb9+0VnRrB9JrKCujRUPLQqJEhMcsitfZ/q7VdLHaf3j
 IlZe7zsaEAusDS+vo4UWcRPFVcXDzfCJ4buvgTWxlsM/lyJQjvR02nXc9VQvNp3G7KAE
 ULYxN64ILlh4YN0oS2okgHWE41NMEA2LS7G0L/L7YiJBvpCk5v2DBmCbIo6zjCaskGR9
 q2rPpA7WqAsNouLSTmOFvpJaaZEH44zj5Z8dTN02Leo3qsXqBvff1t1w2YcVLHaaWW5H
 cf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tw8oTxP+d1rYcqo4u5fuF4TTw3KErFm0gFgNSSZn7x8=;
 b=HP1lLuQ9zgH8i6rXV1x+dq5jrnWxzYF9xjRmYbNBoXV5dEMhZuYH4uOCtdvmNycFJK
 ay10zk299cyqQ8yQ2jHbKueNjFgdZIz5as+OwUHIhBvyrxqLq92ZGIYDJQLet/LjGNNM
 WxgRik71YgBKnlZlGAtkSy6fi1PegYL5MR4uqfggX0Ia99YMU1MuQlVb7AbiaTmKCgvM
 +elr/jvLgH+RRyBnP1YElhtRa+2wHGLzI0gfA/EjyhNHHXWSkeQ7+8Uw4JC5NF+7bQa3
 eubOT+Q8LHQj5haeDeKI1qoOkh+CpkzPqLvQo265BO434r2k8YusX75ApxnOe1O+q+eT
 HgIg==
X-Gm-Message-State: AFqh2kr4fVz8hwbKWqJgvVm3AbamUM1C2ovpXJqHzirdyK6vIMSz7Iev
 HHsptsCs0HAINXl865RTlfaXjvUvg/9BncHsd74=
X-Google-Smtp-Source: AMrXdXthyk19xfQbgHgpfFqnsk367uymb3P+KC8CMHVDJ3vAXqZTPzKMDsYWEwvmaRqs6nmDWLC1Xg==
X-Received: by 2002:a05:600c:3592:b0:3d1:ebdf:d58b with SMTP id
 p18-20020a05600c359200b003d1ebdfd58bmr1024933wmq.5.1671614099370; 
 Wed, 21 Dec 2022 01:14:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c4e9200b003d35c845cbbsm1799749wmq.21.2022.12.21.01.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 01:14:59 -0800 (PST)
Message-ID: <bad2a93e-9fb6-d48c-1525-4e269a406f6e@linaro.org>
Date: Wed, 21 Dec 2022 10:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/6] tests/tcg: fix unused variable in linux-test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, fam@euphon.net,
 berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Beraldo Leal <bleal@redhat.com>
References: <20221221090411.1995037-1-alex.bennee@linaro.org>
 <20221221090411.1995037-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221090411.1995037-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/12/22 10:04, Alex Bennée wrote:
> The latest hexagon compiler picks up that we never consume wcount.
> Given the name of the #define that rcount checks against is WCOUNT_MAX
> I figured the check just got missed.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/linux/linux-test.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


