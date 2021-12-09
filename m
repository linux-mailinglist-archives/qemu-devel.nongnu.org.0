Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47846E33B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 08:32:15 +0100 (CET)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvDuX-0001S3-Dc
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 02:32:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mvDqi-0007Tj-Vq
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:28:17 -0500
Received: from [2a00:1450:4864:20::42c] (port=40647
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mvDqe-00008A-BN
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:28:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t9so8072385wrx.7
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 23:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ACntJQa5JRAuh6bqUszn4wfXaeIE9wytb5aQ+joBqX0=;
 b=YHdx3Zn0t3veC2OmyZr8dHCudS5FXN++8cu0lRl0hl5+SzH94XHZPZMvMmfZjniSvY
 yKwjMJLZtN8UQoZgnqqYNSZQVKs1kNHJXCFFYzKCk3N/7sgkZilWI1Ym7SLqtnybVnAk
 MusLy8o9hX0EyEuUlLYTOAC4YfDh9jE/vHJszy8jzuKW+nINd3S8SZ/yXXJqiNz/iheD
 GLRtPsrbRAnXtvncszPGlM2kwZ96DBfLLY52d4IAJs7Hbz+M/1AUcTdUb4zBOC89Emfb
 r/+Rn1ZQsYORmBUZv8Z4vk6dwHWKnaCpLzIY300PkIeBAgmz2BS9WXOJ3GicQ38CgjFk
 83LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ACntJQa5JRAuh6bqUszn4wfXaeIE9wytb5aQ+joBqX0=;
 b=BonD+X74e32+SNiJ4ZXn0zBBjOz31tuHiQvIEO5+fzJoifnXq+oku5oMg4JQ4RbPBY
 eQd0V8Q4GNo2F0Fkyx3wRY6sDf8FAPMcLJCRq8nLr3DoD57lzKvCl+HxVg8EIiKPO/rk
 9zUCncOO5CbeRZOXPHx5KeHLjlmcGSF57DkKc+y0BrXxmiuV6aumhePUy0vYpYoU3Zx2
 QDx7F8suZA5sTFlKqN+JcalpYkGFcJ8YYsNuv4Kf+8Di3kJK3Mh1Ey34kP3fz+T937W1
 //wgCbR8M9vkYdHlNCw+LMOyQX3zYS4DhhWjRs6smpaATt+wEwf9IhLl3O9sUDTRCM/l
 ++qg==
X-Gm-Message-State: AOAM5316xGt+MXdBmM0uPpPCHBrPCf4buTj1+UmNfKNff1Swa1+MNKVX
 Zre0FMozR93Yud2ZmK5ZpNA=
X-Google-Smtp-Source: ABdhPJxulL4yEU+aDJ5OyYgl5/u436DuR+7+NK4EXjTCFdh6RKivcOm22nzMBiGEJ+6IvA+6VHfLtg==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr4427297wro.461.1639034890937; 
 Wed, 08 Dec 2021 23:28:10 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id b11sm7673107wmj.35.2021.12.08.23.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 23:28:10 -0800 (PST)
Message-ID: <130fd0c5-81d8-e213-58b2-432f9859d3e1@amsat.org>
Date: Thu, 9 Dec 2021 08:28:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/6] target/arm: Move arm_pamax out of line
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211208231154.392029-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.803,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/21 00:11, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 19 +------------------
>  target/arm/helper.c    | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

