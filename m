Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589A6673518
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:08:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRox-0004ed-Ob; Thu, 19 Jan 2023 05:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRom-0004Jn-9T
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoj-0005RO-VK
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:47 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i4so686163wrs.9
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J7awGWN8LF3eNKwLmxatxXWo44vQeX0SuyqtnHKmOi8=;
 b=n4vY475mdWpgyvpryeEgZiL5JAKSJUjrpuhytzsDLo1PsFVhumIzyVY2YbpzF/r7dj
 Is9wBTo5C7b1t9Beelo9aAH2ulxpkPlJ78BcUnkNJtunvoGKgk0C1AfKBxG5nhM7/Zx9
 mPEYaOi0ggcWil0lIahuquJ4CGfx3B0n3+VuQX8VMVGfFoiaqB4AVfUU4qbLdfwLRgx2
 cALu7IpG5SAi3zIg9wQGYCtKCeWoyPDI6pL2GuOYq3U+8CeN8FIG+oxPKLXHsCS4F2Vx
 KgijfxPDxyQOB79JsvJ5gYFTQ1h12Oiq7w4tauuN5r4Ce86zwLZ33kDytPEwRvmwIjNU
 A7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J7awGWN8LF3eNKwLmxatxXWo44vQeX0SuyqtnHKmOi8=;
 b=TmgIoKZi8Vw8A1lRt64v3z6zeAiDB25yB4bHnaWrnR7eM3p6o0yzY8xXl0l4oQKmyY
 bXCT94iWGODw2qQrnNvSZCPF5iOyVruN3zF803+8sJH3vNk+sj0URxqYDM4dilGyMbTY
 7ru6NZS1g5MI3UinUZuZ7cp5dJwnxXqJmfmfmqG6i8AIMlCv3emu2xRRvj7kYuODL9AK
 9cWrprnDyBATc0FapIkhqAWeXa77G3UNp3B7adWvY1nmImlMdBuKH33ydVgy+DLRDRb1
 3K3oFhfrxldzqp1qy6IPn07ZjWAdUJis3H8y1ylhSQ9Nm1wtG39lkJbSegCyKQFhZQ7X
 NkQQ==
X-Gm-Message-State: AFqh2kry24NlLYcYXn6Lx71sxYIHPeynpIM3CSGeypqSyE6gXQv8rG2y
 sdi5VBQCQS8pR6WDZxR0r1phL3jLlzAEhP0e
X-Google-Smtp-Source: AMrXdXsiqUqbmpXyEPODEGWJVyNgRuoKpHM/q0P5yVGBb9glfdbcwLMsTGaQmSCZCC5QRQQZGrK8rw==
X-Received: by 2002:a5d:58ce:0:b0:2be:4c47:abeb with SMTP id
 o14-20020a5d58ce000000b002be4c47abebmr543787wrf.37.1674122804316; 
 Thu, 19 Jan 2023 02:06:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b00241bd7a7165sm33355286wrp.82.2023.01.19.02.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:06:43 -0800 (PST)
Message-ID: <0b203526-d6d5-7046-f40c-5f25af570d2d@linaro.org>
Date: Thu, 19 Jan 2023 11:06:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] MAINTAINERS: Cover userfaultfd
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com
References: <20230119091545.3116376-1-armbru@redhat.com>
 <20230119091545.3116376-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119091545.3116376-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 19/1/23 10:15, Markus Armbruster wrote:
> Commit 0e9b5cd6b2 "migration: introduce UFFD-WP low-level interface
> helpers" added util/userfaultfd.c without covering it in MAINTAINERS.
> Add it to section "Migration".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


