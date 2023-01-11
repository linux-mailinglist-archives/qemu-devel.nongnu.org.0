Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7330766527D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 04:49:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFS5x-0005As-Ac; Tue, 10 Jan 2023 22:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFS5w-0005Ad-6I
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 22:48:08 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFS5u-0002i9-MW
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 22:48:07 -0500
Received: by mail-pl1-x62c.google.com with SMTP id jl4so15424923plb.8
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 19:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G4yTLA/5NOVEqxJd3Mfnp4LQoPRyaxnEyB1tQDqXyoQ=;
 b=Em4kxJaPV73uWPGDsfIT2BLvFHHUzcE4PIWqJQT7QLn7YEL0KP4J24WOVPKNAxBPSs
 8xnUifl0kZhWUoZQBwperrQvfhv8t0BDkuRFd0ogLgUw5oJU3LHcsvAFas1BsgHtQn11
 VYzWVrA5w5umhkC8UMiQbYu4U1HBzenRN3rbPNk/k1nT9CFIacXc16YietKCvEC0R6Yl
 zjZi73wQYjYIAIZVifVYJQ3t7N0uddUMj7lLQ8a52PUHiXTZUSaHBIwSLcgY3W4r9cf1
 uSuCYyMqvFUrORFJio6/PhbSwyr+kQMUagj4jSuuX3wU5OpOTpttGmb+jDnrT2G+SGPQ
 S26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G4yTLA/5NOVEqxJd3Mfnp4LQoPRyaxnEyB1tQDqXyoQ=;
 b=dkMatWslOc+Ez1zsfxFCh4KhBoND36EhygCDqxAGkcEsw9mahrqJpt0q5+TPcgI1y6
 JBpicFiclKpeUanOmGPRRlwvKwVvD+9xcY/WDhyJzLnW2M+F2GbgffHAQaZ3LbL1KWhA
 BVW5diGYDC7V41SqadGAgwmI4i0TUqxsLd3Le0XBzwUcXAoIGkhy3s7rye6qQSV2IjfG
 t2aJufFYnjmo0RRsLIfeApknAhbMXectMJ3swbYtbRR6sfYZC3l3mm4xiDr1m2Fh/nz5
 ykO9rdvrLc5xb9h9R4QrNdjmWfe2+ymNiS3VfJuTBorPn1N7+LnjvvaBu6qypujmeyY7
 xY1g==
X-Gm-Message-State: AFqh2koLj/Tar2Ma8OD3cZ1ASBBXytv1TDtLR1amTbVPM6tdeIJV/IhT
 uCy2oCLwcFU5sLq8mIKq8vnA7Q==
X-Google-Smtp-Source: AMrXdXs6RoeCZ4w7SzTN0RoBgcWZ/UkkJK2nBXJKnNKaXz8QzYXjtxC00Hj9xNQ2gSbHa3eqTponSQ==
X-Received: by 2002:a17:903:32ca:b0:192:7847:b047 with SMTP id
 i10-20020a17090332ca00b001927847b047mr68080977plr.54.1673408884723; 
 Tue, 10 Jan 2023 19:48:04 -0800 (PST)
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net.
 [63.157.97.90]) by smtp.gmail.com with ESMTPSA id
 21-20020a170902c11500b001869b988d93sm2096898pli.187.2023.01.10.19.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 19:48:04 -0800 (PST)
Message-ID: <378c536b-b0e4-4b97-3015-cfdec23fc62e@linaro.org>
Date: Tue, 10 Jan 2023 19:48:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into
 cpregs.c
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-8-farosas@suse.de>
 <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org>
In-Reply-To: <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/9/23 21:52, Richard Henderson wrote:
> On 1/9/23 14:42, Fabiano Rosas wrote:
>> We want to move sme_helper into the tcg directory, but the cpregs
>> accessor functions cannot go along, otherwise they would be separate
>> from the respective ARMCPRegInfo definition which needs to be compiled
>> with CONFIG_TCG=n as well.
> 
> Hmm.  I would have hoped these could stay tcg-only, somehow.
> I wonder if it warrants being an ARM_CP_SPECIAL_MASK value instead of svcr_write.

To answer my own question, ARM_CP_SPECIAL_MASK forces NO_RAW, which is not what we want 
for migration.

I'll think of something better here though.


r~


