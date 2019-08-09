Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D60871AB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 07:45:12 +0200 (CEST)
Received: from localhost ([::1]:56508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvxiB-0004sv-ET
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 01:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvxhP-00041E-DW
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 01:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvxhO-000283-H4
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 01:44:23 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvxhO-00026L-8x
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 01:44:22 -0400
Received: by mail-pf1-x441.google.com with SMTP id u14so45440610pfn.2
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 22:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L2KnyOgkdlrynBJnS9yh0lUNDzVzf3aLmEm/puFZtaQ=;
 b=AdF5SebJIvdwYg2FDpvZ4oZrTEeTTASafLP4XVfQDFPw8QcMmG6dBEk7meMX00gjEn
 Lw+M6dX3Ge9iZme9wtWxjPizDgrgLaT2nxPX5xficdqLL7EG+xsHGjaHBkMsVsXfAkKa
 +fLFF/edHokPKNVlNa3s52k7JbERRicg5uDt2v0mX5/Hkd1F7Y1XfJ9FfxMur7YElyZz
 8LNLSYa1Hytpl5p5cXEOfs8eSElK7peo3EHfm79+zQhxw2kwqDLkymVtEARBTKME1SgQ
 Y1g1AU7Fw8rUbKC7owXnhVSMD1rnCqj1NwoykLeUSdp8iUX7zCaiOOqEqC8dOQ+vkLKd
 ipdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L2KnyOgkdlrynBJnS9yh0lUNDzVzf3aLmEm/puFZtaQ=;
 b=dVtuoQd5t60JMFRZXyXjQV55f5Wlb+N6fGGcZtlZCO2WtpGUcd4mMkdHF37xenVXoT
 B9xrUEC+ZuuEWA/bf+QF3OR91cTCV9N6CRwlQqsHyIsZOJaHBqj0ZQRLRv2Sy6SmQTSm
 paHmpOYpPC41LA7qPvY/8qIjV2FPqU5XgcoJOl+u4dyRYUpluEwnOvW3yXAR8OGK6xFH
 MktDRbv6Eh/ZGNMVvuRqc47e1Vbii9NUVGDu6fcJ2eZUrFj2VzRyykXepUezCXR2JEdV
 XKVULcKs/QxDYfXeenwBWGnQBHJiSOaaoXYFkzBiVNo5r28iv8DttGUfc0DwRhoFxDVK
 xiaQ==
X-Gm-Message-State: APjAAAVpU7dFkxw7Uj5nEqJgmSdNtHv/5IrW1CePPB8c+/NMA0iGH3jM
 JUxav050+rAN1E9BVEBBjiYMRA==
X-Google-Smtp-Source: APXvYqyHkXv053hrifpT4DbOTL+3d+aGIlR7DZKAlOh4DGHSrsXcdV/RzOTjqvu+907xlkgqo3gjJw==
X-Received: by 2002:a17:90a:6097:: with SMTP id
 z23mr7725483pji.75.1565329460666; 
 Thu, 08 Aug 2019 22:44:20 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id x128sm143294313pfd.17.2019.08.08.22.44.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 22:44:19 -0700 (PDT)
To: Rebecca Cran <rebecca@bsdio.com>, qemu-devel@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org
References: <20190809042909.74988-1-rebecca@bsdio.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6330eca7-6808-d1bc-09f8-2fd3c87551e0@linaro.org>
Date: Thu, 8 Aug 2019 22:44:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809042909.74988-1-rebecca@bsdio.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v2] Update the avx2 configure test to be
 compatible with clang
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

On 8/8/19 9:29 PM, Rebecca Cran wrote:
> clang doesn't support the GCC pragma to enable AVX2, but instead
> requires the command line option -mavx2. Since GCC also supports that,
> remove the pragma lines and add the -mavx2 option when building the
> test. If AVX2 is supported, update QEMU_CFLAGS to include -mavx2 .
> 
> Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
> ---
>  configure | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

No, this has the same problem as v1.


r~

