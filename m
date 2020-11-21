Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCD2BC1DA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 20:54:50 +0100 (CET)
Received: from localhost ([::1]:42658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgYy9-0005Md-7R
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 14:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYvL-00041o-NZ
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:51:56 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYvF-0007Ck-L3
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:51:55 -0500
Received: by mail-pg1-x543.google.com with SMTP id 81so10479925pgf.0
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 11:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8bH88tanQCDXMNbvU3ojA+WtU0qAJnx5/BAatZe0a1k=;
 b=RQ1Gex6aiReL0g9gcP2hmk5FOBb0Fr13OjIlfFRpZdhStRTOaqFwN0NvT6gXBpJuLH
 Oig3lApItFD6SKfqC5Kb5l7AggLx7tZhbNZg65FSbY9ia/gLnwexo457jxR8EJV45KaM
 EWL+rjkxs8QajGkA7tk8J6FVqpybbFZ89mZ2qJFNVZ/9MgW4Om74Zu0vu73YNviVQSNY
 RjBTETaU8v0NrZ0cKudofu2qXgfs4eY1Moa/OqwToZ4KEOXru6WUfPiNBhPlO5YjazsU
 j1gthve7G9GKWyqil90ghoos27UG11aJ3w3Uz73LW8YguypMv9uXigXvi3eOqYaaBXKS
 YSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8bH88tanQCDXMNbvU3ojA+WtU0qAJnx5/BAatZe0a1k=;
 b=p60hnTeEs1W03pGkrX+MEn1Q9AX/vVml80RecHE7J0Mjh8jzYmICwsFXIiEXvMyfpY
 smj8LA6pxxWB+1gydfqohubXRB85XpM5JSHdrWWGGvP7/AEPcGhb4dMEziAOGt202ec/
 ZutvoJkNfp6jeBtUoIaIp5gQtnrNJHlq3WlpHFuV+jkCMWG8BEGQplMZv97+Nn+NLk5u
 MY1PrAWq1V839XVKwXlZRzzuqovWRNzrItaczK9Iji5isvopR9RxnhzQNwUsE9OlidV/
 /fAH7FP4osrQklHYYdPtdUODORMnql7U3qc9fuhpO+jZyxWzv7GMAXbWg5uVkA88FYi9
 ir/w==
X-Gm-Message-State: AOAM533vCSVggJ4TErILlC8RZ7fuR75ivLoKgY/cHRuznX/R4xHl3vtz
 gNEvD8YWLiZDO0B6dTozJSuSmg==
X-Google-Smtp-Source: ABdhPJwl1E8IyGwPzPYAQnxOwcRsAmgWLJ25VMnETzDjHZIXM0f7jz7ec1My7ce4IM9XcpoPSOan6w==
X-Received: by 2002:a17:90b:50e:: with SMTP id
 r14mr16795014pjz.193.1605988307465; 
 Sat, 21 Nov 2020 11:51:47 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 92sm8977241pjv.32.2020.11.21.11.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 11:51:46 -0800 (PST)
Subject: Re: [PATCH 07/26] target/mips: Extract DSP translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7772dfc-11a9-e3a7-7955-916368382dbd@linaro.org>
Date: Sat, 21 Nov 2020 11:51:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Extract 2150 lines from the huge translate.c to a new file,
> 'mod-mips-dsp_translate.c.inc'. As there are too many inter-
> dependencies we don't compile it as another object, but
> keep including it in the big translate.o. We gain in code
> maintainability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mod-mips-dsp_helper.c        |    2 +
>  target/mips/translate.c                  | 2150 +--------------------
>  target/mips/mod-mips-dsp_translate.c.inc | 2158 ++++++++++++++++++++++
>  3 files changed, 2164 insertions(+), 2146 deletions(-)
>  create mode 100644 target/mips/mod-mips-dsp_translate.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +++ b/target/mips/mod-mips-dsp_helper.c
> @@ -15,6 +15,8 @@
>   *
>   * You should have received a copy of the GNU Lesser General Public
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later

Needs to get folded back to patch 5.

r~

