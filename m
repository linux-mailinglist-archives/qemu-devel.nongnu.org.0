Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9870A690620
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 12:08:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4mw-0007zT-Mt; Thu, 09 Feb 2023 06:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pQ4mt-0007zK-96
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:08:23 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pQ4mp-0006mF-Bl
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:08:23 -0500
Received: by mail-ej1-x62d.google.com with SMTP id gr7so5239452ejb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JKj7cuD7qo41dxOmGWJIo/Dy+B3/09FgKPmd0ecGb/E=;
 b=zknNBijAvP8GBQoRYPusdeAUlj2EBRsdAvI6XdVWnfM3Wh/xocQMMyahP3ShfAY5qf
 tDLpv/QKeXkWkJaVNNDzVcV2gVwMajUjk1smksNgSf1YXWSTsykHDmxjCLWa4YFPYFID
 k5v+eEqXmvC2r/sectGoz1Jem3xksjcQ4lNN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JKj7cuD7qo41dxOmGWJIo/Dy+B3/09FgKPmd0ecGb/E=;
 b=Mn/SVPWieIpG+drrqOFHgNM/gTWgc+K07+geEKMEzRfc2NVcNg3VXMu3k7eNqcT867
 KGd+y0APSoZduy6kxLijG7IjDRUzP/MZBKXT7UsGefQljfq1vTHH/rSW+YaWL73lWb9E
 l8XOkhBO74dad9LQ4KKKaxXc82SZ43s+mgRd+rB/mkFR7rEOqdLPkSAGeo9qn8VfAeTX
 7UF/QtKNOyMEBXg2r2uFVD8/iYo7R+UeWCi/QUIzpvNTbA6J0ASVy2oTeEPAA7X39DxH
 HVo4DGh5HjQo9XcekvWgMxQDBhzPRY2vqm6AGtzegniQJWhrUqvf0FzhROc4UzPHe7X2
 VFGw==
X-Gm-Message-State: AO0yUKXV6WFNOLANG4l9OJINZC3wqFF9/akWRl42sCIS4LuyEeyv9gV4
 QDI4GNIE0LMOLl03MYW49QvjxZ/0ABL5sYQxwAI8fw==
X-Google-Smtp-Source: AK7set/5FI64tZdoBqNENRIsdvFSZx3SN3oy/1dnf4s8SpBIosWFqAr6gXmM7bu1K8EF3Lp2b12cAu0rMwlY7ypdHt8=
X-Received: by 2002:a17:906:e28b:b0:8ad:731:592d with SMTP id
 gg11-20020a170906e28b00b008ad0731592dmr423723ejb.5.1675940892616; Thu, 09 Feb
 2023 03:08:12 -0800 (PST)
MIME-Version: 1.0
References: <d1500fe9389a1f6964a2b132466d5be2a44d205f.1675858906.git.kkamran.bese16seecs@seecs.edu.pk>
 <5fbc69eb-c5a3-3f0e-265b-3bbbbc0cfc4e@redhat.com>
In-Reply-To: <5fbc69eb-c5a3-3f0e-265b-3bbbbc0cfc4e@redhat.com>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Thu, 9 Feb 2023 16:08:00 +0500
Message-ID: <CAMcjF3AE4Jw=ZFQK0E9PQran-khmKJeWasXW+qauYrQY+ihEQA@mail.gmail.com>
Subject: Re: [PATCH] Updated the FSF address to <https://www.gnu.org/licenses/>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, pbonzini@redhat.com, 
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org, kwolf@redhat.com, 
 hreitz@redhat.com, Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000091d20905f442657a"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-ej1-x62d.google.com
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

--00000000000091d20905f442657a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Thomas! I feel really confused because my patch file has all the
details that you mentioned. I wonder why it is not sending it the way it
did before.

On Thu, Feb 9, 2023, 3:39 PM Thomas Huth <thuth@redhat.com> wrote:

>
>   Hi Khadija,
>
> the diffs below look fine now ... but unfortunately the commit descriptio=
n
> is now lacking your "Signed-off-by" line as we require it for QEMU:
>
>
>
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emai=
ls-must-include-a-signed-off-by-line
>
> You can edit the commit description easily by running "git commit --amend=
"
> again in the branch where you have your commit (assuming it is the topmos=
t
> one), or by running "git rebase -i master" and then mark the commit with
> "reword" instead of "pick".
>
> While you're at it, it would also be nice to re-add the description and
> the
> "Resolves:" line that you had in earlier version of the patches.
>
>   HTH,
>    Thomas
>
>
> On 08/02/2023 13.51, Khadija Kamran wrote:
> > diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
> > index d2d6f6db8d..b1d01c0992 100644
> > --- a/contrib/gitdm/filetypes.txt
> > +++ b/contrib/gitdm/filetypes.txt
> > @@ -12,8 +12,7 @@
> >   # GNU Library General Public License for more details.
> >   #
> >   # You should have received a copy of the GNU General Public License
> > -# along with this program; if not, write to the Free Software
> > -# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307=
,
> USA.
> > +# along with this program. If not, see <https://www.gnu.org/licenses/>=
.
> >   #
> >   # Authors : Gregorio Robles <grex@gsyc.escet.urjc.es>
> >   # Authors : Germ=C3=A1n P=C3=B3o-Caama=C3=B1o <gpoo@gnome.org>
> > diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h
> > index e5f9768e8f..58c29aa925 100644
> > --- a/hw/scsi/viosrp.h
> > +++ b/hw/scsi/viosrp.h
> > @@ -16,8 +16,7 @@
> >   /* GNU General Public License for more details.
>       */
> >   /*
>        */
> >   /* You should have received a copy of the GNU General Public License
>        */
> > -/* along with this program; if not, write to the Free Software
>      */
> > -/* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> 02111-1307  USA */
> > +/* along with this program. If not, see <https://www.gnu.org/licenses/=
>.
>    */
> >   /*
>        */
> >   /*
>        */
> >   /* This file contains structures and definitions for IBM RPA (RS/6000
>       */
> > diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
> > index beb571d5e9..94043431e6 100644
> > --- a/hw/sh4/sh7750_regs.h
> > +++ b/hw/sh4/sh7750_regs.h
> > @@ -22,8 +22,7 @@
> >    * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> >    * General Public License for more details. You should have received
> >    * a copy of the GNU General Public License along with RTEMS; see
> > - * file COPYING. If not, write to the Free Software Foundation, 675
> > - * Mass Ave, Cambridge, MA 02139, USA.
> > + * file COPYING. If not, see <https://www.gnu.org/licenses/>.
> >    *
> >    * As a special exception, including RTEMS header files in a file,
> >    * instantiating RTEMS generics or templates, or linking other files
> > diff --git a/include/hw/arm/raspi_platform.h
> b/include/hw/arm/raspi_platform.h
> > index e0e6c8ce94..4a56dd4b89 100644
> > --- a/include/hw/arm/raspi_platform.h
> > +++ b/include/hw/arm/raspi_platform.h
> > @@ -18,8 +18,7 @@
> >    * GNU General Public License for more details.
> >    *
> >    * You should have received a copy of the GNU General Public License
> > - * along with this program; if not, write to the Free Software
> > - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> 02111-1307  USA
> > + * along with this program. If not, see <https://www.gnu.org/licenses/
> >.
> >    *
> >    * Various undocumented addresses and names come from Herman
> Hermitage's VC4
> >    * documentation:
> > diff --git a/include/qemu/uri.h b/include/qemu/uri.h
> > index d201c61260..cf8ec70356 100644
> > --- a/include/qemu/uri.h
> > +++ b/include/qemu/uri.h
> > @@ -41,8 +41,7 @@
> >    * Lesser General Public License for more details.
> >    *
> >    * You should have received a copy of the GNU Lesser General Public
> > - * License along with this library; if not, write to the Free Software
> > - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> USA
> > + * License along with this library. If not, see <
> https://www.gnu.org/licenses/>.
> >    *
> >    * Authors:
> >    *    Richard W.M. Jones <rjones@redhat.com>
> > diff --git a/tests/qemu-iotests/022 b/tests/qemu-iotests/022
> > index a116cfe255..d98d1ea90f 100755
> > --- a/tests/qemu-iotests/022
> > +++ b/tests/qemu-iotests/022
> > @@ -16,9 +16,7 @@
> >   # GNU General Public License for more details.
> >   #
> >   # You should have received a copy of the GNU General Public License
> > -# along with this program; if not, write to the Free Software
> > -# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
> > -# USA
> > +# along with this program. If not, see <https://www.gnu.org/licenses/>=
.
> >   #
> >
> >   # creator
> > diff --git a/tests/unit/rcutorture.c b/tests/unit/rcutorture.c
> > index 495a4e6f42..7662081683 100644
> > --- a/tests/unit/rcutorture.c
> > +++ b/tests/unit/rcutorture.c
> > @@ -50,8 +50,7 @@
> >    * GNU General Public License for more details.
> >    *
> >    * You should have received a copy of the GNU General Public License
> > - * along with this program; if not, write to the Free Software
> > - * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
> 02111-1307, USA.
> > + * along with this program. If not, see <https://www.gnu.org/licenses/
> >.
> >    *
> >    * Copyright (c) 2008 Paul E. McKenney, IBM Corporation.
> >    */
> > diff --git a/tests/unit/test-rcu-list.c b/tests/unit/test-rcu-list.c
> > index 64b81ae058..9964171da4 100644
> > --- a/tests/unit/test-rcu-list.c
> > +++ b/tests/unit/test-rcu-list.c
> > @@ -14,8 +14,7 @@
> >    * GNU General Public License for more details.
> >    *
> >    * You should have received a copy of the GNU General Public License
> > - * along with this program; if not, write to the Free Software
> > - * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
> 02111-1307, USA.
> > + * along with this program. If not, see <https://www.gnu.org/licenses/
> >.
> >    *
> >    * Copyright (c) 2013 Mike D. Day, IBM Corporation.
> >    */
> > diff --git a/util/uri.c b/util/uri.c
> > index ff72c6005f..dcb3305236 100644
> > --- a/util/uri.c
> > +++ b/util/uri.c
> > @@ -43,8 +43,7 @@
> >    * Lesser General Public License for more details.
> >    *
> >    * You should have received a copy of the GNU Lesser General Public
> > - * License along with this library; if not, write to the Free Software
> > - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> USA
> > + * License along with this library. If not, see <
> https://www.gnu.org/licenses/>.
> >    *
> >    * Authors:
> >    *    Richard W.M. Jones <rjones@redhat.com>
>
>

--00000000000091d20905f442657a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey=C2=A0Thomas! I feel really confused because my patch =
file has all the details that you mentioned. I wonder why it is not sending=
 it the way it did before.=C2=A0</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 9, 2023, 3:39 PM Thomas Huth &l=
t;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 Hi Khadija,<br>
<br>
the diffs below look fine now ... but unfortunately the commit description =
<br>
is now lacking your &quot;Signed-off-by&quot; line as we require it for QEM=
U:<br>
<br>
<br>
<a href=3D"https://www.qemu.org/docs/master/devel/submitting-a-patch.html#p=
atch-emails-must-include-a-signed-off-by-line" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://www.qemu.org/docs/master/devel/submitting-a-pat=
ch.html#patch-emails-must-include-a-signed-off-by-line</a><br>
<br>
You can edit the commit description easily by running &quot;git commit --am=
end&quot; <br>
again in the branch where you have your commit (assuming it is the topmost =
<br>
one), or by running &quot;git rebase -i master&quot; and then mark the comm=
it with <br>
&quot;reword&quot; instead of &quot;pick&quot;.<br>
<br>
While you&#39;re at it, it would also be nice to re-add the description and=
 the <br>
&quot;Resolves:&quot; line that you had in earlier version of the patches.<=
br>
<br>
=C2=A0 HTH,<br>
=C2=A0 =C2=A0Thomas<br>
<br>
<br>
On 08/02/2023 13.51, Khadija Kamran wrote:<br>
&gt; diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt=
<br>
&gt; index d2d6f6db8d..b1d01c0992 100644<br>
&gt; --- a/contrib/gitdm/filetypes.txt<br>
&gt; +++ b/contrib/gitdm/filetypes.txt<br>
&gt; @@ -12,8 +12,7 @@<br>
&gt;=C2=A0 =C2=A0# GNU Library General Public License for more details.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0# You should have received a copy of the GNU General Publi=
c License<br>
&gt; -# along with this program; if not, write to the Free Software<br>
&gt; -# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-130=
7, USA.<br>
&gt; +# along with this program. If not, see &lt;<a href=3D"https://www.gnu=
.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www=
.gnu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0# Authors : Gregorio Robles &lt;<a href=3D"mailto:grex@gsy=
c.escet.urjc.es" target=3D"_blank" rel=3D"noreferrer">grex@gsyc.escet.urjc.=
es</a>&gt;<br>
&gt;=C2=A0 =C2=A0# Authors : Germ=C3=A1n P=C3=B3o-Caama=C3=B1o &lt;<a href=
=3D"mailto:gpoo@gnome.org" target=3D"_blank" rel=3D"noreferrer">gpoo@gnome.=
org</a>&gt;<br>
&gt; diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h<br>
&gt; index e5f9768e8f..58c29aa925 100644<br>
&gt; --- a/hw/scsi/viosrp.h<br>
&gt; +++ b/hw/scsi/viosrp.h<br>
&gt; @@ -16,8 +16,7 @@<br>
&gt;=C2=A0 =C2=A0/* GNU General Public License for more details.=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0/* You should have received a copy of the GNU General Publ=
ic License=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -/* along with this program; if not, write to the Free Software=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -/* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=C2=A0 021=
11-1307=C2=A0 USA */<br>
&gt; +/* along with this program. If not, see &lt;<a href=3D"https://www.gn=
u.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://ww=
w.gnu.org/licenses/</a>&gt;.=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0/* This file contains structures and definitions for IBM R=
PA (RS/6000=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h<br>
&gt; index beb571d5e9..94043431e6 100644<br>
&gt; --- a/hw/sh4/sh7750_regs.h<br>
&gt; +++ b/hw/sh4/sh7750_regs.h<br>
&gt; @@ -22,8 +22,7 @@<br>
&gt;=C2=A0 =C2=A0 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. Se=
e the GNU<br>
&gt;=C2=A0 =C2=A0 * General Public License for more details. You should hav=
e received<br>
&gt;=C2=A0 =C2=A0 * a copy of the GNU General Public License along with RTE=
MS; see<br>
&gt; - * file COPYING. If not, write to the Free Software Foundation, 675<b=
r>
&gt; - * Mass Ave, Cambridge, MA 02139, USA.<br>
&gt; + * file COPYING. If not, see &lt;<a href=3D"https://www.gnu.org/licen=
ses/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.gnu.org/l=
icenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * As a special exception, including RTEMS header files in=
 a file,<br>
&gt;=C2=A0 =C2=A0 * instantiating RTEMS generics or templates, or linking o=
ther files<br>
&gt; diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_pl=
atform.h<br>
&gt; index e0e6c8ce94..4a56dd4b89 100644<br>
&gt; --- a/include/hw/arm/raspi_platform.h<br>
&gt; +++ b/include/hw/arm/raspi_platform.h<br>
&gt; @@ -18,8 +18,7 @@<br>
&gt;=C2=A0 =C2=A0 * GNU General Public License for more details.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * You should have received a copy of the GNU General Publ=
ic License<br>
&gt; - * along with this program; if not, write to the Free Software<br>
&gt; - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=C2=A0 021=
11-1307=C2=A0 USA<br>
&gt; + * along with this program. If not, see &lt;<a href=3D"https://www.gn=
u.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://ww=
w.gnu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * Various undocumented addresses and names come from Herm=
an Hermitage&#39;s VC4<br>
&gt;=C2=A0 =C2=A0 * documentation:<br>
&gt; diff --git a/include/qemu/uri.h b/include/qemu/uri.h<br>
&gt; index d201c61260..cf8ec70356 100644<br>
&gt; --- a/include/qemu/uri.h<br>
&gt; +++ b/include/qemu/uri.h<br>
&gt; @@ -41,8 +41,7 @@<br>
&gt;=C2=A0 =C2=A0 * Lesser General Public License for more details.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * You should have received a copy of the GNU Lesser Gener=
al Public<br>
&gt; - * License along with this library; if not, write to the Free Softwar=
e<br>
&gt; - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-130=
7=C2=A0 USA<br>
&gt; + * License along with this library. If not, see &lt;<a href=3D"https:=
//www.gnu.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://www.gnu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * Authors:<br>
&gt;=C2=A0 =C2=A0 *=C2=A0 =C2=A0 Richard W.M. Jones &lt;<a href=3D"mailto:r=
jones@redhat.com" target=3D"_blank" rel=3D"noreferrer">rjones@redhat.com</a=
>&gt;<br>
&gt; diff --git a/tests/qemu-iotests/022 b/tests/qemu-iotests/022<br>
&gt; index a116cfe255..d98d1ea90f 100755<br>
&gt; --- a/tests/qemu-iotests/022<br>
&gt; +++ b/tests/qemu-iotests/022<br>
&gt; @@ -16,9 +16,7 @@<br>
&gt;=C2=A0 =C2=A0# GNU General Public License for more details.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0# You should have received a copy of the GNU General Publi=
c License<br>
&gt; -# along with this program; if not, write to the Free Software<br>
&gt; -# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=C2=A0 0211=
1-1307<br>
&gt; -# USA<br>
&gt; +# along with this program. If not, see &lt;<a href=3D"https://www.gnu=
.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www=
.gnu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# creator<br>
&gt; diff --git a/tests/unit/rcutorture.c b/tests/unit/rcutorture.c<br>
&gt; index 495a4e6f42..7662081683 100644<br>
&gt; --- a/tests/unit/rcutorture.c<br>
&gt; +++ b/tests/unit/rcutorture.c<br>
&gt; @@ -50,8 +50,7 @@<br>
&gt;=C2=A0 =C2=A0 * GNU General Public License for more details.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * You should have received a copy of the GNU General Publ=
ic License<br>
&gt; - * along with this program; if not, write to the Free Software<br>
&gt; - * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-13=
07, USA.<br>
&gt; + * along with this program. If not, see &lt;<a href=3D"https://www.gn=
u.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://ww=
w.gnu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * Copyright (c) 2008 Paul E. McKenney, IBM Corporation.<b=
r>
&gt;=C2=A0 =C2=A0 */<br>
&gt; diff --git a/tests/unit/test-rcu-list.c b/tests/unit/test-rcu-list.c<b=
r>
&gt; index 64b81ae058..9964171da4 100644<br>
&gt; --- a/tests/unit/test-rcu-list.c<br>
&gt; +++ b/tests/unit/test-rcu-list.c<br>
&gt; @@ -14,8 +14,7 @@<br>
&gt;=C2=A0 =C2=A0 * GNU General Public License for more details.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * You should have received a copy of the GNU General Publ=
ic License<br>
&gt; - * along with this program; if not, write to the Free Software<br>
&gt; - * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-13=
07, USA.<br>
&gt; + * along with this program. If not, see &lt;<a href=3D"https://www.gn=
u.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://ww=
w.gnu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * Copyright (c) 2013 Mike D. Day, IBM Corporation.<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt; diff --git a/util/uri.c b/util/uri.c<br>
&gt; index ff72c6005f..dcb3305236 100644<br>
&gt; --- a/util/uri.c<br>
&gt; +++ b/util/uri.c<br>
&gt; @@ -43,8 +43,7 @@<br>
&gt;=C2=A0 =C2=A0 * Lesser General Public License for more details.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * You should have received a copy of the GNU Lesser Gener=
al Public<br>
&gt; - * License along with this library; if not, write to the Free Softwar=
e<br>
&gt; - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-130=
7=C2=A0 USA<br>
&gt; + * License along with this library. If not, see &lt;<a href=3D"https:=
//www.gnu.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://www.gnu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * Authors:<br>
&gt;=C2=A0 =C2=A0 *=C2=A0 =C2=A0 Richard W.M. Jones &lt;<a href=3D"mailto:r=
jones@redhat.com" target=3D"_blank" rel=3D"noreferrer">rjones@redhat.com</a=
>&gt;<br>
<br>
</blockquote></div>

--00000000000091d20905f442657a--

