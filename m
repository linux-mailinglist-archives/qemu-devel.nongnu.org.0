Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A52B175A4A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 13:19:14 +0100 (CET)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8k2T-00025g-8K
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 07:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j8k1K-0000tu-Jr
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 07:18:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j8k1J-0001Sw-GA
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 07:18:02 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:47071)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j8k1J-0001Si-9B
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 07:18:01 -0500
Received: by mail-wr1-x442.google.com with SMTP id j7so12214596wrp.13
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 04:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=XdruoThp7NMZfN1+sDb1UztO4Q1oOK0aayWaVPmQedg=;
 b=SnbbzUC3X4LeTxqxGFKkRLcLQqmX3X5ZH87nW85HWzHmR8eNkAx35qSgMxP7QCTXun
 fBWi2Qqy+PZpOGWHq1uRLQNfQc3XAcEMt7KfRB8ntdjAaN1T4l7XlJuUPm4N+rHF2n4Q
 GBcWAAz4ap8O66AYXTeGn4a33v+R6qOdtPXl1wjvkh0njWYCGxVroR/8v0DqEA0Yleuu
 PLOmJFItzSHd7ZwlWcoli9/8TlEjfuPvFJD+dQxwWfd0nNKeoedgqzmcDfgCY9Wnvt4x
 feSoqbul72xVuphHlPGQLlBxDCQOnrhiQ1xVTlmUASV1JKO+gNVwhfcga9DHGny+OMwq
 0ECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=XdruoThp7NMZfN1+sDb1UztO4Q1oOK0aayWaVPmQedg=;
 b=GZs8tr8oNUf5sonxUp1F3v717Gkl1Tx1XplBzu/aqokftaUADbjray9aYBTXcaql9u
 9xhzQx1NW/qO5Xmgu7d2ul+cLS8eIOdqRSRN9mNWLH1XWw6VAJblmWUlIvKs8LZCufyg
 DL3GqU65Gjyv1fQLPGIdOSXuzCJOgi391wD0GazvuRB2vsFqUWjl54Mqf0ISJR/D64ut
 Dyz77sb2N6VWBWbclVYY0RZFnpeDEDAAjKnmEESKSbYzf8blmhXqCZotnRzLGEgaMdgG
 MZfVVcrqo9JrVnp7d06TMwOw7zcPByeKZiHDUbtCOJ9Aw7K67JZhohSAw6/I82p9hRxB
 K2QA==
X-Gm-Message-State: ANhLgQ2k0FQfU5XZVFiv1P83gdTxTsrRqRP2ugs6qVuJSSqpArfI97OL
 gHuIGFnadNoP2Jly/r6wMlzs6Q==
X-Google-Smtp-Source: ADFU+vvCK9AokoAl6jIszwxdt98RW76wmoUGlWlF59S3R6hzOqkNHyXv405Hg5k/arY13+U79eGfMg==
X-Received: by 2002:a5d:55d1:: with SMTP id i17mr7419818wrw.326.1583151480234; 
 Mon, 02 Mar 2020 04:18:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 90sm27370541wro.79.2020.03.02.04.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 04:17:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AB73E1FF87;
 Mon,  2 Mar 2020 12:17:58 +0000 (GMT)
References: <20200228153619.9906-1-peter.maydell@linaro.org>
 <20200228153619.9906-23-peter.maydell@linaro.org>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 22/33] doc/scripts/hxtool.py: Strip trailing ':' from
 DEFHEADING/ARCHHEADING
In-reply-to: <20200228153619.9906-23-peter.maydell@linaro.org>
Date: Mon, 02 Mar 2020 12:17:58 +0000
Message-ID: <87pndv9ci1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In hxtool files, section headings defined with the DEFHEADING
> and ARCHHEADING macros have a trailing ':'
>   DEFHEADING(Standard options:)
>
> This is for the benefit of the --help output. For consistency
> with the rest of the rST documentation, strip any trailing ':'
> when we construct headings with the Sphinx hxtool extension.
> This makes the table of contents look neater.
>
> This only affects generation of documentation from qemu-options.hx,
> which we will start doing in a later commit.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  docs/sphinx/hxtool.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/docs/sphinx/hxtool.py b/docs/sphinx/hxtool.py
> index 5d6736f3002..7dd223fe362 100644
> --- a/docs/sphinx/hxtool.py
> +++ b/docs/sphinx/hxtool.py
> @@ -60,8 +60,9 @@ def parse_defheading(file, lnum, line):
>      # empty we ignore the directive -- these are used only to add
>      # blank lines in the plain-text content of the --help output.
>      #
> -    # Return the heading text
> -    match =3D re.match(r'DEFHEADING\((.*)\)', line)
> +    # Return the heading text. We strip out any trailing ':' for
> +    # consistency with other headings in the rST documentation.
> +    match =3D re.match(r'DEFHEADING\((.*?):?\)', line)
>      if match is None:
>          serror(file, lnum, "Invalid DEFHEADING line")
>      return match.group(1)
> @@ -72,8 +73,9 @@ def parse_archheading(file, lnum, line):
>      # though note that the 'some string' could be the empty string.
>      # As with DEFHEADING, empty string ARCHHEADINGs will be ignored.
>      #
> -    # Return the heading text
> -    match =3D re.match(r'ARCHHEADING\((.*),.*\)', line)
> +    # Return the heading text. We strip out any trailing ':' for
> +    # consistency with other headings in the rST documentation.
> +    match =3D re.match(r'ARCHHEADING\((.*?):?,.*\)', line)
>      if match is None:
>          serror(file, lnum, "Invalid ARCHHEADING line")
>      return match.group(1)


--=20
Alex Benn=C3=A9e

