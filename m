Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ECE71242
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 09:04:17 +0200 (CEST)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpoqO-0007pa-NX
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 03:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36197)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hpoqC-0007Q1-6o
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 03:04:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hpoqA-0001N4-7i
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 03:04:04 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43246)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hpoq8-0001Jf-54
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 03:04:01 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so41851501wru.10
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 00:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h1q2psTwUBD0Ao3Xiup7YuSNDYGfpqXrAmXjrAVBqoU=;
 b=OJt5MQ34xMWfppJGCucyuSdBEau3j5GX9YIixOFP3ljS0gMWjSpUJSjM2WlXL9cs5G
 VqlXG+5A+GehMpgSPTlG+ijVnGGoJHtGDduD7WyNMtiOhNajzHwH+ZUXbZlJTIq3G/It
 dys2i/k43fOaADtW1QRLoZ08j5JJjwOa+cmZLi7fAQZ9/bUrsX2HkH43xzjyAit6ocix
 EA1fXT0mpC4qBjDryQCNR3wyyMSZ+6aJeyqbSdN6eJSrVCqQ0x3RMgtcWeXn8XrEcg+U
 URX2dOccBqk4MRFAtcfUkgwS4fWIEWRRUH1wmeEzoyXLqqFBa9vZl0WtfomaM5PKhZeJ
 TnzA==
X-Gm-Message-State: APjAAAUYVYYvhWm74bxmEYle2dOl2VfYFTebNHsW0hHsgLthyyH7wVfT
 FODkRQJWUgkiouJhrjpGSTIqaQ==
X-Google-Smtp-Source: APXvYqw7CqaZI2OtDE59vdiKLblnXEowZpE4mSTmXWGZkcqHTXXdqd4z1KzTq8/wX1UerV6XA1xTxg==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr44246787wro.133.1563865435425; 
 Tue, 23 Jul 2019 00:03:55 -0700 (PDT)
Received: from [192.168.1.38] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id 2sm53907363wrn.29.2019.07.23.00.03.54
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 00:03:54 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190717134335.15351-1-alex.bennee@linaro.org>
 <20190717134335.15351-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a0cc524b-f382-a60e-81dd-100d11397b91@redhat.com>
Date: Tue, 23 Jul 2019 09:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190717134335.15351-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH v2 19/23] tests/docker: invoke the DEBUG
 shell with --noprofile/--norc
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
Cc: Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/19 3:43 PM, Alex Bennée wrote:
> It's very confusing when things work in the debug shell because the
> environment is different from what the test is running. Fix this by
> ensuring we only have the inherited environment from the run shell.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/run | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/docker/run b/tests/docker/run
> index 7aebf4b5698..1014871fec0 100755
> --- a/tests/docker/run
> +++ b/tests/docker/run
> @@ -62,7 +62,7 @@ echo "* Prepared to run command:"
>  echo "  $CMD"
>  echo "* Hit Ctrl-D to continue, or type 'exit 1' to abort"
>  echo
> -$SHELL
> +$SHELL --noprofile --norc
>  
>  if "$CMD"; then
>      exit 0
> @@ -72,7 +72,7 @@ elif test -n "$DEBUG"; then
>      echo "* Hit Ctrl-D to exit"
>      echo
>      # Force error after shell exits
> -    $SHELL && exit 1
> +    $SHELL --noprofile --norc && exit 1
>  else
>      exit 1
>  fi
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

