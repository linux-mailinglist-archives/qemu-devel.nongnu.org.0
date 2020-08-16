Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DC024589D
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Aug 2020 18:56:51 +0200 (CEST)
Received: from localhost ([::1]:42062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7Lxi-0004OR-1l
	for lists+qemu-devel@lfdr.de; Sun, 16 Aug 2020 12:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.shinde12194@gmail.com>)
 id 1k7Lx0-0003vn-9X
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 12:56:06 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rohit.shinde12194@gmail.com>)
 id 1k7Lwy-000550-O8
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 12:56:06 -0400
Received: by mail-pg1-x544.google.com with SMTP id g33so6929689pgb.4
 for <qemu-devel@nongnu.org>; Sun, 16 Aug 2020 09:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kzSZiL+IXq4xlSgO5SkAoFZ6dLa3rxaTPoYQ+oModUk=;
 b=HynKIk0R0zFdE5V/R0D9DheJ20UFn70OUyG420vxxNh3AhFRImxJiZnbbU++OpplYz
 WZQgGMbRlPZiF2XeJCMkxa+Vbn0ikjy040DSQU0eysv2XITlRvWImWOwV0UWM/WkL06X
 /jvRcn1zdNRAzi4m4d6R/I9Wqy63a/7Mpw+23R6xnpZbNSseVDmWi/0d7nwwHjhGltpL
 Pf6Vbrb5gdXqpjjv7J7XTaogN0djbme6KNke0niNV6HsDSpAc3ncshFDLpDFG3aMeBTc
 Lgh5yO0W8dtfRiXJjgMvZO0eOT4wefVzxcjuWRsnh3IE2DH63IuWN+SdIyJPl/pnMxVr
 Bz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kzSZiL+IXq4xlSgO5SkAoFZ6dLa3rxaTPoYQ+oModUk=;
 b=mrRUReqQcmqoJWrVoTvFnXsZ5HZhUlHNW+t4zaTIQ/8PUBiJiUAuRAL925Uk7FVl1H
 WWDdh+qAHt0WcOgFaYN/N6eeFlI76UmyB/aGepbaCcJVmgfJ6YJu+SXUpcJtKv893QXd
 PTWj4wpt4S7r3pDYL/CueDrx6xdQeaZHFLu2CLD30oAdxQnkwN03Mg3B10oaL7TnNAy1
 OPh5nQkhN3CgN8oJAvHNUuoxywQAENj4I8EFRhivIOPBpOlQnsa/FTMaZTBvQFLG6XAD
 ILoms2m3u69kGBdXC+ciQSqQJYvQgbqixpFiF6WTTVCSoAsOmGk6A+yx1X/WbOYoDLOw
 TJrg==
X-Gm-Message-State: AOAM533lD7SrAqIReVoiKd7nCKc+43vpitxQNoUcGNGpO5lbl3ot6DUg
 njmO3pDlFZK10Kxlm8DW9EZk6/LBhwAV47C+MS4=
X-Google-Smtp-Source: ABdhPJxLSWUV7vCMVCpvj/8qRSAqC5DjxNnil7y04RZajs+qcv5ZRAWhvrhymgRT0RnoGhDXVyb+YG80NSJP1x1dSns=
X-Received: by 2002:aa7:972f:: with SMTP id k15mr8800571pfg.209.1597596962625; 
 Sun, 16 Aug 2020 09:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200816023127.22268-1-rohit.shinde12194@gmail.com>
 <9abbbc9d-b5d5-fdd1-e6ff-c89071189f7f@linaro.org>
In-Reply-To: <9abbbc9d-b5d5-fdd1-e6ff-c89071189f7f@linaro.org>
From: Rohit Shinde <rohit.shinde12194@gmail.com>
Date: Sun, 16 Aug 2020 12:55:51 -0400
Message-ID: <CA+Ai=tB3QW7+vt4qSrfSBornPmPJ+1rVajvvXf=p4kg3FG2+ZA@mail.gmail.com>
Subject: Re: [PATCH v4] qapi/opts-visitor: Fixed fallthrough compiler warning
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000739ad205ad01877c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=rohit.shinde12194@gmail.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000739ad205ad01877c
Content-Type: text/plain; charset="UTF-8"

Hey Richard,


   1. So I should fork off the master again? I am a bit unclear on the
   workflow, since this is my first doing patches via format-patch and
   send-email so I am making mistakes.
   2. I just checked and my version of the code doesn't contain that line,
   so I am unsure on how that line got there. I was trying to fix the compiler
   warnings. Could you please guide me on how I create the next version of a
   patch?

Thanks,
Rohit.

On Sun, Aug 16, 2020 at 12:03 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/15/20 7:31 PM, Rohit Shinde wrote:
> >          /* range has been completed, fall through in order to pop
> option */
> > -        __attribute__((fallthrough));
> > +        /* fallthrough */
>
> (1) Any patch should not be relative to your own v3.
> (2) The previous line already contains the words "fall through",
>     so what is it that you are trying to fix?
>
>
> r~
>

--000000000000739ad205ad01877c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Richard,<div><br></div><div><ol><li>So I should=C2=A0f=
ork off the master again? I am a bit unclear on the workflow, since this is=
 my first doing patches via format-patch and send-email so I am making mist=
akes.</li><li>I just checked and my version of the code doesn&#39;t contain=
 that line, so I am unsure on how that line got there. I was trying to fix =
the compiler warnings. Could you please guide me on how I create the next v=
ersion of a patch?</li></ol><div>Thanks,</div></div><div>Rohit.</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun=
, Aug 16, 2020 at 12:03 PM Richard Henderson &lt;<a href=3D"mailto:richard.=
henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 8/15/20 7:31 PM, Rohit=
 Shinde wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* range has been completed, fall th=
rough in order to pop option */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 __attribute__((fallthrough));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallthrough */<br>
<br>
(1) Any patch should not be relative to your own v3.<br>
(2) The previous line already contains the words &quot;fall through&quot;,<=
br>
=C2=A0 =C2=A0 so what is it that you are trying to fix?<br>
<br>
<br>
r~<br>
</blockquote></div>

--000000000000739ad205ad01877c--

