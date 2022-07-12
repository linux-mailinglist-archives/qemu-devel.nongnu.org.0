Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED780572750
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:32:52 +0200 (CEST)
Received: from localhost ([::1]:36662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMYu-0002IL-37
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUb-00051h-Qd
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUa-0004pk-Gg
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id o4so12765405wrh.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JRUrGe5IQT9RBbdLi1zvK/UHy9obDqF8nwtG0tL2tdY=;
 b=Cc9XOd+vvJbl4PRn9JxXvgkZXUCfWtrNroxKO7zUC4PblFd/W1GDF5DTc6tuKgbjg+
 uP9s1qXKZW9cqzqI5LXLuhpKwz52MaxS5rXXIIuHnEnp+VNu8D/dDb6ZX92OMi8y69Kw
 zFp7iRcCTdapu/MWq/PCaMwWaTNOlwr80Sq4qxGBNRkFh1VFFhVGYB7OOB+sVjwMxO6C
 QqFZLbDY5MUZ0S6FqrU2L2gDRnpmh5Hvt4RrBSh3HUBK5mkBWIzSxZOuFbTnLM0kZPRQ
 YhO3RRn6nu83KxuYDgRJhzSkP7Wl7MsE3HpGIdM2me+lFmz2UGu5iCqqdu6sM2Kjln8o
 KM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JRUrGe5IQT9RBbdLi1zvK/UHy9obDqF8nwtG0tL2tdY=;
 b=hJjtzP4StNZIhirSraDWPsyF0Ekefdt36xZ/sh4Yl2y8XQgzF0Qv3KZ/utUAUjkGqw
 RufzdsgwSjs2BdR0smC6IzN1JloAZg1NzP3NnPUf0XcM7pVXIXT9NHouCvuyoBcdQsj0
 Jyyjh6Mr/tRPtJPnMQaFQjWQNqy4vn6Jc5XMlY2yoO943zXKz+9rzNjZ9uHXPgEiOO6b
 akLG6Nyu2A7+kqrcoGCaLS/nCxgqOafViWq3o+JlLoHPeVPjtvI8P6jaKymBlApbLB0H
 O24qDX+K+o3cbywBDGLEqrcziB9uVxalpgTJX0HvYrqD0iEawQwOUHNQd46VkzUsqNWi
 RMeg==
X-Gm-Message-State: AJIora/qtiDuEPqsG3fGV7U4NxA9veEuTjD8qnDTSL87SSfq0hX1N2Fl
 xUxZodtG/x1TMDbRjUSPmhHfHUjYYMl7XfJ7
X-Google-Smtp-Source: AGRyM1szNHPlfm515KMo31cMiq4Djwgw1G3lTVUY1NeGo8yuze8AlkIJhhSKZcp2eqsZ8XTs8fr2bg==
X-Received: by 2002:adf:d20e:0:b0:21d:7654:729b with SMTP id
 j14-20020adfd20e000000b0021d7654729bmr24120953wrh.239.1657657703093; 
 Tue, 12 Jul 2022 13:28:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a5d50d1000000b0021b956da1dcsm9176686wrt.113.2022.07.12.13.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:22 -0700 (PDT)
Message-ID: <d8527d10-626f-5b8c-3b4e-16a98a04add6@amsat.org>
Date: Tue, 12 Jul 2022 22:12:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] docs/devel: fix description of
 OBJECT_DECLARE_SIMPLE_TYPE
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220712103131.2006653-1-alex.bennee@linaro.org>
In-Reply-To: <20220712103131.2006653-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 12/7/22 12:31, Alex Bennée wrote:
> Since 30b5707c26 (qom: Remove module_obj_name parameter from
> OBJECT_DECLARE* macros) we don't need the additional two parameters.
> Fix the documentation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/qom.rst | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


