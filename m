Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6153F1E0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 23:55:58 +0200 (CEST)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyKhY-0004Ao-R7
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 17:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyKfp-0003Tf-6M
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 17:54:09 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:41615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyKfk-0000od-1Q
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 17:54:08 -0400
Received: by mail-oi1-x235.google.com with SMTP id r206so21500279oib.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mkMvfuAuKoA8LcUTpu4NmVqmwW6rgWnAdCTvXbEw5Vk=;
 b=mQK61u+Hs4DMs9c5DbSND+2oolIzP+5oHk5Cf8OnikxOyk5oW3JtWIhFyVMsbqwUIl
 +b+KGfUqNR/zC0Ren6CLdvJNhEkgiqvKH3JFhg+pan5mEXziUURCBNadTMsKO5O07xC8
 zBg2Vbp1arYthyyyL/EdyWYwQyHmWaTnDQ88nSNb+BSeEmnI0jd9lyuPWRAndRE+XCzt
 cgExAmUavz+JYX6+yNoaVR7YsjfxUYEICfwAYNE0XDACqCr1aDYrHzdW0m4Q1FnaRMTc
 KtbuGtq6p8C5s5XoDPwqqWg5glwc8AFysZ86byKOmYsHKi5VZazqNZ1hzBS1qwZBgtvy
 Ev5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mkMvfuAuKoA8LcUTpu4NmVqmwW6rgWnAdCTvXbEw5Vk=;
 b=RUhlC8nAFG5T7AhabAWnDqIPEiQQxppNniRysPXg76RFsiDK4Qzf/3Hd6EwG7jE1Rj
 txSRTNXzSiWa+2fJc1Lb/9wz3UOGvN/AcyrHq5q2Bf8oMYO/zxAYfB49cRQpP8XI6Abt
 XbFoAcks/l2FLyaYAYa4+6f1jV7p7wexiuSq6a0Pdk3zkX287+2JSbS97S/rkXl9qUAB
 USIjn84WM75gJt/Px1o7APTQkCeCMvdfXHZqztI+BrQxFPZD4U50r8YQvokwhUjg+oIQ
 1c0bv50M86psFb2tEn7VPiQk5Cvda5+nhI/iH2SyGH3q8PFeiTGLNELGpgzWdQ1j7Dgd
 zV5w==
X-Gm-Message-State: AOAM533z6K+PbwshxOjA3AvdCi8f6U0h2oWyrvLWDeSRzk9YoU3+zJSY
 Dw2EEs2bDxGNvDl6A4FYGWrha1OMrb+syW2bAQw=
X-Google-Smtp-Source: ABdhPJyyaWHj9f+Uf4ID2IAiJr8vntEDXkSDs6hu0Ppgf/VELU3XkNUVI+PvilKUstq645LC+Y2MHtVQGlCosuGifeY=
X-Received: by 2002:a05:6808:2126:b0:32e:a750:f8b4 with SMTP id
 r38-20020a056808212600b0032ea750f8b4mr2370256oiw.278.1654552442775; Mon, 06
 Jun 2022 14:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220606164336.245740-1-kchamart@redhat.com>
 <20220606164336.245740-3-kchamart@redhat.com>
In-Reply-To: <20220606164336.245740-3-kchamart@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Jun 2022 07:53:36 +1000
Message-ID: <CAKmqyKPjUStYAuUUhBO3y69Fb5EPEyVDWMK9imDExRUES_5AjA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] docs: rSTify MailingLists wiki; move it to QEMU Git
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 7, 2022 at 2:46 AM Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> This document is referred to from the GettingStartedDevelopers wiki
> which will be rSTified in a follow-up commit.
>
> Converted from Mediawiki to rST using:
>
>     $> pandoc -f Mediawiki -t rst MailingLists.wiki
>         -o mailing-lists.rst
>
> The only change in this coversion is that I have removed the users
> mailing list, as it will be referred to from a different document from
> the docs/about/ directory.
>
> Besides that, this is almost a 1-1 conversion (I double-checked to the
> best I could).  I've also checked that the hyperlinks work correctly
> post-conversion.
>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/devel/index.rst         |  1 +
>  docs/devel/mailing-lists.rst | 51 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 docs/devel/mailing-lists.rst
>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 424eff9294..fb9d9f3a80 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -12,6 +12,7 @@ modifying QEMU's source code.
>
>     code-of-conduct
>     conflict-resolution
> +   mailing-lists
>     build-system
>     style
>     kconfig
> diff --git a/docs/devel/mailing-lists.rst b/docs/devel/mailing-lists.rst
> new file mode 100644
> index 0000000000..4533179f1f
> --- /dev/null
> +++ b/docs/devel/mailing-lists.rst
> @@ -0,0 +1,51 @@
> +.. _mailing-lists:
> +
> +Mailing lists
> +=============
> +
> +-  `QEMU developers mailing
> +   list <http://lists.nongnu.org/mailman/listinfo/qemu-devel>`__
> +-  `QEMU stable mailing
> +   list <http://lists.nongnu.org/mailman/listinfo/qemu-stable>`__
> +-  `QEMU trivial patch mailing
> +   list <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>`__
> +
> +.. _subsystem_specific_lists:
> +
> +Subsystem Specific Lists
> +------------------------
> +
> +These exist to make it a little easier to follow subsystem specific
> +patches. You should however continue to CC qemu-devel so your series
> +gets wide visibility.
> +
> +-  `QEMU ARM mailing
> +   list <https://lists.nongnu.org/mailman/listinfo/qemu-arm>`__
> +-  `QEMU block devices mailing
> +   list <https://lists.nongnu.org/mailman/listinfo/qemu-block>`__
> +-  `QEMU PowerPC mailing
> +   list <https://lists.nongnu.org/mailman/listinfo/qemu-ppc>`__
> +-  `QEMU RISC-V mailing
> +   list <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>`__
> +-  `QEMU s390x mailing
> +   list <https://lists.nongnu.org/mailman/listinfo/qemu-s390x>`__
> +
> +If a subsystem maintainer thinks that a new mailing list for their
> +subsystem would make life easier, we're happy to create one -- mail
> +qemu-devel to suggest it (ideally cc'ing the people listed as Savannah
> +project admins in our `AdminContacts <AdminContacts>`__ page, as they
> +are the ones with the ability to make the change).
> +
> +If you are a Savannah project admin, you may want the `technical notes
> +on how to create and configure a new
> +list <Contribute/MailingLists/Creation>`__.
> +
> +.. _access_via_lore.kernel.org:
> +
> +Access via lore.kernel.org
> +--------------------------
> +
> +The qemu-devel mailing list is also archived via
> +`public-inbox <https://public-inbox.org/>`__ on
> +https://lore.kernel.org/qemu-devel/ and accessible via NNTP at
> +nntp.lore.kernel.org (newsgroup org.nongnu.qemu-devel).
> --
> 2.36.1
>
>

