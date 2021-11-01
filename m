Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737004420B0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:19:27 +0100 (CET)
Received: from localhost ([::1]:48028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcq6-0007Jb-1V
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbbv-0005YL-4j
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:00:43 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:43849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbbq-00018z-69
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:00:41 -0400
Received: by mail-qt1-x82e.google.com with SMTP id v29so15294323qtc.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1fyyxoqDUI3rZmhiTObFw0m434oRIlXxGc8uowmY0qU=;
 b=NaFw9MwQuYhRXtu6iPd3s37rWpcWWmnvpuJQtwQ+KKlbg2GfcWBSHGCgWe/pX1/wZM
 Qf1jvOkdBoe219TuaDvSsCixLwwt2kQ8jR+PwSXUhJtiJANoQzWvIiJlDZdBu0e1Rv9l
 rTEPMY1ljI5d9/1FLZt6X78U9D4usV2YiigfpVpY7oO3mia8Nj47NtIp0BKoWb0NkayT
 K90cfKnrrBw5dQD+0/4Ky5vr6mCkdv1yYPDXNvP38xIU0ofQwXQ9RGWWQ2VpBX7Fgw1T
 hSiBDI5NmORAc569jZaLASukm7tglNR2ckxuYQ1sYK6feux4xfxX9BdFVDdY3x5K7BV+
 p27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1fyyxoqDUI3rZmhiTObFw0m434oRIlXxGc8uowmY0qU=;
 b=K2KYyebL1oPDRFjsPQlAXlpz/A7b0+C5IZQv05wfHVABHbI7Xlef6+2CyTCamBaK29
 Hum5eZm3cwotIGYL7U4pj9CMClHdUL1BDDjXUqqZFKjoCi1ur94renIGun7f92qmeQ7t
 Qohp9YCu/ixh2rM4oa7skB6SZvDd9PrLhkE90wVglMrnPLjjW0KC2RfY7WPLgPB6ggAM
 vK476EF4xoC4wXonLJIVEMNaNnGvnPfMPEnbansyVV+mV1dfW/W0Do2GGLfMwcNqxOjL
 GgFyX+dXhaMsK6MGd9k46CSTDKSFti3Pz8xAoSa+pWCehNdfPkLD0nw8yHYeoCTSa8WF
 93VA==
X-Gm-Message-State: AOAM533Ym+q7xZ25EBkgQgdeRkTMQWYS6pChBNpO0PNa9UYI5kT9sQM2
 wGS+IRkXinG12NIGxfRau9UCYg==
X-Google-Smtp-Source: ABdhPJz7TqN0K8Ru1P4Mq9thgU05YfLHuv/MBEocY60Jgg007YfG/kENP+o8rDFzcHq1xgROlcCSwg==
X-Received: by 2002:a05:622a:1708:: with SMTP id
 h8mr8404816qtk.198.1635789637113; 
 Mon, 01 Nov 2021 11:00:37 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id c24sm11298194qkp.43.2021.11.01.11.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 11:00:36 -0700 (PDT)
Subject: Re: gitlab-ci: clang-user job failed with run-tcg-tests-sh4-linux-user
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <e27941cc-2622-cb01-4c93-b9ff344bdddb@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <875ced1d-35ec-f777-f642-db9679082af5@linaro.org>
Date: Mon, 1 Nov 2021 14:00:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e27941cc-2622-cb01-4c93-b9ff344bdddb@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 6:27 AM, Philippe Mathieu-Daudé wrote:
> Build failed running the 'clang-user' job:
> 
>    TEST    linux-test on sh4
> ../linux-user/syscall.c:10373:34: runtime error: member access within
> misaligned address 0x00000048af34 for type 'struct linux_dirent64',
> which requires 8 byte alignment
> 0x00000048af34: note: pointer points here
>    00 00 00 00 00 40 0c 00  00 00 00 00 7b e2 f5 de  fc d8 a1 3a 20 00 0a
> 66  69 6c 65 33 00 00 00 00
>                ^
> make[2]: *** [../Makefile.target:158: run-linux-test] Error 1
> make[1]: *** [/builds/philmd/qemu/tests/tcg/Makefile.qemu:102:
> run-guest-tests] Error 2
> make: *** [/builds/philmd/qemu/tests/Makefile.include:63:
> run-tcg-tests-sh4-linux-user] Error 2
> 
> https://gitlab.com/philmd/qemu/-/jobs/1733066358

Interesting.  It's being skipped on master.  Also, this must have some sort of sanitizer 
enabled to get that warning?


r~

