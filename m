Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EAB5188EA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:43:52 +0200 (CEST)
Received: from localhost ([::1]:46954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlugp-0001B8-8A
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlubY-0003Ep-KY
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:38:24 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlubV-0005Ym-CH
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:38:22 -0400
Received: by mail-pl1-x635.google.com with SMTP id c11so5031156plg.13
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=UC2bCnRCSoeqS5xlzIPjzyDmQAKOLGlFToB/DLty7do=;
 b=rNoVKinpI28xRjkWYGQNNaZGruwOMh9IWvV0xxgDDDgLr2obqASPhGzDN60BLGXlLI
 HAKoOfRcbe7aPVAdPftZT8RACKHsBmhKBvsB/d09SIaxunlaOdYR7+JTIDzN0gccX7fi
 lDJo6jKptsSkcA1Q9Ffy2NnC1xE2caGT3ojqOmdlpkJ+3Sbs7iqu+0War2c32FKJWFqm
 J49gUL5Rs3iavPuqj7KBNmFYhpZ0GCgFdbH5TxLSU32n115mJzVZPeZqN8hjTwYaam5H
 NIF0Sb+zjuY3A8qZyM67tYc/CRwo1JTPO5cwfiCzKCwow8JWAm0AfGomxMpDsltqjJIn
 8cXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UC2bCnRCSoeqS5xlzIPjzyDmQAKOLGlFToB/DLty7do=;
 b=VhZHjDqKZwt8aVCVnhRucF9bDYPJt4LM0aFBVbgwgYWnskSoKxuQDHWXCIPf6ZvsZF
 XuuWmcLn9q2YXrcsk1th4BNpkivOjywzasCdIVnyf6SBuwRU9E2E7TtXvwq2nXPzkHhH
 z5M1trFY7oQj9WYE0fU8pZ/yzXBGwdQqKTIAoMzA69pdoi6bCTzMl2msotaJ9+4tq4O6
 a68JzHYPZBsSppW1owDzlmhyFMvRZZVeQbvsPw9JY541FRjMzUBW8PKAXulsb2kC1gNL
 trxhYBBBQL38HC9shju4SHvEWPOlgULoxtudvL6WWuor35hkca2zC5z/SV6sdMSRaWMv
 NiVg==
X-Gm-Message-State: AOAM533v4imAkhAva8ndu2cCpT5GiEvKMbyLxOy1oCC5wVxibef6r4LD
 iU2Ur6jvPRSAW8MtJW1ZVcbLIg==
X-Google-Smtp-Source: ABdhPJzAWETOQcR4I0L6Hzhc1UiWlayVz4lQmgq/Bzx21tJ7gY/sQLz9wYDlLWs1TcZvGnPCuiltAQ==
X-Received: by 2002:a17:902:ccd0:b0:156:7ac2:5600 with SMTP id
 z16-20020a170902ccd000b001567ac25600mr17336468ple.156.1651592299845; 
 Tue, 03 May 2022 08:38:19 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a62b611000000b0050dc7628170sm6424803pff.74.2022.05.03.08.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:38:19 -0700 (PDT)
Message-ID: <d3aa2974-9c47-e762-63ae-8eaec98b7894@linaro.org>
Date: Tue, 3 May 2022 08:38:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/50] hppa: general improvements and tidy-ups
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
 <47d4a9aa-c7e7-840b-4134-6a17307afe40@gmx.de>
 <805ac102-74a4-40fa-3064-083beade751a@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <805ac102-74a4-40fa-3064-083beade751a@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 5/3/22 05:11, Mark Cave-Ayland wrote:
> Thanks Helge! After a few brief experiments over the holiday weekend I'm going to send a 
> v2 with your A-B tags, and also change the machine from "HPPA generic" to "HPPA BL160L". 
> This will then match with both MAINTAINERS and also Linux which identifies the machine as 
> "model 9000/778/B160L".
> 
> Richard, any other thoughts before sending out a v2? And who should be the best person to 
> merge it?

I have no specific comments; most of the patch set is outside my area of expertise. As far 
as I'm concerned, it would be helpful if you sent the PR.


r~

