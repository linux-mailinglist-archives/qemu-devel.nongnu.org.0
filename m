Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B74537991
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:07:52 +0200 (CEST)
Received: from localhost ([::1]:60872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdFW-0007Qw-Mz
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nvdCZ-0006Ie-Ew
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:04:47 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nvdCX-0003sK-Dj
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:04:47 -0400
Received: by mail-ed1-x536.google.com with SMTP id h11so13017866eda.8
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ay4PnBo2TWkuTSUvQEQ13njBxz+EJird8GALZmDhVjo=;
 b=O6llzG0yQxwbaqV3SGTFd8W42b/fOL3Nk2HjUk/HEWTyxT2Suv4Uup3nlegHUlLCgk
 URoFVwSN+wdvk7JhxWk6lzXoIeM7NT1Lsl7lZ4qzKyCJAIKcIkXpQqXlgdOPGYJOm8bv
 TmnxqNk3WrFyoXDGbvqljpeqbfn0FTKCPc96zJwHLHRQGHDKM23jDq0lWiBy5cGeentg
 sLDHrPiZG9XOiwKzzFT6Jnzj0iNUROzRO75fGArLsbB6hYYZIc/3cE66FUKrY+ZAt5hq
 0vRKgpLck4gqzsvQZz/pmhizuLog07GkhcR7I/IhjjFYfp55BQoIL9fFFzExX+7XqkYr
 AJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ay4PnBo2TWkuTSUvQEQ13njBxz+EJird8GALZmDhVjo=;
 b=DUtNqOFChz8RIm7AKuolmFW55DZql7MQ+WZoCTtfKcQgWdhe6yqEWKlqTEP3DXfb6p
 Ax5t0Y3AngYCV6It8vwKaLXk+K/wNXhFm36Y0Nr/ddeHLDiivcWLD9eF91G76vs31miC
 m/hivPSsWOFb/towR24H01zwoEOPQr54rjkHws3zht3eBxA5cEtfEb5V2k+WYoexPwy+
 OjzEZsvqkkFPv88EjbQjmq4Kw26aiVHIMI0kEMYRUWq06n5e3czsrPQFFFkbF8OvfFxi
 iyq3ZRNTtl7XHGo7aqNzYKsE4B2riT+FKle7vU/9R9ZQLoGLWmeC7w5gpgU18Wh1z0pH
 vN+w==
X-Gm-Message-State: AOAM5322MDZQlRo6ukzNHq7y4/ywTYew4CTVxqj0HmsRyAEiMde5AXOs
 BxlB9W+ShWv8Pba6aG38WIZ951BKH4HXqLhrLlK5Ng==
X-Google-Smtp-Source: ABdhPJzDduYS2rDGushvU5jrE94rrPO0+0GWW7iTv20W3ZTku9pDHCsQZhzZnfrtQVJpLv/92SNvPFJEDd29yul+ybY=
X-Received: by 2002:a05:6402:3293:b0:42b:aef6:7d3 with SMTP id
 f19-20020a056402329300b0042baef607d3mr29318491eda.371.1653908683233; Mon, 30
 May 2022 04:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2205191553440.3608174@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2205191553440.3608174@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 30 May 2022 16:34:32 +0530
Message-ID: <CAARzgwwkB3LsEJ8HLJPqei-p+M3phFz2rS370gGvy-8Fxhyjbg@mail.gmail.com>
Subject: Re: bios bits for QEMU acpi tests
To: Josh Triplett <josh@joshtriplett.org>
Cc: Igor Mammedov <imammedo@redhat.com>, Qemu devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have gotten past this issue and I was able to successfully build
bits using the latest gcc v9.4.0 available on ubuntu 20.04.2. I have
also tested the generated iso and it seems to work fine.
I am going to clean up my changes and send PRs. Some of the changes
are bug fixes to existing code as well.

On Thu, May 19, 2022 at 4:06 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> Hi Josh:
> I am looking into integrating bios bits into Qemu functional tests for
> acpi. Towards that end, I am trying to compile the code on a newer
> compiler as we might need to make some changes, for example, update acpic=
a
> so that it can recognize newer tables etc.
>
> gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
>
>
> Since grub/python etc are quite old in the tree, on the newer copiler it
> does not build out of the box (it does however build fine on my centos 7.=
9
> vm with gcc version 4.8.5 20150623 (Red Hat 4.8.5-44)).
>
> I have resolved a number of issues and warnings when compiling it on the
> new version of gcc. I will at some point clean then up and share the
> changes through my github (most are cosmetic). However, there is one last
> issue which I am not
> able to get past:
>
> _GLOBAL_OFFSET_TABLE_ in python is not defined
>
> $ nm -g -P -p --undefined build/grub-build-i386-pc/grub-core/python.modul=
e
> | grep -i global
> _GLOBAL_OFFSET_TABLE_ U
>
> I have made the following change in rc/python/Makefile.core.def but with
> no help:
>
>
> --- a/rc/python/Makefile.core.def
> +++ b/rc/python/Makefile.core.def
> @@ -29,7 +29,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DA=
MAGE.
>  module =3D {
>          name =3D python;
>          cppflags =3D '-I$(top_srcdir)/contrib/python -I$(srcdir)/contrib=
-deps/python/Include -D_IEEE_LIBM -D__LITTLE_ENDIAN=3D -I$(srcdir)/contrib-=
deps/fdlibm $(CONTRIB_CPPFLAGS) -include contrib/acpica/acenv.h -DGRUB2 -DA=
CPI_LIBRARY -I$(top_srcdir)/contrib/acpica -I$(srcdir)/contrib-deps/acpica/=
source/include -U__ELF__ -I$(srcdir)/contrib-deps/libffi/include -I$(srcdir=
)/contrib-deps/libffi/src/x86 -I$(srcdir)/contrib-deps/python/Modules/zlib'=
;
> -        cflags =3D '$(CONTRIB_CFLAGS) -fshort-wchar -maccumulate-outgoin=
g-args -Wno-empty-body -Wno-float-equal -Wno-maybe-uninitialized -Wno-missi=
ng-field-initializers -Wno-missing-declarations -Wno-missing-format-attribu=
te -Wno-missing-noreturn -Wno-missing-prototypes -Wno-nested-externs -Wno-o=
ld-style-definition -Wno-parentheses -Wno-redundant-decls -Wno-sign-compare=
 -Wno-shadow -Wno-shift-negative-value -Wno-type-limits -Wno-undef -Wno-uni=
nitialized -Wno-unused -Wno-unused-parameter -Wno-unused-value -Wno-unused-=
variable -Wno-write-strings';
> +        cflags =3D '$(CONTRIB_CFLAGS) -fshort-wchar -fno-pie -no-pie -ma=
ccumulate-outgoing-args -Wno-empty-body -Wno-float-equal -Wno-maybe-uniniti=
alized -Wno-missing-field-initializers -Wno-missing-declarations -Wno-missi=
ng-format-attribute -Wno-missing-noreturn -Wno-missing-prototypes -Wno-nest=
ed-externs -Wno-old-style-definition -Wno-parentheses -Wno-redundant-decls =
-Wno-sign-compare -Wno-shadow -Wno-shift-negative-value -Wno-type-limits -W=
no-undef -Wno-uninitialized -Wno-unused -Wno-unused-parameter -Wno-unused-v=
alue -Wno-unused-variable -Wno-write-strings';
>          enable =3D i386_pc;
>          enable =3D i386_efi;
>
>
> I have ensured that the cflags are infact getting used by gcc. I am not
> sure how to resolve this.
>
> Do you have any ideas?
>
> Thanks,
> ani
>

