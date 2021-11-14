Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B10444FBA7
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 21:58:22 +0100 (CET)
Received: from localhost ([::1]:57622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmMZw-0003iy-O7
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 15:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmMYm-0002tl-HD
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 15:57:08 -0500
Received: from [2a00:1450:4864:20::42a] (port=37831
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmMYl-00040P-1R
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 15:57:08 -0500
Received: by mail-wr1-x42a.google.com with SMTP id b12so26607179wrh.4
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 12:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6nQq9IeF0xuDftpamoA6jpmxW+t9OUIkVSBX8QHdAlE=;
 b=UqXY/UvtF19Zb4z87gx9y7K0jplf683r5NnrdWhGWcddFV6AIOXPBz8n6LGpTJOeCg
 iNN0LGee7lj/IFoNbVwzUqYanFV3IBwWeNdIQG8vE6CpOzm+JuuEJKGLhAQpN20aqohU
 3WlOseBGIWRZfWCzY/bY7RP2s6sM+5dmLPXqHEOjgxmBXx1PI3g08jXa1x3wkXDCEcDD
 RuEVUffhChhaD3ZKiSmB6/Wxogcj9p+niIkwrS2ihfitPnn1W9sQem3FnddZXbZpU9Fc
 QMg1YIjaX+AVwrN9mUgzjMqK0Ol5ShYV9kb/PDQ91S9+KcAOlN1UPM01xaDxaVx6khmN
 yf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6nQq9IeF0xuDftpamoA6jpmxW+t9OUIkVSBX8QHdAlE=;
 b=vqCN1QsOYqCD7OlvvdKPcIP9RUpsz5PzHP0uGeW8S65ngETCBzvH5La4febBh4Mnvt
 rXqN1fSYkYM530sF+IGV41MahLdXXeOEyaLCc+JCMP+CoSfbTDvsELyd1Dx0r93DY/1E
 xVGjq0v8Rioo/n/YspDu6QC9w2Q9qf7Gj6KE5mtKIs0jQGQ+YyAI1kS4iIfJwlLHKXAM
 oISniHIHld4QaAdbhhizdWV1sRsLJthXoxnuOFQHJK0Xp7i3M3iSWiNXeK4z0RoJHfAe
 J8bjxRXawMjdpxmcDrpVcNq4SYoFohr+LpKihGJeY5AfqWXOO+6k1N+JaZ/tDs670DY5
 x+Pw==
X-Gm-Message-State: AOAM533ZA7yPHMXi67C+GJowbRd81jgV4b1IqV39Z/DEk0+ms4+b0Sb2
 uftwRvQi6Lcs5sie3oPmh9c=
X-Google-Smtp-Source: ABdhPJyqXUQFJ0naBIB2drfRljlPxXvxqTKdvQNxlvwyOiw+xprmDkYz33ZgtuVE7ZGDAnKUhzyfQQ==
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr40476232wri.203.1636923425079; 
 Sun, 14 Nov 2021 12:57:05 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c79sm12063171wme.43.2021.11.14.12.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 12:57:04 -0800 (PST)
Message-ID: <3a192e75-d2a8-5582-58c5-b3cedc378f5b@amsat.org>
Date: Sun, 14 Nov 2021 21:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/4] linux-user: Fix member types of target_dirent64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211114103539.298686-1-richard.henderson@linaro.org>
 <20211114103539.298686-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211114103539.298686-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.402,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/14/21 11:35, Richard Henderson wrote:
> The host uint64_t (etc) does not have the correct
> alignment constraint as the guest: use abi_* types.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall_defs.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

