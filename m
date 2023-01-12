Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A1F66706E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFvBL-000123-3E; Thu, 12 Jan 2023 05:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFvBD-0000yb-AV
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:51:34 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFvBB-0005mS-S9
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:51:31 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d17so17669647wrs.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JqJV1As7u9h4eJmFzuLL77T6qIVud9TXQ1NtuM+iRsE=;
 b=ry7cnfXJaX+JVaneqecWTsCHr/GGhy0OO/lsbBPmlQgMIxYC2Sd9QH/XiJ/cqhst9K
 ZMhQD+J9SywcD1WCyNh57onLA9vfSydLrPUIgvJVsUwT5wNGyGo431eYPAmVRDjobo/c
 c01t1NP3V4R6mD+RSbPDPFUfJOaYQ0Z+EN0hYVeU7ROF+X4FCJNxHe6tp7FYFaVumZ5E
 KWUIR3G+ICL1+93blZcwP7R7hx3gabZRMIuDL9hs6feob/1KOGGcudtBDnLjE8TZCylC
 KO3J/nYd3/lBIEOshFdomZXtX0e7drcv4806WC0tuIIY+6XZfBcntF4SdqozSZo7HsAf
 0KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JqJV1As7u9h4eJmFzuLL77T6qIVud9TXQ1NtuM+iRsE=;
 b=oPBFIFzCLw5yZXSwAi1XnAG3j6hQKX1BbNnfDEuDM8RDjb65Qz6sAtj1/m0n46airY
 Yg8BEU7Vg79bGFllLfCVxB28uiwn52FZQy89X42zrLCe8c8o0xKN+tovO8p4OsPF5cI6
 6rpys3yikrh51Fl4U/Dt3ahR0KGDnLkhoJV/m6tGkNiQeq32jt+fwvlqwBSOeKM/aEuB
 j4jMv9V7VYrjjp3OGlVK8xEiddS7sUoQsq+1PQSyiN1fSsQ1egnI8RuA0ZYE3hYMoEtx
 YYw2ty4vEi77Q7ZaAzg1CRxQJ9H5n6gp9YaY/7G1WQk6dRVDyechIRIXHIT8sUPry7DQ
 /SHw==
X-Gm-Message-State: AFqh2kokNfl1JuiSXP8ZTEjrI2qIPyLeIMFiL9cT0vUgG3/TCAqZFuMs
 yV+kdw6ZCynDUvd2aNnboaMWYQ==
X-Google-Smtp-Source: AMrXdXtjYPFce5guwo4VUfIW17gon2AaH/Dcc1WfhX1oGmXFBpRVWUB82LX7Gd3SooRiHMM/nJdBQw==
X-Received: by 2002:adf:dc0f:0:b0:242:4f41:4dae with SMTP id
 t15-20020adfdc0f000000b002424f414daemr47187576wri.71.1673520688457; 
 Thu, 12 Jan 2023 02:51:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r18-20020a5d4952000000b002bdda9856b5sm205634wrs.50.2023.01.12.02.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:51:28 -0800 (PST)
Message-ID: <1ce19c81-6493-f5eb-ab28-4cfc7f5f079f@linaro.org>
Date: Thu, 12 Jan 2023 11:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 17/31] tests/qtest/e1000e-test: Fix the code style
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
 <20230112095743.20123-18-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-18-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/1/23 10:57, Akihiko Odaki wrote:
> igb implementation first starts off by copying e1000e code. Correct the
> code style before that.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/e1000e-test.c   | 2 +-
>   tests/qtest/libqos/e1000e.c | 6 ++++--
>   2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


