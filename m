Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25616494FC
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:53:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OdK-0005q2-KV; Sun, 11 Dec 2022 10:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OdI-0005pa-Js
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:52:52 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OdG-0001JR-SF
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:52:52 -0500
Received: by mail-ej1-x633.google.com with SMTP id bj12so22278945ejb.13
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9zC99tvrCHcJG8xFDQ1gC2AMh1ayLVpO2k5rNzx//jM=;
 b=yiZ4DHn/apOdWAJVe5/D13TTJtE2eTtBtgXMp3mMEtLrDVr1loJ5BZwAm5rfcyYsoa
 0AA0aYXgaHD++7cvyXLZ7OKjH52yjoUIX+fsSXwmGJbRBQANNCtjiBhi+jaKwl3OVS28
 1IM/jqTmEHhjzrdr9fUp+bfnicSehHF+20+CS7HHV/9BUUYI6cXM2BGMKmiMXmGyPQ5T
 LRu8fu6hv7ZCt1Q30gX3q75yqui4ZYLfHlPFumddZcZ8D33SCSnqeKhqS8VLyU7eF6lI
 b/7jEdnO/EPxqBbzpUfkVN0UZWyXXzyNgJ03/8/dwVrNkafsIRjS8aP/u5jq+yE0qOqu
 NoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9zC99tvrCHcJG8xFDQ1gC2AMh1ayLVpO2k5rNzx//jM=;
 b=pYOmMw3UZKSdXEcKeFUKVkSDZePK6bgrjloMxJZHlnZAW/yRIKx2rjYgHPR81gyQwr
 HNdEK9yde7SHRWmzTGjsQSd9U2TYYwfvKF3JlzhRrDGyZQNgpT3lelnazDvYMuETSnWk
 VCy1Ya5ex7hZZkpA/GF03DjaXlEOFjOwW+FwnI24PPn3OeX/T7vYiFuguEwmhGTVSsOQ
 SjgAwV/HrdNEb+oQxQym/5ublWiczejCvuzy2tlN1jsZfJ2KN6OsUx5pFuIK5ruiIh/E
 6/pe0Jp3XSnyBKyiT3cBhC9UEHXGjS8QSUENNdluPT5rP6kwulS5c9cmWIkC2c8nxfIF
 yNRw==
X-Gm-Message-State: ANoB5pmsnqhP5cJFL6hw9ORA2Pclztt8s/b/iyXU9VRPIfu2OcriUPQN
 1e8tYcLd7Uo3Ig19eUR/M4ZPEA==
X-Google-Smtp-Source: AA0mqf6Y7cOBgyNzaoH/IS12lDXqdLqvu7+gvuU4cc6ENbcDvQ57I1DaKewpwWEh5E31vItih3c3rQ==
X-Received: by 2002:a17:907:cbc8:b0:7c1:6e08:4c20 with SMTP id
 vk8-20020a170907cbc800b007c16e084c20mr1604567ejc.7.1670773969363; 
 Sun, 11 Dec 2022 07:52:49 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170906940500b0078c213ad441sm2185116ejx.101.2022.12.11.07.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 07:52:49 -0800 (PST)
Message-ID: <e900cf05-fc20-fc7a-0059-2d8aca816081@linaro.org>
Date: Sun, 11 Dec 2022 16:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 13/27] target/s390x: Use ilen instead in branches
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
 <20221211152802.923900-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221211152802.923900-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/12/22 16:27, Richard Henderson wrote:
> Remove the remaining uses of pc_tmp, and remove the variable.
> 
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


