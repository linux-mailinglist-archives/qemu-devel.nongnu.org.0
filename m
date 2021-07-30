Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC063DBE86
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:49:17 +0200 (CEST)
Received: from localhost ([::1]:47844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XZM-0004zv-TH
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XWb-00026v-T4
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:46:25 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XWY-00060q-WC
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:46:25 -0400
Received: by mail-pl1-x62c.google.com with SMTP id u2so3871863plg.10
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8/SPmgoBf6p6X3J7WUxGCSA7AShBq7zTfrrYKtsk13k=;
 b=dyD0WT3tW88sOINxKzN9VXSaROnhAO7P+eCRuJTuEPI4Q0R4KDJSZwzrSSBgAQ6pHQ
 fiIBjLZtLfPQirTblWHnkS/0SOuC5w4Ih81PWGwDleTRfTAynrXAKYpqkNaXAaQCxZCz
 e8FLSxgm8RolKNmD0bGIA7fCVWeJRmpyaToxKlDxDYOC+cBTXL6RKo4CwEP9zLKzAqFQ
 ToLOARFbzL2rp3Xzuitse0fgDkueNXFKqQAsDjpq5OBXLLy6oAdErxnN9JmnxhO6HUel
 QDFNyzY7DU9ACsSWIba9zVd40kl4usRP27Uzd9/UQVWj0DdMHcoo8IvFF3WHWUh4JSb1
 b6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8/SPmgoBf6p6X3J7WUxGCSA7AShBq7zTfrrYKtsk13k=;
 b=BvIQ8CPNspKyGeAG5VghMgoSVFVeEkKVzN2a5p0addlBFof92K+blfK/lUQu3UMETJ
 dc1zoAcq9aUBc8dJ3gzlxkc5KukRF/UCmAzdag87vPPDsKvbFUtv1Tmnn26RHURJYocw
 0XRDHdTLoIYol3usmFnr5I8nL/09fyTTtT89qyiHivLwcpjs/TUc8GjPCU93re7mjH6p
 TlJ5pTHyhatdDjNOmMikv5rFRG89biIV5JiqRq/OtqhvmkmdbvUBfr5KLnkN/Q6YhhAc
 7cTDL+5e0En07juLpjishiaCWZLQsGebpXCai8VkJdR55BpZKOKFPGELMNwbLvHdAbSP
 Oh9w==
X-Gm-Message-State: AOAM533/a7d8mVA3fKkcFn5zQraRpCLRJ34TusOCz08XeGOK+ErMGgzy
 6gcTHhayqOTwz2k5TujmpCtU6Q==
X-Google-Smtp-Source: ABdhPJztuuG541rXfCsXFN2KQeVJjS8TzgMxTTYvf4JX870EtAoJDbqS4KGuN/mJZ2V/wNLp7Pq1lw==
X-Received: by 2002:a17:90a:72cf:: with SMTP id
 l15mr3100741pjk.22.1627670781087; 
 Fri, 30 Jul 2021 11:46:21 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id t37sm3346782pfg.14.2021.07.30.11.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:46:20 -0700 (PDT)
Subject: Re: [PATCH for-6.2 8/8] stubs: Remove unused arch_type.c stub
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2190910a-bf65-ed74-4568-3d56a3c2d496@linaro.org>
Date: Fri, 30 Jul 2021 08:46:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 AM, Peter Maydell wrote:
> We added a stub for the arch_type global in commit 5964ed56d9a1 so
> that we could compile blockdev.c into the tools.  However, in commit
> 9db1d3a2be9bf we removed the only use of arch_type from blockdev.c.
> The stub is therefore no longer needed, and we can delete it again,
> together with the QEMU_ARCH_NONE value that only the stub was using.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

