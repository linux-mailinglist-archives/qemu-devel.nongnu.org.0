Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0F332E62
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:38:22 +0100 (CET)
Received: from localhost ([::1]:55962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhFN-00014Q-MM
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8S-0000mB-7h
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:23:04 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:40430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8J-0002x4-T9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:23:04 -0500
Received: by mail-ot1-x334.google.com with SMTP id b8so13351254oti.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ml5XTUlD7ef/AmQIcNDTC1TSOCGoXFvmHqjUMxek/00=;
 b=p+YPRpx1WOObkiLQ55Qb0BkCVbSwQR+AmwOrDaiVin1W0AUbsqGAp0HJT4BdxfIeMy
 jZQWG6YxWXGP3WrRYgdRtupFfQ77UKzyn6N00kMI7CqBg4k8rjeCSV8nb2eyh4mJrdA+
 i+eZPGbG/Cz/Fqh3HSjUp8Mq4UkufVli9zeaAitn4P+0f7+yDIWTaekCt3+ldaEjLP0t
 CFg3fK0hArk4Sp1P9sRFjAWATMDjjZt/RBdSOqwjr+ZEPTy+e8eEDQeE0NoJj/UG1VNW
 fh/FQxW+TVrCWanNeWPWvt7UXh9Cp4jJ7/W2Hq/adx1LlWetET9qhSoFLneicP6Nnimt
 /8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ml5XTUlD7ef/AmQIcNDTC1TSOCGoXFvmHqjUMxek/00=;
 b=eX2yhHAFG2M7wR77VzygpteUu4xq+Z8yoodPT7fREK0CCx7TyMXAbexEdbx8cz9rQG
 vNPFPSQuJVUjua4VQJ5CV1cVCbbdbuHH5f+JXBaATRkyiFcpp/Uy8bteSoY2apUq5zov
 JJCooIjhVeUnrT74BJCEJjRhxX51uCFUmP7zsFSKHK5ciGKUqBFoZX+sgfSZPsQtu1YC
 crsnaaTJgRVIRrb514zUarSlZwol4NvEgnUVDrXZkUFP5lHGNk74XIVNgZD4D+0wabcY
 UbvWZRuLVG2FBqzdFb+7GgB9+lssLG3T/rlX4D9UOJjYFtDORxiS7RURG5BUIO1OFJnB
 e8qw==
X-Gm-Message-State: AOAM533xbqjF3Jqu+GOtBUJPTNeqcbm/Lhv3+gYf1krNhx5q5pup6PGT
 7Gr7cE72X0pSZO0BRfPnzyGPL43Lnt8TE5Hm
X-Google-Smtp-Source: ABdhPJwnHgihQXUOwHagz8qHxewPIKjJJdaaDuWwE2T8erT8ia3+HtEDmiG1RNKAbGyUQ848GnHmmQ==
X-Received: by 2002:a9d:4a8e:: with SMTP id i14mr24917966otf.37.1615306975015; 
 Tue, 09 Mar 2021 08:22:55 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r44sm578261ooi.17.2021.03.09.08.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 08:22:54 -0800 (PST)
Subject: Re: [PATCH] hexagon: do not specify inputs to
 semantics_generated.pyinc generation
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210309151907.201528-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aaaaf43a-7fa4-cfb5-6a06-46cdab6446bd@linaro.org>
Date: Tue, 9 Mar 2021 08:22:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309151907.201528-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 7:19 AM, Paolo Bonzini wrote:
> gen_semantics is an executable, not an input.  Meson 0.57 special cases
> the first argument and @INPUT@ is not expanded there.  Fix that by
> not including it in the input, only in the command.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/hexagon/meson.build | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

