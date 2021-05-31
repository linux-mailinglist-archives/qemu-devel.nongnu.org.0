Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFDC39578D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 10:54:17 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lndge-0005Gc-Bg
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 04:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lndez-0004IV-KC; Mon, 31 May 2021 04:52:33 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lndev-0004Kx-KP; Mon, 31 May 2021 04:52:33 -0400
Received: by mail-wr1-x432.google.com with SMTP id j14so10080389wrq.5;
 Mon, 31 May 2021 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rNl47LhHVWQl/5LBYkiYrfamF0E7dcwMkZODSCsUUUk=;
 b=ornP9fvLkOmlHty7+9HIdmUA9TcZNcZQhW2kJV6UUfP63EOe1H2uyyLRqGhH9lvtr6
 osnwMr7r58mfgpIzAjLmSt4NZX3Ts0sRD2oSwNSzU5FQaNdujVeLs8wNstMNRK7Sfg0+
 kGRSgzlrSo4X/jFe9AnAv4SO0d0CFUk84ComfUMPhGdTg3SlxpEsjKpISzVxmjKiJHFV
 0rLySe2TSB3/fvum0UnxJFNQ+7zyYohmvq2OLpruSMpS3rHUWMuodFb8MWVQSxyp79sW
 qSGEHJEwTbqH+WMfjKTzyoj2UKBm4nYFE+ACzEoC9s+1BnfkZG0muDs9rcKztiuWm4/L
 o1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rNl47LhHVWQl/5LBYkiYrfamF0E7dcwMkZODSCsUUUk=;
 b=Wp0WCl7eE265gZOKyEXhvdZjRxYATaUJ9XYvhnwKDGyMiP+b/yYMw7Jzubr54pT7jk
 qHeTkEFEq3851ZYyCx9dvfj9do9Z8CGxHbgpi0bjTBsN9AbwgpZj0+m2vdf+1T9iJheY
 Bf2EqsOQe5gSiq/JoGVXskRqYJpVY5Fq0ay76aqS0V91U5SFTSomf5faBuS1vJsiBtIW
 N8uHu/BePgpgHjIKOXFMiclLWqrA5D+/A3zZwmjAS1f0XKhLZ+bHRob01oOa5WBjNeDt
 KoH3FdCdtqcUHZVFMl7FSjbAIxAbcO7s0+/BUiUcELlkjW0TTUX44MCBdDqovp2kvAi+
 UZiw==
X-Gm-Message-State: AOAM532DdF1d/8WxNNITIdnqGCOMVojlDo7234g0e3d9dt0jrQSviUT8
 qYmdReXK9WYc6SCYt0EVtv4q8nWxZe52FQ==
X-Google-Smtp-Source: ABdhPJyRU7W5KFPoNph6km8BU8Ey9wqqxMnf7bMmBtLwG3ImH/UttffOiLwcnMhUpvy06Q4o7wyvzg==
X-Received: by 2002:adf:d209:: with SMTP id j9mr10073098wrh.328.1622451147357; 
 Mon, 31 May 2021 01:52:27 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id z12sm18188563wmc.5.2021.05.31.01.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 01:52:26 -0700 (PDT)
Subject: Re: [PATCH] hw/display/macfb: Classify the "nubus-macfb" as display
 device
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210531073255.46286-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <99ae8529-b26c-7f32-88aa-d6708d5c79ed@amsat.org>
Date: Mon, 31 May 2021 10:52:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210531073255.46286-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.618,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/21 9:32 AM, Thomas Huth wrote:
> The "nubus-macfb" currently shows up as uncategorized device in
> the output of "-device help". Put it into the display category
> to fix this ugliness.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/display/macfb.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

