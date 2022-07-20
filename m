Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E8057BCB9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 19:33:47 +0200 (CEST)
Received: from localhost ([::1]:39232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEDZz-0004tb-15
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 13:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEDYq-0003Ez-Fd
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 13:32:36 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:42569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEDYp-0000w5-0I
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 13:32:36 -0400
Received: by mail-yb1-xb32.google.com with SMTP id c131so32603070ybf.9
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 10:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QCbiXiQ500EfAifuLdSRYnVFlerxTezn2AFtdHI2kKA=;
 b=zao/UO7Uv7r/OleKxvPuf+eiLRvyPgOWeyqmOYXH02RmHEu3bMkTVm4QbOgGKI/Jb7
 uXcBTnobTrsOvxOq9UgOB2aynPGaOtc/2Ty/VMoOmUYPZ8pokhPu1p6a8H9eZWNvRSOa
 mOeaZk4l4Wp8evVun77W6sq1mtlRdIwedgqwQ3xf90dLdgylSTlZsIX0dIA6pByeXCWv
 170Djzv04wqHrJH9NKW2mhVdMaMcjlNG8ofTw0NrCKVNgCFCeNZGQ60l8ht1ZcETzjqu
 EgmB21puwNIQ7Vx1QmAI/krkEN7j0ESSUHJjOnRNnYrS6ub2dZCZfY3yEJpJv1j12YqL
 hoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QCbiXiQ500EfAifuLdSRYnVFlerxTezn2AFtdHI2kKA=;
 b=q98NpdfldnO92wwOa+vKREmwSZHzTYGOtUupqWSXxnxCmewRg6oR8HmJIAqKTJQkb5
 BeZrJvN0q6qIrx6Ob2Tg+LeaaEZrYboHhwtMhx/Zp7G2FIQ4tDaUuzx93+mb1H3SXTuh
 WTOo8oII3LP0R7gaPgt6bmiVEQ5XqbDG27YXP3Fj3QyycTJhuiNjz3Oqx8wGMTACKoD6
 mrDn8UM4tjlOvj6qhws9myw1TJfW6mjFbOrckFR7ZTRWcQ7uRmZk6mcI39x3w0tguFGq
 jJRSF1FGRQ8yERcG2NdDX17tBtGd0oGYzTD2RlYit0yYRCUas/lADWKFc5F/osPBNnH3
 KZ2A==
X-Gm-Message-State: AJIora+McCouU6HTJv53/4FjesJAEBuY0zQc30rh06Ok+NNDWJGj0/6L
 m3IGjDOboUu8d1uqD5Z7/sYEkLUmbMx5YLLelKFPQA==
X-Google-Smtp-Source: AGRyM1s8F/yOgdbCWBp2cnMXBYfUSHjzcJfOlFkKaTRNVNRNhFEYWIT/QgUl4Uxc2EHJW/rTKV7T90PEFSpEUdDG5ec=
X-Received: by 2002:a25:2f58:0:b0:66e:cf9a:6a2 with SMTP id
 v85-20020a252f58000000b0066ecf9a06a2mr41181890ybv.193.1658338353700; Wed, 20
 Jul 2022 10:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220720152631.450903-1-peter.maydell@linaro.org>
 <20220720152631.450903-4-peter.maydell@linaro.org>
 <20220720162954.hzrv4ypgobcgwmeu@redhat.com>
In-Reply-To: <20220720162954.hzrv4ypgobcgwmeu@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 18:32:22 +0100
Message-ID: <CAFEAcA_COkEZSoy6jRYBmyfwFc787vFs+Nn3s5RWB5AKX62LxQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] configure: Don't use bash-specific string-replacement
 syntax
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

On Wed, 20 Jul 2022 at 17:30, Eric Blake <eblake@redhat.com> wrote:
>
> On Wed, Jul 20, 2022 at 04:26:29PM +0100, Peter Maydell wrote:
> > The variable string-replacement syntax ${var/old/new} is a bashism
> > (though it is also supported by some other shells), and for instance
> > does not work with the NetBSD /bin/sh, which complains:
> >  ../src/configure: 687: Syntax error: Bad substitution
> >
> > Replace it with a more portable sed-based approach, similar to
> > what we already do in quote_sh().
> >
>
> >    for e in $1; do
> > -    e=${e/'\'/'\\'}
> > -    e=${e/\"/'\"'}
> > -    printf '"""%s""",' "$e"
> > +    printf '"""'
> > +    # backslash escape any '\' and '"' characters
> > +    printf "%s" "$e" | sed -e 's/\([\"]\)/\\\1/g'
>
> You've fixed the bashism, but at the expense of a non-POSIX use of
> sed.  POSIX says the input to sed must be a text file (ending in a
> newline; but $e does not), and as a result it always outputs a newline
> (but you don't want a newline before the closing """).  GNU sed
> happens to do what you want for input not ending in a newline, but I
> don't remember off-hand whether BSD sed does, and I know that Solaris
> sed does not.

I just copied the approach we already take in quote_sh:

quote_sh() {
    printf "%s" "$1" | sed "s,','\\\\'',g; s,.*,'&',"
}

Is that also relying on this non-portable sed use?

> If this passes on BSD, then I'm okay with it; but if we want to avoid
> non-POSIX altogether, this should work (using the shell's $() to strip
> the trailing newline we added to keep sed happy):
>
> # backslash escape any '\' and '"' characters
> printf '"""%s""",' "$(printf "%s\n" "$e" | sed -e '/s/\([\"]\)/\\\1/g')"

Mmm.

-- PMM

