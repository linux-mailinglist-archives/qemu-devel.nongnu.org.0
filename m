Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A301546FF0B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 11:52:07 +0100 (CET)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvdVW-0003le-QP
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 05:52:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvdU0-0001sm-AX
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:50:32 -0500
Received: from [2a00:1450:4864:20::42a] (port=38652
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvdTs-0001ID-6h
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:50:31 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q3so14212311wru.5
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 02:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xqfkr+ueKBohNoj+V1Ha9RWuhMEPRyqzYnFRfklr4uI=;
 b=QTc77Be0oOm3p/mcKzjYlp+0N78vgaYDB+cr4i4cCNp1nDzUnQXyPLc1NyD+ZzwR8V
 PxPaPNP7c2oRo6bd1QPcz6fMIdYyu/rvGEEAdgOVcFfTARFHqN7/kU0BmmLA3S6G1WhL
 OhNa2McFG+pZ0bAkmqXOGYCE1G8CUTgtwsK5hrHjvLPBTiTJ5kJRTi8HTHpGS6xqNpRZ
 o8APDIaF+yfhw5EO5yvO/UzcCYh6qVT2j70ySUm5dZfCNeFllqxxnI9W2ZD2syREkEEc
 q++ZOnEe+vRLQ5qXqMxocnXA2+7ARXEv/asaDygnEDCcYdZPgwS2KPKCJzXHE4V/R/vI
 fDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xqfkr+ueKBohNoj+V1Ha9RWuhMEPRyqzYnFRfklr4uI=;
 b=biwhnzZPbWtWRK+T5ZGq9Mp5d7zd9mqt+1tcTUV/nUwExTCZjwMUTxjVB2HHw7ZP2o
 CWB4jcFpdopNpPg57x4d3FkJBnykxBcpA+OIVNsiHjGRuZARHixrd9SOoE6D4mQpziL5
 ah8TkQYt0/NkgkMuaKNWglwWRMWFZuVXL08FAA7xm+7R/X+C0F1KA3rgCrKEbMOAtaHD
 pX3eXAY8kmZewJMcM5LxQWK8h57POJnYHlSLxgBEpXlp2dJt1hf6rhtp17+EJb6wJaem
 xqD2b1immHiV1xp88KN+DSqQNJLYxgcXCjfXkpGacTvyQ5sGHyGI8h/tAry4J7xslrVj
 l/nw==
X-Gm-Message-State: AOAM533zeWYvIZInn0lvOs4iFPJbGpc9inWlft0vigDVoOOYZ27eBOOb
 PiDAKjoZWf7XbCdjvt0eT58reYWF4/oIBfW1yieWKw==
X-Google-Smtp-Source: ABdhPJxANd6uy5JGktgqPq8ZAWit9+Cj+1mzROqUo3ZKki/4FcNQ5f8OeVqQzqtuqEClCYtzJdXAwv3/6YQAP07uKVI=
X-Received: by 2002:adf:f64b:: with SMTP id x11mr13412143wrp.4.1639133422691; 
 Fri, 10 Dec 2021 02:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20211210085206.25811-1-pbonzini@redhat.com>
In-Reply-To: <20211210085206.25811-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 10:50:11 +0000
Message-ID: <CAFEAcA_9t_8h0OWkjGeDJGMh-Og6f=x==txSJLBWT1aCRu1WoQ@mail.gmail.com>
Subject: Re: [PATCH] configure: remove DIRS
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Dec 2021 at 10:01, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> DIRS is used to create the directory in which the LINKS symbolic links
> reside, or to create directories for object files.  The former can
> be done directly in the symlinking loop, while the latter is done
> by Meson already, so DIRS is not necessary.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/configure b/configure
> index 80b5d0c148..4f7ed2ad1a 100755
> --- a/configure
> +++ b/configure
> @@ -3794,7 +3794,6 @@ if test "$safe_stack" = "yes"; then
>  fi
>
>  # If we're using a separate build tree, set it up now.
> -# DIRS are directories which we simply mkdir in the build tree;
>  # LINKS are things to symlink back into the source tree
>  # (these can be both files and directories).
>  # Caution: do not add files or directories here using wildcards. This
> @@ -3806,12 +3805,6 @@ fi
>  # UNLINK is used to remove symlinks from older development versions
>  # that might get into the way when doing "git update" without doing
>  # a "make distclean" in between.
> -DIRS="tests tests/tcg tests/qapi-schema tests/qtest/libqos"
> -DIRS="$DIRS tests/qtest tests/qemu-iotests tests/vm tests/fp tests/qgraph"
> -DIRS="$DIRS docs docs/interop fsdev scsi"
> -DIRS="$DIRS pc-bios/optionrom pc-bios/s390-ccw"
> -DIRS="$DIRS roms/seabios"
> -DIRS="$DIRS contrib/plugins/"
>  LINKS="Makefile"
>  LINKS="$LINKS tests/tcg/Makefile.target"
>  LINKS="$LINKS pc-bios/optionrom/Makefile"
> @@ -3840,9 +3833,9 @@ for bios_file in \
>  do
>      LINKS="$LINKS pc-bios/$(basename $bios_file)"
>  done
> -mkdir -p $DIRS
>  for f in $LINKS ; do
>      if [ -e "$source_path/$f" ]; then
> +        mkdir -p `dirname ./$f`
>          symlink "$source_path/$f" "$f"
>      fi
>  done

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Ideally at some point we should move the LINKS stuff into
meson too, and get rid of the wildcarding. pc-bios/meson.build
already has to have an explicit list of the blobs that we
here are handling via wildcards.

thanks
-- PMM

