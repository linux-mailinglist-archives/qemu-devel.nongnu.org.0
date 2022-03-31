Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540294EE2B0
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:34:53 +0200 (CEST)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na1VM-0003sN-6K
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:34:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na1U0-0002Vl-JW
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:33:28 -0400
Received: from [2607:f8b0:4864:20::634] (port=45816
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na1Tz-0005NF-9k
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:33:28 -0400
Received: by mail-pl1-x634.google.com with SMTP id i11so614066plg.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 13:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9H7d44uuZ/vG1cckePjXy83a5uQp+nW+225m36/gbls=;
 b=P6D3aDx01qDZ2rVu3J/RKq4yprqDfedht4IcZfr7Ijbb/oLooyOHo6hWcolJKKFNKa
 YKMu4xdeMIxNvp8tKqoz+BzLLa1ldMNXmX+YZHKjxi9wjhL+zD3sWICsKMn4k7fdt2Ps
 x4Mr/bAaJWXW9wipjeELluVFkTb0g3jglE3Wbu3OODMlZKI4QdON26Lco0DgesjyJ3N7
 +AzhS51pvoDv0gXznYDY482DosvxmdSHJY16Q6/mRL/Jz9c1oZ9s0MslBe62PYmSYJp4
 qcruflazufuDdfYFRrzel6z/osCa/g1lv5+c9LzxuPNlY7mefVqvpvwa1ISvgehnQCg1
 8FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9H7d44uuZ/vG1cckePjXy83a5uQp+nW+225m36/gbls=;
 b=w58MhpXDg9T0o5yIRvPFKbRPAS+4HzkuVP1lINd5BDcPKNtfTqHeOg8S4DNFWHicF8
 759nuArY+7RsSfwg2jG0bVo/67RicppHbhphqnHfyMXgRg7UDqIUXJV0ucp/uF735Yhn
 N+luK8AzsYHg6bRVgw3KGKm4qg6iXiqbDQEZeKlJrrD78vxTnpP83bjVmSbTC90Aa1vf
 dwp0C0/VB4ZdC62qCgqtGbrWhqpbq/Yw7lBbMU0IL6WFmf4lDPBCSXWCjY/3ynG81bpL
 W97OKS//OZrINALhndm6PmFgdbdaQ1G8zWlgGWjIPoSM0LmSS0GkoPaGJEVZETHwcG1R
 xLUg==
X-Gm-Message-State: AOAM532Pr5O4UX9n8ryIgusxAKwkIFL0PHI67Gt0rU8z8b2KQuiIem/0
 Ha9EJ0Bspr1sEVLvLrVWGtc=
X-Google-Smtp-Source: ABdhPJznkBlLn/PZZ3fUoMzNgVOCyqyNczSOcWF0Rk+6VFjuZ5650IhMdX4uD3ss081KRvoOtK4xQw==
X-Received: by 2002:a17:902:cecf:b0:154:2177:26be with SMTP id
 d15-20020a170902cecf00b00154217726bemr6869177plg.96.1648758805973; 
 Thu, 31 Mar 2022 13:33:25 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:f49c:562:b5cb:b2b5?
 ([2600:70ff:f07f:0:f49c:562:b5cb:b2b5])
 by smtp.gmail.com with ESMTPSA id
 75-20020a62144e000000b004fae56c42a0sm316431pfu.211.2022.03.31.13.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 13:33:25 -0700 (PDT)
Message-ID: <05601508-78fc-e861-53a5-539634d7d536@gmail.com>
Date: Thu, 31 Mar 2022 22:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] build-sys: remove MSI's QEMU_GA_MSI_MINGW_DLL_PATH
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220331201127.2006038-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220331201127.2006038-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/3/22 22:11, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Since the introduction of the variable in commit 9dacf32d2cb ("qemu-ga:
> Building Windows MSI installation with configure/Makefile"), nothing
> makes use of the Mingw_dlls variable in the .wxs file.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   configure       | 3 ---
>   qga/meson.build | 1 -
>   2 files changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

