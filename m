Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0544E1E17
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 23:01:31 +0100 (CET)
Received: from localhost ([::1]:40610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3cA-00087w-5E
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 18:01:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3Yr-0005Oh-Lp
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:58:10 -0400
Received: from [2a00:1450:4864:20::433] (port=43675
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3Yq-0003fv-8d
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:58:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id a1so17084811wrh.10
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 14:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CHWqZ0EdKQY2eHqHAu5zT89sfQfiYo+ZUiebivyyKYQ=;
 b=kLEA7hkibSy1cS5ZQVqpf2aXG3KAcgswKbYHledA1guaE20UJXKx9Jsi42MXZ16Y/k
 z6VhsDJQx6JLAibfE5BV50LIcrQ9RG7zU148iOipiony20DsJQRqIPSBVcdq8Up88jCv
 JzXuUm3RiAftyegkxyhlY3DbXEWLPxnwQ9USxJqoWLahhsigtSN1P2bS+BW63scL0CvO
 pawywDLi3o5rraur7DMP44XV7/Yczn5BC1L9QZBrgAc+95JCjGQnZ+aEZYPhua1aqZbX
 j7jLgdsEMEs3ao5flwHTk/isCEIFzuASq6Ds7joHg1sy8CnwEP2Uwvur+Gt9NlIDH8qS
 Yoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CHWqZ0EdKQY2eHqHAu5zT89sfQfiYo+ZUiebivyyKYQ=;
 b=Idlz9gmgTWboGXtA3ma68k6qqPibhn5NJIcJciU2JW3KAu+OLqGE6v2rCs0KJvNSmY
 RjK9FcL1y7yWKxzxUE+548INPTA7pqfa+dyYotlMNuKpmqx672bZSQ94OUBLenFh+2+9
 JBqzrOzGNmKVRPcIJeHenvcfge38L1BUhqCeaw/5IJUDenXCbPBLZWvbC8KE5YPNGNAN
 cCfMiSqXcus3Vwlp1MjcnYx0oYStUQXgBh+ifbel3sZO4ElZ+J7dp77Bt/KgdXLpU/vY
 f8IRpjmIHlt4W+QScKo70FkNMaBvLUM9QaeFrYy8gVpzSGfM4iyBtChFrIJLeRd+1yUS
 hKLw==
X-Gm-Message-State: AOAM530z3u4S2te4dorda4ckZAqxlGqXyvNB4NCIXX1rE9KXLue9bYtz
 ewlIHXH9UaiOBUj1mBiiAQI=
X-Google-Smtp-Source: ABdhPJyxplQoHatGAGnbvPORl1H/ziJ96medFrpRtQyKl3ClW7+bwOci1x/K03LFoTwJlHVnIgt0pQ==
X-Received: by 2002:a5d:5551:0:b0:203:f916:e319 with SMTP id
 g17-20020a5d5551000000b00203f916e319mr9752745wrw.422.1647813482966; 
 Sun, 20 Mar 2022 14:58:02 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 a14-20020a05600c348e00b00389ab74c033sm12074806wmq.4.2022.03.20.14.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 14:58:02 -0700 (PDT)
Message-ID: <1f6a454d-c690-090b-b347-dfdc0686ed6f@gmail.com>
Date: Sun, 20 Mar 2022 22:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL for-7.1 34/36] util/log: Rename QemuLogFile to RCUCloseFILE
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220320171135.2704502-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/3/22 18:11, Richard Henderson wrote:
> s/QemuLogFile/RCUCloseFILE/
> s/qemu_logfile_free/rcu_close_file/
> 
> Emphasize that this is only a carrier for passing a pointer
> to call_rcu for closing, and not the real logfile.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   util/log.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

