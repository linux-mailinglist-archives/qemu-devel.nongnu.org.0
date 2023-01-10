Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49A0663A00
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF96O-0006qr-2M; Tue, 10 Jan 2023 02:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF96L-0006qE-Ey
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:31:17 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF96J-00073t-Nz
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:31:17 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so11059296wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 23:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MqQbsjjNJf4sQ7F15l1eL/gaAUDid8Wa3wFWl6ODroc=;
 b=yFKRjzcl/sRh84ZTFk3PEcrlaTkVEQRDs5NdVn23Hq1yFZ91aRfKxHOb3Anq/1e9TE
 3xnQWu9rAgar/1XChEJjWGSR6cM3Q+FYgnS4SrdQbKwDf+3BEI5ZGUqUyE41ff9tcXrI
 rW9BisoDhDKVwr7DtZ897KZpoDGHc17Bx7E+II2+onhqwBim45dxYazlzXaGycV/DYOq
 4DW6Ft3N1na70yvIxlXV89FTLgK9rQpOx1nCk7wZa1irl9P0Jj3oWZvOrXx347QaAuyr
 II1Wf+Qa0yYkOu2O1LYmknIfXZk1p8tUHgosK/FNqwKCPG6mvaA3oRbp+7Olk/NKAWy8
 9cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MqQbsjjNJf4sQ7F15l1eL/gaAUDid8Wa3wFWl6ODroc=;
 b=BIjGN3fFA7y19j2FXlK9SOJ8K2G0NMe7et4BXD35x8sIDw2PL/PqtF0jVyD8fy9gO7
 iydDa8CFqNdthZPzsE2MCklzVIwheunvvzmgo3g4WWW9ovg/mxv20S9LzHIOBzQCFRPu
 vzqm62hHRrPvf11Kf3QCBYbpO3dwptttDeOmbfcm9QvTIUApMkX6CN70YsBqujtWCcaq
 Auob+iVoW5kFaCZQKhsTX1/1oj3KlRmnple0LOVvr584kVH/gSaI7PmH4QS5SXf8Q983
 COWgcKEW26UGuVlZe7wkOEoZEofROj7qEqKj3rFHgNrh7x/zmDdLTn20sx33C8ohQfbo
 6LzA==
X-Gm-Message-State: AFqh2kpIu5fw9jHM95wCm6f99vs5znX5m7uYKfipgPIGItfkleFcHS4F
 YLeWhSZ92fXMPgXK65hIrlHe5w==
X-Google-Smtp-Source: AMrXdXuO8Vu1ow92v4o4QwmTanUhtAaLpLAV9PJHWwJamWGNtvlH+wvn6HwThJipPI87ydz4MfLgHw==
X-Received: by 2002:a05:600c:48a8:b0:3cf:7197:e68a with SMTP id
 j40-20020a05600c48a800b003cf7197e68amr49145294wmp.18.1673335874277; 
 Mon, 09 Jan 2023 23:31:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003d34faca949sm13989186wmb.39.2023.01.09.23.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 23:31:13 -0800 (PST)
Message-ID: <38a1182c-0a8d-5478-ba3a-f145b80cd9b8@linaro.org>
Date: Tue, 10 Jan 2023 08:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/5] plugins: make qemu_plugin_user_exit's locking
 order consistent with fork_start's
Content-Language: en-US
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230109224954.161672-1-cota@braap.org>
 <20230109224954.161672-6-cota@braap.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109224954.161672-6-cota@braap.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/1/23 23:49, Emilio Cota wrote:
> To fix potential deadlocks as reported by tsan.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>   plugins/core.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


