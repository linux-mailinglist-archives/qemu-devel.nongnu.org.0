Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7599495DFF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:58:09 +0100 (CET)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArcO-0005m8-Uk
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:58:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArAy-0003Dq-IO; Fri, 21 Jan 2022 05:29:48 -0500
Received: from [2a00:1450:4864:20::331] (port=54240
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArAv-0005v4-U5; Fri, 21 Jan 2022 05:29:48 -0500
Received: by mail-wm1-x331.google.com with SMTP id n8so17015884wmk.3;
 Fri, 21 Jan 2022 02:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N914xUFBOra5Rvb9NzOSNLfwXs1xt8qQ4KEvml0EXtY=;
 b=c/QFQunQRKNxcAJqvhZkTZNTRvQJi5dtASfHtWZu5VenCxo7qSKwfZjtplj2jVTuSU
 XVo0vIF0dAZDgG5XA5DurCJ1qUjb7XGBtEUuTq7okKxo9I7xLGENBfH/DHl7dWOqId4h
 oH8YMxhMy97BSY4peeue7MYpTEfRxvFqCQQJJ8LGsoeCEKLbRtRNR+12378WZ3CQNmZq
 sGXWCr4KtJ4ZJ9UMmhpE//MDN1mX0tQfjuc59kKQeqNkfh4JMddCPiJJuzomeMheoAFi
 0/MtjAO/CwCvkVhMdrZTtxMgyUVZyHd4wyZ/GaKk5KWvgeP0n4B3H3ON+x1bK3L2OHcJ
 HxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N914xUFBOra5Rvb9NzOSNLfwXs1xt8qQ4KEvml0EXtY=;
 b=EI0h43NkGReU8pM2xuSPtxbl6H15M86og0twKDMTg127lRpqC2hq2zfNQeQzCa5n2D
 Xkjk9aZi9RBXibEihTsNt6sc0ZpzuVNFlk1Kr/12EiRo0fhxalK+iuss/ng0XsgISgZR
 BJEMYrdNGesiUzKNXzSAUQDuZDmN/ODPkvsLJOLQU1RhyG4WsHrsgh8MO51tAwypLkoV
 EcDQPMu5GACYhYmwKkUVgDVOqyLld8C73eMKN/bWF8o+6fwUn7nVvBlN1/ajqOSWUcCJ
 jjtntPTvGUPzo0zxDP71K9FG4Bp3csyIi8BGg4ortcZciP7eivSqrZPpa/hJ5qbwkoiR
 aIxw==
X-Gm-Message-State: AOAM533ceSRWqxJLMDLRqfIEPnIH+m416s9YaWHaYuUpCA89Ahju9qu3
 YPFvV371s3Z6AOKJdDWkFlZ9/dJGnp8=
X-Google-Smtp-Source: ABdhPJwbi9C+kzSDnMkiK0KVW/8FSq0XKVVY+NmjDZGHOVkUy7T3scda76Nmt7gRRpf737+J/j7JWA==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr3290089wri.7.1642760983108; 
 Fri, 21 Jan 2022 02:29:43 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id t8sm4793849wmq.21.2022.01.21.02.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 02:29:42 -0800 (PST)
Message-ID: <75e442c1-a61c-f0e0-425c-34047cb284b7@amsat.org>
Date: Fri, 21 Jan 2022 11:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 5/7] drop libxml2 checks since libxml is not actually
 used (for parallels)
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220120113016.268265-1-f4bug@amsat.org>
 <20220120113016.268265-6-f4bug@amsat.org>
In-Reply-To: <20220120113016.268265-6-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/20/22 12:30, Philippe Mathieu-Daudé wrote:
> From: Michael Tokarev <mjt@tls.msk.ru>
> 
> For a long time, we assumed that libxml2 is neecessary for parallels
> block format support (block/parallels*). However, this format actually
> does not use libxml [*]. Since this is the only user of libxml2 in
> while qemu tree, we can drop all libxml2 checks and dependencies too.
> 
> It is even more: --enable-parallels configure option was the only
> option which was silently ignored when it's (fake) dependency
> (libxml2) isn't installed.
> 
> Drop all mentions of libxml2.
> 
> [*] Actually the basis for libxml use were merged in commit 25bfd5a75
>     but the implementation was never merged:
>     https://lore.kernel.org/qemu-devel/70227bbd-a517-70e9-714f-e6e0ec431be9@openvz.org/
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
> [PMD: Updated description and adapted to use lcitool]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  meson.build                                     | 6 ------
>  block/meson.build                               | 3 +--
>  meson_options.txt                               | 2 --
>  scripts/ci/org.centos/stream/8/x86_64/configure | 1 -
>  scripts/coverity-scan/coverity-scan.docker      | 1 -
>  scripts/coverity-scan/run-coverity-scan         | 2 +-
>  6 files changed, 2 insertions(+), 13 deletions(-)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

