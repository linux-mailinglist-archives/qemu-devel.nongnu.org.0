Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA66D3D6B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 08:38:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjDo2-0002EF-Ve; Mon, 03 Apr 2023 02:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjDnt-0002Ce-Ez
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:36:33 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjDnr-0003mM-Rr
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:36:33 -0400
Received: by mail-wm1-x331.google.com with SMTP id o32so16390072wms.1
 for <qemu-devel@nongnu.org>; Sun, 02 Apr 2023 23:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680503787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dnwr8QkjYPEQUiRXlHoLoo69wDjs/tmm2kAO752YJvU=;
 b=MjdVu+o8pBFMBmrZ9CaU+6l7u6RbYH+2ap7r8Mv4zMrz2GiaUcEccs/zkchyZMOSeU
 ZoP0AjYPvrk2Adhx68dfwoyzqNkr3sCXOZud0ORX5AFmApO6ElYbrOxk8k2RpAmNPdq1
 BQ5FnhzTrBkFFX8Vx6JB6w9RSux4l0VmUZxukew8Lj52yBBy8SFHNyJvgs8GYTIEUDUX
 0/t+lwIg9ROSjli/G4ACfegl0xmac5QTiUvOS4creqdQpfHcItPGqfN1c8pWnsKy40Di
 xnEIs57Phzvh4AQImUd/pm1tzyrWpWkQ5zvMUlVGaYcVULbufxgW7IbazQxrF/P5fHT0
 tJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680503787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dnwr8QkjYPEQUiRXlHoLoo69wDjs/tmm2kAO752YJvU=;
 b=Y/t8tzd0qrlviPxZoAt8DC3qD1eNb2b4xXjSoE7VKTl/RQPu7zWVzqf48EZ71nqkEc
 zl1vR/oedVtHjjHrm6YFSMDT/WXZdJahJcoJ7HbrIyglwltEeAQdj/DjYzStv+sDMkMY
 /ViDEbQS68QSGKuZd8OP8sQcthhK0RWWqA4spblFek4bkUR21lLRp8aXTdcc3LAIpTfB
 zMVPEmpYpNc4M4higXTEpYz6PYt7bu3MBIU++TCxWrj6DSAtupyHm5b9m3lxytyTckEU
 F9PjZXIpvIrMBe7434CBTBI/YfeywNXv9o1DJbgcJVEgk/2vvE5y4U4J9SLX7EQ2SVBR
 puqw==
X-Gm-Message-State: AO0yUKVqlnXCLAP6/UORB1bk6ZxS5D8lGeCuLbu9abqIGrdXkh1AD8uh
 JXlY3jOsnmp6EbJwwSByOSZVjg==
X-Google-Smtp-Source: AK7set+ZTbAN1sdrvqM6VUAFP0ZxiP7PMaSbMQqElJNZYKArdCzFXzX6KwuFaJLheQkviXX31rGn6Q==
X-Received: by 2002:a05:600c:2214:b0:3ee:289a:43a7 with SMTP id
 z20-20020a05600c221400b003ee289a43a7mr29117728wml.22.1680503786892; 
 Sun, 02 Apr 2023 23:36:26 -0700 (PDT)
Received: from [192.168.127.175] (246.red-95-127-42.staticip.rima-tde.net.
 [95.127.42.246]) by smtp.gmail.com with ESMTPSA id
 y5-20020a1c4b05000000b003edd1c44b57sm11050724wma.27.2023.04.02.23.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 23:36:26 -0700 (PDT)
Message-ID: <fdf7d2dd-fec1-c635-7bf4-9798026968ae@linaro.org>
Date: Mon, 3 Apr 2023 08:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] Revert "linux-user/arm: Take more care allocating
 commpage"
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
 <20230401045106.3885562-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230401045106.3885562-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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

On 1/4/23 06:51, Richard Henderson wrote:
> This reverts commit 4f5c67f8df7f26e559509c68c45e652709edd23f.
> 
> This exposes bugs in target_mmap et al with respect to overflow
> with the final page of the guest address space.  To be fixed in
> the next development cycle.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c | 37 ++++++++++---------------------------
>   1 file changed, 10 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


