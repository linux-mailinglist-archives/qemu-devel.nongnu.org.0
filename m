Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE3142AFAC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 00:34:32 +0200 (CEST)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maQLv-0006Ah-Ut
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 18:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQKT-0004F9-AV
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:33:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQKR-0006zd-W5
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:33:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e3so1726555wrc.11
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 15:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lao7/uWT2Ak7tRalWhrYyKE3IqsZCOiPcAkHz72pObo=;
 b=Y4MUJcDu+tvVjo+c/6TrYjjJYafZ3DT+SyneOEpqYaIVC5VSUvejKQgbXJHeQDd3r/
 YY2Lft3Tlpi05iYrNzaQnXbcWc4xTmJXK8Q1IRvMeawIxxQXcnhibSrzVCMZOuNXjIGi
 rnWadIeRTi0DY5b3DMQrEO6J/qyiizKyUzE3QntOTp6CseIjvaYZUNM01rFtVNzWQvyx
 EIElyT45XHskov7jA+l2vAoPdqsVg5QCqfHlbstiJ1NN1uOtv2HPRE8rahy4+M1iTRzY
 aCLg3Y0vxwEkiCbAWXHMK5LS/MPsbOJvV3949X8zl67apoxdme1Zy6KAxmgSaNaZs0hg
 9NQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lao7/uWT2Ak7tRalWhrYyKE3IqsZCOiPcAkHz72pObo=;
 b=8PJ54KiZi5J2aZtMXX+Cqe4E+q9SG/p9k86rGgKYpzvcqFL3nHJ76APh5FL5LUxRwg
 mUTgqJbbQ74v/9ZGwQ55TjrzkH1Av29lJ3arTv95lkNyN0Vz9E9L9IKztioSSbgeU09m
 jvHo4rXzR4v4q3S/BkPOsnquw3BMs1NmmnaXIcs7sHOsEOY+JNMKKsgD9jsQISB069ep
 U10dot74vKm8nz8QIfpo9b6lZ+zN0wckIeRjhd+ddiWTinY+VShGrQIxSxKRHNg3asK9
 UWqvAC/hFQ50gDBzycD/J/zB+g810TwPeSPM4b2M7nImsOUxeVeWECL19jkezD/R4vEd
 5FRA==
X-Gm-Message-State: AOAM530D+I1+5IMkWKn/uNUXnpyce54CtZGgqnpP0kCMNLSp+IE1cRIS
 Hvf1jXSJ5bl2V/FUfzvCgZc=
X-Google-Smtp-Source: ABdhPJx9VvMXWhx8G2okZgwAcJoj0w3Y+WiLR2u9GncbNgFe5Zj+/EIvP4bX890ui2maVcoQ9JO8SA==
X-Received: by 2002:a05:600c:2212:: with SMTP id
 z18mr8695063wml.39.1634077978624; 
 Tue, 12 Oct 2021 15:32:58 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id k17sm4047717wmj.0.2021.10.12.15.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 15:32:57 -0700 (PDT)
Message-ID: <2acd5c52-0c57-6ee9-3de9-e86c5d0752b7@amsat.org>
Date: Wed, 13 Oct 2021 00:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 15/23] target/openrisc: Drop checks for
 singlestep_enabled
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211012162159.471406-1-richard.henderson@linaro.org>
 <20211012162159.471406-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211012162159.471406-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 18:21, Richard Henderson wrote:
> GDB single-stepping is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/openrisc/translate.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

