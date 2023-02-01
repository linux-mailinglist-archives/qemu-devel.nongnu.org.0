Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D16867E2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:03:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDgc-0002mG-Ri; Wed, 01 Feb 2023 09:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pNAQU-0001Nn-N0
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:33:15 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pNAQO-0003QQ-Sl
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:33:14 -0500
Received: by mail-ej1-x635.google.com with SMTP id qw12so34105074ejc.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CQXdZcIJOyhdfKhmnAt46HBybn9Du9OvhbnHstPO2KA=;
 b=HVRkf7Q3BPLDxsj9vhacCUp1uv2Ae4t7whjW8WjHTHQq4j46rvUIzIBX18r/jFZwpk
 uKqJP3AR8BYFP6aNbN4vsx5TNqLJNkXW4jllJjMwBFk0J7ddbwuFLLzbRquAJK8f89fz
 CYMZILIcH9iG7b26//XpD/223dt2yAwBaSgx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CQXdZcIJOyhdfKhmnAt46HBybn9Du9OvhbnHstPO2KA=;
 b=b88paRvIyo4i6P35ryWEJ+JT+coCk1tk2sCiGb6i50rN65p2PEd7RYsvCsUv6HOvuq
 myf5pVo/8/x2i8xGoTCUo8XKWmWlu77wGZvUZJGZUSIhOEpCfsYkiSLwaKEoLrlNLrrH
 Xy3OwvzAqjxQOwZFILJ2LyqKYoR6QVXLXJcF5094waB2sa7h/5V7iiW6e1Od/VyhNV45
 IrGA95np0pZFNmJrItiD0k4bcUtuOWqKFfICCdd3fbktRWRw3RI318JvVD+7LDLXNjW3
 QlvdNV68JW65xx8PzMtGc3JgwdvLRV40bGjzViEsJt1VInm4ZLE2MPBXsfBiahFW3am6
 ihYQ==
X-Gm-Message-State: AO0yUKVxizXBK0TCq1H+qQY0+RIpwSZdHHG8NtM+650I4ZYQnKERB15y
 BLqHoHJjWc2KlgCQf8UG7oabT00jvPyeReOZdjO6Dg==
X-Google-Smtp-Source: AK7set9qD92IWOkMYIe8F4WRmQCTM+OmW04VjGbYv8Bz5+1JzMYQITXhGrwnXvl80BLGkkF4KCFXN9QKk5+iTkvYzwM=
X-Received: by 2002:a17:906:3954:b0:878:5360:4087 with SMTP id
 g20-20020a170906395400b0087853604087mr488260eje.34.1675247582993; Wed, 01 Feb
 2023 02:33:02 -0800 (PST)
MIME-Version: 1.0
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
 <87mt5xsmyj.fsf@linaro.org>
In-Reply-To: <87mt5xsmyj.fsf@linaro.org>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 1 Feb 2023 15:32:50 +0500
Message-ID: <CAMcjF3CcTkNrprhs7dswPF2OEG7x8PEfhjuM5zNznymX3J4qqQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] Updated the FSF address in file hw/sh4/sh7750_regs.h
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, pbonzini@redhat.com, 
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org, kwolf@redhat.com, 
 hreitz@redhat.com
Content-Type: multipart/alternative; boundary="00000000000018729a05f3a0f989"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Feb 2023 09:02:00 -0500
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

--00000000000018729a05f3a0f989
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the feedback. I will keep the points in mind next time.

On Wed, 1 Feb 2023, 3:24 pm Alex Benn=C3=A9e, <alex.bennee@linaro.org> wrot=
e:

>
> Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk> writes:
>
> > Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
> > ---
> > The Free Software Foundation moved to a new address and this file
> referred to their old location.
> > The address should be updated and replaced to a pointer to <
> https://www.gnu.org/licenses/>
> > This will resolve the issue #379 in the QEMU source repository
>
> For next time I would put this comment in the cover letter. You can also
> add:
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379
>
> to the commit message to auto close the bug once this is merged.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
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
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--00000000000018729a05f3a0f989
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you for the feedback. I will keep the points in min=
d next time.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, 1 Feb 2023, 3:24 pm Alex Benn=C3=A9e, &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><br>
Khadija Kamran &lt;<a href=3D"mailto:kkamran.bese16seecs@seecs.edu.pk" targ=
et=3D"_blank" rel=3D"noreferrer">kkamran.bese16seecs@seecs.edu.pk</a>&gt; w=
rites:<br>
<br>
&gt; Signed-off-by: Khadija Kamran &lt;<a href=3D"mailto:kkamran.bese16seec=
s@seecs.edu.pk" target=3D"_blank" rel=3D"noreferrer">kkamran.bese16seecs@se=
ecs.edu.pk</a>&gt;<br>
&gt; ---<br>
&gt; The Free Software Foundation moved to a new address and this file refe=
rred to their old location.<br>
&gt; The address should be updated and replaced to a pointer to &lt;<a href=
=3D"https://www.gnu.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://www.gnu.org/licenses/</a>&gt;<br>
&gt; This will resolve the issue #379 in the QEMU source repository<br>
<br>
For next time I would put this comment in the cover letter. You can also<br=
>
add:<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/379" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-projec=
t/qemu/-/issues/379</a><br>
<br>
to the commit message to auto close the bug once this is merged.<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;<br>
<br>
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
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div>

--00000000000018729a05f3a0f989--

