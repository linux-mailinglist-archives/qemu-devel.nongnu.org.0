Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335733A8795
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:32:36 +0200 (CEST)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCvT-0005Rk-6c
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCsc-0001s6-RR
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCsZ-0004kh-Ax
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKuHlR37MTxbbn0wbSqQTUMCv4TwJPRODCv1C2NJeDA=;
 b=gW4ulDI7Q58m0ZP/iqujlYrYoZzoumCsXpLHEsRrmlDjKvVmWjiKg9Y+9EGh3g+0vfXZAo
 4N4sBi/HSa3Wezo/0bxuq8F+R0JG3k2GbCA6MCpLvpdwp9OAGObCGoNOHjfSWvy8bhhg9a
 +A5JJFJeWrwxvYcBv2jwrsLhJwmCg0I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-q1zgE95aNXCe9ySjZjRUWA-1; Tue, 15 Jun 2021 13:29:33 -0400
X-MC-Unique: q1zgE95aNXCe9ySjZjRUWA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso8915028wrf.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rKuHlR37MTxbbn0wbSqQTUMCv4TwJPRODCv1C2NJeDA=;
 b=DmrXX5kF/bXK62SBmCzXeA6kyMSEEA72FD+BAK1N7Z4dOPWOoPw9yQVbzQj9y7sdIH
 BUMZohtLjRWcb8K92W4rFRKlg/B7dIUrrlc8oUosgMXZQyaefrWUuL+tIKF7dMaqUasn
 6Lu2gV83W1/27rptfX35KK0VUarU5K453HuelELviWipBZ7A6C+Rj3OuQoXRosoCOQqe
 attxpPe+1Z8olWPkbjE465t6TTBWLAlkafHkBgKzbsBc6x0oHoUoy9LC8y/qccO4OVcu
 0kQmylej4vf2z48MPnt3k7zODjXtD4psw7YJ9Iywjoc4/WLqQQkFh6vcRXVI3nvrosBd
 9UMw==
X-Gm-Message-State: AOAM532ZSYlfe3/z/YltOq2HfbFVV3WyFHBwT3dlBXJosWJpb/ptchJU
 BtU2SOj2Pi6VSMOSVgz7f9c3YJeokWvalGm8EhLX5R7tmdrR2GqIJGZuBiFYhPugcHKI4y5LTGA
 JXmclmqkOFtq1O8w=
X-Received: by 2002:a05:600c:4ba1:: with SMTP id
 e33mr6613507wmp.39.1623778172125; 
 Tue, 15 Jun 2021 10:29:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLlrvG483iv3GMMhWgffGzVnNCHnuHABYzqpwpn3gfYWXu1GDOkECmOth3Jm6aN6rxg9KBQg==
X-Received: by 2002:a05:600c:4ba1:: with SMTP id
 e33mr6613481wmp.39.1623778171884; 
 Tue, 15 Jun 2021 10:29:31 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k11sm2745518wmj.1.2021.06.15.10.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 10:29:31 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] crypto: Make QCryptoTLSCreds* structures private
To: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210615172746.2212998-1-philmd@redhat.com>
 <20210615172746.2212998-8-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <481d9c73-972f-9b63-f880-4de6ec211520@redhat.com>
Date: Tue, 15 Jun 2021 19:29:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615172746.2212998-8-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-block@nongnu.org,
 Leonardo Bras <leobras.c@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 7:27 PM, Philippe Mathieu-Daudé wrote:
> Code consuming the "crypto/tlscreds*.h" APIs doesn't need
> to access its internals. Move the structure definitions to
> the "tlscredspriv.h" private header (only accessible by
> implementations). The public headers (in include/) still
> forward-declare the structures typedef.
> 
> This solves a bug introduced by commit 7de2e856533 which made
> migration/qemu-file-channel.c include "io/channel-tls.h",
> itself sometime depends on GNUTLS, leading to build failure
> on OSX:
> 
>   [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel.c.o
>   FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
>   cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/migration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
>   In file included from ../migration/qemu-file-channel.c:29:
>   In file included from include/io/channel-tls.h:26:
>   In file included from include/crypto/tlssession.h:24:
>   include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
>   #include <gnutls/gnutls.h>
>            ^~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
> Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++
>  include/crypto/tls-cipher-suites.h |  6 ----
>  include/crypto/tlscreds.h          | 16 -----------
>  include/crypto/tlscredsanon.h      | 12 --------
>  include/crypto/tlscredspsk.h       | 12 --------
>  include/crypto/tlscredsx509.h      | 10 -------
>  crypto/tls-cipher-suites.c         |  7 +++++
>  crypto/tlscredsanon.c              |  3 +-
>  crypto/tlscredspsk.c               |  3 +-
>  crypto/tlscredsx509.c              |  4 +--
>  crypto/tlssession.c                |  1 +
>  11 files changed, 58 insertions(+), 61 deletions(-)

> index bea5f76c55d..2675b1af8f8 100644
> --- a/crypto/tlscredsanon.c
> +++ b/crypto/tlscredsanon.c
> @@ -26,9 +26,10 @@
>  #include "qom/object_interfaces.h"
>  #include "trace.h"
>  
> -

Involuntary line removal :/ Can restore if v4 required.

>  #ifdef CONFIG_GNUTLS
>  
> +#include <gnutls/gnutls.h>
> +
>  
>  static int
>  qcrypto_tls_creds_anon_load(QCryptoTLSCredsAnon *creds,
> diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
> index f5a31108d15..820719c5e84 100644
> --- a/crypto/tlscredspsk.c
> +++ b/crypto/tlscredspsk.c
> @@ -26,9 +26,10 @@
>  #include "qom/object_interfaces.h"
>  #include "trace.h"
>  
> -
>  #ifdef CONFIG_GNUTLS
>  
> +#include <gnutls/gnutls.h>
> +
>  static int
>  lookup_key(const char *pskfile, const char *username, gnutls_datum_t *key,
>             Error **errp)
> diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
> index d9d6f4421e5..44dbe0dc819 100644
> --- a/crypto/tlscredsx509.c
> +++ b/crypto/tlscredsx509.c
> @@ -27,12 +27,10 @@
>  #include "qom/object_interfaces.h"
>  #include "trace.h"
>  
> -
>  #ifdef CONFIG_GNUTLS
> -
> +#include <gnutls/gnutls.h>
>  #include <gnutls/x509.h>
>  
> -
>  static int
>  qcrypto_tls_creds_check_cert_times(gnutls_x509_crt_t cert,
>                                     const char *certFile,


