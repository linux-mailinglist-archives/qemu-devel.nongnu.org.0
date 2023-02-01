Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84E686BEF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 17:39:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNG7F-0006Bo-Tl; Wed, 01 Feb 2023 11:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pNG7B-00064H-3o
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:37:41 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pNG76-0005Q3-N9
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:37:40 -0500
Received: by mail-ej1-x631.google.com with SMTP id k4so47647257eje.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 08:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gzs3TEKIDdIGE3Ts6y83RoVSk2Y3pCnlMeHQbTKsVnc=;
 b=6zIqBAHrV2LDbxolu8zOkGDlix7Wu79vHvVTT1i7ROhsMS1Uh6kT2toyPlTK+FV0j5
 GkuEMlRblpvALeccBjgyFDccNOfZa3yag7LBvrfQVDII/ea9L00RxrhfIexXJc0IlbOV
 9bSETTtjP8w/IzC+2s5ZekKP2sN+JTXi3S3ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gzs3TEKIDdIGE3Ts6y83RoVSk2Y3pCnlMeHQbTKsVnc=;
 b=EuBWikcDIHxmRXIJcI8EWXYEW4eIynpJd88t3cU1l5UFfVfsr31GFCkd42Q+5dnLlX
 ROtJQi4YTKTa2ZFHWIPQPJ69puplZhU7bnQCpuCHKhl7fgU2HaHq0mZ71gTzVkleFTq+
 t4pqxxRAPpm3U7sckBM6eT26oxDa9FIBrzFTeMRRq3WTyytNEBBIRKxnhPwY/v4FrUxZ
 zf6pRyPfyQeHsd9R72ko0ENjtVQYpOAARxiD1Zm8kqG9TlATpVlCXCJAAKaf54yaWd08
 D2SdjgZMfoemiEuAHVjCz+hd3Kr0adJyVMQyY60SZvj4IInuK9Lay0anP76A/h7DS4Wg
 BmvA==
X-Gm-Message-State: AO0yUKWvOsn33XKWbhKXYDkCdsazjverKQkNfXkdmcS6vIONOc+2pwx1
 Te6TsvUFq2Owym6dPLoSzEewnNkR26w9R5fcY7aOwg==
X-Google-Smtp-Source: AK7set8EcWcW9Iuoy8BbXLJTqtkjJJAXpqqhMLwCJ/v+0VAQ3xnV1NOxxGS8MSX+/UIir/OSmvuDSvImA4r2LxHwrx0=
X-Received: by 2002:a17:907:a055:b0:883:ba3b:ebb8 with SMTP id
 gz21-20020a170907a05500b00883ba3bebb8mr775901ejc.308.1675269450296; Wed, 01
 Feb 2023 08:37:30 -0800 (PST)
MIME-Version: 1.0
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
 <87357pv157.fsf@pond.sub.org>
In-Reply-To: <87357pv157.fsf@pond.sub.org>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 1 Feb 2023 21:37:17 +0500
Message-ID: <CAMcjF3B78yi4G3-=qf6Rwf8GNneDQz=5W6La-cOgzcz5GnOdAw@mail.gmail.com>
Subject: Re: [PATCH 1/9] Updated the FSF address in file hw/sh4/sh7750_regs.h
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, alex.bennee@linaro.org, 
 pbonzini@redhat.com, fam@euphon.net, peter.maydell@linaro.org, 
 philmd@linaro.org, kwolf@redhat.com, hreitz@redhat.com
Content-Type: multipart/alternative; boundary="0000000000007d05bc05f3a610d2"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000007d05bc05f3a610d2
Content-Type: text/plain; charset="UTF-8"

Okay I understand now. I will do all these changes and send another email.

On Wed, 1 Feb 2023, 8:47 pm Markus Armbruster, <armbru@redhat.com> wrote:

> I recommend to squash all the patches in this series into a single one.
>
> Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk> writes:
>
> > Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
> > ---
>
> The text below this line will not become part of the commit message.
> Please move it above your Signed-off-by: line.
>
> > The Free Software Foundation moved to a new address and this file
> referred to their old location.
> > The address should be updated and replaced to a pointer to <
> https://www.gnu.org/licenses/>
> > This will resolve the issue #379 in the QEMU source repository
> >
> >  hw/sh4/sh7750_regs.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
> > index beb571d5e9..94043431e6 100644
> > --- a/hw/sh4/sh7750_regs.h
> > +++ b/hw/sh4/sh7750_regs.h
> > @@ -22,8 +22,7 @@
> >   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> >   * General Public License for more details. You should have received
> >   * a copy of the GNU General Public License along with RTEMS; see
> > - * file COPYING. If not, write to the Free Software Foundation, 675
> > - * Mass Ave, Cambridge, MA 02139, USA.
> > + * file COPYING. If not, see <https://www.gnu.org/licenses/>.
> >   *
> >   * As a special exception, including RTEMS header files in a file,
> >   * instantiating RTEMS generics or templates, or linking other files
>
>

--0000000000007d05bc05f3a610d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Okay I understand now. I will do all these changes and se=
nd another email.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, 1 Feb 2023, 8:47 pm Markus Armbruster, &lt;<=
a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">I recommend to squash all the patches in =
this series into a single one.<br>
<br>
Khadija Kamran &lt;<a href=3D"mailto:kkamran.bese16seecs@seecs.edu.pk" targ=
et=3D"_blank" rel=3D"noreferrer">kkamran.bese16seecs@seecs.edu.pk</a>&gt; w=
rites:<br>
<br>
&gt; Signed-off-by: Khadija Kamran &lt;<a href=3D"mailto:kkamran.bese16seec=
s@seecs.edu.pk" target=3D"_blank" rel=3D"noreferrer">kkamran.bese16seecs@se=
ecs.edu.pk</a>&gt;<br>
&gt; ---<br>
<br>
The text below this line will not become part of the commit message.<br>
Please move it above your Signed-off-by: line.<br>
<br>
&gt; The Free Software Foundation moved to a new address and this file refe=
rred to their old location.<br>
&gt; The address should be updated and replaced to a pointer to &lt;<a href=
=3D"https://www.gnu.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://www.gnu.org/licenses/</a>&gt;<br>
&gt; This will resolve the issue #379 in the QEMU source repository<br>
&gt;<br>
&gt;=C2=A0 hw/sh4/sh7750_regs.h | 3 +--<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h<br>
&gt; index beb571d5e9..94043431e6 100644<br>
&gt; --- a/hw/sh4/sh7750_regs.h<br>
&gt; +++ b/hw/sh4/sh7750_regs.h<br>
&gt; @@ -22,8 +22,7 @@<br>
&gt;=C2=A0 =C2=A0* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See=
 the GNU<br>
&gt;=C2=A0 =C2=A0* General Public License for more details. You should have=
 received<br>
&gt;=C2=A0 =C2=A0* a copy of the GNU General Public License along with RTEM=
S; see<br>
&gt; - * file COPYING. If not, write to the Free Software Foundation, 675<b=
r>
&gt; - * Mass Ave, Cambridge, MA 02139, USA.<br>
&gt; + * file COPYING. If not, see &lt;<a href=3D"https://www.gnu.org/licen=
ses/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.gnu.org/l=
icenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* As a special exception, including RTEMS header files in =
a file,<br>
&gt;=C2=A0 =C2=A0* instantiating RTEMS generics or templates, or linking ot=
her files<br>
<br>
</blockquote></div>

--0000000000007d05bc05f3a610d2--

