Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179131B359
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:27:37 +0100 (CET)
Received: from localhost ([::1]:43384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQng-0006o1-FG
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQkx-0002rw-VM
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:24:47 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQkw-0007Si-A5
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:24:47 -0500
Received: by mail-pj1-x1033.google.com with SMTP id z9so2814770pjl.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 15:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K/+zYU/YQiH8Re26gQmpF6rM+a1SS93tO/yoIEpBoBk=;
 b=aNPpOpzwqMoMeGGZzrl/ieTyquZ16KDWpGXXpM4PI739VpxNxuq5tEQ2CL5tkUKp1F
 R7EyDLG6QAS7dR+9UadhIwrQq60xAo51qYvZWveRBfq2/mBknDNuzAjsA57N/8cW1+Vi
 lHaem/GDSPgSoQVHR3JACYRvtXUyvxZakmT6KuUNhUV6dP4IaBgaYiDHWaReGGQ5JWGQ
 DyNcNOZElFowZSlB9RiZHaKwmQ4UYIJshi8rPBx+OEH34dXSjM4OOafwg+U1sWk/8+Tu
 NDkjZ1fUS224hPFQIyvBaF804PapKF8HJN3OZ2K2UzqSetGy/9WbtIbeXXNRExuKlpjA
 TDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K/+zYU/YQiH8Re26gQmpF6rM+a1SS93tO/yoIEpBoBk=;
 b=l/UWHfyXiMDUuoEReyFsapE2hRlbdlJ9jC1FErRV3Ujg3p7GOZjrTCShGrbHADK5du
 P84uMYnl9/8yTFb7uE671hRHj/cgt+CKFshYyiU4Jhj2TsQ6cy7LTJjSQbJjTpHz7fh3
 NJhXCkwyY3qVaQb74ZjN3vGDxFmBgQ2l+4QKmwyZeoGElYYJtpqwRvqir9dMUi0IKpRm
 xXJDxQpUBSDuBM0DNjHHQWlUcr171aiJV0CGfk3dPXOW/UuLIIMvmB0M0CWJYu1tWaAm
 RxcYcyolgSofMjKUugHWMgUyVZeaGl4XARpjt0VWWxkpjis34fFDgz3bnmvXhOGDYfvh
 4VMQ==
X-Gm-Message-State: AOAM530m3HRRcG0GEmAIhuQ31axmBokYeTVHVa4eGWiDnXR2UAkYeI5F
 gJb8J2Jx6BXbBTI9+Jl1KyXa7Q==
X-Google-Smtp-Source: ABdhPJzcpfUEu8MNsWIADaOgdu5WtvQCCDrBRYFVkqSfHGLPciBaMD7YRp2riHOSUeeeBL5lkNP4og==
X-Received: by 2002:a17:90a:fd8e:: with SMTP id
 cx14mr13493052pjb.101.1613345084483; 
 Sun, 14 Feb 2021 15:24:44 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 e12sm15185985pjj.23.2021.02.14.15.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 15:24:44 -0800 (PST)
Subject: Re: [PATCH v8 21/35] Hexagon (target/hexagon) generator phase 3 - C
 preprocessor for decode tree
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-22-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0fd849dc-3d75-62af-37dd-f75aa06df306@linaro.org>
Date: Sun, 14 Feb 2021 15:24:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-22-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> Run the C preprocessor across the instruction definition and encoding
> files to expand macros and prepare the iset.py file.  The resulting
> fill contains python data structures used to build the decode tree.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/hexagon/gen_dectree_import.c | 188 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 target/hexagon/gen_dectree_import.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


