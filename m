Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52247DE35
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 05:13:10 +0100 (CET)
Received: from localhost ([::1]:60790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0FTZ-0002lf-NI
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 23:13:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0FRz-00025c-WC
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 23:11:32 -0500
Received: from [2607:f8b0:4864:20::435] (port=47032
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0FRy-0007UA-L4
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 23:11:31 -0500
Received: by mail-pf1-x435.google.com with SMTP id t123so4073179pfc.13
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 20:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=kTOPu9Zbi0XUNk61c8XuXrVtvz4jWn7oaBov9uMQ0Zo=;
 b=MunJt0b1m2sizDc/zuMIN+yhMv9VuxrL+AwdWt1Xe9DMECsz2suMfICJjFw3yuT498
 MqcRwcgfRt5hzD9EHtDBf5LDIn8j3spPkXy+S1QGZDbkrGRa23wc1gcyIaJiuJmFuOEe
 lUZj5UaPpWZSez+J4fbDb+v0Y2IC2TZT3/W6V2zE0tJr4sTKK5hd62OUpLmiLmujyXXb
 8ZYUdyYns97DeWEv/WajbG6yPpxzsRX7QIqIQSqdHMJQZVsBar5BNsDzZw62juT4zcmd
 SSWBTmqwkGOfRK6NPONlXwl8+VedvWJM6sPR9WHEUOF4tCBFvcth1AXh3MrMfm4VaYAb
 j/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=kTOPu9Zbi0XUNk61c8XuXrVtvz4jWn7oaBov9uMQ0Zo=;
 b=y2pHetYkoHVaVsfoPJf4rZXaR4KMqtcKQpml7L4SaNPZ1SuJkhY6JTpNxAOscGTGbJ
 3EKImd0OnwAgv4eQ4bCG0Aj04aAbuNAfnYtEulqIyDiwwZb9c+Qs+b/cselPTV1vlgsR
 E5bcR4dBrQApmRSpiYBqxi/1KsMKUXPWV35GWil6aSV+CPGU1HuV9dWG4ehh2Ydfi02g
 M9CEnaARBdOtcc8uD7VS/H+/AzemqOZ/jEbn5ZhY6EOV69fTega7lEPLVNu11Znjz6ws
 G0IBc9vqvdh20FWeNjM4KFwFLCV/XqZ1Xu9iaIUGeN82xKw+96Rs36RSY/VcyeqQbvLN
 2upg==
X-Gm-Message-State: AOAM531QG0Adn7Iil2QAUPokwkHU/hcRnTEsBatae0rewl8vIuCjbZjP
 iBg8r/piEbPue5RzgAsYcnuOqO7BwiNLtA==
X-Google-Smtp-Source: ABdhPJxIIxTIUu343F8l3MGZknPE3gENSLQq5o9fMQOKi5b18tnnPilUcVt/a7cFc83SyLmbG0AwpA==
X-Received: by 2002:a62:d414:0:b0:4b1:3bf5:2b6d with SMTP id
 a20-20020a62d414000000b004b13bf52b6dmr760744pfh.24.1640232688949; 
 Wed, 22 Dec 2021 20:11:28 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q9sm4518127pfj.9.2021.12.22.20.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 20:11:28 -0800 (PST)
To: John Snow <jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: check-python-tox failures
Message-ID: <d2112a58-a6bc-ebaa-ad94-60d66f4a3437@linaro.org>
Date: Wed, 22 Dec 2021 20:11:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi John,

This test has been failing for quite a while. While it is allowed to fail, can we either 
fix this or disable it, to allow the ci to go proper green?


r~

