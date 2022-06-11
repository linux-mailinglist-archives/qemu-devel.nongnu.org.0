Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D957A547256
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 08:23:48 +0200 (CEST)
Received: from localhost ([::1]:45582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzuXD-0006I8-ED
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 02:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzuRP-000524-LG
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 02:17:48 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzuRO-0004yF-2V
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 02:17:47 -0400
Received: by mail-pf1-x42d.google.com with SMTP id z17so1239818pff.7
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DzWnZRjXuPhQUiPX+5LEbbVRMeXSHA9JchUEvkL08Yg=;
 b=bcY+Rgj9K6iAdY/Me8tDv4/pDYUHvWrFF2hbwCkn/44c+eoW+fokMv/GEy34kCPnnA
 1cmNLdH2XrfWW9Omj0LULWl+KTx0Cnq/byRZN0r86aXbsw70UEZYrqAgC5SEKZ4HOX4A
 pNQY+Q02GrkJimrNGFU7AMREIGM6Llvu+Er/336oeS3QobFw5qO8/M9MYxsVyzZrtbK6
 Y8VSm7L3y5veUBjAC3XMLQsuhr+CrRPFu6WlB0N88jheNNDee1gV2346cPoMxFkO0mLw
 LihXUKU5EAkTWQL4W8b6ShRoVAHWVEsVl2v72YBtszwO2Eb3G3CD6yMId7bTYgP/TdZt
 v7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DzWnZRjXuPhQUiPX+5LEbbVRMeXSHA9JchUEvkL08Yg=;
 b=4gdhQdUOwE4KKVL6FZCMUfgQ+ptpzrm2F6Dxn6GVRr+M7W2lNI5oRibUQ3w0DoCHGD
 MW67EBGgLFoEO/IEoVT0vZ052sI0Cl19Z87iVUXwapKg6Twkx9nNqzUyuPVwShjx6F88
 SNuI+iwdXTfm5MEYAF3Ds1taPoxec16duhsPEUpp8d8kbTfPEjrYFLNcbLEYRS+3SlCH
 tzqdMToQsEyu7fv2FZzuy2IjO8MKmLg8UeIv535QAktYswpTQjMx41Yh8iaqR2alKuHk
 QjrP6y+qTOtkEoSDDSYCo9Qgs6aieWsueqC5TTTQaMYzbOx/aAlbyHIUVdhafuSCyhlG
 I2Jg==
X-Gm-Message-State: AOAM531KFQe+ttxiE1pcPcHjCTW9U69pb9Mluo+uQYkZel6RyZUEOwXI
 QreejrGZeuScMCxHnec4usFdIg==
X-Google-Smtp-Source: ABdhPJwD8gPfgBdprlpr4mHQ/L5nRt4oe40Kyjbu7lEL51lneVafDujfdO9YPcWJtATO3uX/ZVr0Ug==
X-Received: by 2002:a63:5711:0:b0:3fd:b97e:3c0c with SMTP id
 l17-20020a635711000000b003fdb97e3c0cmr26121338pgb.570.1654928264088; 
 Fri, 10 Jun 2022 23:17:44 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a170902e40c00b0015e8d4eb2e0sm718680ple.298.2022.06.10.23.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 23:17:43 -0700 (PDT)
Message-ID: <6732628e-11a3-2ec6-7c2e-0b03ff1076cd@linaro.org>
Date: Fri, 10 Jun 2022 23:17:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 54/54] crypto: Introduce RSA algorithm
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>, Gonglei <arei.gonglei@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-55-mst@redhat.com>
 <93d111a8-222e-b46f-2f36-1d1784cf0373@amsat.org>
 <fff6fbb7-b1be-610d-c48d-0498df879ae2@linaro.org>
 <20220610203530-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220610203530-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 6/10/22 17:35, Michael S. Tsirkin wrote:
> On Fri, Jun 10, 2022 at 11:05:13AM -0700, Richard Henderson wrote:
>>> Build failure:
>>>
>>> ../backends/cryptodev-builtin.c:187:27: error: result of comparison of
>>> unsigned enum expression < 0 is always false
>>> [-Werror,-Wtautological-unsigned-enum-zero-compare]
>>>           if (opt->hash_alg < 0) {
>>>               ~~~~~~~~~~~~~ ^ ~
>>
>> Yep, e.g.
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/2574418442
>>
> 
> 
> Dropped now and re-pushed a tag. Can you try pulling that pls?

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



