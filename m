Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE6C565A76
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:57:29 +0200 (CEST)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8OS1-0005eI-3k
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8OQZ-0004vw-I0
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:55:59 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:33593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8OQX-0007u0-Qo
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:55:59 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31c89111f23so35633147b3.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VCuqu0JLcj7XuoUckIUO0MOad5IfUXpGmi263huERa8=;
 b=TLaNEls9nDAOlJmWLNOldJZYTXGFOLznQ3KQUD3AMroBxefD4VG2fi0wwBbO3aek/X
 t4md9ChsM3zu342WWOpIHU6vK3mcc1IU/+N0MK97YIhpkOJFgEzuhM2JcthKNUpAIr3z
 Mu3Z/OmaxavDL5TJ/6Acn2p4s4/pZOuT9Q38W7kqPcoaIEsLk0GTrZebamMPHidvyxNn
 H+W1bnPFVZWQaZzu4H47w0BiVp6s05fncW4phid8CFoihspaLsACGXJ5dqOcyB9Jsap2
 KIek2PKP3quIn6tosfsV8HHfPq56S/IN9Zy+d4t2e95vyv2RQxKgOsTp4awHQ64B0RZJ
 SDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VCuqu0JLcj7XuoUckIUO0MOad5IfUXpGmi263huERa8=;
 b=3mT/b4e65Vl818/w5h2zcXqc3/EyvSUMQctOf+PAG3ohtRM5bZPIDJTrAaegrLbR/8
 W7tKqHjKFlnhL4xuJn8PjjraUQN5Imkq0A3iKVk74qxR8Z0PcWals4zO0WPAyHrSiASM
 QaDfr/jmBxGq8GsUT1AohEyDA6Fiaqaw3FmkIEm5HpFjz4XFrf+IzUgRXs637AC7fkIL
 4k9sVi/NzPkK+tUZcgZkOVR6bidehAPyNGJPjes4r9A0hsda1dhFzo+avzBXvYoq6kJW
 XAiGo5eJqpnYc44n1si4/sjLLeWnnP3ejFJWJxd0xdiyc15C1NUfrtXkk35BlymeaKXo
 VuLQ==
X-Gm-Message-State: AJIora+IejeFtG+ARnPdM1G8vMa4sCXcQXD8ltvzPrnlt+o9VMu89Lmz
 kRvoVK9EYyU8Ju8Kmud0VDuOhgLb7To52OeDKGrcRQ==
X-Google-Smtp-Source: AGRyM1sWbqXrbOfAuqsC4Z3Rbca5QD2kyCJMPKz5vpNe4V46lCbgb3KKjNsCm3xVzWG+8tpHeIIQsFdz+uqanfommYU=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr10775899ywe.455.1656950155671; Mon, 04
 Jul 2022 08:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-8-berrange@redhat.com>
 <CAFEAcA-DeKXAq8o_pYt5oyWRnLPvhWMfTbM+vCFpx8MYyC3ZoQ@mail.gmail.com>
 <YsMMUosglBjbKRgy@redhat.com>
In-Reply-To: <YsMMUosglBjbKRgy@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:55:45 +0100
Message-ID: <CAFEAcA-fK4qqJ7zyNYf5hyGDeWF9YDX0oG_gEWvXMZg4+bmnSw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] tests/style: check qemu/osdep.h is included in all
 .c files
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 4 Jul 2022 at 16:50, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Mon, Jul 04, 2022 at 04:47:16PM +0100, Peter Maydell wrote:
> > On Mon, 4 Jul 2022 at 16:23, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> > >
> > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >
> > > +
> > > +sc_c_file_osdep_h:
> > > +       @require=3D'#include "qemu/osdep.h"' \
> > > +       in_vc_files=3D'\.c$$' \
> > > +       halt=3D'all C files must include qemu/osdep.h' \
> > > +       $(_sc_search_regexp)
> >
> > The rule is not just "included in all C files", but "included
> > as the *first* include in all C files".
>
> Oh right, so we can copy a rule from libvirt to validate that.
>
> It would look like this, but s,config.h,qemu/osdep.h,
>
>
> # Print each file name for which the first #include does not match
> # $(config_h_header).  Like grep -m 1, this only looks at the first match=
.
> perl_config_h_first_ =3D \
>   -e 'BEGIN {$$ret =3D 0}' \
>   -e 'if (/^\# *include\b/) {' \
>   -e '  if (not m{^\# *include $(config_h_header)}) {' \
>   -e '    print "$$ARGV\n";' \
>   -e '    $$ret =3D 1;' \
>   -e '  }' \
>   -e '  \# Move on to next file after first include' \
>   -e '  close ARGV;' \
>   -e '}' \
>   -e 'END {exit $$ret}'
>
> # You must include <config.h> before including any other header file.
> # This can possibly be via a package-specific header, if given by syntax-=
check.mk.
> sc_require_config_h_first:
>         @if $(VC_LIST_EXCEPT) | $(GREP) '\.c$$' > /dev/null; then \
>           files=3D$$($(VC_LIST_EXCEPT) | $(GREP) '\.c$$') && \
>           perl -n $(perl_config_h_first_) $$files || \
>             { echo 'the above files include some other header' \
>                 'before <config.h>' 1>&2; exit 1; } || :; \
>         else :; \
>         fi

As an example syntax checking rule I think this makes a pretty
convincing case for the argument "make is the wrong language/framework
for this job"...

thanks
-- PMM

