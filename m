Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B143BB5A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:02:53 +0200 (CEST)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfSep-0004ip-Jn
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSdE-0003t9-Pt
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:01:12 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSdC-0002wT-Pb
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:01:12 -0400
Received: by mail-pl1-x635.google.com with SMTP id w16so342230plg.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0KhV93hMjFLVIhjGaIhVkqXbHO87aVrbRuCvihVWLbQ=;
 b=Vq1CL7/i5VzV6DJMVSD+8hx+fTetV6F0UG2DzWdCxdtgC49cbFrYlJzaHltie/Si4q
 aB8MZLEmdTNGKbhNWZCtxPluziaBLV34emJE7uWUDhFvhHSyI7sqedJT1qNuYPMGb40h
 LDYWh4mGeSU1qrQD+4kJX/biifPn6JMScit0Gx9UNjtO2sTJbHYe9q8/Cxbkey/Q0KH4
 QDUwezkX4IcUSgla4hn0Vlj7DyCBdUlrs6No8HTD3p4j2oYmh6HXXXdMdBgfrGMF0OdQ
 ax79uw0vKozova/pW98rDQbq59LyGkIO9XCqwd0YVURY4OjhyPXS7mFRsuVmXhpjc5sC
 sHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0KhV93hMjFLVIhjGaIhVkqXbHO87aVrbRuCvihVWLbQ=;
 b=keVvbMC3NWqzjlc3VSb8aEyZzmSfmA6NSG7btFxn3My+/L3d48h1fTz4uye1IYMZGM
 XcAzCD/AsnoNatC8budZBJ0BRHHGUHPdZvtqCrcNn7Ox2wEMQU7Kyx1JPnjP0hq5yD47
 EBsgA6NPtNyYZ2OsAzj2/x+VWg+Ng3+g/xCTh6kvR2HL5EoFZtKO2ECnxBVikijCL31Q
 aSTmjguig1JoEGONMRP4piXPgpD1zUn5zhxcr8I6NVAbZPe0RLiAI34LBOdgvgacrMaW
 X1FbNqQPUDs0ObySSvWyu3gjjwKHZTUyxC5AnXPW8ol+JchgOYIkVTdC9o1YYuQz+ep3
 FanQ==
X-Gm-Message-State: AOAM5339Xxwc3ETSiKDXBCZ1b3Gi3q0ieWNo3ol3EG0YBg9vG0DNT8Ye
 bSw/sUN60Kt6r2ot5VbX/Aj9Ig==
X-Google-Smtp-Source: ABdhPJwBRneFLSHXTv/VGNjccEf6isoxOt1GmCVz+EUVUFDu4Ur+27TuY2NZI8V5WJNpmfb+Gk3IDA==
X-Received: by 2002:a17:90b:341:: with SMTP id fh1mr984280pjb.6.1635278469038; 
 Tue, 26 Oct 2021 13:01:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g22sm3717654pfc.202.2021.10.26.13.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:01:08 -0700 (PDT)
Subject: Re: [PATCH v1 09/28] tests/docker: split PARTIAL into PARTIAL and
 VIRTUAL images
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cfccd72-bf5a-0386-da23-3738045eee58@linaro.org>
Date: Tue, 26 Oct 2021 13:01:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> This is mostly to ensure we don't include the toolchain and bootstrap
> builds in DOCKER_IMAGES which is useful when verifying all images
> still build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

