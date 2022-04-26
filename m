Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B237051090A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:32:36 +0200 (CEST)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQvL-0007oo-Ob
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPsB-0005Bd-TP
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:25:15 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPs7-0005xE-O4
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:25:15 -0400
Received: by mail-pg1-x534.google.com with SMTP id bg9so16725260pgb.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oeykPI7SlPrOaU6XDQAQ/MHlyrO4FVmyDGfGRNfEF4U=;
 b=IsFppcxAlLckOHRqDPwMSt/X28jvC57GRbJuuwSIvJ6gfwoMqvHhXsxtHQJ/6nk2xz
 qs5lx778h6/Q1TpVrATgOcDN6sQODIotQh7bb7iGXxFAopf57kaeV4DzZXYtbFo8BvdE
 w1Dc+TyL9UvEQwpJfzj7NbY5gXjbXY1HRWGClsTKtETsJRyhg43rAMU94K+bxCLQi36F
 HmxdYFHWOkz7FNp55TUvnsnvKWHz9PYgExQ5Sf+PnEX1g2ebAPiLp9npvhuEoU4kQWRZ
 WTfIuDQZgqlVce3rhALig6DbIJAEZSISkaNeLqfawHcC6TqQqgWtEsQmOj+zZpZO+p3s
 L7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oeykPI7SlPrOaU6XDQAQ/MHlyrO4FVmyDGfGRNfEF4U=;
 b=p2/CtSCngAnK1RZQIZrT9kqRY8qXH3rqUmRgJUd+Tnwio1p/9/mkmWeiN4PPDbK2ZK
 tfGfMV3VlDbEu5NUK5RcRj3x3dYeNZq/ZGocdtsK8y0LvozUFa6Vof4ZNdhrGSCbRY4j
 KhFUG3DL7KU4z02ROwUej6Xf/1Eu1TNZIwejRGv134H79uvte47k7Wt8jUsBi1aVm5UC
 SO8bi7E2XN2CVnM0f42mU1Exlk+oVbaM7Kf8O5DJVGQ5YBhoiCr8zLrcl8UWVtGlwgtV
 iuLtbdzlDwA+f//P94D7opESe8yrD3Oh6OhQt/UQprIvke91cibF5LI1ntXYhoBCz1cd
 jkoA==
X-Gm-Message-State: AOAM531yp2L38Xi39BadvoKnp5/U0K9FjfL8SuTlmtcg+Ul3hhuMMWtc
 UiM7tRKzNTVvyjBeCMoWPwOA5A==
X-Google-Smtp-Source: ABdhPJzeihnWS3KbKlvjxqPbbWTVbKDkrJsotPU2rklO6dAS/nBp39acAiVAzCvmqbKziB2lYNrSPw==
X-Received: by 2002:a63:8ac7:0:b0:3aa:f853:4f62 with SMTP id
 y190-20020a638ac7000000b003aaf8534f62mr15358025pgd.205.1650997504474; 
 Tue, 26 Apr 2022 11:25:04 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a056a00194300b004f6664d26eesm17783230pfk.88.2022.04.26.11.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 11:25:03 -0700 (PDT)
Message-ID: <7f1fc9a3-a89d-392f-5343-f012a68cfe49@linaro.org>
Date: Tue, 26 Apr 2022 11:25:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/9] replay: fix event queue flush for qemu shutdown
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
 <165062839471.526882.6289802323800289333.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165062839471.526882.6289802323800289333.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, philmd@redhat.com,
 wrampazz@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 04:53, Pavel Dovgalyuk wrote:
> This patch fixes event queue flush in the case of emulator
> shutdown. replay_finish_events should be called when replay_mode
> is not cleared.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   replay/replay.c |    3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

