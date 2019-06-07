Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 274EC38BE8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 15:47:21 +0200 (CEST)
Received: from localhost ([::1]:51252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZFDE-0002Zc-5S
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 09:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41339)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZF9U-0000fZ-Ev
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZF9S-0002ea-Oi
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:43:28 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41702)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hZF9S-0002Gx-Cv
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:43:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so2214341wrm.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 06:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QhlZbAmqdabo5pmMETBexYlOSK0+AA4gRQ8EFGmD3u0=;
 b=qyXMBx7NKUdcNmTIKY92I/jKKBP1ypv5J//40kL65uKwAzlEvj6f9Bfjv1GtQjcF2r
 ijsUEA6WSFISkQMMJk10Hh1UDEc7OqXFfq4TdxKu7tiay+Q483X8ZOv7W3EwdSfREgU8
 jS4lsc/kedUijEpq+pcn292pYmf+WCLEPelVKxlBXFJXBWbkqnt2u63/gBo6DHGoSnWf
 XMGUKd27/EA/EpZZ070bPIYGfb5/GbESDQeNJK4kOEL8QYJMu8Exi93e4tXh9Ko8PDpC
 siMo65uXfQsN+WzyEK85Lpvrpl3JhqU/GlFv44j8DwkvH/y43VOD5Ib5rE5WLm8POHuW
 fcuQ==
X-Gm-Message-State: APjAAAUyL5WDM30hOlAArw3bkvxTu7+yQXk4FxHssmAsOJSFnySgbqWC
 oGyrxdJvG6SbHJkmRoZkI334cg==
X-Google-Smtp-Source: APXvYqwjfBD4NIwtlHyS4LvPL23thK1OZd1gz0UmLLeh02OS8FdMt+ipQqhv01ILThmvI7OiFVcXrA==
X-Received: by 2002:adf:ea87:: with SMTP id s7mr31832545wrm.24.1559914996195; 
 Fri, 07 Jun 2019 06:43:16 -0700 (PDT)
Received: from [192.168.0.156] ([78.192.181.46])
 by smtp.gmail.com with ESMTPSA id w6sm2031071wro.71.2019.06.07.06.43.15
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 06:43:15 -0700 (PDT)
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org
References: <20190607091116.49044-1-ysato@users.sourceforge.jp>
 <20190607091116.49044-21-ysato@users.sourceforge.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <919341e7-cc8e-f8be-99c6-7caeeec3c214@redhat.com>
Date: Fri, 7 Jun 2019 15:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607091116.49044-21-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH v17 20/24] target/rx: Use prt_ldmi for
 XCHG_mr disassembly
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/19 11:11 AM, Yoshinori Sato wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Note that the ld == 3 case handled by prt_ldmi is decoded as
> XCHG_rr and cannot appear here.
> 
> Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Again:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  target/rx/disas.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/target/rx/disas.c b/target/rx/disas.c
> index 515b365528..db10385fd0 100644
> --- a/target/rx/disas.c
> +++ b/target/rx/disas.c
> @@ -366,13 +366,7 @@ static bool trans_XCHG_rr(DisasContext *ctx, arg_XCHG_rr *a)
>  /* xchg dsp[rs].<mi>,rd */
>  static bool trans_XCHG_mr(DisasContext *ctx, arg_XCHG_mr *a)
>  {
> -    static const char msize[][4] = {
> -        "b", "w", "l", "ub", "uw",
> -    };
> -    char dsp[8];
> -
> -    rx_index_addr(ctx, dsp, a->ld, a->mi);
> -    prt("xchg\t%s[r%d].%s, r%d", dsp, a->rs, msize[a->mi], a->rd);
> +    prt_ldmi(ctx, "xchg", a->ld, a->mi, a->rs, a->rd);
>      return true;
>  }
>  
> 

