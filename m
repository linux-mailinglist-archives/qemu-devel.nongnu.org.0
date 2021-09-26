Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACAF418A51
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:19:29 +0200 (CEST)
Received: from localhost ([::1]:51788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUXoG-0005hc-Dc
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUXlZ-0003xx-Ql
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:16:41 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:38583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUXlY-0007a2-CV
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:16:41 -0400
Received: by mail-vs1-xe30.google.com with SMTP id y141so15598848vsy.5
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 10:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IzWtB6bp+HsW5R7tvdL9ymGIFOzrGaAAmvMyXP5aeaY=;
 b=cJXboH61VBCNkCFrY3tWmLsCZtB8KQbrG8uS7/WukxQrvG+nHlv5Q6UwtlgoQfBKc4
 N/sZUIkmHJpYeINDlH0GkdWKq1WAHuxzQbYvdPRR8+H5ugv3u2qWtzyJ79nqY9AxQTol
 Xqjt84DMAwD6mKGr71nBDFHPvqjQaGGwknMNPy8IUO/OjHYFBNND+NEUp4IlBBXQTN8u
 pdi2AJ0F37DmFevfMdQSMcBK3Cc5B1VXv1PI0KbYsncs+BqfAzY3ZV7y7A5bIBnY4MRN
 MWW3gUBVV0swPEFHQEAH6itOJetZw5EKtNTLA+GtjlonfD5TEbpBQB8eqY99S/DaHKTS
 m04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IzWtB6bp+HsW5R7tvdL9ymGIFOzrGaAAmvMyXP5aeaY=;
 b=7ew2W+Wg79iObmVwQ7RGy7tZ7kt61bJOyw3+tYfxtPgNhMcD5KHfXYBi+SplMk6Mn5
 SFotNX6m2KcFQi4HZWXDj9hayTfx16viXkjC01axKGzzakAsCzXRnlIu8MDKXdeBmMQX
 ZujxOXOIhtytIeD3jx54fvn1xvwqD+v1hhkfmil7t28wVafCmxbKrwS5k+R8gLMps9Si
 /gI+PuU5g/5IAovOIoG5zW/JZ/cOrdQtFMnz5swB26lOWLYCgtofGambxlxWkR2sLOti
 XkSbPv1YQwynjtdk7C0B1LwDTr9UwEsZtKHkYnyztzieSscrbFTEUy+HvfrlH8zOzZyO
 P+jA==
X-Gm-Message-State: AOAM532EaXUEMwdvUg4FV3RYWnRDowhD1sIN/nvhZVvNNhkbOGNJwNIl
 wkjhzo+w/uW4IPnq84jHV5AH6oHJah3AzOm0ebuVXA==
X-Google-Smtp-Source: ABdhPJweQBkzECaLXeIo9t5Rc0vptpZniHP8S6AtrES19odAF/poyjurqjTVtT6p7dQ2YPB4T/1OQKaCd1kVw7RgKtY=
X-Received: by 2002:a05:6102:317a:: with SMTP id
 l26mr16722739vsm.6.1632676599233; 
 Sun, 26 Sep 2021 10:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-7-imp@bsdimp.com>
 <4c026150-88f5-2e18-16a4-86dbf3f23f2f@amsat.org>
In-Reply-To: <4c026150-88f5-2e18-16a4-86dbf3f23f2f@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 26 Sep 2021 11:16:28 -0600
Message-ID: <CANCZdfqSHxJDy9s4MqOQaHcsDruuybLfjQZVGHh_E_=BjMYzMQ@mail.gmail.com>
Subject: Re: [PATCH 06/14] bsd-user: move TARGET_MC_GET_CLEAR_RET to
 target_os_signal.h
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000bb172805cce92497"
Received-SPF: none client-ip=2607:f8b0:4864:20::e30;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe30.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bb172805cce92497
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 25, 2021 at 4:35 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 9/22/21 08:14, Warner Losh wrote:
> > Move TARGET_MC_GET_CLEAR_RET to freebsd/target_os_signal.h since it's
> > FreeBSD-wide.
>
> "architecture agnostic (on FreeBSD)" instead?
>

I like that language better. Thanks for the suggestion.


> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/freebsd/target_os_signal.h  | 3 +++
> >   bsd-user/i386/target_arch_signal.h   | 2 --
> >   bsd-user/x86_64/target_arch_signal.h | 2 --
> >   3 files changed, 3 insertions(+), 4 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

--000000000000bb172805cce92497
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 25, 2021 at 4:35 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 9/22/21 08:14, Warner Losh wrote:<br>
&gt; Move TARGET_MC_GET_CLEAR_RET to freebsd/target_os_signal.h since it&#3=
9;s<br>
&gt; FreeBSD-wide.<br>
<br>
&quot;architecture agnostic (on FreeBSD)&quot; instead?<br></blockquote><di=
v><br></div><div>I like that language better. Thanks for the suggestion.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/target_os_signal.h=C2=A0 | 3 +++<br>
&gt;=C2=A0 =C2=A0bsd-user/i386/target_arch_signal.h=C2=A0 =C2=A0| 2 --<br>
&gt;=C2=A0 =C2=A0bsd-user/x86_64/target_arch_signal.h | 2 --<br>
&gt;=C2=A0 =C2=A03 files changed, 3 insertions(+), 4 deletions(-)<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
</blockquote></div></div>

--000000000000bb172805cce92497--

