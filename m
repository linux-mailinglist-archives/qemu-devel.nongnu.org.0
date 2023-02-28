Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37516A58AF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:55:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyZ1-0005Yo-Ry; Tue, 28 Feb 2023 06:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWyZ0-0005YI-D1
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:54:34 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWyYy-0000UV-TV
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:54:34 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q16so9450235wrw.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nk/W5I7yEYnRYYwu6FMoJYeX7Rz+RoLFVgBwtE6+/xY=;
 b=W3W/w8s2bA4Hr7umWG7Q2odRwlU8IbiP0zdX45u6EGcdrbvenTqvxIarBrSwM5ecO/
 /jUAidfEToG6DU2PToMFvZN4DLqOJ8kBaL/8+5CNhSI7+jc/zTZCjI9EWBa34Z7vQEEB
 YANkH0OU+jmqs2u//fZgM3JQRpjAz7NWOLJHU7KIC0n2TlU9u/rI8qvK7dMxaj9naTyn
 rya2eQ816WsBNGdCTDpkvz4lTcbrLq4TZcAUaJ7CHiepMw9e5MUevjECIocGSiFPXxoT
 CMCGiyW/Y/7ps6bprGubeK1s6LZ3dyohFdKaIUJqHyOZjHNao9WR3HV3h6H422J/ysAq
 OPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nk/W5I7yEYnRYYwu6FMoJYeX7Rz+RoLFVgBwtE6+/xY=;
 b=3gjI0grKIF88T1WT0QXwEvhv9yu1CLV7WV55ba2JgnbpYCzOxoz14+v0uBqWaWnFJ1
 djlHHjQxrBJae3CdL+dWhMTSYVVKQ4if/0vUqpMjAZk7L4jFbMW3jwsqwpuOrVkyczq9
 fGlDQa4Jdk9nzdPjyIup6BYle8r57ci7t2BYtdl/wgP9lw/RYGbueUptwbHhcN7GEz7O
 Wu1ZxhMeAhQIJNIu56EaaGICf9XnJvEeZhjtvVPTPvs1FbrvhaUGF3JOoE7AJeA2pQtt
 zjHKdRQU419qCRQp2zqmY06TW1FMyaIXNcJ7sLPnxV1CdCTJFm67TbxqIFvNX7qXTxVN
 lf0Q==
X-Gm-Message-State: AO0yUKUaTSMdqaFdJp9up0/8n0ps95Trpucc53pFzUdEFeW7o9e0TKGz
 u7IIwHZug0xd/y9hrKdZ+LIkqw==
X-Google-Smtp-Source: AK7set/wv8d59OwoPof6RRccYE50LP2cZGcQNkcr484s5EjCqd0u8DDl0c4Y+idT0t4c0MlXX0xpag==
X-Received: by 2002:a05:6000:c7:b0:2c7:1c72:69a3 with SMTP id
 q7-20020a05600000c700b002c71c7269a3mr1817350wrx.29.1677585271271; 
 Tue, 28 Feb 2023 03:54:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p9-20020adff209000000b002c3e3ee7d1asm10006438wro.79.2023.02.28.03.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 03:54:30 -0800 (PST)
Message-ID: <307c003d-369a-c44b-2e62-679d3a9ac6d8@linaro.org>
Date: Tue, 28 Feb 2023 12:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/7] configure: expose the direct container command
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224180857.1050220-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 24/2/23 19:08, Alex Bennée wrote:
> In the process of migrating away from using docker.py to build our
> containers we need to expose the command to the build environment. The
> script is still a useful way to probe which command works though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


