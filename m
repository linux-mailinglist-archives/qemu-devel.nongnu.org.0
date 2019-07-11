Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CB8655EC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 13:48:37 +0200 (CEST)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlXYy-0005G9-88
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 07:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40285)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hlXYM-0004oB-MR
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 07:47:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hlXYL-0000Sj-P7
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 07:47:58 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:33555)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hlXYL-0000Hr-It
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 07:47:57 -0400
Received: by mail-oi1-x235.google.com with SMTP id u15so4255224oiv.0
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZAmj2CMK78hSXwv/4i4X4QA7v57YD219cHiMqP00lN8=;
 b=L0c0ftszZpqWYIc8z/pNY2F7aFXcmLaddd4JZ07i/aq5QKUBYRI0LxqzUmeEfB7SKT
 bhqJ1z9HaOsOBmBFGct1+YiNFc7E8qUvuEgwyNSaNJ8g1JGG8MDzUenkVut1uN8avZxN
 ti5g1krN1qRUg4xBFzu0xEpDv+2pehrO4f5cq/qceXvg2HKOOhbYo7hMvzdZ7LD0Unhh
 CE7mvORLI7cGwjsti93h0rhxm5xfWgV0OhDofw4kQDvRJ+j/UykQPo4XEWf15t9V+q7q
 bRjYmCOIjqQuDulFjTQhndV6Pnp4jVi5mCjBH2wYaN/AKPqESsYdncIr+w3nSha6xDhj
 ubUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZAmj2CMK78hSXwv/4i4X4QA7v57YD219cHiMqP00lN8=;
 b=sQ3rMqLOkdI5chTpo1cDCwq3R6VTdqiXFM/Y9jjvYaxfM6XOo+5/CcLmM5yc7nUfHW
 +4GoLGYquWLuRXMVLZzvU7zrtd9Qfte4uE3O1jLkCofMZPS56S9gv4xdXD/sQJsSPR7x
 FWpmVsqhRuzgfYR+1CeKiDnw/Nz3kaYKeHRq4z9UQTJswCNBWkQa06jQXefOTfEqUqHQ
 WlSKe5cmynijjkMmE4jAYunVbafo8dT1wE0tuw9o9UoZ+u55Zxm6yprwM7NyruO3rhm/
 wyTD3nAL056nih5+VkwcqSA+vG9HFFgXLeWWL3BKkzHVC5LYCsHloRSORd+DuptSJxot
 BHjA==
X-Gm-Message-State: APjAAAU4fywDB2zQEl3mp03FullY+Tb+M8PNHC6SSgrmxpH8u9DfHyTo
 FtN79K1oBqHW3ENAZfwVXoLKLA==
X-Google-Smtp-Source: APXvYqwCWdd1RLVYKrV75aCXikBmjSNef9Mkwe6gmUnmBnHJ1+777EzFqiK01eb1ASyVr8DB4q+mqQ==
X-Received: by 2002:aca:5241:: with SMTP id g62mr2030998oib.41.1562845668561; 
 Thu, 11 Jul 2019 04:47:48 -0700 (PDT)
Received: from [192.168.43.94] ([208.54.86.238])
 by smtp.gmail.com with ESMTPSA id s1sm1838712otq.28.2019.07.11.04.47.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 04:47:47 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190711102710.2263-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <acb409f1-67fb-2bfc-8f4e-00cd2c22c840@linaro.org>
Date: Thu, 11 Jul 2019 13:47:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190711102710.2263-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::235
Subject: Re: [Qemu-devel] [PATCH-for-4.1] tests/docker: Install Sphinx in
 the Fedora image
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/19 12:27 PM, Philippe Mathieu-Daudé wrote:
> Since commit 5f71eac06e the Sphinx tool is required
> to build the rST documentation.
> 
> This fixes:
> 
>  $ ./configure --enable-docs
> 
>  ERROR: User requested feature docs
>         configure was not able to find it.
>         Install texinfo, Perl/perl-podlators and python-sphinx
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora.docker | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

