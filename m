Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2204571752
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:29:55 +0200 (CEST)
Received: from localhost ([::1]:53764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBD9O-0006qD-PJ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBD6b-0002yr-Sz
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:27:02 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBD6a-0003dq-0J
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:27:01 -0400
Received: by mail-pl1-x62b.google.com with SMTP id q5so6872074plr.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bxa7w9Zsctn+iyM4gWdukd6MGCfP6ln33tZ3z/9q/jc=;
 b=sXFge9/ghtPC7qQR+C8MS8OAjXQwSYoU+WpOjkrYd+RiCa8Ewx+v3WWxxnU9rQnf7W
 mHFpyR4a9eGwaYNPDil41b541JvEFtFzjizbsP0ELUswN3MVALGJX35x2guuNnfUtDBb
 PndH+FIM8sutSLvHtaM/JT3Uudp6xhzZVLi/blfYZYFfPP+2sCva3YMpYV/8W/5YdZX8
 FJyl7IuBrRC1bCTMSt1nAxij4TzCLR+aFLXxCZAqki0r9Irik6HlwQFPS+nz6B20l8xS
 9FSKW5NcHeBQhgwFxh5mpgZilMZ7gs2rnJaYWp3k+vBnmZhfEHj3tx0DJmx5s42jmxc7
 9uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bxa7w9Zsctn+iyM4gWdukd6MGCfP6ln33tZ3z/9q/jc=;
 b=aL0igjujhFHo/MMFXWpNToykKi4AE6wr4bFCSpD6viUKsFXJkYz91lNCxbx4OkFpAn
 FMyd0HiG7SZatPTWhD23CvcjWN9DkomgP2IApKIUqEA6JpGQTfcr4wUm6ZKL8uq2cpf1
 o2vlwL+jf+f5nL4qI1TaacSszVwE0ag3VxmB7A43chc63KMpmXrjldXt1Mp+4AcN06GV
 xopbuExb8z0a0YRM8ZORkVw9OXaNe/T/3ltx31DkGoxWRMzGZ3OsETI1PoJI6nrKbnNQ
 Jrprk2OuWITewEXQG+HbXvxamScDtu8PRk85X/I7UMbtE2u7QW+UeP+K0vt85CPoXCRC
 unlQ==
X-Gm-Message-State: AJIora8Ymy5PSQFTsNO1wBCK8gTsMrJP609pbIXm8PQ/T8DJaZJePRap
 llrYrcdd+mEQAjZ97ZRV09pTdhC6oE5idw8Y
X-Google-Smtp-Source: AGRyM1vDqprFEbgx1S9jZ2jAOS6PoEGIJlp5oDraPLgOwSzPcgcJwrjoruK8s2PyT5N7m/WI8Do2IA==
X-Received: by 2002:a17:902:e749:b0:16c:3d6f:aba3 with SMTP id
 p9-20020a170902e74900b0016c3d6faba3mr13771843plf.135.1657621618652; 
 Tue, 12 Jul 2022 03:26:58 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 a6-20020aa795a6000000b00528d752969esm6444198pfk.25.2022.07.12.03.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 03:26:58 -0700 (PDT)
Message-ID: <d9bd8b54-868a-6f0e-09b9-754f23c12cbb@linaro.org>
Date: Tue, 12 Jul 2022 15:56:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [COMMITTED 0/3] build fixes
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220712095901.212353-1-richard.henderson@linaro.org>
 <Ys1JMetNPT47lpbV@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Ys1JMetNPT47lpbV@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/12/22 15:43, Daniel P. Berrangé wrote:
> On Tue, Jul 12, 2022 at 03:28:58PM +0530, Richard Henderson wrote:
>> This is a collection of fixes required to get CI back to green.
>> Given that 2 of 3 apply to cirrus, I had to push them to staging to
>> even try them.  Since it worked, I've now pushed them to master.
> 
> FWIW, it is possible to test Cirrus CI fixes in your own personal
> fork too, but it needs a little extra setup first, detailed in
> 
>    .gitlab-ci.d/cirrus/README.rst

How many of the 'github' strings therein should really be 'gitlab'?


r~

