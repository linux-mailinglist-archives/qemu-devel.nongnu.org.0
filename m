Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020E8670C2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 15:59:00 +0200 (CEST)
Received: from localhost ([::1]:49700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlw4h-0000j3-0B
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 09:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34057)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlw4P-0000Gn-4p
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:58:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlw4N-0006RL-S8
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:58:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46426)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hlw4K-0006MD-1p
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:58:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so10055171wru.13
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 06:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mOUv4zwctbwa2rdmIdt3+9N9gVvFvK8LOhZkux+xB9E=;
 b=RoTogxSEofGOuLQ4RmwnMLQ+KgkCkFXIJ1WI9bqzVleF6mM8uetqmUNGNohu5U4Lgc
 oliihlRLUvNlBU39JBRjt7ty4aZUedsYyYpqiBykKQ4p/UOID7mR9FocOQhZ38/btEdy
 r42w8Doio8cB1C6cetJIvTRN+QAHXwZ1CUC00vvlsJWG1Kd6NuMHypDFiQXH+4/+8QS7
 pX+EyHpPYG8oUAsLLA0/AhEQMtRIq4beYByNd2C41PT5XOu0dUaISW7BUkOBbkb/kkMP
 aICenrHcY+z0zy80oJ+CwmDZdep9ItKzFLemo4b+QXXaQUSgj3VO1Mm70M6TfxfDYYDb
 q2KA==
X-Gm-Message-State: APjAAAVj7x21/85soiePv1518k6kK4kHNdkyEVs1HP4RtA+7eHxMsb7Y
 2HFkb+n0F8sUCXoUNz0hnjurVQ==
X-Google-Smtp-Source: APXvYqx+xYDMlWlOWXfsjy4wVkQNbMm5MaSPvt+A/5C4KYkxpt6b2ZKb1bKNNUdjGklLSEoYA9gvuQ==
X-Received: by 2002:a05:6000:9:: with SMTP id
 h9mr12321963wrx.271.1562939911112; 
 Fri, 12 Jul 2019 06:58:31 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id s25sm8087796wmc.21.2019.07.12.06.58.30
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 06:58:30 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1562931470-3700-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1562931470-3700-6-git-send-email-aleksandar.markovic@rt-rk.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3a806b99-189a-97aa-fce6-d96af1f5ae5b@redhat.com>
Date: Fri, 12 Jul 2019 15:58:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1562931470-3700-6-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH for 4.1 4/4] target/mips: Add missing
 'break' for certain cases of MTTR handling
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
Cc: arikalo@wavecomp.com, sw@weilnetz.de, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/19 1:37 PM, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> This was found by GCC 8.3 static analysis.
> 

Similar to the previous one:

Fixes: ead9360e2fb
Reported-by: Stefan Weil <sw@weilnetz.de>

> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks for cleaning this!

Regards,

Phil.

> ---
>  target/mips/translate.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index b1cf5f0..ca62800 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -10055,6 +10055,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
>                  gen_mtc0(ctx, t0, rd, sel);
>                  break;
>              }
> +            break;
>          case 12:
>              switch (sel) {
>              case 0:
> @@ -10064,6 +10065,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
>                  gen_mtc0(ctx, t0, rd, sel);
>                  break;
>              }
> +            break;
>          case 13:
>              switch (sel) {
>              case 0:
> 

