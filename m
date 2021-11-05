Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5014468AB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 19:54:02 +0100 (CET)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj4Lh-0005ly-7f
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 14:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj4J7-0003jg-Cs; Fri, 05 Nov 2021 14:51:24 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj4J5-0003tH-Sx; Fri, 05 Nov 2021 14:51:21 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d24so15188038wra.0;
 Fri, 05 Nov 2021 11:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FGVpeWT40a9bn6CvL8HnTry/b6PifsaAa5UJDxz3Uqo=;
 b=EmQkGFweAjf9AMDBJF1YhC0Wa9g76bS/2YbIZaW84AMBfvZezSeIL3jCChWBRcfalr
 Ax9pYAf6MQY8X+W5s7fmwLTPZEZmUvYY7VRW1epMFwTzOyyNUyYSLXDPowMiVb5lVyQf
 42la83oGaLZUbol/E1YU+JYyGcPStU7O3FWPUuZCfO1x3Kt7yVuhn5DBWdVhEYN7gSAM
 aXeCEqsmb/ak8cPeASf7/drMD/uBQYT2wyqmYFy2LxuM+l9ClBKV1dtkjUM9bxsEZKY2
 ndAeDfg/KBmzIJwcfXddy9AJmt47FcURFMFtBwN9h5jEBbe6VJthSuiTkYWtty04BKlK
 /xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FGVpeWT40a9bn6CvL8HnTry/b6PifsaAa5UJDxz3Uqo=;
 b=M80Qf+2hBVCIL5apTmLpfcRVMZg3MTJUTyR+95SalNdsU/ER6mzAOy4CSPln7k8dAH
 lQOJi1EckoALtGlarVwTHTbxB5Dl9rDeZcbkiLqYra3Hsw8SUWuWMGfXxU17KsEG/Z4h
 RnuAVW6ZQAoKnLEx+PphjmSv+NbUqlJDGTNOjx/S6mIvLuAZ0u1bXhHWz4A4eyoeXZtF
 qMJhaF893BqrKBR7CA73FvG+bhUVt7ZCpShe+TXkM6fx5RH9EGsu/zVY4hAZKBteGcCj
 gupJLivAg1ku695agc+NX+a7Dtgsbe2xRt1VHOTc5rw9WsrbQKtefz3AXKsbgu950IUE
 /WmQ==
X-Gm-Message-State: AOAM531rNENViJajp7yBu8X0S6LEA4XEWXNHknlSHlG5tQ4r657TKo0m
 olyYw5s8PZiDmqJgEn8TkI0=
X-Google-Smtp-Source: ABdhPJxoCMnDalYzSKOYN0N9tkHFecNxo9+ajklJMLwBzqXMxrukKdCzBnIY+nOqlsKuApHUkM3koA==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr62218771wro.324.1636138278044; 
 Fri, 05 Nov 2021 11:51:18 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f18sm8376559wrg.3.2021.11.05.11.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 11:51:17 -0700 (PDT)
Message-ID: <034dd643-dacd-94ba-7a80-6e6e7897d5d5@amsat.org>
Date: Fri, 5 Nov 2021 19:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/ppc/mac.h: Remove MAX_CPUS macro
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211105184216.120972-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211105184216.120972-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.093,
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
Cc: qemu-ppc@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 19:42, Peter Maydell wrote:
> The mac.h header defines a MAX_CPUS macro. This is confusingly named,
> because it suggests it's a generic setting, but in fact it's used
> by only the g3beige and mac99 machines. It's also using a single
> macro for two values which aren't inherently the same -- if one
> of these two machines was updated to support SMP configurations
> then it would want a different max_cpus value to the other.
> 
> Since the macro is used in only two places, just expand it out
> and get rid of it. If hypothetical future work to support SMP
> in these boards needs a compile-time-known limit on the number
> of CPUs, we can give it a suitable name at that point.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Minor bit of cleanup prompted by discussion on
> https://gitlab.com/qemu-project/qemu/-/issues/672
> ---
>  hw/ppc/mac.h          | 3 ---
>  hw/ppc/mac_newworld.c | 3 ++-
>  hw/ppc/mac_oldworld.c | 3 ++-
>  3 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

