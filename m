Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F868EF64
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:57:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPk0c-0004wH-Jx; Wed, 08 Feb 2023 07:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pPk0Y-0004ut-BI
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:57:06 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pPk0V-00035E-Pe
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:57:06 -0500
Received: by mail-ed1-x529.google.com with SMTP id v13so20255520eda.11
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 04:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xKfhqrRbpVgaHxDrnBS8VJWkHa6lfapPMFR41Fqog9I=;
 b=OggaXg/jfqmDZ4HAcvWC1zeHTxIjqNoloKYzDwk/uR+UGfEM/QYTBStt2bpw5bEn+d
 sK09EmTTGDF3box7fQGAh969MLmP3Y5tvvPNj1G31QKmB7fXIFAWY+gx+w3RXm0rLsHI
 B04VP/+EJzK6QiZeqlfwIfyr6HYgxuPcLWzjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xKfhqrRbpVgaHxDrnBS8VJWkHa6lfapPMFR41Fqog9I=;
 b=cWO5XFqsoYWcRHSodAqcGwef5F3LXIwbUwpeC990sQFMKzlYr59GVvTgat6I9zixcO
 nXnV4JW3tWhVx1orKlEcGHQosIyEAdf5SbUlsVLP8qDUknlrnMtXNNN7Co7kG2an1F9q
 5utGv2/pylgYKDdRTUfbjV7SW66sjFbzQUvP/i/ceqBz98U00cG7unELs4MJrb/xsuFf
 JJ3HEQRbvPnZ/d2gIXVXCDhGdydMTyKvE5oM5XJuT3flxYYGyUrH98sUyrnz8Wbg/cwn
 xK0RbbkOZAus4ldE6qxU9wkwIwmg0DrJCpJlxFTiuC7ErnVJ9XwCfA1ohlEvvnDQqnLN
 FO4Q==
X-Gm-Message-State: AO0yUKUCRI4SF7NiCrvu4qBTxk5MdF9VJOPvHvu2LM14H69FqO0FM3D0
 4e12e3e5Vs7H22Q78UyltEysG7E658YLq0/RKdRZBFWvAQCXmw==
X-Google-Smtp-Source: AK7set+TLokdNtiHLpzjHfqqork0IZeKu6CsK+7jYjrF6YnK+MkhmQ1dVvupL6RyiGB0dKeOLdHYymIDuIH8c2sOvR0=
X-Received: by 2002:a50:99c3:0:b0:49d:ec5d:28b1 with SMTP id
 n3-20020a5099c3000000b0049dec5d28b1mr1649324edb.7.1675861021822; Wed, 08 Feb
 2023 04:57:01 -0800 (PST)
MIME-Version: 1.0
References: <d1500fe9389a1f6964a2b132466d5be2a44d205f.1675858906.git.kkamran.bese16seecs@seecs.edu.pk>
In-Reply-To: <d1500fe9389a1f6964a2b132466d5be2a44d205f.1675858906.git.kkamran.bese16seecs@seecs.edu.pk>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 8 Feb 2023 12:56:50 +0000
Message-ID: <CAMcjF3B30hoah_+azdsrjQAeAs2sAmRJ1MvdqETChpPOQhGZ1A@mail.gmail.com>
Subject: Re: [PATCH] Updated the FSF address to <https://www.gnu.org/licenses/>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: thuth@redhat.com, ysato@users.sourceforge.jp, alex.bennee@linaro.org, 
 pbonzini@redhat.com, fam@euphon.net, peter.maydell@linaro.org, 
 philmd@linaro.org, kwolf@redhat.com, hreitz@redhat.com
Content-Type: multipart/alternative; boundary="000000000000e6224d05f42fcc68"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-ed1-x529.google.com
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

--000000000000e6224d05f42fcc68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Markus! Thank you for the help with the git rebase command. I was able
to combine my commits to one, create a patch and email it. :)

On Wed, Feb 8, 2023 at 12:52 PM Khadija Kamran <
kkamran.bese16seecs@seecs.edu.pk> wrote:

> diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
> index d2d6f6db8d..b1d01c0992 100644
> --- a/contrib/gitdm/filetypes.txt
> +++ b/contrib/gitdm/filetypes.txt
> @@ -12,8 +12,7 @@
>  # GNU Library General Public License for more details.
>  #
>  # You should have received a copy of the GNU General Public License
> -# along with this program; if not, write to the Free Software
> -# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
> USA.
> +# along with this program. If not, see <https://www.gnu.org/licenses/>.
>  #
>  # Authors : Gregorio Robles <grex@gsyc.escet.urjc.es>
>  # Authors : Germ=C3=A1n P=C3=B3o-Caama=C3=B1o <gpoo@gnome.org>
> diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h
> index e5f9768e8f..58c29aa925 100644
> --- a/hw/scsi/viosrp.h
> +++ b/hw/scsi/viosrp.h
> @@ -16,8 +16,7 @@
>  /* GNU General Public License for more details.
>     */
>  /*
>    */
>  /* You should have received a copy of the GNU General Public License
>    */
> -/* along with this program; if not, write to the Free Software
>    */
> -/* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
> USA */
> +/* along with this program. If not, see <https://www.gnu.org/licenses/>.
>    */
>  /*
>    */
>  /*
>    */
>  /* This file contains structures and definitions for IBM RPA (RS/6000
>     */
> diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
> index beb571d5e9..94043431e6 100644
> --- a/hw/sh4/sh7750_regs.h
> +++ b/hw/sh4/sh7750_regs.h
> @@ -22,8 +22,7 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>   * General Public License for more details. You should have received
>   * a copy of the GNU General Public License along with RTEMS; see
> - * file COPYING. If not, write to the Free Software Foundation, 675
> - * Mass Ave, Cambridge, MA 02139, USA.
> + * file COPYING. If not, see <https://www.gnu.org/licenses/>.
>   *
>   * As a special exception, including RTEMS header files in a file,
>   * instantiating RTEMS generics or templates, or linking other files
> diff --git a/include/hw/arm/raspi_platform.h
> b/include/hw/arm/raspi_platform.h
> index e0e6c8ce94..4a56dd4b89 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -18,8 +18,7 @@
>   * GNU General Public License for more details.
>   *
>   * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
> USA
> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
>   *
>   * Various undocumented addresses and names come from Herman Hermitage's
> VC4
>   * documentation:
> diff --git a/include/qemu/uri.h b/include/qemu/uri.h
> index d201c61260..cf8ec70356 100644
> --- a/include/qemu/uri.h
> +++ b/include/qemu/uri.h
> @@ -41,8 +41,7 @@
>   * Lesser General Public License for more details.
>   *
>   * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> USA
> + * License along with this library. If not, see <
> https://www.gnu.org/licenses/>.
>   *
>   * Authors:
>   *    Richard W.M. Jones <rjones@redhat.com>
> diff --git a/tests/qemu-iotests/022 b/tests/qemu-iotests/022
> index a116cfe255..d98d1ea90f 100755
> --- a/tests/qemu-iotests/022
> +++ b/tests/qemu-iotests/022
> @@ -16,9 +16,7 @@
>  # GNU General Public License for more details.
>  #
>  # You should have received a copy of the GNU General Public License
> -# along with this program; if not, write to the Free Software
> -# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
> -# USA
> +# along with this program. If not, see <https://www.gnu.org/licenses/>.
>  #
>
>  # creator
> diff --git a/tests/unit/rcutorture.c b/tests/unit/rcutorture.c
> index 495a4e6f42..7662081683 100644
> --- a/tests/unit/rcutorture.c
> +++ b/tests/unit/rcutorture.c
> @@ -50,8 +50,7 @@
>   * GNU General Public License for more details.
>   *
>   * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
> USA.
> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
>   *
>   * Copyright (c) 2008 Paul E. McKenney, IBM Corporation.
>   */
> diff --git a/tests/unit/test-rcu-list.c b/tests/unit/test-rcu-list.c
> index 64b81ae058..9964171da4 100644
> --- a/tests/unit/test-rcu-list.c
> +++ b/tests/unit/test-rcu-list.c
> @@ -14,8 +14,7 @@
>   * GNU General Public License for more details.
>   *
>   * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
> USA.
> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
>   *
>   * Copyright (c) 2013 Mike D. Day, IBM Corporation.
>   */
> diff --git a/util/uri.c b/util/uri.c
> index ff72c6005f..dcb3305236 100644
> --- a/util/uri.c
> +++ b/util/uri.c
> @@ -43,8 +43,7 @@
>   * Lesser General Public License for more details.
>   *
>   * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> USA
> + * License along with this library. If not, see <
> https://www.gnu.org/licenses/>.
>   *
>   * Authors:
>   *    Richard W.M. Jones <rjones@redhat.com>
> --
> 2.34.1
>
>

--=20
Regards,
Khadija Kamran
Registration number: 193799
BESE-7A

--000000000000e6224d05f42fcc68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Markus! Thank you for the help with the git rebase com=
mand. I was able to combine my commits to one, create a patch and email it.=
 :)<img src=3D"https://monitor-mailtracker.com/pixel/sOFhDXf5pHwfgDJJAkX6?r=
id=3DsOFhDXf5pHwfgDJJAkX6" width=3D"1" height=3D"1" border=3D"0"></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Fe=
b 8, 2023 at 12:52 PM Khadija Kamran &lt;<a href=3D"mailto:kkamran.bese16se=
ecs@seecs.edu.pk">kkamran.bese16seecs@seecs.edu.pk</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">diff --git a/contrib/gitd=
m/filetypes.txt b/contrib/gitdm/filetypes.txt<br>
index d2d6f6db8d..b1d01c0992 100644<br>
--- a/contrib/gitdm/filetypes.txt<br>
+++ b/contrib/gitdm/filetypes.txt<br>
@@ -12,8 +12,7 @@<br>
=C2=A0# GNU Library General Public License for more details.<br>
=C2=A0#<br>
=C2=A0# You should have received a copy of the GNU General Public License<b=
r>
-# along with this program; if not, write to the Free Software<br>
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, US=
A.<br>
+# along with this program. If not, see &lt;<a href=3D"https://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/license=
s/</a>&gt;.<br>
=C2=A0#<br>
=C2=A0# Authors : Gregorio Robles &lt;<a href=3D"mailto:grex@gsyc.escet.urj=
c.es" target=3D"_blank">grex@gsyc.escet.urjc.es</a>&gt;<br>
=C2=A0# Authors : Germ=C3=A1n P=C3=B3o-Caama=C3=B1o &lt;<a href=3D"mailto:g=
poo@gnome.org" target=3D"_blank">gpoo@gnome.org</a>&gt;<br>
diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h<br>
index e5f9768e8f..58c29aa925 100644<br>
--- a/hw/scsi/viosrp.h<br>
+++ b/hw/scsi/viosrp.h<br>
@@ -16,8 +16,7 @@<br>
=C2=A0/* GNU General Public License for more details.=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
=C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0/* You should have received a copy of the GNU General Public License=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-/* along with this program; if not, write to the Free Software=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-/* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=C2=A0 02111-13=
07=C2=A0 USA */<br>
+/* along with this program. If not, see &lt;<a href=3D"https://www.gnu.org=
/licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/licens=
es/</a>&gt;.=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0/* This file contains structures and definitions for IBM RPA (RS/6000=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h<br>
index beb571d5e9..94043431e6 100644<br>
--- a/hw/sh4/sh7750_regs.h<br>
+++ b/hw/sh4/sh7750_regs.h<br>
@@ -22,8 +22,7 @@<br>
=C2=A0 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU<b=
r>
=C2=A0 * General Public License for more details. You should have received<=
br>
=C2=A0 * a copy of the GNU General Public License along with RTEMS; see<br>
- * file COPYING. If not, write to the Free Software Foundation, 675<br>
- * Mass Ave, Cambridge, MA 02139, USA.<br>
+ * file COPYING. If not, see &lt;<a href=3D"https://www.gnu.org/licenses/"=
 rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/licenses/</a>&gt;=
.<br>
=C2=A0 *<br>
=C2=A0 * As a special exception, including RTEMS header files in a file,<br=
>
=C2=A0 * instantiating RTEMS generics or templates, or linking other files<=
br>
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platfor=
m.h<br>
index e0e6c8ce94..4a56dd4b89 100644<br>
--- a/include/hw/arm/raspi_platform.h<br>
+++ b/include/hw/arm/raspi_platform.h<br>
@@ -18,8 +18,7 @@<br>
=C2=A0 * GNU General Public License for more details.<br>
=C2=A0 *<br>
=C2=A0 * You should have received a copy of the GNU General Public License<=
br>
- * along with this program; if not, write to the Free Software<br>
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=C2=A0 02111-13=
07=C2=A0 USA<br>
+ * along with this program. If not, see &lt;<a href=3D"https://www.gnu.org=
/licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/licens=
es/</a>&gt;.<br>
=C2=A0 *<br>
=C2=A0 * Various undocumented addresses and names come from Herman Hermitag=
e&#39;s VC4<br>
=C2=A0 * documentation:<br>
diff --git a/include/qemu/uri.h b/include/qemu/uri.h<br>
index d201c61260..cf8ec70356 100644<br>
--- a/include/qemu/uri.h<br>
+++ b/include/qemu/uri.h<br>
@@ -41,8 +41,7 @@<br>
=C2=A0 * Lesser General Public License for more details.<br>
=C2=A0 *<br>
=C2=A0 * You should have received a copy of the GNU Lesser General Public<b=
r>
- * License along with this library; if not, write to the Free Software<br>
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307=C2=
=A0 USA<br>
+ * License along with this library. If not, see &lt;<a href=3D"https://www=
.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.or=
g/licenses/</a>&gt;.<br>
=C2=A0 *<br>
=C2=A0 * Authors:<br>
=C2=A0 *=C2=A0 =C2=A0 Richard W.M. Jones &lt;<a href=3D"mailto:rjones@redha=
t.com" target=3D"_blank">rjones@redhat.com</a>&gt;<br>
diff --git a/tests/qemu-iotests/022 b/tests/qemu-iotests/022<br>
index a116cfe255..d98d1ea90f 100755<br>
--- a/tests/qemu-iotests/022<br>
+++ b/tests/qemu-iotests/022<br>
@@ -16,9 +16,7 @@<br>
=C2=A0# GNU General Public License for more details.<br>
=C2=A0#<br>
=C2=A0# You should have received a copy of the GNU General Public License<b=
r>
-# along with this program; if not, write to the Free Software<br>
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=C2=A0 02111-130=
7<br>
-# USA<br>
+# along with this program. If not, see &lt;<a href=3D"https://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/license=
s/</a>&gt;.<br>
=C2=A0#<br>
<br>
=C2=A0# creator<br>
diff --git a/tests/unit/rcutorture.c b/tests/unit/rcutorture.c<br>
index 495a4e6f42..7662081683 100644<br>
--- a/tests/unit/rcutorture.c<br>
+++ b/tests/unit/rcutorture.c<br>
@@ -50,8 +50,7 @@<br>
=C2=A0 * GNU General Public License for more details.<br>
=C2=A0 *<br>
=C2=A0 * You should have received a copy of the GNU General Public License<=
br>
- * along with this program; if not, write to the Free Software<br>
- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, U=
SA.<br>
+ * along with this program. If not, see &lt;<a href=3D"https://www.gnu.org=
/licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/licens=
es/</a>&gt;.<br>
=C2=A0 *<br>
=C2=A0 * Copyright (c) 2008 Paul E. McKenney, IBM Corporation.<br>
=C2=A0 */<br>
diff --git a/tests/unit/test-rcu-list.c b/tests/unit/test-rcu-list.c<br>
index 64b81ae058..9964171da4 100644<br>
--- a/tests/unit/test-rcu-list.c<br>
+++ b/tests/unit/test-rcu-list.c<br>
@@ -14,8 +14,7 @@<br>
=C2=A0 * GNU General Public License for more details.<br>
=C2=A0 *<br>
=C2=A0 * You should have received a copy of the GNU General Public License<=
br>
- * along with this program; if not, write to the Free Software<br>
- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, U=
SA.<br>
+ * along with this program. If not, see &lt;<a href=3D"https://www.gnu.org=
/licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/licens=
es/</a>&gt;.<br>
=C2=A0 *<br>
=C2=A0 * Copyright (c) 2013 Mike D. Day, IBM Corporation.<br>
=C2=A0 */<br>
diff --git a/util/uri.c b/util/uri.c<br>
index ff72c6005f..dcb3305236 100644<br>
--- a/util/uri.c<br>
+++ b/util/uri.c<br>
@@ -43,8 +43,7 @@<br>
=C2=A0 * Lesser General Public License for more details.<br>
=C2=A0 *<br>
=C2=A0 * You should have received a copy of the GNU Lesser General Public<b=
r>
- * License along with this library; if not, write to the Free Software<br>
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307=C2=
=A0 USA<br>
+ * License along with this library. If not, see &lt;<a href=3D"https://www=
.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.or=
g/licenses/</a>&gt;.<br>
=C2=A0 *<br>
=C2=A0 * Authors:<br>
=C2=A0 *=C2=A0 =C2=A0 Richard W.M. Jones &lt;<a href=3D"mailto:rjones@redha=
t.com" target=3D"_blank">rjones@redhat.com</a>&gt;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><font face=3D"arial, helvetica,=
 sans-serif">Regards,</font><div><font face=3D"arial, helvetica, sans-serif=
">Khadija Kamran</font></div><div><font face=3D"arial, helvetica, sans-seri=
f">Registration number: 193799</font></div><div><font face=3D"arial, helvet=
ica, sans-serif">BESE-7A</font></div></div></div>

--000000000000e6224d05f42fcc68--

