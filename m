Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D7373B35
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:29:39 +0200 (CEST)
Received: from localhost ([::1]:53968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGeo-0004az-Nn
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1leGcj-0003lf-77
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:27:29 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1leGch-0003aD-1e
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:27:28 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso2932237wmc.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OK8DmX+F3x76frvkF0UJqFQMzd6/6MYloIU/YNFbx5o=;
 b=jES9lClnS3fF93hIZHXoxQ9LExtGBEs90WD62ybfxbJic1mpAcL5NTMpq7YK6tOXhl
 rHAZDVqLDnqP1z5WrAJJUI9Urw5vPa6gX5R/zJr2/ECnFC0XSc2PU6WClR6SpAnCVHrn
 eS8a6bUgaCqyMM4UTrX2p26EQj0/WcrM6WgXLsvZeo73qI844nsN+DO6EhVNTcfuHsB5
 l8rfo1/7Vl4vcniLsSeMeODFHoUfnmESU9Ly5N60o7oeIaqWBMNcJbzL6w2z/bqrOieK
 wRZoSC8+Ic1iR6dAr/crBzpLh9NZnRgYTUlPZUjj7VwXrLrWgpSxRMI/idWptjdZrv4G
 FNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OK8DmX+F3x76frvkF0UJqFQMzd6/6MYloIU/YNFbx5o=;
 b=UL6ZpYsjA/h5tAk5VYq0dcot3CT3oolCgzp3BKyi9CtqfoNgV94YziGywwjax4pq2+
 pZnSKGALL3IcXrTLA6a2crEEbOGTtwX3dCmcYpDogBaNXMJbiD5l3Nt1SetkYuvXqJks
 QRTUyqERkxqUp/KGesOejHpQnAh2mNEeZNl4OVch/1SOruWBb91yGSZHyL5w89+ycLex
 spaIGOaZmOa+nbFPC4rTjNm3npBXN6QPmwLvNTxEYnX3Jz0iyi7nc6f0bGEnROvvT/a1
 p8S97t5UTi3POf0tjeLhkb4MpjNRqt+EJ7IW9ijzOFZBaNuQrt0vdprXPYcFBt0ZYkeO
 ONeg==
X-Gm-Message-State: AOAM5306m6pmv6BdJnHsb6pMLgWu0omD2zAm+wvHbFqGnZ8QgkE2HREP
 +lZmiz95uTQL8KyG3WFT7FA=
X-Google-Smtp-Source: ABdhPJy0KBm97EUOj05beTzq3jXuAmXm7L7a2/+r9zabYCaAYEQfwtl+v1cgO7c7rYQZMmMLe2NwhA==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr30415572wmp.164.1620217645336; 
 Wed, 05 May 2021 05:27:25 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id v18sm23128809wro.18.2021.05.05.05.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 05:27:24 -0700 (PDT)
Subject: Re: [RFC v14 54/80] Revert "target/arm: Restrict v8M IDAU to TCG"
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210416162824.25131-1-cfontana@suse.de>
 <20210416162824.25131-55-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d189d5bd-3e97-7e26-7ac9-487b46946071@amsat.org>
Date: Wed, 5 May 2021 14:27:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416162824.25131-55-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 6:27 PM, Claudio Fontana wrote:
> This reverts commit 6e937ba7f8fb90d66cb3781f7fed32fb4239556a
> 
> This change breaks quickly at startup, as all interfaces in boards
> are checked in vl.c in select_machine():
> {
>   GSList *machines = object_class_get_list(TYPE_MACHINE, false);
> }
> 
> In order to restrict v8M IDAU to TCG,
> we need to first disable all incompatible boards when building
> only KVM.

Possible way to disable all incompatible boards:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777719.html

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c                | 7 +++++++
>  target/arm/tcg/tcg-cpu-models.c | 8 --------
>  2 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

