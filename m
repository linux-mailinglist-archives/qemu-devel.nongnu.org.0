Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 60939381B9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 01:18:49 +0200 (CEST)
Received: from localhost ([::1]:44894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZ1ei-0001tM-JX
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 19:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42453)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZ1ZV-0007Dx-Nj
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 19:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZ1ZU-0000BG-Jq
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 19:13:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40120)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hZ1ZU-00008y-E3
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 19:13:24 -0400
Received: by mail-wr1-f67.google.com with SMTP id p11so269488wre.7
 for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 16:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BH8TmM5DqgIS8XULm5dq/x3y3HUVUY9B3/dMbKlrpiw=;
 b=MX3affHtcXQhRo/aEk7bFV6nHj37iOuGbFvpxj3+8pZFF+4TnY/NQ3m54YLxYWSWze
 eFc2v7GJ934fAeD3FtHIAVxUtXFxPMSy+NZ4oYorbn86XrvaE8Tex0JJI3xqaL/3XgUg
 5HU3kXAnTWcmwnLYc85XmIrZ6Fh4uE75v718UQZ7w+j9bRxvufuzVjJAn02Ems+NpU/D
 4ia75LSrzjRyMqrPqzWPIjnH7W5gwcThqQal+lBBPgYVPMrhDuMzQfIZ4bv1symGQG7m
 TmGutY2/yAVnQ0PXmp96DnNlxbaCvVn3AIDfEKrAL1ZmQ8mETr9gRngt0RV8mDb9Z5D+
 D2rA==
X-Gm-Message-State: APjAAAXy+XIjzwGAgszMrmdRTxOaAypJw+sGKddsdg9c4t9JibFY7SuT
 /lspTNauQOehSwxokpXPlJ/m9A==
X-Google-Smtp-Source: APXvYqygnhM3b+UJBQ9ht5rYpsFlGpGx+NimUYD+Sy8yOFFU4YYJYLsYJsCJc8TgqDGI2HdM7CCxrQ==
X-Received: by 2002:adf:de06:: with SMTP id b6mr15958050wrm.0.1559862803323;
 Thu, 06 Jun 2019 16:13:23 -0700 (PDT)
Received: from [192.168.0.156] ([78.192.181.46])
 by smtp.gmail.com with ESMTPSA id t14sm190940wrr.33.2019.06.06.16.13.22
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 16:13:22 -0700 (PDT)
To: Lidong Chen <lidong.chen@oracle.com>, qemu-devel@nongnu.org
References: <cover.1559761541.git.lidong.chen@oracle.com>
 <6b19cb7359a10a6bedc3ea0fce22fed3ef93c102.1559761541.git.lidong.chen@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <140d31ab-e13a-5e5f-7c43-3e6f0bfc2116@redhat.com>
Date: Fri, 7 Jun 2019 01:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6b19cb7359a10a6bedc3ea0fce22fed3ef93c102.1559761541.git.lidong.chen@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [Qemu-devel PATCH v2 1/2] sd: Fix out-of-bounds
 assertions
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, liran.alon@oracle.com,
 liq3ea@gmail.com, armbru@redhat.com, darren.kenny@oracle.com,
 marcandre.lureau@gmail.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/5/19 9:15 PM, Lidong Chen wrote:
> Due to an off-by-one error, the assert statements allow an
> out-of-bound array access.

I believe this is a "v2 RESEND" patch, since there is no change with the
other v2 posted here:
https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg00634.html
So I'll copy paste the same comment I wrote there:

  Not sure via which tree this patch is going (trivial?).
  To the maintainer, please consider adding when applying:

  "This access can not happen. Fix to silent static analyzer warnings."

  As confirmed by Lidong in v1 here:
  https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg01337.html

Thanks,

Phil.

> Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Li Qiang <liq3ea@gmail.com>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> ---
>  hw/sd/sd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index aaab15f..818f86c 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -144,7 +144,7 @@ static const char *sd_state_name(enum SDCardStates state)
>      if (state == sd_inactive_state) {
>          return "inactive";
>      }
> -    assert(state <= ARRAY_SIZE(state_name));
> +    assert(state < ARRAY_SIZE(state_name));
>      return state_name[state];
>  }
>  
> @@ -165,7 +165,7 @@ static const char *sd_response_name(sd_rsp_type_t rsp)
>      if (rsp == sd_r1b) {
>          rsp = sd_r1;
>      }
> -    assert(rsp <= ARRAY_SIZE(response_name));
> +    assert(rsp < ARRAY_SIZE(response_name));
>      return response_name[rsp];
>  }
>  
> 

