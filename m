Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4986C12537D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 21:33:43 +0100 (CET)
Received: from localhost ([::1]:60338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihg0s-0007v2-6C
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 15:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihfyn-0006yi-6E
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 15:31:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihfyj-000659-HY
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 15:31:31 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52412)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihfyf-00061s-UJ
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 15:31:27 -0500
Received: by mail-pj1-x1042.google.com with SMTP id w23so1408832pjd.2
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 12:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EgquuMahjEW5YEjdy3ojcA50VUIAktcr/XHmJSYUEiA=;
 b=o+/C0LqEINS+QtcNH/yIGAolsHPlUAquez6q0HgFiwy7J3Y3tKgV4JSKiBOuiupnjF
 YTzkN5WgaKYmhQb6qDP6zQjiPJCbsVFIVj+siZKqZCMhwUnC0HAME93OuJhG1owQhxI3
 I8sTlifa6jncQxO6Fgbw+vhdXvcsK9vZdrpL7N6rC6nt2dg1m4Aw5PsJC4K92sRVOgkp
 qx/SYpURXuLMFC+KWRSpOBCGjKTUpbBWK88lf28W/RhrQAf6NFp/HufOggGwCxRXPC73
 ffzUAt8Km5qBPNoNLc8V8ynKy4Bg6yUA79HYhEyp43iG7oVPcRwHoz8mSngC+QQ/NzoO
 XwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EgquuMahjEW5YEjdy3ojcA50VUIAktcr/XHmJSYUEiA=;
 b=uF1X55xeqiQ9f3hPkk02ZESq2/eaMg4KHBJPsBjsxHQM8x99qUqPYOp4/6zNB1d7UK
 vlTbPE5MSBLmZkN1i8RehAIxsZesz6yjRkJahyQXpJDPwhMich8zrhfUsDGeDQu6PF+U
 VIbSCWDaauYcl0/myNWfNCsZoieCePM/RUG1joGGEBlPeKVqofJGxB4J02TWO64aFt6W
 9aH82vAnUtRvvpbnqyp3YmTPFR+FghzcvsWJd4LWy24SE+hD90kcpfHZLS+AIUu9pzSu
 A+ykRqRYs+s2JETUpeoBE2rDGI9ifGHlbpDGxWt+5PU/+mDjIbxpZYndpKPTrQx8+2cx
 Vt3Q==
X-Gm-Message-State: APjAAAVwghjB7ZqZviqZLf9tzpTCHpsu3mU/G8O7rV7R30pXw4W1PYbP
 krb9PhfOM7cE4O33FiF93vLtmw==
X-Google-Smtp-Source: APXvYqzDxaFVta1H5y7LC61KAMLQ/pohVFpzDLNjModXZAIVe5PZBVWZDXIKOHfHPipZq+pJP0wGUw==
X-Received: by 2002:a17:902:b902:: with SMTP id
 bf2mr4817097plb.137.1576701083484; 
 Wed, 18 Dec 2019 12:31:23 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id m101sm3955868pje.13.2019.12.18.12.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 12:31:22 -0800 (PST)
Subject: Re: [RFC PATCH v2 6/6] hw/pci-host/designware: Remove unuseful
 FALLTHROUGH comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191218192526.13845-1-philmd@redhat.com>
 <20191218192526.13845-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c54c1c5f-efd4-0a7a-6275-c265997f45a8@linaro.org>
Date: Wed, 18 Dec 2019 10:31:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218192526.13845-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/19 9:25 AM, Philippe Mathieu-Daudé wrote:
> We don't need to explicit this obvious switch fall through.
> Stay consistent with the rest of the codebase.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/pci-host/designware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

