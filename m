Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CDF37229C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:42:42 +0200 (CEST)
Received: from localhost ([::1]:51966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgKv-00023b-3V
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgIs-0000ir-DM
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:40:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgIq-0007FP-QY
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:40:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 p6-20020a05600c3586b029014131bbe5c7so114000wmq.3
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hHOnJUjb8620ZPO+7x/gc6cveaOQldex13VDbW8q/m8=;
 b=mXmO+zFsjUWP97912px+mZqwuC1TRa0eVBkg83IYcieCKkKyjRnThPCD1kHfKcwCcz
 /KPx9IYOwmWamH4ozz4gHWG4S7E93hbUOLWVyj1+vxERnzR63my8OjS3NXCAxR9KgVY2
 3CIM0EnF97QLmqzVOUBVnNsrIapStFcO9UvUe3p2brVnh4KfzG1TL84iSMbbLiu6w1Hv
 uxzAT4St3+AZM8vsYYWAO5weY6FNvBF8lemczUjxPRqInVBxXKsm3MWR9OBnmehJexcT
 nYkFeLLOnmuBljamFsGlPhqvugclrH+Id3FyqYr3KEVhxoC2NCxXvwRX7vpklqHdYL6/
 lmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hHOnJUjb8620ZPO+7x/gc6cveaOQldex13VDbW8q/m8=;
 b=hMZgxrNNQE82B+dZnI2dh1LAYwqeyNmWBhdCAIj6usl22j9p/j488CYfMl3Jk6Wz7K
 HHb6nqeM7UhoBhNc/5WfMuSeYA10v1gJy8VlwjDbroZsFgZ7Xe99H+qb3W23go9xSdk2
 BZBzQ7mFOLXIAJKdsyzK3bVFZRMFox9IlHl3PA995htsce5SbDo3dL9I8yskAU//CQ18
 iVS15z5pSOFhquguFQk3z5duISwd+3lkFMa+uB1MbwrQzbeSX0pMxkrf4A7QbcRXLVI/
 5pypf6+2UXYMlEUPXQ0su07AocFm78YlXLAhrNWkbF6ZDUujhe8Z65Rfn7YS8qmaPRp0
 xj6g==
X-Gm-Message-State: AOAM533HBI7CkgJfbPsI4AvaElpQcDiAfTRUfANZiBlB4mjHcLz5d3Yu
 MNtVfW+n+xeZvvThxD9661jMDO/l2nnmNg==
X-Google-Smtp-Source: ABdhPJxJZC+Luf8NwB4NXdnI4iW0wx0ZSoG1tnEP8g1S3yM5eR0JNpWvqahpuDdULxI2nlNMfNMK9g==
X-Received: by 2002:a1c:f305:: with SMTP id q5mr635719wmq.96.1620078029046;
 Mon, 03 May 2021 14:40:29 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id n6sm9488023wro.23.2021.05.03.14.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 14:40:28 -0700 (PDT)
Subject: Re: [PATCH v6 03/26] accel/tcg/plugin-gen: Drop inline markers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4e256434-cdf1-e277-b840-ca11bd3d712d@amsat.org>
Date: Mon, 3 May 2021 23:40:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 5/3/21 1:57 AM, Richard Henderson wrote:
> Let the compiler decide on inlining.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/plugin-gen.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

