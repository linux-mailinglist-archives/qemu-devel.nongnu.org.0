Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CADB410CE8
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:32:51 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1cQ-0006vr-7U
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1YV-0003TE-Ak
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:28:48 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1YT-0007mf-Fs
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:28:47 -0400
Received: by mail-wr1-x436.google.com with SMTP id q26so24620879wrc.7
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4XP4NPyvRLh1wRknKc4vUXwDY5pF14fUvL+pL88hMB4=;
 b=HaH0PZNVy4+0pLvGi+EJwG2sMp053mCbMbdk+NWKvV5e1qSbk/nIXDt5Tf9P4mYC0o
 09NC4/T46hPzdamYFpQmNjjwV5PqakH94tfJhOvGyNMCKxMDniDICG1T4WrljEYAdZk1
 RbNL64Q4mFV3n0ttA3B+uyuXi5OuCLn1+4kyHNW906wRCmkj/voS11Csj0QpbUpnQJTP
 z41kkIyW9U5mQsaTUqD0/af2ILn8Nhug4kifDNwxh4w6kbJK4kstUZ5EG5GyRVDo8ERu
 zU8APkglYapS3jVvpAREsOh0825s05AjJZ44g9pY5/+Xd2EA5Xc8YrKXDlnIW3oIHp2z
 o5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4XP4NPyvRLh1wRknKc4vUXwDY5pF14fUvL+pL88hMB4=;
 b=nH4r7iLm7fm+lSNq7lJa/Htp3X2WsbPmx/tlwfXH5lK3wwz0HO1WdVyzLx1jEvL9Ac
 f8i4uXdxYyA5WaX1++cKF7nITVYHCVEa5v+uhxeobkiZ2sEYX9RbC+BqZhPjBBqbw4Te
 NuCI/zimmuIvi9FRHp6qBwFPdVL10iP69XYX/jb3IYV3J10BcQyZRjzBPmuCkHJN2abV
 inhGowcS/y50mr/VEBReNWemEox7Klb5/beQI8naw183bVA6CfRGis8RKL4OD6nSZlDn
 zOdf0jmvNdtLLFJeTCSOYm4EHOU5blCJsw7rmm0IFmKN1w7/3bNPQTDNg2jL+y3M7GOi
 N4Cg==
X-Gm-Message-State: AOAM531xbd9JRgCjkkbWjSoLxN0yxeL8F4rAT1VsIH3tF20VwDZyI8vZ
 5l3ssW0JTepVhzM3yUCbRms=
X-Google-Smtp-Source: ABdhPJyGnX91JzzVhdMs+Vb+L0chLIBB8UmBTq0uc2NC9Ym60gJXpIx78iBHCKe8ZW7N42PZnxY+Yw==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr23608300wri.391.1632076124073; 
 Sun, 19 Sep 2021 11:28:44 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id a77sm1699791wme.28.2021.09.19.11.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:28:43 -0700 (PDT)
Message-ID: <aa0bcff2-e43b-04cf-d4d8-6862ed1cfd8f@amsat.org>
Date: Sun, 19 Sep 2021 20:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 24/41] target/cris: Make cris_cpu_tlb_fill sysemu only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 20:45, Richard Henderson wrote:
> The fallback code in raise_sigsegv is sufficient for cris-linux-user.
> Remove the code from cpu_loop that handled the unnamed 0xaa exception.
> 
> This makes all of the code in helper.c sysemu only, so remove the
> ifdefs and move the file to cris_softmmu_ss.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/cpu.h          |  8 ++++----
>  linux-user/cris/cpu_loop.c | 10 ----------
>  target/cris/cpu.c          |  4 ++--
>  target/cris/helper.c       | 18 ------------------
>  target/cris/meson.build    |  7 +++++--
>  5 files changed, 11 insertions(+), 36 deletions(-)

Nice!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

