Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9656FE112
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:04:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlLn-0004Sm-SL; Wed, 10 May 2023 11:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwlLg-0004Kt-Qk
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:03:25 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwlLb-0000Ug-VD
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:03:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d4so46858105e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683730995; x=1686322995;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ER+33kzGDmSAwrFFAlAhoTc3pRpaqOOFlfuNyxX/6IA=;
 b=eyPp0DewbHfGzBiuPD8xqqo394mF8IYZyX0dt6Wu4+yzQHcx7tvwERSEwNbVgd2Hox
 NDWAuyZnvhpFRqdetv5OMjZ7UEDnQaHVMRQhG6rzukd2FFRgbWXRXrpGiRJ4Hc2d1UlO
 v1CP0x9cnj5BjBjMAh2S7QtXnb1bjFxjBACgWAjOjmUWMGARbXp4YFkMgCukIvv2kheB
 t/w2Nu6fub5qwmbxrYQSp/PBP5uD16b5hVErFnCviZ1rQCm6o9caHGCLSAVcsQr9YyVQ
 pUaEpV3byC1lLszU+aUOqv9oh0TLINWsegzfc3wYeaDUtA1hJuTER4neIEUB3zPMNHj4
 rcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683730995; x=1686322995;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ER+33kzGDmSAwrFFAlAhoTc3pRpaqOOFlfuNyxX/6IA=;
 b=OpPAsE8E5n5NiidegtJVxF8ni0cwC4M3uxPs9uN6TLSQqIme9WooI13tGmi5cAiElx
 ++9+ACK5AvccgtiqaOkjAsYi0S81Vwar7p9zTB6UcbAOpU7SXYqsFcN/lAGVEVhOEMGl
 23s+H4Zdz1+zFSeYaWygcyKnxeoXvAmY1NiYvrl918F0pG1L2LrZd8J7DV1yqbFpZjXr
 LNocyHyhic+AnmlYleAdlmPeg5fa0JeJrdYuczbRfal2SR5wL1Rb+sPOb7BJR6sgKZFE
 tyvzAJLi8BOHxyCaG1TZSYqoTvRsVeud/Dk9Hm4UpcaPAO2pvdww7x3TrJoGe5HR0Mjy
 QgcA==
X-Gm-Message-State: AC+VfDxOANidkFgLLDgC6lhKzjowl7TddTDGhk1RO5ffIGmt2q3JG6Ap
 Y+ZBPYMYWj+zIeOkerCytjBS7Q==
X-Google-Smtp-Source: ACHHUZ4rqrESO5X/K6DcMlIZahp7bkg+5RxnOouUJGAGiSbVKpBEO/3maa08l/paJv9yhZI39NwwnA==
X-Received: by 2002:a7b:c051:0:b0:3f1:6ec5:3105 with SMTP id
 u17-20020a7bc051000000b003f16ec53105mr12765227wmc.20.1683730994298; 
 Wed, 10 May 2023 08:03:14 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z24-20020a1cf418000000b003f3e50eb606sm22805804wma.13.2023.05.10.08.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 08:03:13 -0700 (PDT)
Message-ID: <c70a9e7a-eb29-7f48-b520-e69f2a62574d@linaro.org>
Date: Wed, 10 May 2023 17:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: Avocado not killing QEMU processes on test timeouts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Jan Richter <jarichte@redhat.com>
References: <CAFEAcA8SNErngCkt=gsxVSiGXQ0BhQp6y+0fLtBxSmb7-_Ko1Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8SNErngCkt=gsxVSiGXQ0BhQp6y+0fLtBxSmb7-_Ko1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter,

On 10/5/23 15:22, Peter Maydell wrote:
> I was testing 'make check-avocado' on an s390 host, which currently
> has a bunch of tests that time out and fail INTERRUPTED because of
> various endianness bugs. I found that when the avocado run had
> finished, it hadn't cleaned up the various qemu-system-foo
> processes that the tests spawned (and so they kept on running
> using CPU in the background).
> 
> What's the mechanism that's supposed to clean this up? I think
> that the top level avocado process should never exit without
> making sure all the processes that got spawned have been
> killed (with SIGKILL if necessary).

Cleber said [1] he is working on this issue [2].

[1] 
https://lore.kernel.org/qemu-devel/e9d0f20a-4ca8-7622-0171-2cb56b75821b@redhat.com/
[2] https://github.com/avocado-framework/avocado/issues/4994

Regards,

Phil.

