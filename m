Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2022B39CB72
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 00:27:20 +0200 (CEST)
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpelC-0000T1-Li
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 18:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpekF-00080e-8m
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:26:19 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpekC-0005ke-VY
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:26:19 -0400
Received: by mail-pg1-x52f.google.com with SMTP id v14so10806198pgi.6
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 15:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Egth3OGXf/16cX2HUKNGGRN6jIhhddoXpEcJRP+eRq4=;
 b=IgPoInN0mN3Q38UXo+sKz86l2WIR2y0mkcvSXBX1uK+cqsn4IvbXL9OZ88qZcKc1xD
 UJGKsuWbHtkYnfkkZrVDZpQUoxnovdcgXHC/HP1tbWWU2Rpre8iz5HTk39v9dz5qvXqf
 TOEV3vWNBXHg1l/V34WnqKGsEEcpEvKuDOAnNqTQbdwdrrwRUHytXagxau7ZItRlkCL2
 obgI/QTZm4z4Bh6DtxdhMAZwvGIbL5O5JcWnv07bTAowYPFwz0OVWDPxkfUmW1UiR7UI
 kEmWU3juvQ7WyYxnXQ+PkVhIflW10696Ra0D3PALu/T78c72gx9QwAbwn4KHDOe6sqoL
 PjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Egth3OGXf/16cX2HUKNGGRN6jIhhddoXpEcJRP+eRq4=;
 b=Xz0qwRRcJnnOSekFur4WqDR8pntdu39mwlXev3ywx/0pp261aOrHnyVroLeu429RPj
 XlWIdSSIj8xdcHA57f3e8ex9CU8ihS4z7GYrMkC7zmPg4tLXtNvzqp1bv8WC9rm8OrER
 7/uSG9wS7+fD4q3MjwVcvJ1lgY45dymsEGlyb5Q+smqMUu5HUOzgoX1CmKxIufhZ+BCS
 BzhBx4Y1Acl0ohzu51N7QHLPh5ZBTu5dZGiWa+DDdINzb6cL0jc2+7lxA6KIEnt7U1QK
 fb+WNBucABNm1vDhJ+I9yweBm83y+LFhi3L/xJqepRSfCa1qYmBvZXjiElTRDOpoD6+E
 z3wA==
X-Gm-Message-State: AOAM530VnEo6uazZVxFY9eqfunOC/v5W7lXkpBvtQIM8Hrx+XHbwxHD6
 6wptAtwhmhYyIGKwNRAV4UHPzQ==
X-Google-Smtp-Source: ABdhPJyO3TPVlDhKJKik8qKOWqtgS4IhYcNQ0eUk73cOFvaXpJdx50CHzxT+nBrdzZuQzhVXmTzARw==
X-Received: by 2002:a63:e114:: with SMTP id z20mr11356780pgh.207.1622931975112; 
 Sat, 05 Jun 2021 15:26:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a9sm4512098pfo.69.2021.06.05.15.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:26:14 -0700 (PDT)
Subject: Re: [PATCH v16 92/99] target/arm: remove v7m stub function for
 !CONFIG_TCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-93-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1777966e-7c8c-c1ad-5674-8ff2ae967535@linaro.org>
Date: Sat, 5 Jun 2021 15:26:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-93-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:53 AM, Alex Bennée wrote:
> -    if (arm_feature(env, ARM_FEATURE_M)) {
> -        return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
> +    if (tcg_enabled()) {
> +        if (arm_feature(env, ARM_FEATURE_M)) {

Merge the two if with &&?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

