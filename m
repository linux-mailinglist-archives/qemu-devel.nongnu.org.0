Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604CA1468C5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 14:12:23 +0100 (CET)
Received: from localhost ([::1]:56822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iucHV-0001My-S1
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 08:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iub3M-0002zg-5b
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:53:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iub3L-0001ZB-2w
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:53:40 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iub3K-0001Ym-Tn
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:53:39 -0500
Received: by mail-ot1-x344.google.com with SMTP id p8so2418029oth.10
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 03:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jiEFxAVj/mPGzRjcXJwGIfxc2hM/TdWjGuKvlH0yFAM=;
 b=C4bLCHzO6NQ/k+qHqTnTcU6J3STSEMopUE3fAarUapmH1wYUT8VDnbb6aqXQxCiOBK
 tjjZS1je15dDjjYn5WJ7A+C9IwYjNnstJDIbw3cdVN7brJepFDap1B/tUPhSRPa8K9Z6
 L5Y931si7JUYw8pimeSxgnBzkeL1o2vKQUacMYVYw0zNz/L8kvg7iKsqrdhzBbppgEl+
 SxV10py0MMW+KVIjp/Yyh/yywySfQ1oPaSKokVqAJdsS0NMROPqsIebAp8iVEMGhXUQU
 pJAN2C8etGnth6Wp0wQvSTXNEtbLziBIwnWbLxdzTkG2gtjDxayAh4PCUjx1tngaelPO
 Sh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jiEFxAVj/mPGzRjcXJwGIfxc2hM/TdWjGuKvlH0yFAM=;
 b=UyNjLnWBteycECllWlMCCPyXznckLmUew/9rkc4gCNnZ6QToWRKwB6IWvJVx7k5kqw
 16w+Z6k+r3CSLogbD2RDFzF0icqHaCN2krQwB0RHZajpidmpyV1KpQecSlsw24jWq2DH
 9PZeg9NqPELePKHm59Imn98KGZ4RJMRC9FKVSg7BqPnC9c9WUAFOzsrdqsq/Qc87EdJu
 8oGt3bLKwNVSf55Kw4wTJ3MfjBzwSlpXxLNTKJqeliQqi7XV8B/e8PQIPYx8QZlz80yf
 7ShqmVLPK9io73nDBdKePEoBrzJrqDItgGtrAo44GiDFoJ3aw4DSCB/3JjXDWA13hfZo
 Zmxg==
X-Gm-Message-State: APjAAAXVSbcJcK6LP+capwUGH4uAG0Y41renMHPM6vYuVUY6G5x3J8NF
 dvvtA0FBO98EOjLRELwKa0bGrGaouGorn82sqsoevg==
X-Google-Smtp-Source: APXvYqyBD+bp3ayHUWadu90HXnJ2UiPufQhG+lR76jOjRIUcCM/fDaMLcl6yzFgY6g6kPLWPqVvmFxXk01gBYwDHf0s=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr5115122otd.91.1579780418124; 
 Thu, 23 Jan 2020 03:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20200122172137.7282-1-philmd@redhat.com>
In-Reply-To: <20200122172137.7282-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2020 11:53:27 +0000
Message-ID: <CAFEAcA_4yGD4Tm5LpN3PXP6S_cbFGdVD8jAcnrm2pEyLNteW0w@mail.gmail.com>
Subject: Re: [PATCH] Makefile: List the sphinx documentation in 'make help'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Jan 2020 at 17:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> In commit 5f71eac06e1 we started to support the rST documentation.
> List the build target we need to call to generate the rST files in
> the 'make help' output.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 6562b0dc97..b777f7fcdd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1197,7 +1197,7 @@ endif
>         @echo  '  vm-help         - Help about targets running tests insi=
de VM'
>         @echo  ''
>         @echo  'Documentation targets:'
> -       @echo  '  html info pdf txt'
> +       @echo  '  html info pdf txt sphinxdocs'
>         @echo  '                  - Build documentation in specified form=
at'
>  ifdef CONFIG_GCOV
>         @echo  '  coverage-report - Create code coverage report'

'sphinxdocs' wasn't intended to be a user-facing target.
If you do 'make html' this will build the HTML Sphinx
documentation (as well as any legacy non-Sphinx HTML).

thanks
-- PMM

