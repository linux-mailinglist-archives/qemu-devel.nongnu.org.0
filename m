Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3334A72FC8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 15:23:42 +0200 (CEST)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqHF7-00047T-Dj
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 09:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqHEs-0003j3-RJ
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 09:23:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqHEr-0005dR-0F
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 09:23:25 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:55178)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqHEq-0005cw-PZ
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 09:23:24 -0400
Received: by mail-wm1-f44.google.com with SMTP id p74so41804506wme.4
 for <qemu-devel@nongnu.org>; Wed, 24 Jul 2019 06:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aEMD1b3mg5oL41JBr4ewL4wiyLUgNVTihSMRgWv9WZQ=;
 b=lO4mFN/sj4B9Z4H02uPy1H8Q/JuEj4xOTBBl6gquNbKR8pcpn6ZkYsDjsTuGi6UehR
 GNUsE9s2aIVBktEmiKnl13JAvrQVCs/HhYBpIaDlzFe3HUBoHYuQcBg+QaN4ICkhdkfX
 7T+eNA3Rs365RFJlww9NMxZu0lq+Dn8g27J2FkffZqY7a9+5IymzQTqVWCmPacnjw9qm
 C0jJW2e4q7g3nTFmexqhnEZnr720SsViMUMJlkjQQMLwUl3pU7pdFVKz0GTmV13wT26x
 VG237wLDXIa55FNy752HtQD67B4FGMg95Bv8aBldMJA4LaG07hBMozRIoFyOaOA+7hy4
 WSPw==
X-Gm-Message-State: APjAAAUxGeQ1UIPQ29OTUnk9ir288DZIIdVGmd7behzOmQBR+QpJZxbo
 N3Zx6kHdpWc7X4LR2a8W87WKig==
X-Google-Smtp-Source: APXvYqzhNrSTATtMu3ju3L4JfFxDEzb49e3bBm9S40hSJNs3rCg6P+Vy3RG4Ye+mq7uzSjanJBnK0Q==
X-Received: by 2002:a1c:4803:: with SMTP id v3mr75641163wma.49.1563974603718; 
 Wed, 24 Jul 2019 06:23:23 -0700 (PDT)
Received: from [10.201.33.105] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id c6sm45733632wma.25.2019.07.24.06.23.22
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 06:23:22 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20190724131309.1378-1-pbonzini@redhat.com>
 <20190724131309.1378-4-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <21ad7858-d1f6-acae-cf3f-fd2404575138@redhat.com>
Date: Wed, 24 Jul 2019 15:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190724131309.1378-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.44
Subject: Re: [Qemu-devel] [PULL 3/3] docs: correct kconfig option
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/24/19 3:13 PM, Paolo Bonzini wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20190723120804.29565-1-marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Not a big deal bug I reviewed this one:
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg05128.html
(wondering if patchwork/patchew is loosing mails/tags).

> ---
>  docs/devel/kconfig.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
> index d6f8eb0977..b7bca44704 100644
> --- a/docs/devel/kconfig.rst
> +++ b/docs/devel/kconfig.rst
> @@ -267,7 +267,7 @@ the default configuration by uncommenting lines in the first group,
>  or commenting out lines in the second group.
>  
>  It is also possible to run QEMU's configure script with the
> -``--with-default-devices`` option.  When this is done, everything defaults
> +``--without-default-devices`` option.  When this is done, everything defaults
>  to ``n`` unless it is ``select``ed or explicitly switched on in the
>  ``.mak`` files.  In other words, ``default`` and ``imply`` directives
>  are disabled.  When QEMU is built with this option, the user will probably
> 

