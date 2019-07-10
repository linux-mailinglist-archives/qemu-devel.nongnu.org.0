Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6825764526
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 12:23:26 +0200 (CEST)
Received: from localhost ([::1]:59740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl9kz-0008NJ-LN
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 06:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40272)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hl9k0-0007Nd-PB
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:22:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hl9jy-00048Q-QA
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:22:24 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40076)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hl9jx-0003uE-HV
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:22:22 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so1663703wmj.5
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 03:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ll2mQ9aZWRQ4mMGTvnZvalGdQmmyD4heGZJ1CmBKXfI=;
 b=F5+WteRhx50IAlafAOtt3VhcZDZBxkGHK+fPF9DqgOJSTb9GZ5bgkJdqZ6yONaLCNT
 XNS0qA4LxB/EGseEVLi5U6fdr1iU5JsfZXg8z7SLh3ORzn7qofZ0h1qBnhwj+2v3N7LA
 QOzCotXbVk9/tqIKeaqBx/UKrhc/ezhFP0OCsqPGd28Frk89YgzF/wJ7ntvYRlSREmjx
 6Jl63wF/aCeLJhJVwIA6XGHwbfaBYCxQrUDH6j8gmh/wiflnPVMMYePBWNKnIpG+vpwv
 em+HsSPdmwEFc43CELT1k+4NLKqw3mf4Lu3waw5PDxvRkZkZXwMgT7YTx5Ur07Ikeqd+
 BHeQ==
X-Gm-Message-State: APjAAAVsBMeiZ6Vzq4KDwX+P2e2KWIs9kKkKQXgjczLhzraFUjtRZevr
 lX6o4J1AsIW485xC4CuXga3F5w==
X-Google-Smtp-Source: APXvYqwU8rRdyJIg/6Mk5bruqdn4qNupI14mt+nEmI17jDGqHImpmOqnAZ2010/GkRXaOvaW219dYw==
X-Received: by 2002:a1c:7a02:: with SMTP id v2mr4673976wmc.159.1562754134549; 
 Wed, 10 Jul 2019 03:22:14 -0700 (PDT)
Received: from [10.32.224.100] (red-hat-inc.vlan560.asr1.mad1.gblx.net.
 [159.63.51.90])
 by smtp.gmail.com with ESMTPSA id r5sm1944106wmh.35.2019.07.10.03.22.13
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 03:22:13 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190709184823.4135-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c167f496-57c3-1e90-82fd-109b68be1d23@redhat.com>
Date: Wed, 10 Jul 2019 12:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190709184823.4135-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH] tcg/aarch64: Fix output of extract2 opcodes
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/19 8:48 PM, Richard Henderson wrote:
> The aarch64 argument ordering for the operands is big-endian,
> whereas the tcg argument ordering is little-endian.  Use REG0
> so that we honor the rZ constraints.
> 
> Fixes: 464c2969d5d
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.inc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
> index b0f8106642..0713448bf5 100644
> --- a/tcg/aarch64/tcg-target.inc.c
> +++ b/tcg/aarch64/tcg-target.inc.c
> @@ -2226,7 +2226,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>  
>      case INDEX_op_extract2_i64:
>      case INDEX_op_extract2_i32:
> -        tcg_out_extr(s, ext, a0, a1, a2, args[3]);
> +        tcg_out_extr(s, ext, a0, REG0(2), REG0(1), args[3]);
>          break;
>  
>      case INDEX_op_add2_i32:
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

