Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE8B3D6A03
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 01:10:34 +0200 (CEST)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m89k1-0008VM-9v
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 19:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m89ig-0007od-NF
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 19:09:10 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m89if-0000gE-C4
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 19:09:10 -0400
Received: by mail-pl1-x631.google.com with SMTP id f13so3052751plj.2
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 16:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2z8V9DUKiD8XgfgKZyc/q/JwVW00qKF4Og+WnWaO4Oc=;
 b=sl+VpqsQETaILJVPEVE4bnikp6XEddY2DpkxpUGvj4kvAZPJEwqbICQxYMIM1moSuk
 2eT+Z4hCnIqmDByK97LTD2d0MR8n1xBoXwAXHuHHp6o4MV8BOYv37uxACqJuLTqbppEn
 U2bly3+f9d008Q9GdONU4j6Els1UweyxZJTm1t1wZxw3Q+Ces6HC4UxtlwKAEyN7le+A
 dKlbxK7C4W5v0rpvLkdqTxn5QQR1vf5MIMzGVf8iwUWEUaQT81PwJd2+WxqDXzRFJoru
 vtnuFf/2o95QyGaL3KLMRTjvlOdJ/x+qMRWBoYkEB8bwHhC9gDnHCKeVQ0VmNQqzaDdh
 KBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2z8V9DUKiD8XgfgKZyc/q/JwVW00qKF4Og+WnWaO4Oc=;
 b=BfWaOzP6ASGCAXXJaYPJO8ytoER265fmIYorY+T1E5e0N2A+5xevgxsWDKEpKcH3ir
 YqY1bVz6EfZIwEdbNSlJMV8zLFlbn5IWyKRaKl9NV0jh74d1f3uV1RL5Uh5Gz39j8W70
 CjnTDS7FLmLAJAMzpcnvQFIO5tSqfwVaiA6N/p0FVvhr/+xQAMXUnlg17eOBQNqOvpPs
 xjplCALFPVhCgKUox1JADFh7+rlANT9aS6G4X+2jBO8Dbosdg464Cs2rR/RtUbqG7/lK
 zdb3W9rahD22tgSqPS4dlXvSpCYyHVhsg49BjckFhaL+IcYfI+9JjXoT1DpQl99wobi/
 Tmig==
X-Gm-Message-State: AOAM530u1sVBfJIly2T8ay7CabHibiIUZfSzm8ccw36GRF3Zv8Avn+LW
 L/pi5jLC0fnYt63oWqD8UCGi+A==
X-Google-Smtp-Source: ABdhPJxtwLX1FwO2vzWLXCamJtL5L4zG0sM+9IO9Y5L5ICOlwMZHxZjZpLFheaXWiq85mh/SO1POZw==
X-Received: by 2002:a63:794:: with SMTP id 142mr20301599pgh.344.1627340947963; 
 Mon, 26 Jul 2021 16:09:07 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id v31sm906050pgl.49.2021.07.26.16.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 16:09:07 -0700 (PDT)
Subject: Re: [PATCH for-6.1 00/10] docs: Format literals correctly in rST
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210726142338.31872-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11eec79c-b186-de54-d6d8-fe7e6a02b7e0@linaro.org>
Date: Mon, 26 Jul 2021 13:09:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726142338.31872-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 4:23 AM, Peter Maydell wrote:
> Peter Maydell (10):
>    docs/devel/build-system.rst: Format literals correctly
>    docs/devel/build-system.rst: Correct typo in example code
>    docs/devel/ebpf_rss.rst: Format literals correctly
>    docs/devel/migration.rst: Format literals correctly
>    docs/devel: Format literals correctly
>    docs/system/s390x/protvirt.rst: Format literals correctly
>    docs/system/arm/cpu-features.rst: Format literals correctly
>    docs: Format literals correctly
>    docs/about/removed-features: Fix markup error
>    docs/tools/virtiofsd.rst: Delete stray backtick

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

