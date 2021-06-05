Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C9439C9D4
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 18:26:16 +0200 (CEST)
Received: from localhost ([::1]:56962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpZ7m-0006ZW-SR
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 12:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpZ6G-0005Eg-IW
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:24:40 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpZ6C-0006BV-OH
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:24:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so7646947pjq.3
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SNG8ngesPIxj4WmDTXPwZou71DnjwbHocoNlS18paFI=;
 b=wYkL0VqEGJWRZwwzz2ES48mfwW61PNW4rVqH+11ajfd6iWszUa08c56bHuyqCanEgt
 JfjzAaHFbfb+qXV4pKYBLar8jNxlRHRtigdg7owTgSbQvWnRk6bOKO7fmuN/ZzxwK1aS
 gmBpSUddhll+hNErtKVOjeKCkX8pK9CZyj6XV0wpcaPmhUJ7jkynmRiEzM8HMkljuh72
 iEx2NeAgooxbMu7QlOmnZfpKbEaGfKkrjegX3krZDtF8m9UTEMpAXR064AP+uAvEgtCu
 O6XCNzC+tRtdilM/lGO9oz+nPY6sSxXf96rU+2S2EB3/WBix8tYWSAIWGXvAKsMCKk8Z
 XxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SNG8ngesPIxj4WmDTXPwZou71DnjwbHocoNlS18paFI=;
 b=BXLJJQActlMmGayWVnVsxRWqsm0c2Aota2nONHp5svQt4DO/In4eqxBGAYywVru+mF
 PJFJw7bzjUZAXjoAyTv41fkqUYbBUt88JvS99sVFS+JtrFITBfz+oab7ylqUWvoXZnzz
 NQv2nM2MCt8ccGTunHR9lxSgPQg4gbOBMLETEae+IIUlfNucF/O+MbrRxPxwrZhgBWzA
 yrswRAnH0P3Zq/N6ID+io8wU4CKqSsuY9AGISsSW4FqUMqJ4OgbcjkswsN9vdZfrO7JX
 USNh0dMszfWoB1hQdlX4yj05lOnMCE8xgyFtQtQ3yteO459gAG6QjbwalNZdKFWppaqR
 xgoA==
X-Gm-Message-State: AOAM530XXnPM7i7wFTsP0GNvzh+g8Iy2koThsbFh4ItTT01OUhOUCIH6
 2tpjrvH05g6+j9GsqTYAAlu7xA==
X-Google-Smtp-Source: ABdhPJw00utj2uEHjlxni8z/2qhht9cYgH6mrRm3ThWwsBo3HSuQMO2y5Rz6iJox+fFOpnnC/Ov5wA==
X-Received: by 2002:a17:90a:f317:: with SMTP id
 ca23mr11366904pjb.174.1622910275035; 
 Sat, 05 Jun 2021 09:24:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f7sm4283527pfk.191.2021.06.05.09.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 09:24:34 -0700 (PDT)
Subject: Re: [PATCH v16 63/99] tests/qtest: skip bios-tables-test
 test_acpi_oem_fields_virt for KVM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-64-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <24538cd3-0e17-7c32-4b71-8ca994f5cdc9@linaro.org>
Date: Sat, 5 Jun 2021 09:24:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-64-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> test is TCG-only.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/qtest/bios-tables-test.c | 7 +++++++
>   1 file changed, 7 insertions(+)

The new qtest_has_accel should be used instead of an ifdef.


r~

