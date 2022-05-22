Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF84E530696
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 00:40:38 +0200 (CEST)
Received: from localhost ([::1]:57930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsuFZ-00023m-Rk
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 18:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nsuDn-0000sH-Qm; Sun, 22 May 2022 18:38:47 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nsuDm-0008Bc-9c; Sun, 22 May 2022 18:38:47 -0400
Received: by mail-pj1-x102a.google.com with SMTP id n10so12436727pjh.5;
 Sun, 22 May 2022 15:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oHX9poT5pIw4v3K2FeScvYWSM7W/h8jX/GSh+J84w+4=;
 b=W7tjX2eHTSDXFOj+wBN2EfQRA8JB8ZwU6tKAHhinunBcGL4CfXaToIKQfRjmZ/Qq/+
 voeOcXOog3Xh/xe/Oc1NuZ98YpVnWEZun1Xh1BjlxgnJY5+xjYGeQRe8x5cN7Q+fDSUV
 qZJ9QuaiNP4ReHstkG3oXSeq0pIBAC+MVAFWLVW772ytfsZz7hKfvbm4ntAESujIwytv
 Hw30UO1ZEfpG5/kbCjeqpvjKSvyzTRwa8//wt2fqOt+ImXmIR1DMzkoTAIoyrAvo+Ub9
 KRFpW++tMOjqFDLRYLzkyoN2FUuPfecmIpBjn4zBJwOhZ8fenL8enFk6Utx2gXAvQfXy
 ZPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oHX9poT5pIw4v3K2FeScvYWSM7W/h8jX/GSh+J84w+4=;
 b=po+FJogH0VlMJch1E6uzddktJBoObbplV7DwwAoOLur8ICYuo9kPL9DKwZRdwhtdCD
 WPNFDRmkiwmMKHOK1yffMjkejA+QrWyGCcJolRWldvipVLJMCrA5CeWVIZxbBW+iOhv3
 Kq88JYMW/OfcnsLexh4W56A7l3MxQ6yG+yQyTgBXnRrvgm3Dy2ykQpj/cBbqpg8IT9uZ
 e1JDwUdykO75wEIm0W7MMwtgUUU5nv245G3JIMnGwEOOFQ29YW8GpbLZ9ZnTNCVYNl2m
 xtOene+QPVWxkUGZNY71H/8N80PjimL4803jJzu6ZyN/BFX+kyV6R+lzXfk/JpKvq29d
 Ur1A==
X-Gm-Message-State: AOAM5302BIHwLaNz5esCVhre9xE1qTv+QzDY6HtaAhffOUHlJN4/5CWk
 95XzWe4vyLQgLZidkfjyPXh2YlCpvzY=
X-Google-Smtp-Source: ABdhPJxcX1dkYBSW9xlWS1G8MuPak9zIY9NYxpdD/Sl9KZKNpHBL3RpCgc9ZDq5WThtLOuRRGQc7ZQ==
X-Received: by 2002:a17:90a:2f84:b0:1dd:940:50e7 with SMTP id
 t4-20020a17090a2f8400b001dd094050e7mr23469379pjd.210.1653259124187; 
 Sun, 22 May 2022 15:38:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bh11-20020a170902a98b00b00161d80dd1d1sm3560288plb.292.2022.05.22.15.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 15:38:43 -0700 (PDT)
Message-ID: <0f74fb58-9c50-e69a-20c5-b74eadcc6e5f@amsat.org>
Date: Mon, 23 May 2022 00:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 08/10] accel/tcg/cpu-exec: Unexport dump_drift_info()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220520180109.8224-1-shentey@gmail.com>
 <20220520180109.8224-9-shentey@gmail.com>
In-Reply-To: <20220520180109.8224-9-shentey@gmail.com>
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

On 20/5/22 20:01, Bernhard Beschow wrote:
> Commit 3a841ab53f165910224dc4bebabf1a8f1d04200c 'qapi: introduce
> x-query-jit QMP command' basically moved the only function using
> dump_drift_info() to cpu-exec.c. Therefore, dump_drift_info() doesn't
> need to be exported any longer.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   accel/tcg/cpu-exec.c   | 2 +-
>   include/exec/cpu-all.h | 2 --
>   2 files changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

