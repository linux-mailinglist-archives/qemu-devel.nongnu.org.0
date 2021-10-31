Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80259440DBF
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 11:14:32 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh7rD-0002jW-Km
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 06:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7pq-0001Pw-BB
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:13:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7pn-0007os-Sl
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:13:05 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso6175411wmf.0
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pIU7IZduJaELh7/D+L/PvVQveQQLMs7XYlPXN7eLo/8=;
 b=R6Pc0eenUA47yzZRqQkeVdL3NwRrUVuULC96EINTGhn7Kcof9/94cmCTxUx5ZCdzZg
 B5QSwr5a2xoSTm8OqGB6P9pbtx9XK/JZEx1n1Dl55VyqKHct1xS/skKlDxTDbHQHOkPY
 wEbWOcOv8nCdyFlxELD9LDr6fcI4EoIwg4j26usvrqAvavJHVvds74+qj7KwPHk7Lra6
 raTUQJBy1XnV59zwlqlyIYMfarMZ0K5hIZgS5psTbxh+YLgQGUTJbAhhrfArMxHYEcDH
 fQ9+9//MwrkgNxZ+5G5UTBcN8uLd+TgZMw7AvUQZcX/xYDCwiebMGK4AKkLMBM0eu78/
 FokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pIU7IZduJaELh7/D+L/PvVQveQQLMs7XYlPXN7eLo/8=;
 b=Em5beNlabBKcuQ0X6xEbqoHihWP6WK91VshC2o5schX9EhNFiT7WUFiaCqqoBVjFSE
 iZ1Q9rhj4RYKKAMyfGMI1Se0BMzw4WCgiqQhUW1K4JweGmqTzcdnY0jOd7OUhXh4IgLh
 suux2ce4JzlDrCfm7DE25ts7vYodCTTt2Q1cojVhvjBSMZTTciluNPA7km99t0edUQcR
 0dLLHI5ZvPfK4XCan34c/yWEIryZsHodSaWtXj9iCH0PbHBlHWndSp6EZNSV95us3RjU
 TCG6AdvR3fcUk94E0ViMVtLXLrHfHKIKce77seaAaEEMDBbv77LtO/uxSbm8V6U31Ope
 Gf3A==
X-Gm-Message-State: AOAM533xuoaflT5Z9hHICwzWJsBg07v984pRpr+Yul6xmfRluh1DT5C6
 Q37Cwp+iUJfFZIWrJdoSlSY=
X-Google-Smtp-Source: ABdhPJyiclChrhrdipXikdJt7rPSMrVAsFNfdMTvXRzbBldEdUOdVC+KIOVkDI8kcdKr6x2+Z/sg0w==
X-Received: by 2002:a05:600c:2904:: with SMTP id
 i4mr21938487wmd.26.1635675182617; 
 Sun, 31 Oct 2021 03:13:02 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 9sm1832036wry.0.2021.10.31.03.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 03:13:02 -0700 (PDT)
Message-ID: <985fb1fa-e350-6555-85fd-34267407b188@amsat.org>
Date: Sun, 31 Oct 2021 11:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 26/66] target/hppa: Make hppa_cpu_tlb_fill sysemu only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211030171635.1689530-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.426,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 19:15, Richard Henderson wrote:
> The fallback code in cpu_loop_exit_sigsegv is sufficient
> for hppa linux-user.
> 
> Remove the code from cpu_loop that raised SIGSEGV.
> This makes all of the code in mem_helper.c sysemu only,
> so remove the ifdefs and move the file to hppa_softmmu_ss.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hppa/cpu.h          |  2 +-
>  linux-user/hppa/cpu_loop.c | 16 ----------------
>  target/hppa/cpu.c          |  2 +-
>  target/hppa/mem_helper.c   | 15 ---------------
>  target/hppa/meson.build    |  6 ++++--
>  5 files changed, 6 insertions(+), 35 deletions(-)

To the best of my knowledge:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

