Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2C6752E0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 12:00:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIp6X-0001NP-D0; Fri, 20 Jan 2023 05:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIp6V-0001Mt-Fc
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:58:39 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIp6T-0006mx-R4
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:58:39 -0500
Received: by mail-wr1-x42b.google.com with SMTP id n7so4498124wrx.5
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 02:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I/f1sg3P/2lcuYuObTBT5YGVpQ4/JMdwB2zdQuVNHn4=;
 b=TvLSMx6gmHh46xtJ/VPP4UVdo8AsprkmUCUP8e7X02KJ2mJmuWIZUKwg4otYCEG0l7
 +k3q6uFPF1cYE67d3uUb387Fw1bFXG+kuGXgm22z7QxdfWv/9FuDzU0ytwozpOwZHx9p
 q9CcZsl3RYWlQYtLAIkO388zPyoAdsPm21uRongcL5NYV2uLtRBq/bol3vBbiw9W0Nno
 cPN9rYy1Bb/fZVOk8FKPL4v40/b9QtJWpYWpPW5dLc3F9H9/uCMpn+ZVSVVluyu0Ufdu
 J4w3cd2o+4iBGw6YibPxww7xam3hMe7+z2OIpG0MjSXGpd2bGSTnNSWfHP1bEZxGyNEc
 UcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I/f1sg3P/2lcuYuObTBT5YGVpQ4/JMdwB2zdQuVNHn4=;
 b=HIJYBxYyk6hBar1t8G+u00Qxhzk3imA0XUv9b6KSEjX1DLupKfStmmPbfU+swAfZv5
 rjOFDQ3kYIGPCb3cU+d9NCbwTnr7NmuvBas2CQDK1Elli/QcO+jVweUVyjbiwWzpYqke
 JEWQAjW87OPk0J8AOUVo3yUTW+OtwqkavqVjb01uJ2Mo1Qcd9A2rpDtz37DV53/2bd/u
 XQnGu5P7rauUaW5jma8GRUbHk1IrU9J+06X1UDpv+T00sAJlFJaNNZTM2j6A8X8DDIsU
 g6clYr+/IiOxtTSeNcjjf4c5ro1V8QOtQuE1KkaFQx+s9vZP8x5wnrSYfJqyj6mOoYvX
 0ORw==
X-Gm-Message-State: AFqh2kov26EpC4gZIhQ1dha9VVzhk7bxmdsSZOgpNmSHVZy6Ia7bAsn9
 7P4mCP7BlYFjCbfnpb77uBgNwQ==
X-Google-Smtp-Source: AMrXdXt9pyDTUMgtognL/Js600QPMpN1tVuUeefl7SH7fEXoJSSw1S5AAV0rh+ks3T6PPOYTW6JOOg==
X-Received: by 2002:adf:ef50:0:b0:2bb:366b:d5e1 with SMTP id
 c16-20020adfef50000000b002bb366bd5e1mr12291537wrp.30.1674212315787; 
 Fri, 20 Jan 2023 02:58:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6152000000b002425be3c9e2sm35024405wrt.60.2023.01.20.02.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 02:58:35 -0800 (PST)
Message-ID: <321c1dd0-4354-ed38-6b3c-6be3cdc1e481@linaro.org>
Date: Fri, 20 Jan 2023 11:58:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 06/11] tests/qtest/migration-test: Reduce 'cmd_source'
 string scope
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-7-philmd@linaro.org>
 <cd802b6b-1fe7-2640-1ae0-0227c3e8e335@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cd802b6b-1fe7-2640-1ae0-0227c3e8e335@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 20/1/23 10:02, Thomas Huth wrote:
> On 19/01/2023 15.58, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/migration-test.c | 29 +++++++++++++++--------------
>>   1 file changed, 15 insertions(+), 14 deletions(-)
> 
> Missing explanation in the commit description. What's the benefit of 
> doing this?

Reduce the changes in the next patches to ease David's review.


