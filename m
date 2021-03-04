Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7D732DB17
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:21:22 +0100 (CET)
Received: from localhost ([::1]:45976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuTJ-00030I-Op
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuOm-00019R-9q; Thu, 04 Mar 2021 15:16:40 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuOj-0005bX-NT; Thu, 04 Mar 2021 15:16:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id h7so1602358wmf.3;
 Thu, 04 Mar 2021 12:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rSXNuvPVPLmbaiHHTqz+Qk6OjKDVz+iUt54KSSX86/k=;
 b=J6uw5deoOyYYGulnmPDYc5RUtO0ikEsl3VzvDbgpNbxppxsgScxD6MOrGv68M6CYEX
 NO8giBcZi3wPJGH44U8WC/H1p1gAQ8PRsWLEGutux09HeBPnVxGIg1RIdiJXU/32USjb
 Wf6Gbx/5INxVezAe6CHv6SFv19DY11Zpv68vCPmYXgHk4xXtMyX1CrREszEm2aPjoa8m
 hN+wVtHxitN9QVyDiTHAcWN4BmIZEJReFNhVqP1BJaiiB9y8YyS2dCqAxXu7OkjJWYW5
 +hEu/w/MMX/ddy4i9fc0hIo+B1qlKY3oY/SbOyJgfFUOzwRLu5PNu7Sef4hJafBs86rP
 1ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rSXNuvPVPLmbaiHHTqz+Qk6OjKDVz+iUt54KSSX86/k=;
 b=VA1NGp2Psd3xzkZNnW6udj/24f92B7XrE0GjAea4lxu9JW1K1jlW5W/ij2IxT3OwB0
 tMuQf4wa90SGnYRdcSQ8DPNA4hDsjnS6Cz11XlfJKgob5rWX2ptTA9+Oq4iCqDtANPTC
 oOO3uJUo8lmKodF+z/RwrnAloKysNCP4Z1bms7+qPbvd+8hn4PtBZoATxdYchE/rg3x/
 i8n3/A8WUmYMXLo0Na7uh+/Iynvf9eDN5yWsZvdcWMm00HlNhUrcxhP0nylL7gOmOyAD
 dpbn7nFcDXJH74PJk1/rKb2VuQx3sDD4jF9PorUVbuf5YOPzSEsCwiEMsuaurTnETaoS
 tUwg==
X-Gm-Message-State: AOAM531O9A6by2VqdTKJWAfdFMjpsm8TfAwLpmlNrGYq5UYmynU/6LO2
 AbbrNoYR5YvNF+P8aYyeFMD1P3a+1qE=
X-Google-Smtp-Source: ABdhPJzkxvcNqvBcP5hZ/FNWjbJyoa+AR7huBy1exsTD2O+lrdvzqMPAAsoOn98kvVC4rfgdv4FA9Q==
X-Received: by 2002:a1c:8005:: with SMTP id b5mr5594530wmd.130.1614888994769; 
 Thu, 04 Mar 2021 12:16:34 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u3sm487364wrt.82.2021.03.04.12.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:16:34 -0800 (PST)
Subject: Re: [PATCH 36/44] hw/arm/mps2-tz: Make UART overflow IRQ
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-37-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6fc27647-e6a2-4069-34be-4e5249d792e6@amsat.org>
Date: Thu, 4 Mar 2021 21:16:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

On 2/19/21 3:46 PM, Peter Maydell wrote:
> The AN547 puts the combined UART overflow IRQ at 48, not 47 like the
> other images. Make this setting board-specific.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

