Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA1607502
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:32:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpJm-0003hT-ON
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:31:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpJ2-000808-Az
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1olpIb-0005N2-4X
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:30:48 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1olpIX-0006ns-U9
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:30:44 -0400
Received: by mail-lj1-x22b.google.com with SMTP id bs14so3066143ljb.9
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ecbgzTx5kkKqhfD1JzEDQDcRA9B6flaQVttOqmED40o=;
 b=bhHryH4rSBrKqSLuXz2GisoSbHPfxp/jIjIAw4aEa+6AYJvV35VqAocKCj+s5Sxqrg
 wY7Sd9wV0dqavfFxqAu5A1SP6FyUFMZPlb4hEKWJSOuVScnxVP5u1+CvthLKbanYJMZ3
 /rCRJnSyo7XiZh2RNrxu2xK6+ZZPDbrzQJlU+0NJNdGsZnWVdM1zUTxlaA+DEPChQ0Zm
 cGBmLAC9pRPPTxpLVmK7wemjaqlgo4uEHpUPCEmPTMylF2EZvZhubdpBktNt1gc80wfp
 CmB3msVn3MrN5AGOPFma+fX485pjH2/eur+s0tyjaGmOcJH4tK39NIJYrxXFzocLxnHS
 HUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ecbgzTx5kkKqhfD1JzEDQDcRA9B6flaQVttOqmED40o=;
 b=7rqHb+mUxGJyDvOsl1gbx7byI5TSr8yRdxbMlQyyHXp5ZwGbHloRTQ3nXYL6NpJQPe
 EhAYAhsukrIRggG/D51ffCqGwjVq8jp1G51QFp9hyz3fzgnWiXBwZ38QeNoJXKmYhN3J
 Z4GNMbs8BWIakTWv/d0legywqqFqkhKsERPetegLB70cj1O6A3uwZHxL84L2TmIkUPA4
 GUFo3r0YPqF/BVQgyQdn+Bmm+0BEt+/VHXSz/mKNWFAVVnse+LWysCMxfbEM/1onNggW
 AuWrtyEy6zpJ6496lewPv6MLPGzF9zIsxC/8TX3cEUIoOHr1GZWGe803O+izl4eLX5Uj
 2xIw==
X-Gm-Message-State: ACrzQf05zA1IUetC8w9LS9fixZyx/rW+V+T3kRA4hvnw5mT1romE/ldb
 oxV1OIZOPeEPmKW4NxxFmPwQxie+gGpWsezu9E8=
X-Google-Smtp-Source: AMsMyM5laRrguDLwGDPckEAxWuG3o609ngeu4rUrrE+BjI5y+CTyQmtidB1XzM/gQ5ajtA+GfJIh9cwRnbFnleUWsic=
X-Received: by 2002:a2e:804d:0:b0:26f:c663:2c79 with SMTP id
 p13-20020a2e804d000000b0026fc6632c79mr6235716ljg.289.1666348237089; Fri, 21
 Oct 2022 03:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-14-lvivier@redhat.com>
In-Reply-To: <20221021090922.170074-14-lvivier@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 21 Oct 2022 14:30:24 +0400
Message-ID: <CAJ+F1C+sgKTezxFOA4b7efXkvz2c5x6TVeCVH2wFykeC5wGa2Q@mail.gmail.com>
Subject: Re: [PATCH v14 13/17] qemu-sockets: move and rename
 SocketAddress_to_str()
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 xen-devel@lists.xenproject.org, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Stefan Weil <sw@weilnetz.de>, David Gibson <david@gibson.dropbear.id.au>, 
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000be72d305eb88ee09"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000be72d305eb88ee09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Oct 21, 2022 at 2:03 PM Laurent Vivier <lvivier@redhat.com> wrote:

> Rename SocketAddress_to_str() to socket_uri() and move it to
> util/qemu-sockets.c close to socket_parse().
>
> socket_uri() generates a string from a SocketAddress while
> socket_parse() generates a SocketAddress from a string.
>

Tbh, as we are renaming functions here, I would follow good glib/C
conventions and use the type name in lower case as prefix. I would also not
use "URI", which should be reserved for RFC3986 compliant forms.

So instead, I'd suggest to rename to:

char *socket_address_to_string(SocketAddress *addr);

SocketAddress *socket_address_new_from_string(const char *str, Error **errp=
)

my 2c


> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/qemu/sockets.h |  2 +-
>  monitor/hmp-cmds.c     | 23 +----------------------
>  util/qemu-sockets.c    | 20 ++++++++++++++++++++
>  3 files changed, 22 insertions(+), 23 deletions(-)
>
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index db4bedb6fa20..214058d8e307 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -58,6 +58,7 @@ NetworkAddressFamily inet_netfamily(int family);
>  int unix_listen(const char *path, Error **errp);
>  int unix_connect(const char *path, Error **errp);
>
> +char *socket_uri(SocketAddress *addr);
>  SocketAddress *socket_parse(const char *str, Error **errp);
>  int socket_connect(SocketAddress *addr, Error **errp);
>  int socket_listen(SocketAddress *addr, int num, Error **errp);
> @@ -141,5 +142,4 @@ SocketAddress
> *socket_address_flatten(SocketAddressLegacy *addr);
>   * Return 0 on success.
>   */
>  int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
> -
>  #endif /* QEMU_SOCKETS_H */
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index bab86c5537e1..01b789a79e62 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -199,27 +199,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict)
>      qapi_free_MouseInfoList(mice_list);
>  }
>
> -static char *SocketAddress_to_str(SocketAddress *addr)
> -{
> -    switch (addr->type) {
> -    case SOCKET_ADDRESS_TYPE_INET:
> -        return g_strdup_printf("tcp:%s:%s",
> -                               addr->u.inet.host,
> -                               addr->u.inet.port);
> -    case SOCKET_ADDRESS_TYPE_UNIX:
> -        return g_strdup_printf("unix:%s",
> -                               addr->u.q_unix.path);
> -    case SOCKET_ADDRESS_TYPE_FD:
> -        return g_strdup_printf("fd:%s", addr->u.fd.str);
> -    case SOCKET_ADDRESS_TYPE_VSOCK:
> -        return g_strdup_printf("tcp:%s:%s",
> -                               addr->u.vsock.cid,
> -                               addr->u.vsock.port);
> -    default:
> -        return g_strdup("unknown address type");
> -    }
> -}
> -
>  void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  {
>      MigrationInfo *info;
> @@ -382,7 +361,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdic=
t)
>          monitor_printf(mon, "socket address: [\n");
>
>          for (addr =3D info->socket_address; addr; addr =3D addr->next) {
> -            char *s =3D SocketAddress_to_str(addr->value);
> +            char *s =3D socket_uri(addr->value);
>              monitor_printf(mon, "\t%s\n", s);
>              g_free(s);
>          }
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 83f4bd6fd211..9f6f655fd526 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1077,6 +1077,26 @@ int unix_connect(const char *path, Error **errp)
>      return sock;
>  }
>
> +char *socket_uri(SocketAddress *addr)
> +{
> +    switch (addr->type) {
> +    case SOCKET_ADDRESS_TYPE_INET:
> +        return g_strdup_printf("tcp:%s:%s",
> +                               addr->u.inet.host,
> +                               addr->u.inet.port);
> +    case SOCKET_ADDRESS_TYPE_UNIX:
> +        return g_strdup_printf("unix:%s",
> +                               addr->u.q_unix.path);
> +    case SOCKET_ADDRESS_TYPE_FD:
> +        return g_strdup_printf("fd:%s", addr->u.fd.str);
> +    case SOCKET_ADDRESS_TYPE_VSOCK:
> +        return g_strdup_printf("tcp:%s:%s",
> +                               addr->u.vsock.cid,
> +                               addr->u.vsock.port);
> +    default:
> +        return g_strdup("unknown address type");
> +    }
> +}
>
>  SocketAddress *socket_parse(const char *str, Error **errp)
>  {
> --
> 2.37.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000be72d305eb88ee09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 21, 2022 at 2:03 PM Lau=
rent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com">lvivier@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ren=
ame SocketAddress_to_str() to socket_uri() and move it to<br>
util/qemu-sockets.c close to socket_parse().<br>
<br>
socket_uri() generates a string from a SocketAddress while<br>
socket_parse() generates a SocketAddress from a string.<br></blockquote><di=
v><br></div><div>Tbh, as we are renaming functions here, I would follow goo=
d glib/C conventions and use the type name in lower case as prefix. I would=
 also not use &quot;URI&quot;, which should be reserved for RFC3986 complia=
nt forms.</div><div><br></div><div>So instead, I&#39;d suggest to rename to=
:</div><div><br></div><div>char *socket_address_to_string(SocketAddress *ad=
dr);</div><div><br></div><div>SocketAddress *socket_address_new_from_string=
(const char *str, Error **errp)</div><div><br></div><div>my 2c</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Laurent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com" tar=
get=3D"_blank">lvivier@redhat.com</a>&gt;<br>
Reviewed-by: David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au=
" target=3D"_blank">david@gibson.dropbear.id.au</a>&gt;<br>
Reviewed-by: Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.c=
om" target=3D"_blank">dgilbert@redhat.com</a>&gt;<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/sockets.h |=C2=A0 2 +-<br>
=C2=A0monitor/hmp-cmds.c=C2=A0 =C2=A0 =C2=A0| 23 +----------------------<br=
>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 | 20 ++++++++++++++++++++<br>
=C2=A03 files changed, 22 insertions(+), 23 deletions(-)<br>
<br>
diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h<br>
index db4bedb6fa20..214058d8e307 100644<br>
--- a/include/qemu/sockets.h<br>
+++ b/include/qemu/sockets.h<br>
@@ -58,6 +58,7 @@ NetworkAddressFamily inet_netfamily(int family);<br>
=C2=A0int unix_listen(const char *path, Error **errp);<br>
=C2=A0int unix_connect(const char *path, Error **errp);<br>
<br>
+char *socket_uri(SocketAddress *addr);<br>
=C2=A0SocketAddress *socket_parse(const char *str, Error **errp);<br>
=C2=A0int socket_connect(SocketAddress *addr, Error **errp);<br>
=C2=A0int socket_listen(SocketAddress *addr, int num, Error **errp);<br>
@@ -141,5 +142,4 @@ SocketAddress *socket_address_flatten(SocketAddressLega=
cy *addr);<br>
=C2=A0 * Return 0 on success.<br>
=C2=A0 */<br>
=C2=A0int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);=
<br>
-<br>
=C2=A0#endif /* QEMU_SOCKETS_H */<br>
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c<br>
index bab86c5537e1..01b789a79e62 100644<br>
--- a/monitor/hmp-cmds.c<br>
+++ b/monitor/hmp-cmds.c<br>
@@ -199,27 +199,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict)<b=
r>
=C2=A0 =C2=A0 =C2=A0qapi_free_MouseInfoList(mice_list);<br>
=C2=A0}<br>
<br>
-static char *SocketAddress_to_str(SocketAddress *addr)<br>
-{<br>
-=C2=A0 =C2=A0 switch (addr-&gt;type) {<br>
-=C2=A0 =C2=A0 case SOCKET_ADDRESS_TYPE_INET:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;tcp:%s:%s&quot;,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.inet.host,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.inet.port);<br>
-=C2=A0 =C2=A0 case SOCKET_ADDRESS_TYPE_UNIX:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;unix:%s&quot;,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.q_unix.path);<br>
-=C2=A0 =C2=A0 case SOCKET_ADDRESS_TYPE_FD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;fd:%s&quot;, addr=
-&gt;u.fd.str);<br>
-=C2=A0 =C2=A0 case SOCKET_ADDRESS_TYPE_VSOCK:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;tcp:%s:%s&quot;,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.vsock.cid,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.vsock.port);<br>
-=C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup(&quot;unknown address type&quo=
t;);<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
=C2=A0void hmp_info_migrate(Monitor *mon, const QDict *qdict)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MigrationInfo *info;<br>
@@ -382,7 +361,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_printf(mon, &quot;socket address:=
 [\n&quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (addr =3D info-&gt;socket_address; ad=
dr; addr =3D addr-&gt;next) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *s =3D SocketAddress_to_str=
(addr-&gt;value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *s =3D socket_uri(addr-&gt;=
value);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_printf(mon, &quot;\=
t%s\n&quot;, s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index 83f4bd6fd211..9f6f655fd526 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -1077,6 +1077,26 @@ int unix_connect(const char *path, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return sock;<br>
=C2=A0}<br>
<br>
+char *socket_uri(SocketAddress *addr)<br>
+{<br>
+=C2=A0 =C2=A0 switch (addr-&gt;type) {<br>
+=C2=A0 =C2=A0 case SOCKET_ADDRESS_TYPE_INET:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;tcp:%s:%s&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.inet.host,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.inet.port);<br>
+=C2=A0 =C2=A0 case SOCKET_ADDRESS_TYPE_UNIX:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;unix:%s&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.q_unix.path);<br>
+=C2=A0 =C2=A0 case SOCKET_ADDRESS_TYPE_FD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;fd:%s&quot;, addr=
-&gt;u.fd.str);<br>
+=C2=A0 =C2=A0 case SOCKET_ADDRESS_TYPE_VSOCK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;tcp:%s:%s&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.vsock.cid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.vsock.port);<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup(&quot;unknown address type&quo=
t;);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
<br>
=C2=A0SocketAddress *socket_parse(const char *str, Error **errp)<br>
=C2=A0{<br>
-- <br>
2.37.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000be72d305eb88ee09--

