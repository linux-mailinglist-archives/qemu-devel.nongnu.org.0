Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075BC6985CD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:44:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOdc-0002fE-VH; Wed, 15 Feb 2023 15:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOdX-0002eB-TD
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:44:20 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOdW-00049H-Aa
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:44:19 -0500
Received: by mail-wr1-x42b.google.com with SMTP id o15so17153128wrc.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wpymyfuKQ8Qvg5hphgre5Rf7sINLs+KPLSzQ6wa4lFE=;
 b=Y70M5ThKuiN+Nk3FUFZKd+lvOj/fhX545DDyJp4O4nh8DQAUuUg3cgI7N8oS/S0Owl
 70B2kKZ12PQ+R4ON0FjvRvpCfOLXwNp7Lm3c6YVCXJW+BuA+USh1ubRSoaLmFvu9epGB
 zE6kCbH5/jJOKBx9CT+1YgoW8DUpU7FZWOW1NObQyRpDk4eGhIZNkao3bI+mRMxOh9eb
 yHPA5Y1I6X5uEJmJNhNVFiyyE8bakv349b7pmH+EoaJb9HqsdMvclK2ZH4l1PdONNXx9
 8BnUiJUw+tiazCZQE8aUq1M0vv1D52ShRoj127FT3ydXiQjVo1mj08zE0p8XHuHtepX/
 IV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wpymyfuKQ8Qvg5hphgre5Rf7sINLs+KPLSzQ6wa4lFE=;
 b=ZPVY2Ym1Y2DxFtsr/shzeZZGSmqh9KnJSkHw60Bn1/6wcg7/a5tnC/8JrdFNCsmXb/
 RLWWgnV4LfrMo2HGPXvGl16YQQLFB0jkpmVzBwAC1lZoF7NTwR97Qmu97JZopzySucW8
 fVTWQZzRZ62v9HgDUl8gMKnHXNUoWC1vF2Ilr9zj1lV6BjJ0UjSV712q1R61INlmdr3l
 hSsK54SbGj/cnzUW8rUGhufkqqU1/WzACoEAu61fqQSrjRizaIcoAL1ZK+XQqN0HFOcw
 4AYLtkx0QPwgfVwFfduuHARe0FAp9q8J5AraJsDU4Ill+sZsMHpkAEhePGZlNv7FPXgX
 D3JA==
X-Gm-Message-State: AO0yUKW5Bwg8aNGnVGwHY+0BkeMuV5EzkFgfvyBOtow1zPUluOuolX/J
 47tC3MVUsQXhknf2vartWf+bRw==
X-Google-Smtp-Source: AK7set+OCWe8nK9HCYNvk3hNNv+Umpn3fW8v2PCJ4RcR+qHnmiZ5P+634voaPYEVpRJHGzv73sR8pw==
X-Received: by 2002:a5d:46cd:0:b0:2c4:872:e929 with SMTP id
 g13-20020a5d46cd000000b002c40872e929mr2903172wrs.16.1676493856668; 
 Wed, 15 Feb 2023 12:44:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h10-20020adfe98a000000b002c5501a5803sm11496214wrm.65.2023.02.15.12.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:44:16 -0800 (PST)
Message-ID: <0822739e-eb54-b948-a076-e7c252ec72ad@linaro.org>
Date: Wed, 15 Feb 2023 21:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 04/12] tests: be a bit more strict cleaning up fifos
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
 <20230215192530.299263-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 15/2/23 20:25, Alex Bennée wrote:
> When we re-factored we dropped the unlink() step which turns out to be
> required for rmdir to do its thing. If we had been checking the return
> value we would have noticed so lets do that with this fix.
> 
> Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


