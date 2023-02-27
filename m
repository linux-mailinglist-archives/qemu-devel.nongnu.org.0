Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC46A4DAE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 23:02:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWlZ9-0006k8-K0; Mon, 27 Feb 2023 17:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWlZ7-0006jh-Fc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:01:49 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWlZ5-0002gO-NT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:01:49 -0500
Received: by mail-wr1-x430.google.com with SMTP id bt28so7758923wrb.8
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Un0PHLKzh0MMG6EhkRPCes7q74uDan74U0LXhgDSf34=;
 b=SmrJPDsqv3wcNjdOIWZb3m3Br8nSjllMJS4raJyn3NCruBRG2A34Va1ASJmZA/Hi91
 exeqrLhWpGM6Qu5FHEjR5qAzVlAYbgCo7ZOWVfaTuYGBBZSMcGYmY/IwQq1pHi/1SNwX
 PQ6mbm2mbDMinF6sX7K6AsolSJ/cev1jghQ0Z6sBJPvU0rR33+bm301RbPJ0phNywKkl
 G577thEpZOWmf6ayc0euTGbAylJOWIRkuxNuvlQGwVrPiXq2Qujr7QgYqd80MPHecA1C
 7J/+UNuWrwe8Y5INgx2kmYzr6DO+vm33py2NjDRVGoxUpyFe4l3NulRYQxtIrnJF5joy
 VIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Un0PHLKzh0MMG6EhkRPCes7q74uDan74U0LXhgDSf34=;
 b=IROJFFQmWfK9SRg+JUdrd7nkIxLep+hzbEwXTahV+RHxLPfq6/bEHOcSUaE0fib6oP
 d9BT9kod8YG00NjzhooEFEIsartferziBI5UsJcQcDZ9CXUs48GibUvnpH9m/qQjY+0c
 3XMzyDN+mNr6Q+rcreiPEhWcvTa3lZq7K38yXxDzQRvL6BIK01YtHrcGmEeGmzexBgEg
 vJkuNAO2KXDmo8DX1JEbgNFFyjyYA0PhX8wy+c2rgmrDMCBme1A77vWpcHac8YMmZUxa
 Fry2eZTzhCpwAWgzZP0wi5OS74aztFX/UspEOiK0zMDCGDwRFDevWyOupW7E041UMfhT
 rWVg==
X-Gm-Message-State: AO0yUKWVabPCRGU7DkFBTeifutpzmOgCimerbkRnNp6KxNHDdqwvShtV
 r0u0lhX9Xyd4tNijViwGGsMv+w==
X-Google-Smtp-Source: AK7set+JaHHe8dEmkADLKZKYvbe2IioCzUTh08VGjLJJyhTncytOC5aPVWwNWXCKMcy2zAkht7g0Lg==
X-Received: by 2002:adf:f483:0:b0:2c7:d7ca:4c89 with SMTP id
 l3-20020adff483000000b002c7d7ca4c89mr479044wro.58.1677535306083; 
 Mon, 27 Feb 2023 14:01:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w3-20020adff9c3000000b002c7e1a39adcsm8165476wrr.23.2023.02.27.14.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 14:01:45 -0800 (PST)
Message-ID: <5aa19e4c-9d91-3446-33d2-08bcf46c15ed@linaro.org>
Date: Mon, 27 Feb 2023 23:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] tests: Ensure TAP version is printed before other messages
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: alxndr@bu.edu, pbonzini@redhat.com, bsd@redhat.com, stefanha@redhat.com,
 thuth@redhat.com, darren.kenny@oracle.com, Qiuhao.Li@outlook.com,
 fam@euphon.net, lvivier@redhat.com, berrange@redhat.com
References: <20230227174019.1164205-1-rjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227174019.1164205-1-rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 27/2/23 18:40, Richard W.M. Jones wrote:
> These two tests were failing with this error:
> 
>    stderr:
>    TAP parsing error: version number must be on the first line
>    [...]
>    Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.
> 
> This can be fixed by ensuring we always call g_test_init first in the
> body of main.
> 
> Thanks: Daniel Berrange, for diagnosing the problem
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>   tests/qtest/fuzz-lsi53c895a-test.c | 4 ++--
>   tests/qtest/rtl8139-test.c         | 5 +++--
>   2 files changed, 5 insertions(+), 4 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks for tackling this!

