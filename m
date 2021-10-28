Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEC443E79D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:59:37 +0200 (CEST)
Received: from localhost ([::1]:34006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg9gf-00061N-3K
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mg9dS-0001Cf-Oz
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:56:18 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mg9dQ-0003I3-B9
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:56:18 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id t127so3362623vke.13
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YufxuHKCoPkSZge0E5ciSU/zgYYhE5iYk4XDfnY5eic=;
 b=3VfAaedUbjecPrPZMICFGRzYBLn7swMMRbdKqvE7xbT2WBl1ew9avsqsSh5ztakuGR
 qi4MDjBkqCAoJAmrHzwKpWIDcmvuNMJoTA7b9vc03YwsSeR/4LVyM1mICUQme7lmorr+
 13+532EnsZ71/DZJqbLr7L+qB70amPnVCJB9U523RDIL07oXL62VJpYTknit12utALCK
 PQRCBDe+WlpunAOMuV+cvfDftoJQjtBVQ3+hIGGPt/GH+4yYwa1W+9UByrJ0pmbU7qu5
 Zmd2GPzSGfuguj/wEB3zO5WRAEAUrN0b+QaG3CXT4KWrWlzQdxRaZKVpwhFDCgtILYjf
 JtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YufxuHKCoPkSZge0E5ciSU/zgYYhE5iYk4XDfnY5eic=;
 b=4DhNXOOUZzu77+NJWpSQ6R9v86EqN5fmZNJsVTYwjh4+7fFwhOHf6eRuW7myvnC2ep
 8qqsri+8IMq/aPO9SH7n0NdPoaz5dw2NBH7OsvrnoE1EBBLxchjXmSShKaP2F7mOqtln
 AeK8Asi3YGh3qDzcTqPjTS5E9CrFSqywhTpOwJzhPv29fhv5XTnLAySHoAR+jDkd4zRX
 MtX1q9h5GtAaIvQ/9ufSmp88x7C1al/cHNSgLjdYDkK1deuMMxRC1Y2+MbVH1psaAUrr
 sKyMXA89e9txgMVeX+xDhKrOWF4XPGDHNgxTu5FdBkHxWgYcVtj94FdE9w0doO8a7/Mv
 n9tQ==
X-Gm-Message-State: AOAM532a1IEiCJ+QVw9h4Mm2ckSc1BKs30z3jJG46xeOmqDuvHPrNHGI
 r+vddfgX0VlDhozcd6v3fYOpLc32ccko7/jeaqzzZA==
X-Google-Smtp-Source: ABdhPJw5ewDo3UEm2LIEzWoqMQYeqNmGzhoGsWwqSfHytVJojKkpujhyfJihUvtkcJ7Z8+6gc3Sv6uJIjwrJyr84ht4=
X-Received: by 2002:a05:6122:2e8:: with SMTP id
 b8mr5537371vko.23.1635443774454; 
 Thu, 28 Oct 2021 10:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-10-imp@bsdimp.com>
 <152e8afa-fc89-5666-e234-a2af6bca6acb@linaro.org>
In-Reply-To: <152e8afa-fc89-5666-e234-a2af6bca6acb@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 11:56:03 -0600
Message-ID: <CANCZdfph7CSPN7KtAT4yGJ7V0wu2BzSVmHmthEEHO1UcXHHHxA@mail.gmail.com>
Subject: Re: [PATCH 09/24] bsd-user/arm/target_arch_cpu.h: Implement system
 call dispatch
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003a123805cf6d6dc8"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Klye Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003a123805cf6d6dc8
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 9:35 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/19/21 9:44 AM, Warner Losh wrote:
> > +                env->eabi = 1; /* FreeBSD is eabi only now */
>
> Surely this should be set target_cpu_init.  Even then it'd be just for
> completeness.  This
> is the kind of thing that shouldn't have escaped linux-user, as it's
> otherwise unused.
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

I see no other uses outside of linux-user, so I'm just going to delete this
line. FreeBSD
used to support OABI in bsd-user, but always badly and so that code was
removed.

Warner

--0000000000003a123805cf6d6dc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 9:35 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;eabi =
=3D 1; /* FreeBSD is eabi only now */<br>
<br>
Surely this should be set target_cpu_init.=C2=A0 Even then it&#39;d be just=
 for completeness.=C2=A0 This <br>
is the kind of thing that shouldn&#39;t have escaped linux-user, as it&#39;=
s otherwise unused.<br>
<br>
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>I see no other uses outside of linux-user, so I&#39=
;m just going to delete this line. FreeBSD</div><div>used to support OABI i=
n bsd-user, but always badly and so that code was removed.</div><div><br></=
div><div>Warner=C2=A0</div></div></div>

--0000000000003a123805cf6d6dc8--

