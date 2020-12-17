Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9578D2DD694
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:50:57 +0100 (CET)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxQW-0005Av-AR
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpxPV-0004Up-IJ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:49:53 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:34334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpxPT-0003Sn-Vc
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:49:53 -0500
Received: by mail-oi1-x22a.google.com with SMTP id s75so33155832oih.1
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 09:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U+eeI+c+4WrFxYh7/HbeR7NJwnfkm3cobb1LC0j5P6o=;
 b=OEtvlEV9xgPHXLkZjWVzXl7FqTgBIJrx6vm1aLQbZqX4YeJfNTzfK/PGOmM3ovLr81
 tMGbivQLZealc9SW9ClIH2MTJyGk85Iej05hvhT4Ona5lXJSZrN4k2fKs/Fo+stIcImW
 5wifCtG1ZN0ZN4yglsSXzvvMg5ihOU3roI94w0QOssKTeAOAJlpZJWwyK4wDamod6aQq
 VAzliZYUGIAjTeTlnfZk9kNZ9tjUWaMsUshoWbp3BhcWBqpmTdgj6Hlf9PpmVEcHxcOK
 Z4YyAbDG1WujLFU46Eyjn+WDbTOG1w1C46Mp7szy3ueGpxChrLBX48ifr6nWXVwKVIsQ
 0yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U+eeI+c+4WrFxYh7/HbeR7NJwnfkm3cobb1LC0j5P6o=;
 b=fkN8pGImKVCYomdjX0rePSyXqVQdHET07dkGsbDyAIjH0+MqHEs1JuLxKpsdydaUgl
 a9Qzu3jWCA5I5V58ffWS5W6K7Psjc8lPf1mrHIQYEIwzeKFRQ/ll2iornXPDuPIFRK2E
 QkY1ZSjOgMy9Jc3QdvBkZi36CEyhRFePFaefCWdkUpp882m5iszkJZqiWuO6gGbPA2no
 BuKUUOAQ/qK4EN7V6fr40bk6skAOG8v/WLoP0JWH8ZfRQO3hwH3UjEmo1pqu51sbhe9T
 FEnCXbYFjvk9KJS4vO9LD8hWkIQIPTR5wKdt17iU5Yj1s6RjZF7ca3eHBecmKSjusfb1
 cBKg==
X-Gm-Message-State: AOAM533CrV3vNejLe/TURuuy0i9oFSWbrcDDhYgv1BqHN64HNP44Hr3Y
 E4FRK+ee+RhbYGqjPDKxsWTVLQ==
X-Google-Smtp-Source: ABdhPJyp+4NtU/B7+PLtHz5FUB0P8/z0uJsTb53hj+D+C1HjYTkGS0TEEof18gANTrwZOf23PRn5DA==
X-Received: by 2002:a54:450a:: with SMTP id l10mr167134oil.171.1608227390474; 
 Thu, 17 Dec 2020 09:49:50 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k3sm1353535oof.31.2020.12.17.09.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 09:49:49 -0800 (PST)
Subject: Re: [PATCH] bsd-user: Silence warnings about missing fallthrough
 statement
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201217154138.1547274-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4738f0c-6b63-43c1-a654-f7d1aea75d0f@linaro.org>
Date: Thu, 17 Dec 2020 11:49:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201217154138.1547274-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Sean Bruno <sbruno@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 9:41 AM, Thomas Huth wrote:
> When compiling with -Werror=implicit-fallthrough, the compiler complains
> about a missing fallthrough annotation in this file. Looking at the code,
> the fallthrough is indeed wanted here, so let's add a proper comment.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  bsd-user/main.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

