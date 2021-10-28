Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC1F43E6A8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:53:38 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8en-0008V3-ED
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mg8Zy-0002O6-Bm
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:48:38 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:37425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mg8Zv-0003NL-O3
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:48:38 -0400
Received: by mail-ua1-x934.google.com with SMTP id f4so12783550uad.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dfIgzIXlYymggwsCQ4DvFxMXkRyE0+MfLIBarLFYcZg=;
 b=nhePTZ/H13jtTfvBvg/PlLyPDhWl3AIMGa/PbvkymFHUQG7/ySe8fjgl0+AzNJgQl0
 EFHW9vvH6mAdil0283IBNAWUz7pov7ZsVUy8IJD8M11jiQjDu7mI9yGBWpl7xZa+d1Sn
 D2ag2G08MkJQQpuuR3KaO2oIwYnzG39ezqhSEvgA11/EruIQyVhxSWnWEFzIWioyNBaj
 cHFXaTl4iBgy6fBL6k69/RKDtFN3NX9pucrgY9Y11B6i+6tOR0ZHkJMTvyWBZwVukGV5
 jvcWrKGAJcky1OU3tsq7ndSCtWMepu7GwaVmoG/hbAAFX0YaJ2LlQLZdm1zYEY8NfZIt
 DG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dfIgzIXlYymggwsCQ4DvFxMXkRyE0+MfLIBarLFYcZg=;
 b=krFLrU7UtY0GQI0JFHO8+JNNtec7gDt5dc8llIRhZ/vgUxErSqB5XcEY4B5uov/7xG
 xQY8w+aHT8O8UT6bi5kPtJrakwUWyYlZ0IFB1w/4YU4PrrqPcfNeeM9U/ULiaKEx0x0g
 TgqKajIOHJu0i1evkw/wldGh1parUzkmkTgy6WLFAkqRM0YeqBPO77xrLs7Ccdehg9il
 WR8PwsT/qroLl+0C4rc84R3L/x2g2Nf6ZOaLBhOPEGjkvhGiFglhNgeQBYEX8eCAzbj+
 q6qZTQEBG57XxsoLBFebgH9giOq8RoZ9AmG6rSoIy7gNMpxQsyiIy+raEQF5OdH0pxSY
 +erA==
X-Gm-Message-State: AOAM532o1WkL059Ma4vMGgBWnVpXEhmsBRVnaALOKU5EAbBEorefyFA6
 koarZKlebkaAP+7Qu+zejFinV0dbAI6cVjwOhSgqGQ==
X-Google-Smtp-Source: ABdhPJw6nnTBk7ZmxCl1rGFVRror1FamHMqPaYPLgjDIuEfA7BpGEPAHVTE/78MMymnfpQhA3tXyGgg/yd1T+0TKWII=
X-Received: by 2002:a05:6102:5494:: with SMTP id
 bk20mr6254599vsb.6.1635439713629; 
 Thu, 28 Oct 2021 09:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-18-imp@bsdimp.com>
 <d1dc2f64-22bb-c29f-1fec-a9f44c0e295e@linaro.org>
In-Reply-To: <d1dc2f64-22bb-c29f-1fec-a9f44c0e295e@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 10:48:22 -0600
Message-ID: <CANCZdfo_anCnfHXv_gUe3C9HEK1OOjOKHpeewEOnXsvFX-bO=A@mail.gmail.com>
Subject: Re: [PATCH 17/24] bsd-user/arm/target_arch_signal.h: arm specific
 signal registers and stack
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002eca3905cf6c7bbc"
Received-SPF: none client-ip=2607:f8b0:4864:20::934;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x934.google.com
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
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002eca3905cf6c7bbc
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 10:18 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/19/21 9:44 AM, Warner Losh wrote:
> > +#define TARGET_INSN_SIZE    4       /* arm instruction size */
>
> What is this for?  arm max insn size?
>

It's used a few lines below:

+#define TARGET_SZSIGCODE    ((abi_ulong)(9 * TARGET_INSN_SIZE))

which is a fancy way of getting the sizeof the sigtramp handler that's
copied onto the stack and used in the setup.
It's then used in bsd-user/arm/target_arch_signal.h because it doesn't have
visibility to target_arch_sigtramp.h's
namespace to get the size.

It's likely a 'todo' cleanup to make this less hard-coded.

Warner


> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~
>

--0000000000002eca3905cf6c7bbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 10:18 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; +#define TARGET_INSN_SIZE=C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
arm instruction size */<br>
<br>
What is this for?=C2=A0 arm max insn size?<br></blockquote><div><br></div><=
div>It&#39;s used a few lines below:</div><div><br></div><div>+#define TARG=
ET_SZSIGCODE=C2=A0 =C2=A0 ((abi_ulong)(9 * TARGET_INSN_SIZE))<br></div><div=
><br></div><div>which is a fancy way of getting the sizeof the sigtramp han=
dler=C2=A0that&#39;s copied onto the stack and used in the setup.</div><div=
>It&#39;s then used in bsd-user/arm/target_arch_signal.h because it doesn&#=
39;t have visibility to target_arch_sigtramp.h&#39;s</div><div>namespace to=
 get the size.</div><div><br></div><div>It&#39;s likely a &#39;todo&#39; cl=
eanup to make this less hard-coded.</div><div><br></div><div>Warner</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
r~<br>
</blockquote></div></div>

--0000000000002eca3905cf6c7bbc--

