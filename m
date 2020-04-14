Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F051A848A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 18:22:02 +0200 (CEST)
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOOK1-0000NC-M2
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 12:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jOOHn-0006VS-PG
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jOOHh-0004z1-1p
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:19:42 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40047)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jOMrF-0004Jp-7F
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 10:48:13 -0400
Received: by mail-wr1-x443.google.com with SMTP id h26so3242404wrb.7
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ZR24j9hWskrgk6aq2YDPWPZ+EtU5XKar0fjET1Xo38w=;
 b=SNJRtIP5OiZcLISfO3oZ4TDdN0WDSCTg7eckN6uZFvSpJge5IJ5W7uszsFdXFAXLX/
 Q4f69ozu/n0/iH5GSNyHowrsPWSRrUGzXJcMdFI2vkGeDDEfJUqp7VfNH6n0S2YcHsGE
 EJvetmqsNeJeO0Za4yYp26goD+/GgedvswqHYmvd5kAgeMy3kXK7+q6+tha0zb4upffC
 bxCkZ1IeYJJgFQCjckrPe+BDvkXCmlS2dZjtDq7yuwpKWQucleX/Z1ZPbO2tLB5evJXA
 zjymMWQs8UgPqbMiiMt3Uk5usWwoUClg+4YVq7F3fzp+tPxtFoQJ1AILq28GAucIY/QZ
 +LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ZR24j9hWskrgk6aq2YDPWPZ+EtU5XKar0fjET1Xo38w=;
 b=IBFcTdoGE7ogjWqxTx6chFKfIkILJXl9fVVG8z8rK5kcbDXPYAhsR3kg0o96eq4Cal
 prkQ14MGDC3D30j66qqsvDYUPDTpF9Pe/cSNZqK0rhMmfZl/rPZU1PBQgliQs+Asw0XS
 PPvt6oQr51RhCYwQEaIlZ+5iN723E9fP0VBKno47T98/O3TyNHXFlt4n/hnuC6TNV5XW
 tayGDwaFPTEs07S9pLKqU0caAeiULFSolBYr03VZeCTP+v01tiwIjX2uGa/1gvbAfkMo
 xBFHDYBBvq/1l6QV7z3E3FzHXX3k12zhzDc7VsANnbygZHRCFBq1gPsk9mqCqiYzHa4K
 B54A==
X-Gm-Message-State: AGi0PuYfkFVzgBYRiknk6E6AAp5aNX/Xh5JPJj/QqMgFKQrlj7PsbIOc
 Ld/89VW4vUeEbgPobSRbsbzJYQ==
X-Google-Smtp-Source: APiQypIzsgQ/BrzcUJEgi44YmJ0O15YabQdaKDxTd0iyMF5xlSlQat07r26VW5tACY6ch931/axnkQ==
X-Received: by 2002:adf:a704:: with SMTP id c4mr1681835wrd.303.1586875691662; 
 Tue, 14 Apr 2020 07:48:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x18sm19114640wrs.11.2020.04.14.07.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 07:48:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CB311FF7E;
 Tue, 14 Apr 2020 15:48:08 +0100 (BST)
References: <20200411182934.28678-1-peter.maydell@linaro.org>
 <20200411182934.28678-2-peter.maydell@linaro.org>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.0? 1/3] configure: Honour --disable-werror for Sphinx
In-reply-to: <20200411182934.28678-2-peter.maydell@linaro.org>
Date: Tue, 14 Apr 2020 15:48:08 +0100
Message-ID: <877dyi9l93.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> If we are not making warnings fatal for compilation, make them
> non-fatal when building the Sphinx documentation also.  (For instance
> Sphinx 3.0 warns about some constructs that older versions were happy
> with, which is a build failure if we use the warnings-as-errors
> flag.)
>
> This provides a workaround at least for LP:1872113.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure | 9 ++++++++-
>  Makefile  | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 22870f38672..7b9ae0418d0 100755
> --- a/configure
> +++ b/configure
> @@ -4928,6 +4928,12 @@ if check_include sys/kcov.h ; then
>      kcov=3Dyes
>  fi
>=20=20
> +# If we're making warnings fatal, apply this to Sphinx runs as well
> +sphinx_werror=3D""
> +if test "$werror" =3D "yes"; then
> +    sphinx_werror=3D"-W"
> +fi
> +

I wonder if this would have caught the failure I was seeing on debian9 +
mxe images?

>  # Check we have a new enough version of sphinx-build
>  has_sphinx_build() {
>      # This is a bit awkward but works: create a trivial document and
> @@ -4936,7 +4942,7 @@ has_sphinx_build() {
>      # sphinx-build doesn't exist at all or if it is too old.
>      mkdir -p "$TMPDIR1/sphinx"
>      touch "$TMPDIR1/sphinx/index.rst"
> -    "$sphinx_build" -c "$source_path/docs" -b html "$TMPDIR1/sphinx" "$T=
MPDIR1/sphinx/out" >/dev/null 2>&1
> +    "$sphinx_build" $sphinx_werror -c "$source_path/docs" -b html
>  "$TMPDIR1/sphinx" "$TMPDIR1/sphinx/out" >/dev/null 2>&1

Note this will clash with the simple configure change I made to redirect
the output to config.log.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

