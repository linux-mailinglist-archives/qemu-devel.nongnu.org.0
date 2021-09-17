Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40BB40F6B4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:27:41 +0200 (CEST)
Received: from localhost ([::1]:35948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRC1s-0006qy-RL
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRC00-0005HZ-9B
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:25:44 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:38590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRBzy-00038J-OL
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:25:44 -0400
Received: by mail-ot1-f51.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso12423430ots.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UY8vWBybgg0ziw+oJk2ZxIkD36FVrMBaGrfEqYF6Fm8=;
 b=lI9R0mV9IEAWIfiYhHoXMB3pujel1Y3ebUaiLsYFIiuPkOuyMT+W91hxt+08um44c4
 dfnEso3Fis/K+Q//i9VK4UMU00i29fkZJs6IPV+1nqvc6pRMwOSJKOiEnkR9CYKKR211
 I/Q6zu99pTBh7yEhR9C6r4bSFpFlEmQQLCLrSM6xhRg0am7OvM/05xQ3UwSFON+k75O/
 4ZTuG+EO4mcrxzxEX+BhKLtGNajSoUl2m3sRA87FWCcrVXU+1T/eYR0qUitdd2lnvuaP
 Wpnn7ja+fRdBGoi9bqu+igC0mvgG0T54B06DrUaLh+IKarCJJPG4iX9IFM90O7t7sn9x
 sRlQ==
X-Gm-Message-State: AOAM533Er7CjC4dpJE+zxm31cugLMh+Ui+oHhEtLx4L6b9bhQ4boREr5
 WN4JD+jotoSY9Xbm11BIStgV3ZSic9yOTIrGPiQ=
X-Google-Smtp-Source: ABdhPJyo+QjsU6uMAGZFnYohfdT7im+vajuAh2tbQLnL0m3LHi1kcaoa4+Ooi7E+YcKi0a+BK8UNdFSluc1zYg3O7vA=
X-Received: by 2002:a05:6830:812:: with SMTP id
 r18mr8274706ots.190.1631877941653; 
 Fri, 17 Sep 2021 04:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210917094826.466047-1-thuth@redhat.com>
In-Reply-To: <20210917094826.466047-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 17 Sep 2021 13:25:30 +0200
Message-ID: <CAAdtpL7DkZyE7z-M2trjnXj0mpry95Y-T7-WahgxWg-jfg9gCg@mail.gmail.com>
Subject: Re: [PATCH] travis.yml: Remove the "Release tarball" job
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000775b105cc2f313b"
Received-SPF: pass client-ip=209.85.210.51;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000775b105cc2f313b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 17 sept. 2021 11:48, Thomas Huth <thuth@redhat.com> a =C3=A9crit :

> This is a leftover from the days when we were using Travis excessively,
> but since x86 jobs are not really usable there anymore, this job has
> likely never been used since many months. Let's simply remove it now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .travis.yml | 23 -----------------------
>  1 file changed, 23 deletions(-)
>

Do we have the equivalent job on GitLab?

>

--0000000000000775b105cc2f313b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le ven. 17 sept. 2021 11:48, Thomas Huth &lt;<a href=3D"mailto=
:thuth@redhat.com">thuth@redhat.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">This is a leftover from the days when we were =
using Travis excessively,<br>
but since x86 jobs are not really usable there anymore, this job has<br>
likely never been used since many months. Let&#39;s simply remove it now.<b=
r>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0.travis.yml | 23 -----------------------<br>
=C2=A01 file changed, 23 deletions(-)<br></blockquote></div></div><div><br>=
</div><div>Do we have the equivalent job on GitLab?=C2=A0</div><div><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000000775b105cc2f313b--

