Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0051590933
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 01:32:51 +0200 (CEST)
Received: from localhost ([::1]:52324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMHfW-0007fk-Ra
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 19:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHdM-00067b-9J
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:30:36 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHdJ-0004HJ-3y
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:30:35 -0400
Received: by mail-pj1-x102a.google.com with SMTP id gp7so4606436pjb.4
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 16:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=ZBfwUmGhXnPufVVy5+vc4bbK2K8yUBYr5DtZOwb6yIw=;
 b=ZbUJbjaGuw0dIWGCx0YKJMenfIhwXLQiM3CqZtZyFppDZA0Sf6bECcdisYcLT4mOo2
 uSkriUtebh0Obel34lwuV+XjuP6siJOqtCo9lYopFyFpzGH0Jxx+IiS1kDZP/0oWmUmF
 5bJbws8QDJ1gQcJYqIA+9YeUffz6mwZW4rnKiL/nsdNlCoQPdnIxwmOPvLR/bIsVz175
 tMFlsI/ZqPOu5vtIGBiS/LifOYs4AWNabRCL8BQmd5QqxCtsGSartc0ewsIhkSBEEHmf
 NsDJEQfHJQwKDzmVdPx9lm9F1Up0vdD+cRep876kxDe7mcHUyrY8M9xwC+EaEUns18iB
 4Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=ZBfwUmGhXnPufVVy5+vc4bbK2K8yUBYr5DtZOwb6yIw=;
 b=WXe4sphZXJwqg0zJIftitlAG38CR2YWVzYuXnV8XN4qW8e4dfdo6BVtZa5ikI9e4jg
 t2mz5+7jlSNbRXQOjpKXKfvRlh1yYI8oO2gXX3+0Rkvq7NGT7E4kcOWPhK4Oa61ip4Vi
 7nLjL4KL0WBBtPrqxSpWtEjHbEw3Kq/CBGObMJ8jWIFNQTF645HHU0TAiMCYCauzVjAQ
 vbrJrHX/zZ5p5v96s0ZXoyGTn0qbJFqkhceeoEJO3THViDx1RM18eaeLWDOzImzyYF9f
 hfewiWeSrYsdDSzGjUXOxlCuV5yNQxQIfBV1xYg2gvAn3cpGf4WMBRZAUX7zw8Hz1WtL
 dE/g==
X-Gm-Message-State: ACgBeo2FePNtV4TgCzZJq3K+qYwBYI0Us+TetYQ95gtXcFJVEtORBJvM
 NpSHFGXecBIG6OePF+W/wynCZbrvJT4=
X-Google-Smtp-Source: AA6agR6P5LQYB5sARw4I1crSFTs8PsuxbEJP2F4bECXIY8RSIphb3LcaxHxS08jey+TEVJMmWUThqg==
X-Received: by 2002:a17:903:2303:b0:16d:c555:9b2 with SMTP id
 d3-20020a170903230300b0016dc55509b2mr1442185plh.46.1660260631604; 
 Thu, 11 Aug 2022 16:30:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a623105000000b005302cef1684sm254811pfx.34.2022.08.11.16.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 16:30:31 -0700 (PDT)
Message-ID: <d2d89961-bf0a-a28b-bffc-3d0afd8d1db4@amsat.org>
Date: Fri, 12 Aug 2022 01:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] tests/qtest: misc tweaks to readconfig
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220809093854.168438-1-berrange@redhat.com>
In-Reply-To: <20220809093854.168438-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/8/22 11:38, Daniel P. Berrangé wrote:
> The property name parameter is ignored when visiting a top
> level type, but the obvious typo should be fixed to avoid
> confusion. A few indentation issues were tidied up. We
> can break out of the loop when finding the RNG device.
> Finally, close the temp FD immediately when no longer
> needed.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/readconfig-test.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

