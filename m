Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BEB39B7DB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 13:27:32 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp7z9-0000Gg-7l
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 07:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lp7y4-00081y-8U
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 07:26:24 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lp7y1-0005Zv-5h
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 07:26:24 -0400
Received: by mail-ed1-x534.google.com with SMTP id f5so5710307eds.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 04:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/YtXF8v6+KQLSXjDBi0A/82UjIX8ZCRurxS4d01v/jQ=;
 b=Hd9DADRFIQ9AJQaCHsioN/FFWTBaDRthnQfnsdIC0wgbHDHdsaLzNQlmb0D8R0gUmB
 j4i3Z3N3SACLSiJTznIRf6hFcok5h0i5P0OuhOgje4IIjIwHYfeBmqfBJq0SI7AT5jQX
 xx0GWx6tkJXMUGGJPgZRsGHdqO4nFqI2vQIftqqBVzgg4JQDyXza3qkgbAOk26Lo4j9e
 Aw3KaRkSY2GivghuAq4Xi8rtk+T7hO+Q/ut49qFO7gi7tD/Qa+9AC8WanBzgJ9NhzNPW
 6qRuIr0942x3IhKtEuaZ8xI+yNf+fg0RziXpUHWmhz+2sEgMRUqU8qi/gED380gUeBmc
 HCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/YtXF8v6+KQLSXjDBi0A/82UjIX8ZCRurxS4d01v/jQ=;
 b=uMr+QLWuYXQEOBiAHuF6l9qiA+BR1mmfkQI8Q3W22Sc6yE97gxfiRb6+dDICiJ4SBG
 jbry1ZKAB2ftZQtZLP2Cd4/HxN2fZVxymkuIFwGIpjwdxh2ppU0f70G7pU1mchrX+A0c
 q1hAZcJYURk6iGrV9Dtt/AQHsO/pUE3lJ8trcY5Q1n/jOvTduYARvv25A9D7vuGMmtlS
 o4yt4RHf22zUtPrnkosZUqrCWFh+qtAYsdpAX22HU1z+HnzwnPhyoKfG/uR9TOzNtAth
 krEx7ou1pOy4J/ngw7cRxLCPeGCJifFHoEHGnB8wQOofdiEegsoPmHtYKvtp5X/Nlaz8
 Fsig==
X-Gm-Message-State: AOAM533YMjEnpYPIO2p2yyZC+M3ZudmUppQecdd/599Y8+eXUdzgDwcY
 u7gBZAlvanwnq2mtlkKY9+cwU9JCA8Xpcj7aXy4=
X-Google-Smtp-Source: ABdhPJx0Jkw0UkfnO9CRlJzAADJ8guWRkQ+aO40lMRjrJiSjQUEawVewb7m5AJg1DdaNxZavsGRMi6yHDI2BkxMc7bw=
X-Received: by 2002:aa7:cc10:: with SMTP id q16mr4246208edt.53.1622805979250; 
 Fri, 04 Jun 2021 04:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210514173110.1397741-1-berrange@redhat.com>
 <20210514173110.1397741-3-berrange@redhat.com>
In-Reply-To: <20210514173110.1397741-3-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Jun 2021 15:26:06 +0400
Message-ID: <CAJ+F1CJGW3fpZPsKhQC2VTwxsYjiAH9J1fr=hzgYv1tKm8F7FA@mail.gmail.com>
Subject: Re: [PATCH 2/4] docs: document usage of the authorization framework
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000eec2f105c3eef517"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, NORMAL_HTTP_TO_IP=0.001, NUMERIC_HTTP_ADDR=1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eec2f105c3eef517
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 9:36 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> The authorization framework provides a way to control access to network
> services after a client has been authenticated. This documents how to
> actually use it.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/system/authz.rst | 263 ++++++++++++++++++++++++++++++++++++++++++
>  docs/system/index.rst |   1 +
>  2 files changed, 264 insertions(+)
>  create mode 100644 docs/system/authz.rst
>
> diff --git a/docs/system/authz.rst b/docs/system/authz.rst
> new file mode 100644
> index 0000000000..2276546d23
> --- /dev/null
> +++ b/docs/system/authz.rst
> @@ -0,0 +1,263 @@
> +.. _client authorization:
> +
> +Client authorization
> +--------------------
> +
> +When configuring a QEMU network backend with either TLS certificates or
> SASL
> +authentication, access will be granted if the client successfully proves
> +their identity. If the authorization identity database is scoped to the
> QEMU
> +client this may be sufficient. It is common, however, for the identity
> database
> +to be much broader and thus authentication alone does not enable
> sufficient
> +access control. In this case QEMU provides a flexible system for enforci=
ng
> +finer grained authorization on clients post-authentication.
> +
> +Identity providers
> +~~~~~~~~~~~~~~~~~~
> +
> +At the time of writing there are two authentication frameworks used by
> QEMU
> +that emit an identity upon completion.
> +
> + * TLS x509 certificate distinguished name.
> +
> +   When configuring the QEMU backend as a network server with TLS, there
> +   are a choice of credentials to use. The most common scenario is to
> utilize
> +   x509 certificates. The simplest configuration only involves issuing
> +   certificates to the servers, allowing the client to avoid a MITM atta=
ck
> +   against their intended server.
> +
> +   It is possible, however, to enable mutual verification by requiring
> that
> +   the client provide a certificate to the server to prove its own
> identity.
> +   This is done by setting the property ``verify-peer=3Dyes`` on the
> +   ``tls-creds-x509`` object, which is in fact the default.
> +
> +   When peer verification is enabled, client will need to be issued with=
 a
> +   certificate by the same certificate authority as the server. If this =
is
> +   still not sufficiently strong access control the Distinguished Name o=
f
> +   the certificate can be used as an identity in the QEMU authorization
> +   framework.
> +
> + * SASL username.
> +
> +   When configuring the QEMU backend as a network server with SASL, upon
> +   completion of the SASL authentication mechanism, a username will be
> +   provided. The format of this username will vary depending on the choi=
ce
> +   of mechanism configured for SASL. It might be a simple UNIX style use=
r
> +   ``joebloggs``, while if using Kerberos/GSSAPI it can have a realm
> +   attached ``joebloggs@QEMU.ORG``.  Whatever format the username is
> presented
> +   in, it can be used with the QEMU authorization framework.
> +
> +Authorization drivers
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +The QEMU authorization framework is a general purpose design with choice
> of
> +user customizable drivers. These are provided as objects that can be
> +created at startup using the ``-object`` argument, or at runtime using t=
he
> +``object_add`` monitor command.
> +
> +Simple
> +^^^^^^
> +
> +This authorization driver provides a simple mechanism for granting acces=
s
> +based on an exact match against a single identity. This is useful when i=
t
> is
> +known that only a single client is to be allowed access.
> +
> +A possible use case would be when configuring QEMU for an incoming live
> +migration. It is known exactly which source QEMU the migration is expect=
ed
> +to arrive from. The x509 certificate associated with this source QEMU
> would
> +thus be used as the identity to match against. Alternatively if the
> virtual
> +machine is dedicated to a specific tenant, then the VNC server would be
> +configured with SASL and the username of only that tenant listed.
> +
> +To create an instance of this driver via QMP:
> +
> +::
> +
> +   {
> +     "execute": "object-add",
> +     "arguments": {
> +       "qom-type": "authz-simple",
> +       "id": "authz0",
> +       "props": {
> +         "identity": "fred"
> +       }
> +     }
> +   }
> +
> +
> +Or via the command line
> +
> +::
> +
> +   -object authz-simple,id=3Dauthz0,identity=3Dfred
> +
> +
> +List
> +^^^^
> +
> +In some network backends it will be desirable to grant access to a range
> of
> +clients. This authorization driver provides a list mechanism for grantin=
g
> +access by matching identities against a list of permitted one. Each matc=
h
> +rule has an associated policy and a catch all policy applies if no rule
> +matches. The match can either be done as an exact string comparison, or
> can
> +use the shell-like glob syntax, which allows for use of wildcards.
> +
> +To create an instance of this class via QMP:
> +
> +::
> +
> +   {
> +     "execute": "object-add",
> +     "arguments": {
> +       "qom-type": "authz-list",
> +       "id": "authz0",
> +       "props": {
> +         "rules": [
> +            { "match": "fred", "policy": "allow", "format": "exact" },
> +            { "match": "bob", "policy": "allow", "format": "exact" },
> +            { "match": "danb", "policy": "deny", "format": "exact" },
> +            { "match": "dan*", "policy": "allow", "format": "glob" }
> +         ],
> +         "policy": "deny"
> +       }
> +     }
> +   }
> +
> +
> +Due to the way this driver requires setting nested properties, creating
> +it on the command line will require use of the JSON syntax for
> ``-object``.
> +In most cases, however, the next driver will be more suitable.
> +
> +List file
> +^^^^^^^^^
> +
> +This is a variant on the previous driver that allows for a more dynamic
> +access control policy by storing the match rules in a standalone file
> +that can be reloaded automatically upon change.
> +
> +To create an instance of this class via QMP:
> +
> +::
> +
> +   {
> +     "execute": "object-add",
> +     "arguments": {
> +       "qom-type": "authz-list-file",
> +       "id": "authz0",
> +       "props": {
> +         "filename": "/etc/qemu/myvm-vnc.acl",
> +         "refresh": true
> +       }
> +     }
> +   }
> +
> +
> +If ``refresh`` is ``yes``, inotify is used to monitor for changes
> +to the file and auto-reload the rules.
> +
> +The ``myvm-vnc.acl`` file should contain the match rules in a format tha=
t
> +closely matches the previous driver:
> +
> +::
> +
> +   {
> +     "rules": [
> +       { "match": "fred", "policy": "allow", "format": "exact" },
> +       { "match": "bob", "policy": "allow", "format": "exact" },
> +       { "match": "danb", "policy": "deny", "format": "exact" },
> +       { "match": "dan*", "policy": "allow", "format": "glob" }
> +     ],
> +     "policy": "deny"
> +   }
> +
> +
> +The object can be created on the command line using
> +
> +::
> +
> +   -object authz-list-file,id=3Dauthz0,\
> +           filename=3D/etc/qemu/myvm-vnc.acl,refresh=3Don
> +
> +
> +PAM
> +^^^
> +
> +In some scenarios it might be desirable to integrate with authorization
> +mechanisms that are implemented outside of QEMU. In order to allow maxim=
um
> +flexibility, QEMU provides a driver that uses the ``PAM`` framework.
> +
> +To create an instance of this class via QMP:
> +
> +::
> +
> +   {
> +     "execute": "object-add",
> +     "arguments": {
> +       "qom-type": "authz-pam",
> +       "id": "authz0",
> +       "parameters": {
> +         "service": "qemu-vnc-tls"
> +       }
> +     }
> +   }
> +
> +
> +The driver only uses the PAM "account" verification
> +subsystem. The above config would require a config
> +file /etc/pam.d/qemu-vnc-tls. For a simple file
> +lookup it would contain
> +
> +::
> +
> +   account requisite  pam_listfile.so item=3Duser sense=3Dallow \
> +           file=3D/etc/qemu/vnc.allow
> +
> +
> +The external file would then contain a list of usernames.
> +If x509 cert was being used as the username, a suitable
> +entry would match the distinguished name:
> +
> +::
> +
> +   CN=3Dlaptop.berrange.com,O=3DBerrange Home,L=3DLondon,ST=3DLondon,C=
=3DGB
> +
> +
> +On the command line it can be created using
> +
> +::
> +
> +   -object authz-pam,id=3Dauthz0,service=3Dqemu-vnc-tls
> +
> +
> +There are a variety of PAM plugins that can be used which are not
> illustrated
> +here, and it is possible to implement brand new plugins using the PAM AP=
I.
> +
> +
> +Connecting backends
> +~~~~~~~~~~~~~~~~~~~
> +
> +The authorization driver is created using the ``-object`` argument and
> then
> +needs to be associated with a network service. The authorization driver
> object
> +will be given a unique ID that needs to be referenced.
> +
> +The property to set in the network service will vary depending on the
> type of
> +identity to verify. By convention, any network server backend that uses
> TLS
> +will provide ``tls-authz`` property, while any server using SASL will
> provide
> +a ``sasl-authz`` property.
> +
> +Thus a example using SASL and authorization for the VNC server would loo=
k
>

"an example"

+like:
> +
> +::
> +
> +   $QEMU --object authz-simple,id=3Dauthz0,identity=3Dfred \
> +         --vnc 0.0.0.0:1,sasl,sasl-authz=3Dauthz0
> +
> +While to validate both the x509 certificate and SASL username:
> +
> +::
> +
> +   echo "CN=3Dlaptop.qemu.org,O=3DQEMU Project,L=3DLondon,ST=3DLondon,C=
=3DGB" >>
> tls.acl
> +   $QEMU --object authz-simple,id=3Dauthz0,identity=3Dfred \
> +         --object authz-list-file,id=3Dauthz1,filename=3Dtls.acl \
> +        --object tls-creds-x509,id=3Dtls0,dir=3D/etc/qemu/tls,verify-pee=
r=3Dyes
> \
> +         --vnc 0.0.0.0:1
> ,sasl,sasl-authz=3Dauth0,tls-creds=3Dtls0,tls-authz=3Dauthz1
> diff --git a/docs/system/index.rst b/docs/system/index.rst
> index 6aa2f8c05c..6092eb2d91 100644
> --- a/docs/system/index.rst
> +++ b/docs/system/index.rst
> @@ -31,6 +31,7 @@ Contents:
>     vnc-security
>     tls
>     secrets
> +   authz
>     gdb
>     managed-startup
>     cpu-hotplug
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000eec2f105c3eef517
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 14, 2021 at 9:36 PM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The authorization framework provides a way to control access to netwo=
rk<br>
services after a client has been authenticated. This documents how to<br>
actually use it.<br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
---<br>
=C2=A0docs/system/authz.rst | 263 +++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0docs/system/index.rst |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 264 insertions(+)<br>
=C2=A0create mode 100644 docs/system/authz.rst<br>
<br>
diff --git a/docs/system/authz.rst b/docs/system/authz.rst<br>
new file mode 100644<br>
index 0000000000..2276546d23<br>
--- /dev/null<br>
+++ b/docs/system/authz.rst<br>
@@ -0,0 +1,263 @@<br>
+.. _client authorization:<br>
+<br>
+Client authorization<br>
+--------------------<br>
+<br>
+When configuring a QEMU network backend with either TLS certificates or SA=
SL<br>
+authentication, access will be granted if the client successfully proves<b=
r>
+their identity. If the authorization identity database is scoped to the QE=
MU<br>
+client this may be sufficient. It is common, however, for the identity dat=
abase<br>
+to be much broader and thus authentication alone does not enable sufficien=
t<br>
+access control. In this case QEMU provides a flexible system for enforcing=
<br>
+finer grained authorization on clients post-authentication.<br>
+<br>
+Identity providers<br>
+~~~~~~~~~~~~~~~~~~<br>
+<br>
+At the time of writing there are two authentication frameworks used by QEM=
U<br>
+that emit an identity upon completion.<br>
+<br>
+ * TLS x509 certificate distinguished name.<br>
+<br>
+=C2=A0 =C2=A0When configuring the QEMU backend as a network server with TL=
S, there<br>
+=C2=A0 =C2=A0are a choice of credentials to use. The most common scenario =
is to utilize<br>
+=C2=A0 =C2=A0x509 certificates. The simplest configuration only involves i=
ssuing<br>
+=C2=A0 =C2=A0certificates to the servers, allowing the client to avoid a M=
ITM attack<br>
+=C2=A0 =C2=A0against their intended server.<br>
+<br>
+=C2=A0 =C2=A0It is possible, however, to enable mutual verification by req=
uiring that<br>
+=C2=A0 =C2=A0the client provide a certificate to the server to prove its o=
wn identity.<br>
+=C2=A0 =C2=A0This is done by setting the property ``verify-peer=3Dyes`` on=
 the<br>
+=C2=A0 =C2=A0``tls-creds-x509`` object, which is in fact the default.<br>
+<br>
+=C2=A0 =C2=A0When peer verification is enabled, client will need to be iss=
ued with a<br>
+=C2=A0 =C2=A0certificate by the same certificate authority as the server. =
If this is<br>
+=C2=A0 =C2=A0still not sufficiently strong access control the Distinguishe=
d Name of<br>
+=C2=A0 =C2=A0the certificate can be used as an identity in the QEMU author=
ization<br>
+=C2=A0 =C2=A0framework.<br>
+<br>
+ * SASL username.<br>
+<br>
+=C2=A0 =C2=A0When configuring the QEMU backend as a network server with SA=
SL, upon<br>
+=C2=A0 =C2=A0completion of the SASL authentication mechanism, a username w=
ill be<br>
+=C2=A0 =C2=A0provided. The format of this username will vary depending on =
the choice<br>
+=C2=A0 =C2=A0of mechanism configured for SASL. It might be a simple UNIX s=
tyle user<br>
+=C2=A0 =C2=A0``joebloggs``, while if using Kerberos/GSSAPI it can have a r=
ealm<br>
+=C2=A0 =C2=A0attached ``<a href=3D"mailto:joebloggs@QEMU.ORG" target=3D"_b=
lank">joebloggs@QEMU.ORG</a>``.=C2=A0 Whatever format the username is prese=
nted<br>
+=C2=A0 =C2=A0in, it can be used with the QEMU authorization framework.<br>
+<br>
+Authorization drivers<br>
+~~~~~~~~~~~~~~~~~~~~~<br>
+<br>
+The QEMU authorization framework is a general purpose design with choice o=
f<br>
+user customizable drivers. These are provided as objects that can be<br>
+created at startup using the ``-object`` argument, or at runtime using the=
<br>
+``object_add`` monitor command.<br>
+<br>
+Simple<br>
+^^^^^^<br>
+<br>
+This authorization driver provides a simple mechanism for granting access<=
br>
+based on an exact match against a single identity. This is useful when it =
is<br>
+known that only a single client is to be allowed access.<br>
+<br>
+A possible use case would be when configuring QEMU for an incoming live<br=
>
+migration. It is known exactly which source QEMU the migration is expected=
<br>
+to arrive from. The x509 certificate associated with this source QEMU woul=
d<br>
+thus be used as the identity to match against. Alternatively if the virtua=
l<br>
+machine is dedicated to a specific tenant, then the VNC server would be<br=
>
+configured with SASL and the username of only that tenant listed.<br>
+<br>
+To create an instance of this driver via QMP:<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0&quot;execute&quot;: &quot;object-add&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0&quot;arguments&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;qom-type&quot;: &quot;authz-simple&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;id&quot;: &quot;authz0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;props&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;identity&quot;: &quot;fred&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0}<br>
+<br>
+<br>
+Or via the command line<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0-object authz-simple,id=3Dauthz0,identity=3Dfred<br>
+<br>
+<br>
+List<br>
+^^^^<br>
+<br>
+In some network backends it will be desirable to grant access to a range o=
f<br>
+clients. This authorization driver provides a list mechanism for granting<=
br>
+access by matching identities against a list of permitted one. Each match<=
br>
+rule has an associated policy and a catch all policy applies if no rule<br=
>
+matches. The match can either be done as an exact string comparison, or ca=
n<br>
+use the shell-like glob syntax, which allows for use of wildcards.<br>
+<br>
+To create an instance of this class via QMP:<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0&quot;execute&quot;: &quot;object-add&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0&quot;arguments&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;qom-type&quot;: &quot;authz-list&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;id&quot;: &quot;authz0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;props&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rules&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;match&quot;: &quot;fred&=
quot;, &quot;policy&quot;: &quot;allow&quot;, &quot;format&quot;: &quot;exa=
ct&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;match&quot;: &quot;bob&q=
uot;, &quot;policy&quot;: &quot;allow&quot;, &quot;format&quot;: &quot;exac=
t&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;match&quot;: &quot;danb&=
quot;, &quot;policy&quot;: &quot;deny&quot;, &quot;format&quot;: &quot;exac=
t&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;match&quot;: &quot;dan*&=
quot;, &quot;policy&quot;: &quot;allow&quot;, &quot;format&quot;: &quot;glo=
b&quot; }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;policy&quot;: &quot;deny&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0}<br>
+<br>
+<br>
+Due to the way this driver requires setting nested properties, creating<br=
>
+it on the command line will require use of the JSON syntax for ``-object``=
.<br>
+In most cases, however, the next driver will be more suitable.<br>
+<br>
+List file<br>
+^^^^^^^^^<br>
+<br>
+This is a variant on the previous driver that allows for a more dynamic<br=
>
+access control policy by storing the match rules in a standalone file<br>
+that can be reloaded automatically upon change.<br>
+<br>
+To create an instance of this class via QMP:<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0&quot;execute&quot;: &quot;object-add&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0&quot;arguments&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;qom-type&quot;: &quot;authz-list-file&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;id&quot;: &quot;authz0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;props&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;filename&quot;: &quot;/etc/qemu/my=
vm-vnc.acl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;refresh&quot;: true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0}<br>
+<br>
+<br>
+If ``refresh`` is ``yes``, inotify is used to monitor for changes<br>
+to the file and auto-reload the rules.<br>
+<br>
+The ``myvm-vnc.acl`` file should contain the match rules in a format that<=
br>
+closely matches the previous driver:<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0&quot;rules&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;match&quot;: &quot;fred&quot;, &quot;po=
licy&quot;: &quot;allow&quot;, &quot;format&quot;: &quot;exact&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;match&quot;: &quot;bob&quot;, &quot;pol=
icy&quot;: &quot;allow&quot;, &quot;format&quot;: &quot;exact&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;match&quot;: &quot;danb&quot;, &quot;po=
licy&quot;: &quot;deny&quot;, &quot;format&quot;: &quot;exact&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;match&quot;: &quot;dan*&quot;, &quot;po=
licy&quot;: &quot;allow&quot;, &quot;format&quot;: &quot;glob&quot; }<br>
+=C2=A0 =C2=A0 =C2=A0],<br>
+=C2=A0 =C2=A0 =C2=A0&quot;policy&quot;: &quot;deny&quot;<br>
+=C2=A0 =C2=A0}<br>
+<br>
+<br>
+The object can be created on the command line using<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0-object authz-list-file,id=3Dauthz0,\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename=3D/etc/qemu/myvm-vnc.acl=
,refresh=3Don<br>
+<br>
+<br>
+PAM<br>
+^^^<br>
+<br>
+In some scenarios it might be desirable to integrate with authorization<br=
>
+mechanisms that are implemented outside of QEMU. In order to allow maximum=
<br>
+flexibility, QEMU provides a driver that uses the ``PAM`` framework.<br>
+<br>
+To create an instance of this class via QMP:<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0&quot;execute&quot;: &quot;object-add&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0&quot;arguments&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;qom-type&quot;: &quot;authz-pam&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;id&quot;: &quot;authz0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;parameters&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;service&quot;: &quot;qemu-vnc-tls&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0}<br>
+<br>
+<br>
+The driver only uses the PAM &quot;account&quot; verification<br>
+subsystem. The above config would require a config<br>
+file /etc/pam.d/qemu-vnc-tls. For a simple file<br>
+lookup it would contain<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0account requisite=C2=A0 pam_listfile.so item=3Duser sense=3Da=
llow \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=3D/etc/qemu/vnc.allow<br>
+<br>
+<br>
+The external file would then contain a list of usernames.<br>
+If x509 cert was being used as the username, a suitable<br>
+entry would match the distinguished name:<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0CN=3D<a href=3D"http://laptop.berrange.com" rel=3D"noreferrer=
" target=3D"_blank">laptop.berrange.com</a>,O=3DBerrange Home,L=3DLondon,ST=
=3DLondon,C=3DGB<br>
+<br>
+<br>
+On the command line it can be created using<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0-object authz-pam,id=3Dauthz0,service=3Dqemu-vnc-tls<br>
+<br>
+<br>
+There are a variety of PAM plugins that can be used which are not illustra=
ted<br>
+here, and it is possible to implement brand new plugins using the PAM API.=
<br>
+<br>
+<br>
+Connecting backends<br>
+~~~~~~~~~~~~~~~~~~~<br>
+<br>
+The authorization driver is created using the ``-object`` argument and the=
n<br>
+needs to be associated with a network service. The authorization driver ob=
ject<br>
+will be given a unique ID that needs to be referenced.<br>
+<br>
+The property to set in the network service will vary depending on the type=
 of<br>
+identity to verify. By convention, any network server backend that uses TL=
S<br>
+will provide ``tls-authz`` property, while any server using SASL will prov=
ide<br>
+a ``sasl-authz`` property.<br>
+<br>
+Thus a example using SASL and authorization for the VNC server would look<=
br></blockquote><div><br></div><div>&quot;an example&quot;<br></div><div> <=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+like:<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0$QEMU --object authz-simple,id=3Dauthz0,identity=3Dfred \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--vnc <a href=3D"http://0.0.0.0:1" rel=
=3D"noreferrer" target=3D"_blank">0.0.0.0:1</a>,sasl,sasl-authz=3Dauthz0<br=
>
+<br>
+While to validate both the x509 certificate and SASL username:<br>
+<br>
+::<br>
+<br>
+=C2=A0 =C2=A0echo &quot;CN=3D<a href=3D"http://laptop.qemu.org" rel=3D"nor=
eferrer" target=3D"_blank">laptop.qemu.org</a>,O=3DQEMU Project,L=3DLondon,=
ST=3DLondon,C=3DGB&quot; &gt;&gt; tls.acl<br>
+=C2=A0 =C2=A0$QEMU --object authz-simple,id=3Dauthz0,identity=3Dfred \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--object authz-list-file,id=3Dauthz1,fil=
ename=3Dtls.acl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 --object tls-creds-x509,id=3Dtls0,dir=3D/etc/q=
emu/tls,verify-peer=3Dyes \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--vnc <a href=3D"http://0.0.0.0:1" rel=
=3D"noreferrer" target=3D"_blank">0.0.0.0:1</a>,sasl,sasl-authz=3Dauth0,tls=
-creds=3Dtls0,tls-authz=3Dauthz1<br>
diff --git a/docs/system/index.rst b/docs/system/index.rst<br>
index 6aa2f8c05c..6092eb2d91 100644<br>
--- a/docs/system/index.rst<br>
+++ b/docs/system/index.rst<br>
@@ -31,6 +31,7 @@ Contents:<br>
=C2=A0 =C2=A0 vnc-security<br>
=C2=A0 =C2=A0 tls<br>
=C2=A0 =C2=A0 secrets<br>
+=C2=A0 =C2=A0authz<br>
=C2=A0 =C2=A0 gdb<br>
=C2=A0 =C2=A0 managed-startup<br>
=C2=A0 =C2=A0 cpu-hotplug<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000eec2f105c3eef517--

