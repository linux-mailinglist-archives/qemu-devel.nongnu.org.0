Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B64EEA9B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:42:04 +0200 (CEST)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDn9-0007gl-9N
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:42:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1naDJD-00009o-HF
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1naDJ8-0005ey-Hz
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648804260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YU9DW2xQ7VlCPne/efRbCc2Z489WhMBOT6koC8Lj7bk=;
 b=PFFm7bVvHlmTU92WMFC6Pou7ZLhuvO7p5zHR37ez3BVmhsPceAd2J9/nkhZ1GRQsanUIzE
 lGc9NPUB0LcxPjtwlNMIjbJXXjt5jr6bg4nj6WsIP3CKfwlfmKC6YnpGWXmS1otvCRxN83
 iQcy5bx0In0wO2+BKR0yYlwbSojOmW4=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-aP5F-I3VOISWCjbGJPs9Kg-1; Fri, 01 Apr 2022 05:09:54 -0400
X-MC-Unique: aP5F-I3VOISWCjbGJPs9Kg-1
Received: by mail-yb1-f200.google.com with SMTP id
 n207-20020a25d6d8000000b0063bd7a74ae4so1715288ybg.21
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YU9DW2xQ7VlCPne/efRbCc2Z489WhMBOT6koC8Lj7bk=;
 b=UPxcm2FBavtEAlEaDXNvlbB0dKXC1GwQtljHN21zn3rw5s7kFghpby96w/2T64zwRj
 NxmRSudkwEH/x/78GNzvJ9nZ9dyOHWqgGPEfTelmfYnETYwHtmp3DEjbNDzP5acCTiRx
 bqZYxu+CnOZ5yRbKrueW0q6rt2H7D2f+IvTKYadXD5LuQdrRAdakna6v0dd5zY/eDP+U
 mDUeaX8nLJt7zcSvaqSUPrbYywwS1j53Qp7kIRis1YuXkq+eLpNX4SXh6szKJm6ZzGIl
 Q4MvuA7m3S7+qqImnL/JrHNb3bgNpuTMQf+swJHYcwWzkxJHAv+F7RCuaTF1djn6WCeg
 4p2w==
X-Gm-Message-State: AOAM531wftPbklCzoaPfUnGlHtji3LD2V/1yS0qvdIrPeF0HotV8K7gk
 OO26/jI4WbSQY3VP8yR40nWlNSU9Ie+HqPuBwOp3BBv7/iP04T2RqPhz6IpaTHYikFTDZPJpC+W
 vO7tRAvBsdNCzVlH0CIdke23dC2rlPbk=
X-Received: by 2002:a25:73ce:0:b0:633:bc19:a576 with SMTP id
 o197-20020a2573ce000000b00633bc19a576mr7419933ybc.68.1648804193792; 
 Fri, 01 Apr 2022 02:09:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydu/fj3q+sAsdGz1UuPYmxEvX45K4sQj+lteQBdI7c7bMoEccB3cIRjTCVzla7NT7sbBsP7MXu2KsKuCnPTks=
X-Received: by 2002:a25:73ce:0:b0:633:bc19:a576 with SMTP id
 o197-20020a2573ce000000b00633bc19a576mr7419921ybc.68.1648804193564; Fri, 01
 Apr 2022 02:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220401085106.2167374-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220401085106.2167374-1-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Fri, 1 Apr 2022 12:09:42 +0300
Message-ID: <CAPMcbCrDhc5XDKpr3P7+y7L-F-Dunm7HOSNmy8NY1vsb32+ukA@mail.gmail.com>
Subject: Re: [PATCH] build-sys: drop ntddscsi.h check
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000043116605db9424e7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000043116605db9424e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Fri, Apr 1, 2022 at 11:51 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The header has been part of MinGW-w64 since the introduction of the
> project (2007). While on MinGW(32), the legacy project, it was imported
> in 2014 from w32api-3.17 (commit e4803e0da2).
>
> According to build-platform.rst and our CI coverage, we only support
> building with MinGW-w64 (from Debian/Fedora).
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build          | 17 -----------------
>  qga/commands-win32.c | 19 -------------------
>  qga/meson.build      |  6 ++----
>  3 files changed, 2 insertions(+), 40 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index c06fe5e02737..46b5e938b196 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2019,22 +2019,6 @@ if targetos =3D=3D 'windows' and link_language =3D=
=3D 'cpp'
>  endif
>  config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
>
> -have_ntddscsi =3D false
> -if targetos =3D=3D 'windows'
> -  have_ntddscsi =3D cc.compiles('''
> -    #include <windows.h>
> -    #include <ntddscsi.h>
> -    int main(void) {
> -    #if !defined(IOCTL_SCSI_GET_ADDRESS)
> -    #error Missing required ioctl definitions
> -    #endif
> -      SCSI_ADDRESS addr =3D { .Lun =3D 0, .TargetId =3D 0, .PathId =3D 0=
 };
> -      return addr.Lun;
> -    }
> -''')
> -endif
> -config_host_data.set('HAVE_NTDDSCSI', have_ntddscsi)
> -
>  ignored =3D ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
>      'HAVE_GDB_BIN']
>  arrays =3D ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
> @@ -3722,7 +3706,6 @@ summary_info +=3D {'libnfs support':    libnfs}
>  if targetos =3D=3D 'windows'
>    if have_ga
>      summary_info +=3D {'QGA VSS support':   have_qga_vss}
> -    summary_info +=3D {'QGA w32 disk info': have_ntddscsi}
>    endif
>  endif
>  summary_info +=3D {'seccomp support':   seccomp}
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 3c428213db0a..ebec5536340a 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -18,10 +18,8 @@
>  #include <ws2tcpip.h>
>  #include <iptypes.h>
>  #include <iphlpapi.h>
> -#ifdef HAVE_NTDDSCSI
>  #include <winioctl.h>
>  #include <ntddscsi.h>
> -#endif
>  #include <setupapi.h>
>  #include <cfgmgr32.h>
>  #include <initguid.h>
> @@ -474,8 +472,6 @@ void qmp_guest_file_flush(int64_t handle, Error **err=
p)
>      }
>  }
>
> -#ifdef HAVE_NTDDSCSI
> -
>  static GuestDiskBusType win2qemu[] =3D {
>      [BusTypeUnknown] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,
>      [BusTypeScsi] =3D GUEST_DISK_BUS_TYPE_SCSI,
> @@ -1098,21 +1094,6 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **err=
p)
>      return ret;
>  }
>
> -#else
> -
> -static GuestDiskAddressList *build_guest_disk_info(char *guid, Error
> **errp)
> -{
> -    return NULL;
> -}
> -
> -GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
> -{
> -    error_setg(errp, QERR_UNSUPPORTED);
> -    return NULL;
> -}
> -
> -#endif /* HAVE_NTDDSCSI */
> -
>  static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
>  {
>      DWORD info_size;
> diff --git a/qga/meson.build b/qga/meson.build
> index 4d5de843abf6..40a7baabfde3 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -83,14 +83,12 @@ qga_ss =3D qga_ss.apply(config_host, strict: false)
>  gen_tlb =3D []
>  qga_libs =3D []
>  if targetos =3D=3D 'windows'
> -  qga_libs +=3D ['-lws2_32', '-lwinmm', '-lpowrprof', '-lwtsapi32',
> '-lwininet', '-liphlpapi', '-lnetapi32']
> +  qga_libs +=3D ['-lws2_32', '-lwinmm', '-lpowrprof', '-lwtsapi32',
> '-lwininet', '-liphlpapi', '-lnetapi32',
> +               '-lsetupapi', '-lcfgmgr32']
>    if have_qga_vss
>      qga_libs +=3D ['-lole32', '-loleaut32', '-lshlwapi', '-lstdc++',
> '-Wl,--enable-stdcall-fixup']
>      subdir('vss-win32')
>    endif
> -  if have_ntddscsi
> -    qga_libs +=3D ['-lsetupapi', '-lcfgmgr32']
> -  endif
>  endif
>
>  qga =3D executable('qemu-ga', qga_ss.sources(),
> --
> 2.35.1.693.g805e0a68082a
>
>

--00000000000043116605db9424e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 1=
, 2022 at 11:51 AM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marca=
ndre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a=
>&gt;<br>
<br>
The header has been part of MinGW-w64 since the introduction of the<br>
project (2007). While on MinGW(32), the legacy project, it was imported<br>
in 2014 from w32api-3.17 (commit e4803e0da2).<br>
<br>
According to build-platform.rst and our CI coverage, we only support<br>
building with MinGW-w64 (from Debian/Fedora).<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 -----------------<=
br>
=C2=A0qga/commands-win32.c | 19 -------------------<br>
=C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++----<br>
=C2=A03 files changed, 2 insertions(+), 40 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index c06fe5e02737..46b5e938b196 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2019,22 +2019,6 @@ if targetos =3D=3D &#39;windows&#39; and link_langua=
ge =3D=3D &#39;cpp&#39;<br>
=C2=A0endif<br>
=C2=A0config_host_data.set(&#39;HAVE_VSS_SDK&#39;, have_vss_sdk)<br>
<br>
-have_ntddscsi =3D false<br>
-if targetos =3D=3D &#39;windows&#39;<br>
-=C2=A0 have_ntddscsi =3D cc.compiles(&#39;&#39;&#39;<br>
-=C2=A0 =C2=A0 #include &lt;windows.h&gt;<br>
-=C2=A0 =C2=A0 #include &lt;ntddscsi.h&gt;<br>
-=C2=A0 =C2=A0 int main(void) {<br>
-=C2=A0 =C2=A0 #if !defined(IOCTL_SCSI_GET_ADDRESS)<br>
-=C2=A0 =C2=A0 #error Missing required ioctl definitions<br>
-=C2=A0 =C2=A0 #endif<br>
-=C2=A0 =C2=A0 =C2=A0 SCSI_ADDRESS addr =3D { .Lun =3D 0, .TargetId =3D 0, =
.PathId =3D 0 };<br>
-=C2=A0 =C2=A0 =C2=A0 return addr.Lun;<br>
-=C2=A0 =C2=A0 }<br>
-&#39;&#39;&#39;)<br>
-endif<br>
-config_host_data.set(&#39;HAVE_NTDDSCSI&#39;, have_ntddscsi)<br>
-<br>
=C2=A0ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;, # actually per-targ=
et<br>
=C2=A0 =C2=A0 =C2=A0&#39;HAVE_GDB_BIN&#39;]<br>
=C2=A0arrays =3D [&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_W=
HITELIST&#39;]<br>
@@ -3722,7 +3706,6 @@ summary_info +=3D {&#39;libnfs support&#39;:=C2=A0 =
=C2=A0 libnfs}<br>
=C2=A0if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0if have_ga<br>
=C2=A0 =C2=A0 =C2=A0summary_info +=3D {&#39;QGA VSS support&#39;:=C2=A0 =C2=
=A0have_qga_vss}<br>
-=C2=A0 =C2=A0 summary_info +=3D {&#39;QGA w32 disk info&#39;: have_ntddscs=
i}<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
=C2=A0summary_info +=3D {&#39;seccomp support&#39;:=C2=A0 =C2=A0seccomp}<br=
>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 3c428213db0a..ebec5536340a 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -18,10 +18,8 @@<br>
=C2=A0#include &lt;ws2tcpip.h&gt;<br>
=C2=A0#include &lt;iptypes.h&gt;<br>
=C2=A0#include &lt;iphlpapi.h&gt;<br>
-#ifdef HAVE_NTDDSCSI<br>
=C2=A0#include &lt;winioctl.h&gt;<br>
=C2=A0#include &lt;ntddscsi.h&gt;<br>
-#endif<br>
=C2=A0#include &lt;setupapi.h&gt;<br>
=C2=A0#include &lt;cfgmgr32.h&gt;<br>
=C2=A0#include &lt;initguid.h&gt;<br>
@@ -474,8 +472,6 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-#ifdef HAVE_NTDDSCSI<br>
-<br>
=C2=A0static GuestDiskBusType win2qemu[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[BusTypeUnknown] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,<br>
=C2=A0 =C2=A0 =C2=A0[BusTypeScsi] =3D GUEST_DISK_BUS_TYPE_SCSI,<br>
@@ -1098,21 +1094,6 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
-#else<br>
-<br>
-static GuestDiskAddressList *build_guest_disk_info(char *guid, Error **err=
p)<br>
-{<br>
-=C2=A0 =C2=A0 return NULL;<br>
-}<br>
-<br>
-GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
-=C2=A0 =C2=A0 return NULL;<br>
-}<br>
-<br>
-#endif /* HAVE_NTDDSCSI */<br>
-<br>
=C2=A0static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **er=
rp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DWORD info_size;<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index 4d5de843abf6..40a7baabfde3 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -83,14 +83,12 @@ qga_ss =3D qga_ss.apply(config_host, strict: false)<br>
=C2=A0gen_tlb =3D []<br>
=C2=A0qga_libs =3D []<br>
=C2=A0if targetos =3D=3D &#39;windows&#39;<br>
-=C2=A0 qga_libs +=3D [&#39;-lws2_32&#39;, &#39;-lwinmm&#39;, &#39;-lpowrpr=
of&#39;, &#39;-lwtsapi32&#39;, &#39;-lwininet&#39;, &#39;-liphlpapi&#39;, &=
#39;-lnetapi32&#39;]<br>
+=C2=A0 qga_libs +=3D [&#39;-lws2_32&#39;, &#39;-lwinmm&#39;, &#39;-lpowrpr=
of&#39;, &#39;-lwtsapi32&#39;, &#39;-lwininet&#39;, &#39;-liphlpapi&#39;, &=
#39;-lnetapi32&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-lsetupapi&#39=
;, &#39;-lcfgmgr32&#39;]<br>
=C2=A0 =C2=A0if have_qga_vss<br>
=C2=A0 =C2=A0 =C2=A0qga_libs +=3D [&#39;-lole32&#39;, &#39;-loleaut32&#39;,=
 &#39;-lshlwapi&#39;, &#39;-lstdc++&#39;, &#39;-Wl,--enable-stdcall-fixup&#=
39;]<br>
=C2=A0 =C2=A0 =C2=A0subdir(&#39;vss-win32&#39;)<br>
=C2=A0 =C2=A0endif<br>
-=C2=A0 if have_ntddscsi<br>
-=C2=A0 =C2=A0 qga_libs +=3D [&#39;-lsetupapi&#39;, &#39;-lcfgmgr32&#39;]<b=
r>
-=C2=A0 endif<br>
=C2=A0endif<br>
<br>
=C2=A0qga =3D executable(&#39;qemu-ga&#39;, qga_ss.sources(),<br>
-- <br>
2.35.1.693.g805e0a68082a<br>
<br>
</blockquote></div>

--00000000000043116605db9424e7--


