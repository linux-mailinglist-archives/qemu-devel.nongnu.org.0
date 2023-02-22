Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13069F7E0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:33:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUr6r-0004Z5-3I; Wed, 22 Feb 2023 10:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUr6d-0004YS-Bf
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:32:32 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUr6b-00073L-Nw
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:32:31 -0500
Received: by mail-wr1-x431.google.com with SMTP id p8so8283257wrt.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uIbFvWNDHnPaFylbidVLmz6XVkELdfBovcJNelCol2E=;
 b=PTs+17lauGbM125UBgXuaR7EXxcZhFpv9Kdixnreo33ckupwV/zmQn4gbUFAg0XNtH
 aBLFAgbOYXA00MHg9TmcdFUs6XevE6vbKispkrPyOfygbAy6yWvs09b8rDkotyER4OGd
 cJfd/soFA1Q2cgopOHK+8/y9Tgbu7lBkoEdIGJRCzrhvT+PBuL1GRR7GCZL+Wflk/pYu
 Q0srKSopSPIhPACYY6pYZUSZh51ar4irbDOMACQI8VZfmOAJyZTiQU3RMkkvEwuPkhK2
 SE7Q5mFjyMzmXzxz69iPcoRT5zJi8vnKBOKYeGvhrJ1C+nQLz82BFnjKgB0/SB42+XpT
 2sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uIbFvWNDHnPaFylbidVLmz6XVkELdfBovcJNelCol2E=;
 b=Yi63UpgV11+YB52StZzjnDfBP0Jk0I1ZGkNV4ZO12LjiJywYSlF33PVgNpbNDWiRNt
 +oD7wJUpYJeUudBsll2+Ti2Qn97HoVaBelpKKjb6qTwx7tg4qOZYRARDVIHND+ctplTP
 1N84rqpGwgeddGcJBibHoyCgfCA1M/97NehI6Mm1kTV6ri8qLGgBqLnbYCT7f8wKf1e2
 jmXU9+cIsFbn176tcCKdinsyEZruSVgDXY6Sg90wxTpljac73dOmSRq0+LUOJ1ZFJ043
 VkBGkOa+1Lh/Ig+/0cdmAQlIpbUUFT8SDvcJbFhykVo4EfSUHUidZV0ae3zOQ5W0WcZv
 /MEA==
X-Gm-Message-State: AO0yUKWFQIH741tNal+8uNkjcOjoi1q6MWox/laXdwAX/KBBejkIkcht
 83Gr4tLIZAlI4kdMBHge4Iz4wQ==
X-Google-Smtp-Source: AK7set9xry5pKwEERDtiDpmYh408Zdqn7AMHMW8pdDdaumUH6tXMrZl5S9wvxJBU1793FlqRJM71qQ==
X-Received: by 2002:a5d:4dce:0:b0:2c4:503:7afc with SMTP id
 f14-20020a5d4dce000000b002c405037afcmr8454637wru.7.1677079946521; 
 Wed, 22 Feb 2023 07:32:26 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a056000118400b002c5544b3a69sm4489460wrx.89.2023.02.22.07.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 07:32:26 -0800 (PST)
Message-ID: <9d198d55-d28c-e710-edfe-ff67dd88a461@linaro.org>
Date: Wed, 22 Feb 2023 16:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 11/12] cirrus.yml: Improve the windows_msys2_task
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15/2/23 20:25, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> There's no need to run a full-blown bash just to create a directory.
> And we can skip the "cd build" each time by doing it once at the
> beginning.
> 
> Additionally, let's exclude some targets (that we already compile-test
> with MinGW in the gitlab jobs) from the build, since the build time of
> this task is very long already (between 80 and 90 minutes).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230208103046.618154-1-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .cirrus.yml | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


