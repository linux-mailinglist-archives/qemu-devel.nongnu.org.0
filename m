Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9DD4AD845
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:23:48 +0100 (CET)
Received: from localhost ([::1]:49880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPX9-00016E-GG
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:23:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOTO-0001cf-OL
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:15:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOT7-0006PK-1H
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:15:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644318932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zDssK10xkac+ezYQtTWlMNki1tAeBRBmxbwJCXP8Uzk=;
 b=HwlPAG2u8zBIDanSSsVeoYahl26Ljs2fJ8+hJb2g4mU8P0rODNSpKXEtJU8l8fqFaaTFz4
 lSoXSdH5BFWn688QbfrrfZB7digRsAAaYVfXQ8dsyC+0YMtlBhlYTR3fSykqEWbeh+H1ma
 4JNPbSZh834s/Tcss9MspIXv5/QvMKU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-cEdGnIpQN4KU52673uMhvQ-1; Tue, 08 Feb 2022 06:15:28 -0500
X-MC-Unique: cEdGnIpQN4KU52673uMhvQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 v10-20020a05690204ca00b0061dd584eb83so8272863ybs.21
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDssK10xkac+ezYQtTWlMNki1tAeBRBmxbwJCXP8Uzk=;
 b=jDII04jivylNV0ObkncHRPVBp0EuOa+/PTRE1JTVwQYsdNfUqWgd+AF+oIMvamxsWF
 AUikXYxD55Zbb1vDhE5cdo87cMyclOcDxAKEm3oVB5vdM8lznJ37gXYj6PO0t8dVeEFX
 7d3tT4/dsnUNp8/2IG3a1GnqSAbkVpQSzTzfk3G8A9pgVXa9O9ws6FGjTNYoAcOrv2b7
 KdXk2pohXGtOq1v++ynlMSN6BdQiyqaLdkvpsLiPkvba/DbkPBrAul0Yc6mqpQkzJfps
 wG5sLoS3WK8dsTLeZ+H9PYh0F3DzU+5sTD5z9AHI0fzmvoPs9XUxznP8solaFJpXIjv9
 King==
X-Gm-Message-State: AOAM532IU4vy6bf3ZvXfkpsJp81TobZAGqJc2JXNYLY3+HQQUDgs2w4e
 1hmCmtneb6LzP4zkWodRGaVExr1V1DyMvXIaJEGvcDZCXsvkc9XzVjhTcZFkb2ZFwLe7MSqFJKu
 H9eoBXlz9mMngw6OQccHeLAOY35AJ37U=
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr3948338ybo.103.1644318927594; 
 Tue, 08 Feb 2022 03:15:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwrwavf8T0iMDaCnDC/gvkBKEfcR+CxNkXk1KQs05VFOcANBUGNgxi/Ku8T8zpR17ipA0NjO7on5r9QccAvX8=
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr3948327ybo.103.1644318927415; 
 Tue, 08 Feb 2022 03:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-27-pbonzini@redhat.com>
In-Reply-To: <20220203173359.292068-27-pbonzini@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 8 Feb 2022 13:15:16 +0200
Message-ID: <CAPMcbCqSeZ0xH89OcB+SoOFXooohFwAKJ2NjnpQwEzT+ntbLpA@mail.gmail.com>
Subject: Re: [PATCH 26/27] meson, configure: move ntddscsi API check to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009102a305d77fd52d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009102a305d77fd52d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, Feb 3, 2022 at 8:03 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure            | 23 -----------------------
>  meson.build          | 18 +++++++++++++++++-
>  qga/commands-win32.c |  6 +++---
>  qga/meson.build      |  2 +-
>  4 files changed, 21 insertions(+), 28 deletions(-)
>
> diff --git a/configure b/configure
> index f67088044f..f6b9e5a1cd 100755
> --- a/configure
> +++ b/configure
> @@ -2289,26 +2289,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# check if mingw environment provides a recent ntddscsi.h
> -guest_agent_ntddscsi=3D"no"
> -if test "$mingw32" =3D "yes"; then
> -  cat > $TMPC << EOF
> -#include <windows.h>
> -#include <ntddscsi.h>
> -int main(void) {
> -#if !defined(IOCTL_SCSI_GET_ADDRESS)
> -#error Missing required ioctl definitions
> -#endif
> -  SCSI_ADDRESS addr =3D { .Lun =3D 0, .TargetId =3D 0, .PathId =3D 0 };
> -  return addr.Lun;
> -}
> -EOF
> -  if compile_prog "" "" ; then
> -    guest_agent_ntddscsi=3Dyes
> -  fi
> -fi
> -
>  ##########################################
>  # capstone
>
> @@ -2818,9 +2798,6 @@ if test "$debug_tcg" =3D "yes" ; then
>  fi
>  if test "$mingw32" =3D "yes" ; then
>    echo "CONFIG_WIN32=3Dy" >> $config_host_mak
> -  if test "$guest_agent_ntddscsi" =3D "yes" ; then
> -    echo "CONFIG_QGA_NTDDSCSI=3Dy" >> $config_host_mak
> -  fi
>    echo "QEMU_GA_MSI_MINGW_DLL_PATH=3D${QEMU_GA_MSI_MINGW_DLL_PATH}" >>
> $config_host_mak
>    echo "QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}" >> $config_host_=
mak
>    echo "QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index 999d2c8bd1..98e795d21a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1944,6 +1944,22 @@ if targetos =3D=3D 'windows' and link_language =3D=
=3D 'cpp'
>      int main(void) { return VSS_CTX_BACKUP; }''')
>  endif
>
> +have_ntddscsi =3D false
> +if targetos =3D=3D 'windows'
> +  have_ntddscsi =3D cc.compiles('''
> +    #include <windows.h>
> +    #include <ntddscsi.h>
> +    int main(void) {
> +    #if !defined(IOCTL_SCSI_GET_ADDRESS)
> +    #error Missing required ioctl definitions
> +    #endif
> +      SCSI_ADDRESS addr =3D { .Lun =3D 0, .TargetId =3D 0, .PathId =3D 0=
 };
> +      return addr.Lun;
> +    }
> +''')
> +endif
> +config_host_data.set('HAVE_NTDDSCSI', have_ntddscsi)
> +
>  ignored =3D ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
>      'HAVE_GDB_BIN']
>  arrays =3D ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
> @@ -3615,7 +3631,7 @@ summary_info +=3D {'libnfs support':    libnfs}
>  if targetos =3D=3D 'windows'
>    if have_ga
>      summary_info +=3D {'QGA VSS support':   have_qga_vss}
> -    summary_info +=3D {'QGA w32 disk info':
> config_host.has_key('CONFIG_QGA_NTDDSCSI')}
> +    summary_info +=3D {'QGA w32 disk info': have_ntddscsi}
>    endif
>  endif
>  summary_info +=3D {'seccomp support':   seccomp}
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 484cb1c6bd..4fbbad793f 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -18,7 +18,7 @@
>  #include <ws2tcpip.h>
>  #include <iptypes.h>
>  #include <iphlpapi.h>
> -#ifdef CONFIG_QGA_NTDDSCSI
> +#ifdef HAVE_NTDDSCSI
>  #include <winioctl.h>
>  #include <ntddscsi.h>
>  #endif
> @@ -474,7 +474,7 @@ void qmp_guest_file_flush(int64_t handle, Error **err=
p)
>      }
>  }
>
> -#ifdef CONFIG_QGA_NTDDSCSI
> +#ifdef HAVE_NTDDSCSI
>
>  static GuestDiskBusType win2qemu[] =3D {
>      [BusTypeUnknown] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,
> @@ -1111,7 +1111,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp=
)
>      return NULL;
>  }
>
> -#endif /* CONFIG_QGA_NTDDSCSI */
> +#endif /* HAVE_NTDDSCSI */
>
>  static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
>  {
> diff --git a/qga/meson.build b/qga/meson.build
> index 8c177435ac..fe0bfc295f 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -88,7 +88,7 @@ if targetos =3D=3D 'windows'
>      qga_libs +=3D ['-lole32', '-loleaut32', '-lshlwapi', '-lstdc++',
> '-Wl,--enable-stdcall-fixup']
>      subdir('vss-win32')
>    endif
> -  if 'CONFIG_QGA_NTDDSCSI' in config_host
> +  if have_ntddscsi
>      qga_libs +=3D ['-lsetupapi', '-lcfgmgr32']
>    endif
>  endif
> --
> 2.34.1
>
>
>
>

--0000000000009102a305d77fd52d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kk=
ostiuk@redhat.com">kkostiuk@redhat.com</a>&gt;</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 3, 2022 at 8:03 P=
M Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redh=
at.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 -------------=
----------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++++++++++++++++-=
<br>
=C2=A0qga/commands-win32.c |=C2=A0 6 +++---<br>
=C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A04 files changed, 21 insertions(+), 28 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index f67088044f..f6b9e5a1cd 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2289,26 +2289,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# check if mingw environment provides a recent ntddscsi.h<br>
-guest_agent_ntddscsi=3D&quot;no&quot;<br>
-if test &quot;$mingw32&quot; =3D &quot;yes&quot;; then<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;windows.h&gt;<br>
-#include &lt;ntddscsi.h&gt;<br>
-int main(void) {<br>
-#if !defined(IOCTL_SCSI_GET_ADDRESS)<br>
-#error Missing required ioctl definitions<br>
-#endif<br>
-=C2=A0 SCSI_ADDRESS addr =3D { .Lun =3D 0, .TargetId =3D 0, .PathId =3D 0 =
};<br>
-=C2=A0 return addr.Lun;<br>
-}<br>
-EOF<br>
-=C2=A0 if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 =C2=A0 guest_agent_ntddscsi=3Dyes<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# capstone<br>
<br>
@@ -2818,9 +2798,6 @@ if test &quot;$debug_tcg&quot; =3D &quot;yes&quot; ; =
then<br>
=C2=A0fi<br>
=C2=A0if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_WIN32=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-=C2=A0 if test &quot;$guest_agent_ntddscsi&quot; =3D &quot;yes&quot; ; the=
n<br>
-=C2=A0 =C2=A0 echo &quot;CONFIG_QGA_NTDDSCSI=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
-=C2=A0 fi<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_MSI_MINGW_DLL_PATH=3D${QEMU_GA_MSI_MINGW_DL=
L_PATH}&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}&quot=
; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}&quot; &gt;&gt; $=
config_host_mak<br>
diff --git a/meson.build b/meson.build<br>
index 999d2c8bd1..98e795d21a 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1944,6 +1944,22 @@ if targetos =3D=3D &#39;windows&#39; and link_langua=
ge =3D=3D &#39;cpp&#39;<br>
=C2=A0 =C2=A0 =C2=A0int main(void) { return VSS_CTX_BACKUP; }&#39;&#39;&#39=
;)<br>
=C2=A0endif<br>
<br>
+have_ntddscsi =3D false<br>
+if targetos =3D=3D &#39;windows&#39;<br>
+=C2=A0 have_ntddscsi =3D cc.compiles(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 #include &lt;windows.h&gt;<br>
+=C2=A0 =C2=A0 #include &lt;ntddscsi.h&gt;<br>
+=C2=A0 =C2=A0 int main(void) {<br>
+=C2=A0 =C2=A0 #if !defined(IOCTL_SCSI_GET_ADDRESS)<br>
+=C2=A0 =C2=A0 #error Missing required ioctl definitions<br>
+=C2=A0 =C2=A0 #endif<br>
+=C2=A0 =C2=A0 =C2=A0 SCSI_ADDRESS addr =3D { .Lun =3D 0, .TargetId =3D 0, =
.PathId =3D 0 };<br>
+=C2=A0 =C2=A0 =C2=A0 return addr.Lun;<br>
+=C2=A0 =C2=A0 }<br>
+&#39;&#39;&#39;)<br>
+endif<br>
+config_host_data.set(&#39;HAVE_NTDDSCSI&#39;, have_ntddscsi)<br>
+<br>
=C2=A0ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;, # actually per-targ=
et<br>
=C2=A0 =C2=A0 =C2=A0&#39;HAVE_GDB_BIN&#39;]<br>
=C2=A0arrays =3D [&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_W=
HITELIST&#39;]<br>
@@ -3615,7 +3631,7 @@ summary_info +=3D {&#39;libnfs support&#39;:=C2=A0 =
=C2=A0 libnfs}<br>
=C2=A0if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0if have_ga<br>
=C2=A0 =C2=A0 =C2=A0summary_info +=3D {&#39;QGA VSS support&#39;:=C2=A0 =C2=
=A0have_qga_vss}<br>
-=C2=A0 =C2=A0 summary_info +=3D {&#39;QGA w32 disk info&#39;: config_host.=
has_key(&#39;CONFIG_QGA_NTDDSCSI&#39;)}<br>
+=C2=A0 =C2=A0 summary_info +=3D {&#39;QGA w32 disk info&#39;: have_ntddscs=
i}<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
=C2=A0summary_info +=3D {&#39;seccomp support&#39;:=C2=A0 =C2=A0seccomp}<br=
>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 484cb1c6bd..4fbbad793f 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -18,7 +18,7 @@<br>
=C2=A0#include &lt;ws2tcpip.h&gt;<br>
=C2=A0#include &lt;iptypes.h&gt;<br>
=C2=A0#include &lt;iphlpapi.h&gt;<br>
-#ifdef CONFIG_QGA_NTDDSCSI<br>
+#ifdef HAVE_NTDDSCSI<br>
=C2=A0#include &lt;winioctl.h&gt;<br>
=C2=A0#include &lt;ntddscsi.h&gt;<br>
=C2=A0#endif<br>
@@ -474,7 +474,7 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-#ifdef CONFIG_QGA_NTDDSCSI<br>
+#ifdef HAVE_NTDDSCSI<br>
<br>
=C2=A0static GuestDiskBusType win2qemu[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[BusTypeUnknown] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,<br>
@@ -1111,7 +1111,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<=
br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
-#endif /* CONFIG_QGA_NTDDSCSI */<br>
+#endif /* HAVE_NTDDSCSI */<br>
<br>
=C2=A0static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **er=
rp)<br>
=C2=A0{<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index 8c177435ac..fe0bfc295f 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -88,7 +88,7 @@ if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0qga_libs +=3D [&#39;-lole32&#39;, &#39;-loleaut32&#39;,=
 &#39;-lshlwapi&#39;, &#39;-lstdc++&#39;, &#39;-Wl,--enable-stdcall-fixup&#=
39;]<br>
=C2=A0 =C2=A0 =C2=A0subdir(&#39;vss-win32&#39;)<br>
=C2=A0 =C2=A0endif<br>
-=C2=A0 if &#39;CONFIG_QGA_NTDDSCSI&#39; in config_host<br>
+=C2=A0 if have_ntddscsi<br>
=C2=A0 =C2=A0 =C2=A0qga_libs +=3D [&#39;-lsetupapi&#39;, &#39;-lcfgmgr32&#3=
9;]<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009102a305d77fd52d--


