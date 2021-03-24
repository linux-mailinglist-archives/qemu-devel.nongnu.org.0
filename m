Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBFB348106
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:56:20 +0100 (CET)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8fz-0004vs-K2
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8T3-0001KQ-Mx
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:42:57 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:44605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8T2-0008BV-5Z
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:42:57 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 p2-20020a4aa8420000b02901bc7a7148c4so6058762oom.11
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p8/I1LInlSADCdhqpWFNl76OdU/U3JcQNmok5CEeSEk=;
 b=z45ru1DQpWBKASSBbuzGC6OSByJR288rBcppnNZaIuxd17ylcXvtFFpFMyZPuh3IDf
 PfdN3iNfFHWVJDjSEBZ33VVPgkqtwhNpqxk8BX+YwTMVPpehS7jVwjUfH5rm4i3V7WXz
 rMHlHkPmcDBCYA4XQR8cbAARmTUdcBjMgPc+7LfS/kOuldPbgl9ZBpf3RYol8GBCA0te
 SoN9qeCKxNTZ75Ghqnd4EwdiWuj6zV1510iZ70w2Uf2ps1KwspNoxwzTXkPPQEdczzNu
 f4ki1Xf8C84x/kqr78FEPagHHyXGFuMdFwJ5yh+KN1VjjonfrXOocd+C6S0bEf47BrLl
 Huwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p8/I1LInlSADCdhqpWFNl76OdU/U3JcQNmok5CEeSEk=;
 b=NDAtdU2smKwH3kGVnJrueizIxkUE7buBCX4kBg8IF5ZfQRJRLQYOfz78bn6cYKQ/ib
 61eS4zvABRjZTW5r6dATBRKUzpEfpYFPp8FMlYJddWw9C9Igw/Xw4xwjJnwe2RROB3U3
 pyY8pDo9BKCnfgeUqhfdHnpsfyJ2klafVWIABNVFFL/XhRDpaxDHySlui5FPssi7H8eu
 MwKjjwPB1qVRMr2waSeUXDF+MGU/DNePRKPEqN9N8i0kDSP/yacHTLtwbbn9FqwcLAn7
 3YMFR21viawAvOIfWqNIVQLuPITtp7gXjDSB9vw82uyyYQzaPAsR79a+mdkn2Cw3IqrF
 Bc7w==
X-Gm-Message-State: AOAM533nxNw+H7194Er+HciErMZjfRBhzD+249cr0Aq1lASLIdgUmnbE
 4I44tCuRkOm81fknvc9UXPmOgQ==
X-Google-Smtp-Source: ABdhPJwHhxyCRAj7l/P1SvVj9HqyUPCVGnxHvnirB4j1YbEiU1FNSv7mwhEqWfJFZebNSQ6pCPZzBQ==
X-Received: by 2002:a4a:3c48:: with SMTP id p8mr3925214oof.79.1616611374432;
 Wed, 24 Mar 2021 11:42:54 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id q67sm564178oic.55.2021.03.24.11.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:42:54 -0700 (PDT)
Subject: Re: [RFC v11 15/55] target/arm: move cpu definitions to common cpu
 module
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-8-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <052d792c-a400-8f39-b6d2-053d2a1ea8c5@linaro.org>
Date: Wed, 24 Mar 2021 12:42:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-8-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 3/23/21 9:45 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-common.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/helper.c | 29 -----------------------------
>   target/arm/meson.build  |  1 +
>   3 files changed, 42 insertions(+), 29 deletions(-)
>   create mode 100644 target/arm/cpu-common.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

