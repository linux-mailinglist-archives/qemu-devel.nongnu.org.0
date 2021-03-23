Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4185034688D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:09:26 +0100 (CET)
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmP7-0006QG-5g
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOlfD-0002gh-0m
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:22:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOlf9-00083a-8z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:21:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id e18so21804379wrt.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5r+iGIBAu2ykVlJeeuy+HeoSYTxh7jmUnCWfoqnqWB4=;
 b=ns8GgXo2IjBjiZ3wDmacuky+3XIKh8+uAskQ9khjdcHuPzPa4IAtnCll+rfngCbTyZ
 csHna0bNX32KsiAZmBXbMsvNOqHJ0ny1Is88rO17nl38HR+CCGNdzE0/pLhL13sEEQU2
 S2t6ogBeId6JSyNiVVngCV+6LknQ5Fw27gHb+slEzMtk7Dy0t0vaCGIcd5qwCHsgudlb
 ng3dxIj0gjJGfsnQQYiFebApNdmufSbTMaMKU8EL2eyYnVuTE7GnfMpNPXJwOm3dhdqI
 a5hYLHI5B4I4y+T3Xz1BBgGhsEcWIxZpeThfsMnNZMOwi4I2WJIvO9ZBIR7arAqm5liB
 95Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5r+iGIBAu2ykVlJeeuy+HeoSYTxh7jmUnCWfoqnqWB4=;
 b=s5GiWnKwIVUcOtKctI2gcyJFU9Lg8VFT6iv7EKjLrsPPUYbhlFjRCcVGdjWuxdl7S0
 hji6sBLT0qMRCZr8jcYi4hG9zrc4vfGbJ5BprZQxCBhRqWpUwNWtToHnomtUcqSV99RZ
 WIYL1D5TZbclYbOVKpbHJFrWCUHnD3pFjTckLN3zJDvNXN0CQet9JZAmwXLM4txTxfdI
 /JUIzcBy5wRKYE00urb0IToJgXzTEet020RlQE0YTNmzfTzarb0uHmCSUmpw9+3nttru
 +gezyU1UVOWedXFHIJWWS7zfSjLNDNgoaLFMDV2+YespFp06LieU5aQLDCnug1xZ1xgC
 acBA==
X-Gm-Message-State: AOAM5308BtvH2d9v2uH4iCQbL/zhPzGmDxUM2tWK6O+nVo4GdKCaVl5O
 wpN/sIBx8FU5FRBydYqq+go=
X-Google-Smtp-Source: ABdhPJyM9SsPyY9tDB3fNNwH6ynfj45vZC+5cN24h35m+K4vew2bGrd3wjlnBc6NXgyPYWRphw9XCA==
X-Received: by 2002:adf:82af:: with SMTP id 44mr5136810wrc.279.1616523713017; 
 Tue, 23 Mar 2021 11:21:53 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j136sm3532720wmj.35.2021.03.23.11.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 11:21:52 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] exec: Rename exec-vary.c as page-vary.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210323161601.454996-1-richard.henderson@linaro.org>
 <20210323161601.454996-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da56deb1-92d0-9f1c-5589-e81c7d83736f@amsat.org>
Date: Tue, 23 Mar 2021 19:21:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323161601.454996-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: pbonzini@redhat.com, gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 5:15 PM, Richard Henderson wrote:
> exec-vary.c is about variable page size handling,
> rename it page-vary.c. Currently this file is target
> specific (built once for each target), comment this.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210322112427.4045204-2-f4bug@amsat.org>
> [rth: Update MAINTAINERS]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                | 3 ++-
>  exec-vary.c => page-vary.c | 2 +-
>  MAINTAINERS                | 1 +
>  3 files changed, 4 insertions(+), 2 deletions(-)
>  rename exec-vary.c => page-vary.c (98%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

