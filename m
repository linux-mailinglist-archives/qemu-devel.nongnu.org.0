Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D91037B32D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 02:48:14 +0200 (CEST)
Received: from localhost ([::1]:39440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgd2r-0005EB-F6
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 20:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcw7-00064k-7J
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:41:15 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcw4-0002Ma-1T
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:41:14 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so15156707oto.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 17:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5g+jpRm92ogIBzxOm2tzS3hf9VZ0EaFFMXALrQIUkQI=;
 b=a1wQsFCwRWkFS3qCjpIQTpKAYcwuLZjeuoH+Ws74U64DEDKdekOuub/jweQExmyk02
 PO+Skuik5UexlK384pOe6k8fPpacSFuL3oE6IaDtXCGdM2C7hh8ITnxXvyH9v7e+LrpQ
 /kiYFNbNeWzMOkJykFi4/PJENNnIE+SZGJzRgx5uUsrbmdFaCwQpXslXK9DeVNhUaOL/
 Gv/ij0csDr2PLT5Vl00LVW6MAJpzl3Lu/4VjFoGwN77tbfw1EGo8ICUZ9q9FE4HR1Lm4
 0Z1f6F7DhtXMQPQQVsDqJZAxcOO7JalHLzwbNN8r59/cYywKtUd0gEFXiN1/6sFYnxEo
 jawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5g+jpRm92ogIBzxOm2tzS3hf9VZ0EaFFMXALrQIUkQI=;
 b=JsJjwJNM6tU4zz0JB8PqFxCjlCDnxLVDfRqiHzLRPkA4JYjd75NlSOWyfUw4i2JOii
 LM7UN0/p1ITtx/Hj2DJx338071Y/lTMlS7cnEGN1FJGsr/z6xXOQQKIbe+TPc29dAtAC
 vA9VmZ2G1hmEvehqPM6o2Btas1A4v6BUVjt0EqWSf/vbQDDQBvtPLc1kSPK4uquKN7f2
 9cSVtapacZKtURPSIBDDuoDhruj83JnCE4oANMsUu9EnzeT2qa3t5CUQBEW0++sEI8L0
 Y72Mf9+EcLIgDQhNsTpfvEDTuiEZ0FCQveCCvVJ0j6HdxQ/sgD/t0Pj7E9O2og9AesjW
 U8VA==
X-Gm-Message-State: AOAM532PV446mPPvTmUESAFfgK3MH9X19RJ2OGbfys9SgzA0z321ByDE
 JjDmjdFhNkrhUAyZEyXfhhyAiA==
X-Google-Smtp-Source: ABdhPJyTkbwNs2nhfdwnuLOlYH/WPPNZn0Ig6UoIUi1YfesV1ZVDpOMfDBzAfY0Rs4kSeNMo9J9aYA==
X-Received: by 2002:a05:6830:a:: with SMTP id
 c10mr19114618otp.114.1620780070702; 
 Tue, 11 May 2021 17:41:10 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id y6sm4274062otk.42.2021.05.11.17.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 17:41:10 -0700 (PDT)
Subject: Re: [PATCH 07/12] crypto: drop used conditional check
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-8-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52bab5fb-93de-9207-4b23-596c9c3c6216@linaro.org>
Date: Tue, 11 May 2021 19:41:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-8-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 8:26 AM, Daniel P. Berrangé wrote:
> The condition being tested has never been set since the day the code was
> first introduced.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   crypto/tlscredsx509.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

