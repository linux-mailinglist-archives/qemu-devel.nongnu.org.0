Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47531B364
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:29:35 +0100 (CET)
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQpa-0001La-DI
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQnb-0007fY-TA
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:27:31 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQnY-0008MW-Uq
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:27:31 -0500
Received: by mail-pl1-x630.google.com with SMTP id k22so2728269pll.6
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 15:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XnFCJ4HW3cz1H0m0Z+QJ2cRMCL9RrKu6I5e7pZJ7UY8=;
 b=DJhEH/TwoRmiaHAZAU1wjXReEJPMYk55nPfHLS4CNOb8Ic1RigQFCEmDWViU/vzpoQ
 j/6Nn41cZph/4qIvM7hJvnacC3OkzPDcIXWMKlC0HV8ajzuSS5uFI7bk8U13D58GVvbA
 yXiFEpqPqfRgx0n38gsq4YQM6mw61pTtE+Theb75zaienReHDvHYUqxe0YV3vcby35vO
 asNEyVVoEIG6F4GwjS4Vg0MGnAUPgSX3ed8WiWQB2kYz7Z1mGVyuDJvrbLYqULeLXUNi
 t6JjMvdrbOd91DIbmEz8emXLPO53YfR/m6FF14uA67p/7yOMCsQlHKxuwYcWLFaCb9aj
 FpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XnFCJ4HW3cz1H0m0Z+QJ2cRMCL9RrKu6I5e7pZJ7UY8=;
 b=RS7DkSJjVVQdr/T4eY+aWlS2lGfi4jZZScefq1xJuuPaFxmIkYlq9nkoybfMPcikSL
 3nx+y4jKg4dwEvGapWfja7SWbXVB7n+7NS8H0+fBnajstY9VwvzexFNDAwLO+fuTOMCr
 cTeN1H++GC0Ovjvusd7sYO+l2k5MA+DdLsiG4ZTb0iBKqFarCG0oPu2YDTRHV1+tAP6/
 0dDTBfnD1tpp033TvXGSwFID1dlTb7j5OuYKQFKGXygZGsjRG69Dy3cyxRLKjsMtCmUM
 9VX8GKnJuFw4S3+WVeBfW96VSSlxl22NAjbSwVvploYXmu99t52u0n3dz9rc1C2kYlmH
 w+2Q==
X-Gm-Message-State: AOAM533gNoPIugcRK2m72gfu/t9oyvXJ3uMk+xB4I/zGuCHvxwuyo9bn
 Tq/TAPfXQuJ7siHMt8057fRiKg==
X-Google-Smtp-Source: ABdhPJzOAqFiiYXARlRM7wiu433kVS3i4RwYj7WPYQ6CiI+XgHmIoL2yknpUxZTbwU2WCTyaKQVSvg==
X-Received: by 2002:a17:90b:1201:: with SMTP id
 gl1mr13573447pjb.155.1613345247517; 
 Sun, 14 Feb 2021 15:27:27 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 x64sm15711927pfc.46.2021.02.14.15.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 15:27:27 -0800 (PST)
Subject: Re: [PATCH v8 23/35] Hexagon (target/hexagon) opcode data structures
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-24-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8df2606b-cbf5-2fb7-6da7-e6297a0f9d4b@linaro.org>
Date: Sun, 14 Feb 2021 15:27:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-24-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/opcodes.h |  58 +++++++++++++++++++
>  target/hexagon/opcodes.c | 142 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 200 insertions(+)
>  create mode 100644 target/hexagon/opcodes.h
>  create mode 100644 target/hexagon/opcodes.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


