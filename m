Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC694403AE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:00:03 +0200 (CEST)
Received: from localhost ([::1]:50328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgY2k-00083W-BJ
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgXva-000405-AM; Fri, 29 Oct 2021 15:52:38 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgXvY-0004Qe-Kf; Fri, 29 Oct 2021 15:52:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m22so18290286wrb.0;
 Fri, 29 Oct 2021 12:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dbS8+HUqtQDQmVS3N5PbvwzJ11VAAK6yioq4+Bq87VA=;
 b=oD518lM4g5vVZ/eMFAWx7JFbowk0i7yAIcoLPAz7T5L21CMr0GtANKl3iXYSVmL8X/
 MgZhUwjvCw/NY7+XAyN3MiIyCIawH2XoYQ2divVdP/rXblGGNBTKYKQgfGoqtNa/bcm8
 UX1fMcMvagdp2tzkDaA0HDV4saeVKNkyJfVVpIdKkDGdWxChEC9PHeXT2z8rK2ZwsA7Y
 5WkJUKM1Wldy38s+ZbCgzShjSJy+pgBmEK4ggA8X0Kg4cPAoFHYr0jdb8lM2WE/AUDjT
 CwLZONBGx9DSW9UYkGCif2Dr9N2ALRy0IDTPlsl6T6TYGHlqMv2rk5nCFaDTTa0AYI6E
 View==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dbS8+HUqtQDQmVS3N5PbvwzJ11VAAK6yioq4+Bq87VA=;
 b=HfzaiB4758EcJUvq1xQtftow45jNrXn78VTv6EIP4UH1GoczpK3B+FftkvoHZ1s0LH
 UIJ/WFEN6JJT3xINYDFVlugYXyW2wvpZbPpr/KfV3dHoy2RS3Du8/YLwF5uvSAyrpeza
 QuqPrM5pQWqMDahdSIGfyCcaaZoBpteV6iE9Ov0JsU5sF2B2Y+4oqxxlj3tJynWM+Q4M
 +u4GJ3UqvDAdMXgr8fcvw7TcaFrbxUaYj0Y8hGfYDic6gIt6aOl6M9s+JKC+8+wKbkrv
 MNbBEEvBh4KQUraS14JeW+6oXj+8WrNEh5JWhoizpArtR/Q2TYMbHRYeOASmKe4EgUAX
 4pyg==
X-Gm-Message-State: AOAM532KqAXcQZYDdDKm8ZXMVnoJ2FozvwAX0xtwQ9z8PzU5Z0FxNq9F
 KYYmPEd8YvVeeIhZZWtoZXs=
X-Google-Smtp-Source: ABdhPJyT0TOfzwmOulGUxUQgx8D2C6A3cSWuXZwdVFAm6KBykIM6nvay4eXebzSaCdbK4eKfLRiESg==
X-Received: by 2002:a5d:63cd:: with SMTP id c13mr16119476wrw.224.1635537154914; 
 Fri, 29 Oct 2021 12:52:34 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s13sm9771262wmc.47.2021.10.29.12.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:52:34 -0700 (PDT)
Message-ID: <cdd0d0ce-2bb9-a026-dcea-232b6eb6fc3e@amsat.org>
Date: Fri, 29 Oct 2021 21:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 03/15] target/ppc: Introduce REQUIRE_FPU
Content-Language: en-US
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211029192417.400707-1-luis.pires@eldorado.org.br>
 <20211029192417.400707-4-luis.pires@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211029192417.400707-4-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Fernando Valle <fernando.valle@eldorado.org.br>,
 richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 21:24, Luis Pires wrote:
> From: Fernando Valle <fernando.valle@eldorado.org.br>
> 
> Signed-off-by: Fernando Valle <fernando.valle@eldorado.org.br>
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/translate.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

