Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71443E6E4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:12:15 +0200 (CEST)
Received: from localhost ([::1]:40018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8wo-0004f4-8W
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mg8tz-0001mX-DW
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:09:19 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:44871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mg8tx-0002XN-K5
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:09:19 -0400
Received: by mail-ua1-x92a.google.com with SMTP id e5so12815846uam.11
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cVFSfuEvXqSLqmvyfP/51rF0YAV/sHgQWtLQU0DcrTU=;
 b=kHG5/e0QVx3tPjF3sYd0iFU8O7X9npoU6I2EvvC27yfqSQu6CufeKxF2pfzLwbD03H
 uBQNIonwYWMh6x8GHflQPqG+qevGAi8uI0HH9Qqa+HN1slaf15Q4MGA7Pg5oKc+o/iw8
 XU+DjFTH9P/sMI6+cTlUf9clHEC5NwLtFVt1r9sb1bOsLycZrDGtSwbXMUE7vbwlD5wT
 EWcxwEGFv5TdCFNmUHfYEaXdO998Jge5s1FZZz8IalWStNtKX2hzBorXMRzgqQI7S/Lb
 QRdBpiiglT43GLvg2GM/OzZhk6rBSfsAWrbPpprBFe0hXGhB4TZvVBL90G+Qg8abfqGU
 CR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cVFSfuEvXqSLqmvyfP/51rF0YAV/sHgQWtLQU0DcrTU=;
 b=ICmEgfknI+v1bvlMuYdMJIh+o0AQrK6/VOpW7HfYd40oiLNsutbz65ir6MDF6aYkYv
 AnnX4gPx4KKc8r15M2T52r2I3JZxOwhmh7VQveUEfLTG/gyJPglFDr/I87xWyEH8PhG0
 kjcvUfDSmNx/zy++kIJYUtFpvZ9ik2/7uOkHwSBIBmcK+66bLGN6Kl/nRWwbemGURtv+
 pQUlXR7fvwUjMkbRDgGPh8USLUqDcrbZZ5CEt0fT5DJEfS3ApNYKArXcUn+GI5ORNoH3
 w+/P6Y2YwQBq0/hy78YFMJKk5+aF3k5LWAqoO9vleqbK73UrwYkciEVlNglS0lrgBCzg
 QesA==
X-Gm-Message-State: AOAM532PN0dCEmyxicpXgfG/qJfzc18uG7q0epYT6T7Q8wOlmSkhe/Z3
 E/a/AV+KFI0TCjqP4W2wSFaxaVqJncJHqlqQbRHy8w==
X-Google-Smtp-Source: ABdhPJy+st5JyrpZdCs6LdBhbg5And7vXakBInTXpsmk3L2KcGw7NgcwopZJNICJDMnyRvFDzVUySQfYxRApAajyqP4=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr6265833vsh.30.1635440956110;
 Thu, 28 Oct 2021 10:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-26-alex.bennee@linaro.org>
 <e26b5d8b-fe12-c0f5-0cd3-6a2e7421c0c0@linaro.org>
 <6C94810E-93F3-49E5-B4F7-995C41D64453@gmail.com>
 <869244aa-ef0a-803e-5497-cdb22e1f65f8@linaro.org>
In-Reply-To: <869244aa-ef0a-803e-5497-cdb22e1f65f8@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 11:09:05 -0600
Message-ID: <CANCZdfrop0Zob6zQcuifuh7qVtivWwm7jDqcDqvdUOmt3H5X5Q@mail.gmail.com>
Subject: Re: [PATCH v1 25/28] plugins: add helper functions for coverage
 plugins
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003d8c5405cf6cc544"
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
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
Cc: Fam Zheng <fam@euphon.net>, minyihh@uci.edu,
 "Daniel P. Berrange" <berrange@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, robhenry@microsoft.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Ivanov Arkady <arkadiy.ivanov@ispras.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003d8c5405cf6cc544
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 12:58 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/27/21 9:09 AM, Warner Losh wrote:
> >
> >
> >> On Oct 26, 2021, at 2:25 PM, Richard Henderson <
> richard.henderson@linaro.org> wrote:
> >>
> >> On 10/26/21 3:22 AM, Alex Benn=C3=A9e wrote:
> >>> +#else
> >>> +#include "qemu.h"
> >>> +#include "loader.h"
> >>
> >> There is no bsd-user/loader.h.
> >
> > Should there be?
>
> Probably.  It came with Peter's cleanup of linux-user/qemu.h at
> 3ad0a76928df01726e5872b8530d8e1eaa1a971d.
>
> What I meant with my over-terse response is that Alex's patch is
> incomplete and cannot be
> applied as-is.
>
> I think we should introduce a new header for sharing these new functions
> with plugins/.
> Perhaps something shared, in include/user/.
>

I like that idea. I think there'd need to be some level of effort to rework
bsd-user
to use a common header (though if it's just the header, not much). What's
harder
is sharing the bulk of the ELF loading code because it's the same
everywhere.
Or I should, sadly, say mostly the same everywhere but the 'mostly' can be
worked out w/o a huge amount of fuss.

Warner

--0000000000003d8c5405cf6cc544
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021 at 12:58 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 10/27/21 9:09 AM, Warner Losh wrote:<br>
&gt; <br>
&gt; <br>
&gt;&gt; On Oct 26, 2021, at 2:25 PM, Richard Henderson &lt;<a href=3D"mail=
to:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro=
.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 10/26/21 3:22 AM, Alex Benn=C3=A9e wrote:<br>
&gt;&gt;&gt; +#else<br>
&gt;&gt;&gt; +#include &quot;qemu.h&quot;<br>
&gt;&gt;&gt; +#include &quot;loader.h&quot;<br>
&gt;&gt;<br>
&gt;&gt; There is no bsd-user/loader.h.<br>
&gt; <br>
&gt; Should there be?<br>
<br>
Probably.=C2=A0 It came with Peter&#39;s cleanup of linux-user/qemu.h at <b=
r>
3ad0a76928df01726e5872b8530d8e1eaa1a971d.<br>
<br>
What I meant with my over-terse response is that Alex&#39;s patch is incomp=
lete and cannot be <br>
applied as-is.<br>
<br>
I think we should introduce a new header for sharing these new functions wi=
th plugins/. <br>
Perhaps something shared, in include/user/.<br></blockquote><div><br></div>=
<div>I like that idea. I think there&#39;d need to be some level of effort =
to rework bsd-user</div><div>to use a common header (though if it&#39;s jus=
t the header, not much). What&#39;s harder</div><div>is sharing the bulk of=
 the ELF loading code because it&#39;s the same everywhere.</div><div>Or I =
should, sadly, say mostly the same everywhere but the &#39;mostly&#39; can =
be</div><div>worked out w/o a huge amount of fuss.</div><div><br></div><div=
>Warner</div></div></div>

--0000000000003d8c5405cf6cc544--

