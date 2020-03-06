Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06E17C816
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 23:05:25 +0100 (CET)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAL5w-0001W5-0N
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 17:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jAL4g-0000yE-3O
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 17:04:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jAL4e-0005CT-Mz
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 17:04:05 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:56264)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jAL4c-00059f-SB; Fri, 06 Mar 2020 17:04:03 -0500
Received: by mail-wm1-x341.google.com with SMTP id 6so4081655wmi.5;
 Fri, 06 Mar 2020 14:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q6qD/VobKcCH4PwUpLuXbHKucAr9l2DoQW/rKV85TBI=;
 b=eZgkaVMrbhSKVHcOreCjqH/r2S1Zv+J3+FaifRd/FuJtf3VN4P8Iiz/+qgXPyFd0c2
 C2s8CkYAtK6r4ndEqPwwjktCBwGodw8FLlsnLXZc3QOQdEaB4Pt9BvYKr8CJADJLGnrw
 HVV9y5H7ghmztdLzwk/HyWqndzh4RrnfwHjzGGlmlrSxqHYr4D7B2D9WsKA6Tq28Hi+u
 YKiZHi848tIqoMr+a+p9c6JD0MJFqWY8p1V7+8s2B6/dOtuLHsg0JJ+qxaFvia1L8LAO
 u7bqALqoNAEwCVq19+SOCMSZWdJiEfclQ6QhS6rRM0EiAsM6/Qw6j2mMh5/V2XIKo/G7
 bw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q6qD/VobKcCH4PwUpLuXbHKucAr9l2DoQW/rKV85TBI=;
 b=N5+4+H/jDXD5AgCgg3BGo1996xQaSPVaDA5hUHZMCKlWrdIL72Z/TE8nW+MH8a6vc5
 RudBUx0UF1q9TJQnwo/t+M0OQGkPZBexm6x1phtIxQpAXvzzVmWoIRNMGJnz/cUzbVal
 RbRBijfPF5g6qKdZNBCKdA1JWNiIra/Dpf07mbUXUH14+V/2vzBzDU49GWEH4Z7W7BKq
 t7Jl/z0niD+KxWLpLrD6QPHQntYCPL4tpU+XRMYIgGdMS45nRqmEKtjzvpS0u73bZLTE
 EKqoJROisOQoLFJEnlncp7B0RSPS7zO6uhXM1MW4GhU2rbvmzLz3dtd7Jn36RpOjKP4Q
 UTng==
X-Gm-Message-State: ANhLgQ3bqlPnzBjDwuurfJC2gLGJvEMeptHy02zvs/W9n/d5QNRN4RIo
 +PackxYpaRPEerbwZUQk0daFe8baLwZteRY+f18=
X-Google-Smtp-Source: ADFU+vsTDhW5MA2GP5axZ1GK+FGmBNTIrpWqnlXHibZ1wJ2gixF7hi06BbfPmYyXiZMTuLPg1m2ieLeFA9Q/1ElPYjM=
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr5684586wmi.37.1583532239442; 
 Fri, 06 Mar 2020 14:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20200306170456.21977-1-philmd@redhat.com>
In-Reply-To: <20200306170456.21977-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 6 Mar 2020 23:03:47 +0100
Message-ID: <CAJ+F1C+MyXcKOGygp9jPk6J+-oiMhYqKM7Z6DTq0Fywty3ZSrA@mail.gmail.com>
Subject: Re: [PATCH] build-sys: Move the print-variable rule to rules.mak
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: qemu trival <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 6, 2020 at 6:05 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Currently the print-variable rule can only be used in the
> root directory:
>
>   $ make print-vhost-user-json-y
>   vhost-user-json-y=3D contrib/vhost-user-gpu/50-qemu-gpu.json tools/virt=
iofsd/50-qemu-virtiofsd.json
>
>   $ make -C i386-softmmu print-obj-y
>   make: Entering directory 'build/i386-softmmu'
>   make: *** No rule to make target 'print-obj-y'.  Stop.
>   make: Leaving directory 'build/i386-softmmu'
>
> Move it to rules.mak so we can use it from other directories:
>
>   $ make -C i386-softmmu print-obj-y
>   make: Entering directory 'build/i386-softmmu'
>   obj-y=3Dqapi-introspect.o qapi-types-machine-target.o qapi-types-misc-t=
arget.o qapi-types.o qapi-visit-machine-target.o qapi-visit-misc-target.o q=
api-visit.o qapi-events-machine-target.o qapi-events-misc-target.o qapi-eve=
nts.o qapi-commands-machine-target.o qapi-commands-misc-target.o qapi-comma=
nds.o qapi-init-commands.o
>   make: Leaving directory 'build/i386-softmmu'
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  Makefile  | 3 ---
>  rules.mak | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9d4b224126..fdc5d29bb9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -15,9 +15,6 @@ UNCHECKED_GOALS :=3D %clean TAGS cscope ctags dist \
>      help check-help print-% \
>      docker docker-% vm-help vm-test vm-build-%
>
> -print-%:
> -       @echo '$*=3D$($*)'
> -
>  # All following code might depend on configuration variables
>  ifneq ($(wildcard config-host.mak),)
>  # Put the all: rule here so that config-host.mak can contain dependencie=
s.
> diff --git a/rules.mak b/rules.mak
> index e39b073d46..694865b63e 100644
> --- a/rules.mak
> +++ b/rules.mak
> @@ -435,3 +435,6 @@ sentinel =3D .$(subst $(SPACE),_,$(subst /,_,$1)).sen=
tinel.
>  atomic =3D $(eval $1: $(call sentinel,$1) ; @:) \
>           $(call sentinel,$1) : $2 ; @touch $$@ \
>           $(foreach t,$1,$(if $(wildcard $t),,$(shell rm -f $(call sentin=
el,$1))))
> +
> +print-%:
> +       @echo '$*=3D$($*)'
> --
> 2.21.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

