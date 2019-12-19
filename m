Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB04C126663
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 17:08:17 +0100 (CET)
Received: from localhost ([::1]:44048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihyLY-0003Vv-Ks
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 11:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ihyKk-00031T-7S
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 11:07:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ihyKj-00026d-4N
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 11:07:26 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:47499)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1ihyKi-0001xL-NH
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 11:07:25 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MnIxu-1i0uL60XTQ-00jIEQ; Thu, 19 Dec 2019 17:07:20 +0100
Subject: Re: [PATCH 108/132] meson: linux-user
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
 <1576758232-12439-17-git-send-email-pbonzini@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7ba5bde7-a113-508e-8373-3bc5db4d9b79@vivier.eu>
Date: Thu, 19 Dec 2019 17:07:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1576758232-12439-17-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2GmYC3/2fYZzni7rzLZi2It0AD4PII2weT9xmwc00mpvanY2kPC
 rSFShXef+Lr0KiDqxODmJ28Ez5Wc7YyEHlKFrDyopGOJP9xqSMHDkErxJk13SSsT/MeCj7u
 2OX+sbZWV5IMqLvqev65N3vIPwW8KrVsSDlruTMq4gekGf6pFkaSEKfZ+lENbu0+vt1cddR
 PzRbRhfSxusr8CwY+uBXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:knR9AQly+ZQ=:0Bvt7nhgMrplx5RXKxFlEV
 DDF/Nnn9aZ1nPiUsMXfNDNYO1uuqvXs3ycuu4B/baPbkz8l+VNmabxxumOJDb1oTvkNUC4ZQA
 cu+tMqBXrxY3B3QEO6xDHcOHlSYWPaI9hIJMqkBIKf01NbTKXULT6O9p6KdHBl6QEI2KFCSKv
 bbqRO7clnnEXAOxnA+8CRwcvE7hLns4mv8gad6nWDkfzqyWtrTIGtsFzIHv0hJMSg4oPf58bw
 a/ndw+KK+AAb8/cBApfmQlP7D+p/fWBaf43HVjcrMJgNasC8cQj38NSAjgyLLmdtEKl9WZcW1
 ysIRLROdyQnKkhGwp5h1FBU0JOmBkY0LPjIP9UUSONI863elMsEMVdAnb5iPqvp3JmLLgALFW
 LdxccbOoJmE3yNZ8jiznrShJEt+2hMGpLX6wQHDxf5+XCsdfIl6WY/s7/CF8qPLFadOBphdHN
 N9BveDxm3vXZnHyHVQNj3naZEl91lSMQiit+7iRwrVyRbSMzCDHIquR7GfVgnDYf08VFzsyYw
 eRkfpsIAWokj+L63nEhjwnNghRCZFrrAy4U0ueY17ygW+g8zxmMuY3PJe/gySsTiknIQGu+Zw
 sKySGRWtuc1BJuUwKPwvnWMqX5gg/EU6dTGSCPMLG6WZXlU33KY5qsyURA0GBQ6g+6Ss7zyoy
 6jvkJruvo9Q7wgjbsgNLSG/DECdG1XPTIwO82OfBiT+smA6ehPg856p4zDZ+9OxCdvkiPB2Ti
 8E+6qvjj1trEIC9eRyrGygXriYUxXY59MpX4WZgYTg7GE6v28JHA+C8McXdJ06lFXT2qri5G3
 2AcSOx1UzmI/krw51Qx6VgM8/1MZRDd7Gos00jONtHBVHWmWnD+18eI4v3FkHLbA98t2GGrnA
 5gJsHreucuZBObT0ovZg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.75
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

Le 19/12/2019 à 13:23, Paolo Bonzini a écrit :
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  Makefile.target                    |  3 ---
>  linux-user/Makefile.objs           | 10 ----------
>  linux-user/arm/nwfpe/Makefile.objs |  2 --
>  linux-user/arm/nwfpe/meson.build   | 10 ++++++++++
>  linux-user/meson.build             | 22 ++++++++++++++++++++++
>  meson.build                        |  4 ++++
>  6 files changed, 36 insertions(+), 15 deletions(-)
>  delete mode 100644 linux-user/Makefile.objs
>  delete mode 100644 linux-user/arm/nwfpe/Makefile.objs
>  create mode 100644 linux-user/arm/nwfpe/meson.build
>  create mode 100644 linux-user/meson.build
> 

Acked-by: Laurent Vivier <laurent@vivier.eu>


