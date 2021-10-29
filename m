Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012CB43F6DC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:56:53 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKsm-0006ou-4U
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKkc-0004i7-IL
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:48:26 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKka-0002jJ-Nr
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:48:26 -0400
Received: by mail-wr1-x430.google.com with SMTP id o14so14306193wra.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 22:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XpUsBxsQglLOD+Hu9GVDUpo3tBNqhWJKwTW98SGBAsQ=;
 b=UA+KWJs8PWiwl4+JTQeZiA4u+n0b87XsGYCHs+mHtpL/Vdmz7QhwIrUec3h0bMDrvS
 lTC9AVXILnPSlFY4wKHR2T2QYcWkutEe2TyAL+zU2aONAUlmknZ5d+jgjjlA4rXR1nZm
 I3BpKCQv51U6a6i/OPalkXezEH/+iw8YO9pRKFQ2OHDGbWQL1s/yGYd4UWR89oCeLd2q
 tFDdtwscBg/5IJq9PLJy4wBa4nZpUxOK3rPROEqmVxTyhyhBRY2jmtcKF5XQpakxwfHX
 +jIGqd2lRYmZ2jVfc49D5CzwNmnH+w/8ZUiuuu6WFYkLem5wLwnQelnM+9EqEhNyQygY
 /sQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XpUsBxsQglLOD+Hu9GVDUpo3tBNqhWJKwTW98SGBAsQ=;
 b=MrPLYIzC0uZR0EZW38W2s8MuEvqSibePPmVqgubo8ki8AGoR5rK9qEmLwsq/1zjvyV
 9U5OUtj4XoZLSdWIFotlhgm2fyGUcSeb5Aoo0k4DRFCAuhw9eA5ZsVNb9UMdIssmJz4b
 L/jX9fK8CCEffgu6/QMvE54G7DERakqQegZXb0j58OcU4qSNM/JJ5ovKdETHQts+teps
 tjLzoTnJ5Dv99H8bABY+EFBhxFfy89Y8mOnMcjGXhvDUtNVCpFGyffgwmfmu305rCCRs
 mlu8W+f+j43xqb1OxvEVjNIxPIMPcdByWz992XWSgPzLm2+7tq1blb/1wLP02y0DTroB
 fE8w==
X-Gm-Message-State: AOAM5310xfBngrZoOltKFEqzjTdSsPSJag4anjLzXSCstUbCNd+ceaER
 lhs6E9/ySxQmKZFVbhLemcA=
X-Google-Smtp-Source: ABdhPJyvwI299hKbF8uiF2zo+wcblZdJ25tODsZQopzihD2XnjHklEgCM3eMAtYTspnTmFAqrvg1+A==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr6150268wrn.335.1635486503193; 
 Thu, 28 Oct 2021 22:48:23 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f8sm4782240wrj.41.2021.10.28.22.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:48:22 -0700 (PDT)
Message-ID: <fdd05a38-8c8d-0236-5351-4256e020d86c@amsat.org>
Date: Fri, 29 Oct 2021 07:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 22/23] hw/timer/sh_timer: Do not wrap lines that are
 not too long
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <6e6737d7a4a349399a8c94ec725d74a834d72a21.1635449225.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <6e6737d7a4a349399a8c94ec725d74a834d72a21.1635449225.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 21:27, BALATON Zoltan wrote:
> It's more readable to keep things on one line if it fits the length limit.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/timer/sh_timer.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

