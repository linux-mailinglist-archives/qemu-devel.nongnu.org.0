Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87CF3BE0A7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:47:23 +0200 (CEST)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0weo-0004gE-RE
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wdo-0002xY-Ay
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:46:20 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wdi-0006wo-4e
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:46:19 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so384903pju.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ni3jkoCWynQRMxZ88zqDCiJgdi2y2t0GHVIzhjWQLMU=;
 b=cYgYrPZJOeI2v4e7948COXT9HdJojnqt0atdxOLMAI6XPwgLvfk1+fbkcYRvENcXt5
 tLEa624XkEST8AWn2gHERoyx7v3aUUmR4h06B5sjDyvIHlmkNcDXAZ/g7xVz4KaKjcYL
 DQE3k/bTj7LIV+SxVBV/rtmJlri5Q+k2GAEBd/E2XV2h7JBFfmk5ysFKSiYMvlM+dRFz
 xcjSDrboi2hHH30N2vqiThpBgN5LTwDE7v+aQAyJqmpQZjQOE8CShqT0+y+QXQG7NmZC
 tPF02QYrQvXowwoRQjtuMpskjzuNwwvISFCIm9mVcDDEs9GIirf8A/aB1utCU2qqvII8
 zf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ni3jkoCWynQRMxZ88zqDCiJgdi2y2t0GHVIzhjWQLMU=;
 b=FDCXS0mfh3Cr9uB4z9/vJdiW/7QSJTmVjfLtLwC9vdJVicJvsiEvxg+Ro3nu0eyPAo
 HGUScqFBbPPZcX2L8qwPk6Y5YKybLqEUTl4BRymAImLwnPchbHoHjC5psMrKXO0i4I/d
 DDYpnfCYBrqIOusQSwW/Ga73LxG7wk2o/AwCa1cCPVY3Is7/HrsWCmJLeq2EetRgJlle
 yCFRaAIOMTXhahHpwv8m4RBbNcFScSh4jmHzKAtspdpTyRFz1QemE6RxFuEEBBR15Ig2
 u3MRpcB4jBo/IO0xDK3J3uJL+eoBiURpX/gcPbJHVtIT3PRdUZzfoA2Fm2s84nbYuzjv
 3C3A==
X-Gm-Message-State: AOAM532nw9Hjju8aSSGAafZPUM1cKZBMfWnipvmPDEiRXITiUZobrn59
 UP7psbG98OcD5rjZmaVw9haPqg==
X-Google-Smtp-Source: ABdhPJzGjYBhIIL33nNiLoFdosoaMFfylUTJW5h6+Jlt7/ySccvyiGpwMrH7OsjVzpCed31QsLxxJQ==
X-Received: by 2002:a17:90a:590d:: with SMTP id
 k13mr23496261pji.56.1625622372180; 
 Tue, 06 Jul 2021 18:46:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id f193sm9570068pfa.185.2021.07.06.18.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:46:11 -0700 (PDT)
Subject: Re: [PATCH 06/12] linux-user/alpha: Remove hardcoded tabs (code style)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f56a158-a752-b3c7-138e-c49d14883401@linaro.org>
Date: Tue, 6 Jul 2021 18:46:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 11:37 AM, Philippe Mathieu-Daudé wrote:
> We are going to move this code, fix its style first.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> Patch trivial to review using 'git-diff --ignore-all-space'
> ---
>   linux-user/alpha/target_syscall.h | 196 +++++++++++++++---------------
>   1 file changed, 97 insertions(+), 99 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

