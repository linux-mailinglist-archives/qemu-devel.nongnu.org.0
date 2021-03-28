Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28D34BD75
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:14:15 +0200 (CEST)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYzO-0000ca-5h
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYyF-000072-5C
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:13:03 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:36526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYyD-0003Kb-N6
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:13:02 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso10074962otq.3
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C7WA7UdHpofM/T1qJvB09Ymg8LAx8iTZdeHbutfno7A=;
 b=jh0lmhm0mSjqZby8uK72JSFOns4T++S2K1u9IddAn1BCdJyxNJVbSpswdAqkKjjSp4
 KEGaa2HkiaR+dhkHIIsWdN/YKn+XSkSwqLpniH6zD4OS8clNAv3MLRXY2PklGb8LmnDJ
 6SCofmyGzINq8mzb2YW9Avf94Ew/D73wfCc9gk8KY8bUAG4VzlceCyXv/wZLJ4nk1Epr
 nHKhsup6rBiNpNbNKcEjmSJLuB920cmNH9B+zJPINoyt5zmWoMBgNhvtQPbaImJk8esR
 mE7uqYR5kZrGgVhu67Jpg00wo2kU4nofNR/igi6Jd0HWohGXb24X2NBmoBfNSKwQjp46
 HGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C7WA7UdHpofM/T1qJvB09Ymg8LAx8iTZdeHbutfno7A=;
 b=Z86lZoPm+/T8jqzS00cdcaZE84OjGuuMyq3yG1lXmCO0/WdISxthZpo3CaIk5EepBg
 UZjv3ZWjPowB/wg55/+9BBWvkws63pWPfQagWVHJ0fG+AiBgkbBYvTo08OuvVOp/wPoM
 RgI2KW0FHlG0GTgsbCBjTgbufSrUx14RErRA4/t2ykI81S0nfEZnIpJeQki/ohZW6r/8
 bULIWTi4HsVlaj0MEfjDKVQUR2EMiJO/xhgPk8pfkeWj8NPpj3owwT6OGtxmLFt1jzeR
 cUmBYvYjheYEhsNSaqwLwhnhCIht1i55BAd1uzeTFCWn8rmsJmLuzNg5zRR0UHRlX2i/
 az0Q==
X-Gm-Message-State: AOAM5319EEZuR6fTOb7d2XCxYqKCVPvNzpyrL3KKMQHkl5Rz7Lb+tRVh
 ThaKFed5qxpXNnaoEiAkVpFlOw==
X-Google-Smtp-Source: ABdhPJxv93QITT2a+hvWizjpwy+PsKTE8vMofHwuNPJucLnBbKfuMIs392bi2sR4CHqajldXT5pFNw==
X-Received: by 2002:a9d:5c0f:: with SMTP id o15mr19433356otk.279.1616951580561; 
 Sun, 28 Mar 2021 10:13:00 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id o6sm3922426otj.81.2021.03.28.10.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:13:00 -0700 (PDT)
Subject: Re: [RFC v12 39/65] target/arm: remove kvm-stub.c
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-40-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38cf740e-c2a9-1e26-2646-51c971c4c6c0@linaro.org>
Date: Sun, 28 Mar 2021 11:12:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-40-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> the functions used in machine.c are now protected via
> if (kvm_enabled()), so the stub is not needed.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/kvm-stub.c | 24 ------------------------
>   1 file changed, 24 deletions(-)
>   delete mode 100644 target/arm/kvm-stub.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

