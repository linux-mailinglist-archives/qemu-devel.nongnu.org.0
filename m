Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD93967C0D0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 00:28:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKpBY-0002HB-0Q; Wed, 25 Jan 2023 18:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKpBV-0002FI-OB
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:28:05 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKpBU-0001z8-69
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:28:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so97739wmc.1
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 15:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8APanKUAnmdWhnlPqwkZQ0dkpyjqYhFtC8FxZRJrVQo=;
 b=sdR81LnFyZgwMVsnliSYqoVmW0m0qufSS2Cjd1TJ0Zq2Kl+j9P8HlchBi401NCLKvE
 jZoGy7QalzBOkEUppfnohuHR+3odvFcMkDY7rYTdgUFuAg/XISg8Rj82iQ+15tv+lSEy
 aI3VxthtPT4ayWECFEjYPjrGmbiic/hO7lEf0DXZWWO8XYANG291FSGihMdVugsWi+vA
 U61uKHDULyN/VSR8cY8uew15wRcUzHUsrgFxQMD27zjIAc7t7cl2D7CdBHb5ncbjmXIq
 p0VsZDou1V7XHS08AwedGDQr/FD6zx4OJuBJU6qdZTkF2qHCOsPDw1ut6+tBuEpMQ7e0
 VETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8APanKUAnmdWhnlPqwkZQ0dkpyjqYhFtC8FxZRJrVQo=;
 b=DAs1uLyc40UD9VjyArtF8WYLbubsnnTZFqtA5wu6IJMx8DWncqbFL2lqhYzmrQJ0KE
 Kdk4fBJ2mlGakOxmsH75MQkQd6urpm4gYs6WOnvOqmf8HF8ToPakhNGGP1x5j7k0VOR0
 y+PmZGGVbMErSDn0G9JQ5/yL8msxnCINo4QzZqdRoqrbSUE9MvSX5OOY982gNbUGwQjv
 11uRSIucy0rsmt30edzOp+8QYbYJCf0jVR2Wo8vomCQBH5mPGVbHleZJ4Za6BOObCJVX
 TsByntbn6RmjzUwNj4EInAY6/EXastnA4cFs6VKqyn/e5qAwkE1bT/FQcUBe6i27Gkxc
 a6Zw==
X-Gm-Message-State: AFqh2kpiKwl+RGGDefker9PyNG8BokHWsS5SuZiN3rOsd6tURFOqNS3Z
 UwclgFgCcogb1vpnlwTHoJTK4Q==
X-Google-Smtp-Source: AMrXdXsdPmpe2e6wdelvK1dEM/px+x64bIaKi5G/OtBl2SNChxbrns5ZqMYjPNCkArWGSWnhgW+A/Q==
X-Received: by 2002:a05:600c:539a:b0:3d9:ef72:190d with SMTP id
 hg26-20020a05600c539a00b003d9ef72190dmr32442647wmb.19.1674689282647; 
 Wed, 25 Jan 2023 15:28:02 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a7bcbd8000000b003daf7721bb3sm2886105wmi.12.2023.01.25.15.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 15:28:01 -0800 (PST)
Message-ID: <4095f853-d9c3-d0ef-e441-d98600a4c80f@linaro.org>
Date: Thu, 26 Jan 2023 00:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 34/35] cpu-exec: assert that plugin_mem_cbs is NULL
 after execution
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-35-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-35-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 24/1/23 19:01, Alex Bennée wrote:
> From: Emilio Cota <cota@braap.org>
> 
> Fixes: #1381
> 
> Signed-off-by: Emilio Cota <cota@braap.org>
> Message-Id: <20230108165107.62488-1-cota@braap.org>
> [AJB: manually applied follow-up fix]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/plugin.h | 4 ++++
>   accel/tcg/cpu-exec.c  | 2 ++
>   2 files changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


