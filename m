Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF33594F90
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 06:29:23 +0200 (CEST)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNoCg-0004Wy-4O
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 00:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaishu071998@gmail.com>)
 id 1oNoBY-0003Bn-6q
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 00:28:12 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:37417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vaishu071998@gmail.com>)
 id 1oNoBW-0002zL-KC
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 00:28:11 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-32194238c77so122026277b3.4
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 21:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=quADI/kjFtBikm6McoG6FGtm67oyPMwGUB37TMIQS8o=;
 b=bLqy9xXDUVLobXETgLOU6dtHH6DlB1+mMohcEHGA4KnVAb8RtUgs/X5nZNcLTmZRQD
 jczXYBs9J3+rcLPhMr/6jFzzddkX273UcA74U87SFdcoSWMg6W62JbDqUnr4ElvFqs+k
 RD8eoAoJpxKbNIyz8IWDXKTWSk5OtnLOgCE8F2YNOsc1eqbdKmY/nHXF2qqFNJzOPf/v
 o+/JB/hnCh9xTV9GznXBR1kHv/IiemZj4UeWXFTymoEpSFjR75FpiJ45rKgVf6xAMaXn
 LgWUBIMW03hE55SmYSAlEl+K14OGd9PtCes1b21aeuXz8hM4gH9w/vqiCgr08BKX+Rvk
 Fvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=quADI/kjFtBikm6McoG6FGtm67oyPMwGUB37TMIQS8o=;
 b=65my1t6uCupLwA3JbAsb71JStg8FIUmjoztHxJH+qYldzYt8OdY5EHY5Xeqz2IAXhd
 Fyz0qTyaz5qiP+S9WAvxg4KFFicNJrF5LmVuii9EDV6QGsmYoZ2/x815o3U4hd5ejgJ4
 EWEVWlC6oABvsEfXlxg8aAD2WN753mvGCFj6j8s6FMR7+NeCF7GTZOOfGAVw9cnkKbQK
 0EoYNsyGYWjszCGJ+KOYT9Xo4WoAl9JbVRLhs1guTigzq4e8AbmOkQpG5ZxwnbCKrACu
 iT8TbTEYvxMsGG/VWNJSijzolGMlm2QAdEsDQ2ABfCGdZclbatIEAaWUKmia7q9FBIwL
 m7PQ==
X-Gm-Message-State: ACgBeo20unxY57Mg5a+M/lPbGsyl5lKV/SW2diy8BFKAu/Fxkya/b2SV
 CBQUV+yR72OV0UgvQRW0g+AV3MR/ThRE4Fo44hw=
X-Google-Smtp-Source: AA6agR5SZzHWb/9yj/s1or+LcGnmjkWDoY2JLVyuz9X3e82Yijr8PzL9xj4L0W88L9lBOIlyYG8SScnphPDxDk/4uC4=
X-Received: by 2002:a05:6902:110e:b0:66d:e6dc:5f31 with SMTP id
 o14-20020a056902110e00b0066de6dc5f31mr14547779ybu.628.1660624089308; Mon, 15
 Aug 2022 21:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcBaE1DOVtq+D1jh42ZO01guWo_zVRbFWoAOigpD2xm0YPSKQ@mail.gmail.com>
 <CAFEAcA9+UmPzjDeFQDEbq3DW_t-zUHeZaA-eY6S8baT0ko7uwg@mail.gmail.com>
In-Reply-To: <CAFEAcA9+UmPzjDeFQDEbq3DW_t-zUHeZaA-eY6S8baT0ko7uwg@mail.gmail.com>
From: vaishu venkat <vaishu071998@gmail.com>
Date: Tue, 16 Aug 2022 09:57:56 +0530
Message-ID: <CAEcBaE24F5F=LQQ6do=j5Epznv8h-9sUw76wWSmMV=GjVK+WUw@mail.gmail.com>
Subject: Re: Bluetooth support in QEMU
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f2e37e05e6542c7a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=vaishu071998@gmail.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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

--000000000000f2e37e05e6542c7a
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Thanks for quick reply.

We don't have an existing application running with qemu functionality.



On Mon, Aug 15, 2022 at 9:36 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 15 Aug 2022 at 16:53, vaishu venkat <vaishu071998@gmail.com>
> wrote:
> >
> > Hi team,
> >             We are currently required to use QEMU for virtualization of
> customized application. The application requires Bluetooth and Wi-fi
> support, as observed below warning,
> > qemu-system-aarch64: -bt hci,host: warning: The bluetooth subsystem is
> deprecated and will be removed soon. If the bluetooth subsystem is still
> useful for you, please send a mail to qemu-devel@nongnu.org with your
> usecase.
> >
> >  Could you please help us with the support of bluetooth in QEMU.
>
> You're rather late... Bluetooth was deprecated in 2018 for
> QEMU v3.1 (hence that warning message), and was subsequently
> removed entirely for QEMU v5.0, released in 2020.
>
> The code in QEMU was, as far as we could tell at the time,
> basically unused, unmaintained and also broken. It isn't
> coming back, I'm afraid.
>
> Do you have an existing application that runs and works with
> the bluetooth functionality on the QEMU version you have,
> or are you instead trying to get it working as a new thing?
> If the former, the answer is "just keep using that old QEMU".
> If the latter, the answer is "it never really worked anyway,
> so don't bother trying".
>
> thanks
> -- PMM
>

--000000000000f2e37e05e6542c7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>Thanks for quick r=
eply.</div><div><br></div><div>We don&#39;t have an existing application ru=
nning with qemu functionality. <br></div><div><br></div><div><br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Aug 15, 2022 at 9:36 PM Peter Maydell &lt;<a href=3D"mailto:peter.mayde=
ll@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Mon, 15 Aug 2022 at 16:53, vaishu=
 venkat &lt;<a href=3D"mailto:vaishu071998@gmail.com" target=3D"_blank">vai=
shu071998@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi team,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0We are currently requir=
ed to use QEMU for virtualization of customized application. The applicatio=
n requires Bluetooth and Wi-fi support, as observed below warning,<br>
&gt; qemu-system-aarch64: -bt hci,host: warning: The bluetooth subsystem is=
 deprecated and will be removed soon. If the bluetooth subsystem is still u=
seful for you, please send a mail to <a href=3D"mailto:qemu-devel@nongnu.or=
g" target=3D"_blank">qemu-devel@nongnu.org</a> with your usecase.<br>
&gt;<br>
&gt;=C2=A0 Could you please help us with the support of bluetooth in QEMU.<=
br>
<br>
You&#39;re rather late... Bluetooth was deprecated in 2018 for<br>
QEMU v3.1 (hence that warning message), and was subsequently<br>
removed entirely for QEMU v5.0, released in 2020.<br>
<br>
The code in QEMU was, as far as we could tell at the time,<br>
basically unused, unmaintained and also broken. It isn&#39;t<br>
coming back, I&#39;m afraid.<br>
<br>
Do you have an existing application that runs and works with<br>
the bluetooth functionality on the QEMU version you have,<br>
or are you instead trying to get it working as a new thing?<br>
If the former, the answer is &quot;just keep using that old QEMU&quot;.<br>
If the latter, the answer is &quot;it never really worked anyway,<br>
so don&#39;t bother trying&quot;.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000f2e37e05e6542c7a--

