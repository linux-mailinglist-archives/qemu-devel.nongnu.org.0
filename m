Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C295DF326
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 18:32:17 +0200 (CEST)
Received: from localhost ([::1]:45098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMabP-0001dq-HE
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 12:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37553)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iMaXe-0006Io-Os
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:28:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iMaXd-0001Ka-KR
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:28:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38344)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iMaXd-0001KD-C1
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:28:21 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F76183F3D
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 16:28:20 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id b10so888116wmh.6
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 09:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mCvOKuU5JGoVf42zSNc4upgCWBKw7Qb85x2J2MWlprY=;
 b=uncZjP8tXI8tnedsuUOSlQ8LW3ZmQo/SrhG9iBvu3xsRVhRNlMI5A4pZ54axI/Ar/1
 JdSX2ojTsncdZQLN9Bom9ngNeAW8RoGpkFaK3/tg4plBH37FtsK+r9li8nvupmuQhB4t
 7qHMsmJeoXqGBvDC8tcEzvbXbts7ZS3vBKsnvrek1671/6BBhtWNStmEiZD42QoiUX2E
 HrDyJ4OrEVVLQp/AlaLRZbLRfZVFKxqHEs5HUoPscBKU/RLitDQ/Luq3WDPRs4x1FBks
 Lx1JjZr2JmCdZgnfeFzZsDDeTLsseyFpq7h/eWHVb9LPo3spbSNmg4oGTbiygYK8Fn3e
 2jCQ==
X-Gm-Message-State: APjAAAWhAtpW1u7A40zBvvABkTsoXDNXTzs2UmtX/ozcNl5QJVgMExvn
 Cg/HcSqoFJlGd+cvOC3eYvSFi+KV3PRz/yBMNT96sm7uCT/Dl7fwgwEXGiuhog4mzXa9TlXRcbo
 UZSYfZFxXfSXp5RY=
X-Received: by 2002:a05:6000:1c9:: with SMTP id
 t9mr3146466wrx.171.1571675298948; 
 Mon, 21 Oct 2019 09:28:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyp8Us36q1Oy2M2NTPvnSrZx/Dg6jXYWgAA4eS3LLxhpzy6GbN5mgR7AWIrIej3CDqz+3QFaw==
X-Received: by 2002:a05:6000:1c9:: with SMTP id
 t9mr3146440wrx.171.1571675298596; 
 Mon, 21 Oct 2019 09:28:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:847b:6afc:17c:89dd?
 ([2001:b07:6468:f312:847b:6afc:17c:89dd])
 by smtp.gmail.com with ESMTPSA id 17sm4391455wmg.29.2019.10.21.09.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 09:28:18 -0700 (PDT)
Subject: Re: [PATCH v2] Do not use %m in common code to print error messages
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20191018130716.25438-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <001ca3e6-0cfe-eafb-8860-145ff2b7ea09@redhat.com>
Date: Mon, 21 Oct 2019 18:28:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191018130716.25438-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-trivial@nongnu.org, Kamil Rytarowski <kamil@netbsd.org>,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/19 15:07, Thomas Huth wrote:
> The %m format specifier is an extension from glibc - and when compiling
> QEMU for NetBSD, the compiler correctly complains, e.g.:
> 
> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c: In function 'sigfd_handler':
> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c:64:13: warning: %m is only
>  allowed in syslog(3) like functions [-Wformat=]
>              printf("read from sigfd returned %zd: %m\n", len);
>              ^
> Let's use g_strerror() here instead, which is an easy-to-use wrapper
> around the thread-safe strerror_r() function.
> 
> While we're at it, also convert the "printf()" in main-loop.c into
> the preferred "error_report()".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Do not try to g_free() the strings
> 
>  hw/misc/tmp421.c | 4 ++--
>  util/main-loop.c | 3 ++-
>  util/systemd.c   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
> index 9f044705fa..c0bc150bca 100644
> --- a/hw/misc/tmp421.c
> +++ b/hw/misc/tmp421.c
> @@ -120,7 +120,7 @@ static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
>      int tempid;
>  
>      if (sscanf(name, "temperature%d", &tempid) != 1) {
> -        error_setg(errp, "error reading %s: %m", name);
> +        error_setg(errp, "error reading %s: %s", name, g_strerror(errno));
>          return;
>      }
>  
> @@ -160,7 +160,7 @@ static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
>      }
>  
>      if (sscanf(name, "temperature%d", &tempid) != 1) {
> -        error_setg(errp, "error reading %s: %m", name);
> +        error_setg(errp, "error reading %s: %s", name, g_strerror(errno));
>          return;
>      }
>  
> diff --git a/util/main-loop.c b/util/main-loop.c
> index e3eaa55866..eda63fe4e0 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -61,7 +61,8 @@ static void sigfd_handler(void *opaque)
>          }
>  
>          if (len != sizeof(info)) {
> -            printf("read from sigfd returned %zd: %m\n", len);
> +            error_report("read from sigfd returned %zd: %s", len,
> +                         g_strerror(errno));
>              return;
>          }
>  
> diff --git a/util/systemd.c b/util/systemd.c
> index d22e86c707..1dd0367d9a 100644
> --- a/util/systemd.c
> +++ b/util/systemd.c
> @@ -60,8 +60,8 @@ unsigned int check_socket_activation(void)
>               * and we should exit.
>               */
>              error_report("Socket activation failed: "
> -                         "invalid file descriptor fd = %d: %m",
> -                         fd);
> +                         "invalid file descriptor fd = %d: %s",
> +                         fd, g_strerror(errno));
>              exit(EXIT_FAILURE);
>          }
>      }
> 

Queued, thanks.

Paolo

