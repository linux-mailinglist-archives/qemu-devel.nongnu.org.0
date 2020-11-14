Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228012B2D1D
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 13:23:04 +0100 (CET)
Received: from localhost ([::1]:40382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdua6-0004BQ-N5
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 07:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kduZ9-0003TC-QH
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 07:22:04 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:36606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kduZ6-0004Kl-3T
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 07:22:03 -0500
Received: by mail-ed1-x543.google.com with SMTP id o20so13906068eds.3
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 04:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5cwadVd4VAquABhv8dfPfFccMf9QiYNkFXVKl2ntGk4=;
 b=LRXch8ikm+UTwroL4WYiYujUlP4mk3OB2qEp1AWJBUBSR0K4Ne+9q3RUkRafNvl/g3
 NapxWYcCfKnhp8W4Lw4F6Q9hvB8jIC+YIvygnmBXtlcGFDccQBLMgY2uQI1kIm6K/aRe
 +SPeXD8FO9oHQOBoTL6K1c40X8cgeiAJcqh3P7jqqe/3cpJpbxlfg2AxjgoTYgkbO0Fh
 Ah4+kQUCSwyA51oAPm7DN5pqWUuQuqKIy6vsDPhDZids0oDkuhDoj6Bnp/HN6pH60USh
 +xGR7ye9vWNiGwr2iX5U1BUVYxKAdZ68A7avj7t7sA/Ug88pVUD6ZHH2vTFhROK2KIbn
 hI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5cwadVd4VAquABhv8dfPfFccMf9QiYNkFXVKl2ntGk4=;
 b=ksMTKtOMO71sP+BbAb79aow/LuUPrHK6lqVWKbzC9sRqHc4TUHeAVK0WrVU8d/+iYJ
 Y/BQqrKlnijiuqVeEJA8vxtn34gosqv4OQnxoEtx7nP/le0vsltBiPuf63b7Wd9Qo0ey
 czSQzM/D1B06kPWaclqnv464TwCMI0/yMOemN+z4XorTPl1LHbhwqe75hVJvCqOBVmle
 1Jq7nmXVtFol2O2xGA4dtNCr9C/0QNI3V87bFBDUMSYVOivxrFjPFcN7aKdFpbqZRi+9
 LORREBlHTnZqJl5uFd3GumVg+7ZKcdq8z1sDcr3e0aJm/wX1HaIBQ8BdtRz2tcVGx7gd
 t6gQ==
X-Gm-Message-State: AOAM531rDYzTHlhK59C6twXbAgRBugGDvnce+ht9/xwbBu8tDz0m5S/P
 1lM2tfEZIbhQr0qKaKfCa6EIzjnIjRXlXMKojnY=
X-Google-Smtp-Source: ABdhPJw99IwsOJEEzil2aGr5avsQtmrFWlDx0R04tbONdaeZmf05xW0Eei9B/X1DaB+7fH1Nt6GIWACz9i1fIVzmeHo=
X-Received: by 2002:aa7:cd56:: with SMTP id v22mr7379238edw.245.1605356516142; 
 Sat, 14 Nov 2020 04:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20201113183312.432630-1-michael.roth@amd.com>
In-Reply-To: <20201113183312.432630-1-michael.roth@amd.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 14 Nov 2020 16:21:44 +0400
Message-ID: <CAJ+F1CKMZViPfKpsaAS-afARx582_4trSOg722cwe_qSbgaSaA@mail.gmail.com>
Subject: Re: [PATCH for-5.2] qga: update schema for guest-get-disks
 'dependents' field
To: Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="000000000000e1f3bf05b410306b"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?VG9tw6HFoSBHb2xlbWJpb3Zza8O9?= <tgolembi@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e1f3bf05b410306b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2020 at 10:49 PM Michael Roth <michael.roth@amd.com> wrote:

> The recently-added 'guest-get-disk' command returns a list of
> GuestDiskInfo entries, which in turn have a 'dependents' field which
> lists devices these entries are dependent upon. Thus, 'dependencies'
> is a better name for this field. Address this by renaming the field
> accordingly.
>
> Additionally, 'dependents' is specified as non-optional, even though
> it's not implemented for w32. This is misleading, since it gives users
> the impression that a particular disk might not have dependencies,
> when in reality that information is simply not known to the guest
> agent. Address this by making 'dependents' an optional field, and only
> marking it as in-use when the facilities to obtain this information are
> available to the guest agent.
>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@redhat.com>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-posix.c | 10 ++++++----
>  qga/qapi-schema.json |  8 ++++----
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 12c1ba5ef7..c089e38120 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1285,6 +1285,7 @@ static void get_disk_deps(const char *disk_dir,
> GuestDiskInfo *disk)
>          g_debug("failed to list entries in %s", deps_dir);
>          return;
>      }
> +    disk->has_dependencies =3D true;
>      while ((dep =3D g_dir_read_name(dp_deps)) !=3D NULL) {
>          g_autofree char *dep_dir =3D NULL;
>          strList *dep_item =3D NULL;
> @@ -1297,8 +1298,8 @@ static void get_disk_deps(const char *disk_dir,
> GuestDiskInfo *disk)
>              g_debug("  adding dependent device: %s", dev_name);
>              dep_item =3D g_new0(strList, 1);
>              dep_item->value =3D dev_name;
> -            dep_item->next =3D disk->dependents;
> -            disk->dependents =3D dep_item;
> +            dep_item->next =3D disk->dependencies;
> +            disk->dependencies =3D dep_item;
>          }
>      }
>      g_dir_close(dp_deps);
> @@ -1351,8 +1352,9 @@ static GuestDiskInfoList *get_disk_partitions(
>          partition->name =3D dev_name;
>          partition->partition =3D true;
>          /* Add parent disk as dependent for easier tracking of hierarchy
> */
> -        partition->dependents =3D g_new0(strList, 1);
> -        partition->dependents->value =3D g_strdup(disk_dev);
> +        partition->dependencies =3D g_new0(strList, 1);
> +        partition->dependencies->value =3D g_strdup(disk_dev);
> +        partition->has_dependencies =3D true;
>
>          item =3D g_new0(GuestDiskInfoList, 1);
>          item->value =3D partition;
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 6ca85f995f..3b3d1d0bd9 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -870,9 +870,9 @@
>  #
>  # @name: device node (Linux) or device UNC (Windows)
>  # @partition: whether this is a partition or disk
> -# @dependents: list of dependent devices; e.g. for LVs of the LVM this
> will
> -#              hold the list of PVs, for LUKS encrypted volume this will
> -#              contain the disk where the volume is placed.     (Linux)
> +# @dependencies: list of device dependencies; e.g. for LVs of the LVM
> this will
> +#                hold the list of PVs, for LUKS encrypted volume this wi=
ll
> +#                contain the disk where the volume is placed.     (Linux=
)
>  # @address: disk address information (only for non-virtual devices)
>  # @alias: optional alias assigned to the disk, on Linux this is a name
> assigned
>  #         by device mapper
> @@ -880,7 +880,7 @@
>  # Since 5.2
>  ##
>  { 'struct': 'GuestDiskInfo',
> -  'data': {'name': 'str', 'partition': 'bool', 'dependents': ['str'],
> +  'data': {'name': 'str', 'partition': 'bool', '*dependencies': ['str'],
>             '*address': 'GuestDiskAddress', '*alias': 'str'} }
>
>  ##
> --
> 2.25.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e1f3bf05b410306b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 13, 2020 at 10:49 PM Mich=
ael Roth &lt;<a href=3D"mailto:michael.roth@amd.com" target=3D"_blank">mich=
ael.roth@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">The recently-added &#39;guest-get-disk&#39; command returns=
 a list of<br>
GuestDiskInfo entries, which in turn have a &#39;dependents&#39; field whic=
h<br>
lists devices these entries are dependent upon. Thus, &#39;dependencies&#39=
;<br>
is a better name for this field. Address this by renaming the field<br>
accordingly.<br>
<br>
Additionally, &#39;dependents&#39; is specified as non-optional, even thoug=
h<br>
it&#39;s not implemented for w32. This is misleading, since it gives users<=
br>
the impression that a particular disk might not have dependencies,<br>
when in reality that information is simply not known to the guest<br>
agent. Address this by making &#39;dependents&#39; an optional field, and o=
nly<br>
marking it as in-use when the facilities to obtain this information are<br>
available to the guest agent.<br>
<br>
Cc: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"_blank">e=
blake@redhat.com</a>&gt;<br>
Cc: Tom=C3=A1=C5=A1 Golembiovsk=C3=BD &lt;<a href=3D"mailto:tgolembi@redhat=
.com" target=3D"_blank">tgolembi@redhat.com</a>&gt;<br>
Cc: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Michael Roth &lt;<a href=3D"mailto:michael.roth@amd.com" tar=
get=3D"_blank">michael.roth@amd.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by:=20
Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" t=
arget=3D"_blank">marcandre.lureau@redhat.com</a>&gt;

</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/commands-posix.c | 10 ++++++----<br>
=C2=A0qga/qapi-schema.json |=C2=A0 8 ++++----<br>
=C2=A02 files changed, 10 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 12c1ba5ef7..c089e38120 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -1285,6 +1285,7 @@ static void get_disk_deps(const char *disk_dir, Guest=
DiskInfo *disk)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_debug(&quot;failed to list entries in %=
s&quot;, deps_dir);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 disk-&gt;has_dependencies =3D true;<br>
=C2=A0 =C2=A0 =C2=A0while ((dep =3D g_dir_read_name(dp_deps)) !=3D NULL) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_autofree char *dep_dir =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strList *dep_item =3D NULL;<br>
@@ -1297,8 +1298,8 @@ static void get_disk_deps(const char *disk_dir, Guest=
DiskInfo *disk)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_debug(&quot;=C2=A0 adding=
 dependent device: %s&quot;, dev_name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dep_item =3D g_new0(strList=
, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dep_item-&gt;value =3D dev_=
name;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_item-&gt;next =3D disk-&gt;d=
ependents;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;dependents =3D dep_item=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_item-&gt;next =3D disk-&gt;d=
ependencies;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;dependencies =3D dep_it=
em;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_dir_close(dp_deps);<br>
@@ -1351,8 +1352,9 @@ static GuestDiskInfoList *get_disk_partitions(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-&gt;name =3D dev_name;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-&gt;partition =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Add parent disk as dependent for easie=
r tracking of hierarchy */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;dependents =3D g_new0(strList, 1=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;dependents-&gt;value =3D g_strdu=
p(disk_dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;dependencies =3D g_new0(strList,=
 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;dependencies-&gt;value =3D g_str=
dup(disk_dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;has_dependencies =3D true;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0item =3D g_new0(GuestDiskInfoList, 1);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0item-&gt;value =3D partition;<br>
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json<br>
index 6ca85f995f..3b3d1d0bd9 100644<br>
--- a/qga/qapi-schema.json<br>
+++ b/qga/qapi-schema.json<br>
@@ -870,9 +870,9 @@<br>
=C2=A0#<br>
=C2=A0# @name: device node (Linux) or device UNC (Windows)<br>
=C2=A0# @partition: whether this is a partition or disk<br>
-# @dependents: list of dependent devices; e.g. for LVs of the LVM this wil=
l<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hold the list of PVs, fo=
r LUKS encrypted volume this will<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 contain the disk where t=
he volume is placed.=C2=A0 =C2=A0 =C2=A0(Linux)<br>
+# @dependencies: list of device dependencies; e.g. for LVs of the LVM this=
 will<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hold the list of =
PVs, for LUKS encrypted volume this will<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 contain the disk =
where the volume is placed.=C2=A0 =C2=A0 =C2=A0(Linux)<br>
=C2=A0# @address: disk address information (only for non-virtual devices)<b=
r>
=C2=A0# @alias: optional alias assigned to the disk, on Linux this is a nam=
e assigned<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0by device mapper<br>
@@ -880,7 +880,7 @@<br>
=C2=A0# Since 5.2<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;GuestDiskInfo&#39;,<br>
-=C2=A0 &#39;data&#39;: {&#39;name&#39;: &#39;str&#39;, &#39;partition&#39;=
: &#39;bool&#39;, &#39;dependents&#39;: [&#39;str&#39;],<br>
+=C2=A0 &#39;data&#39;: {&#39;name&#39;: &#39;str&#39;, &#39;partition&#39;=
: &#39;bool&#39;, &#39;*dependencies&#39;: [&#39;str&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*address&#39;: &#39;GuestDis=
kAddress&#39;, &#39;*alias&#39;: &#39;str&#39;} }<br>
<br>
=C2=A0##<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000e1f3bf05b410306b--

