Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7710D43A4C0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 22:34:11 +0200 (CEST)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf6fa-0002eM-Ht
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 16:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5gh-0003rq-KE
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:31:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5gd-0006Cc-HB
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635190270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gkgh0n2rrqzl7lD3E63cXACepubcySAmhU0RzeTULiI=;
 b=M/T1vDKkpTN1vp9HWWQRrqyMnR18gyhJXwHxX6yE7roemsoztvPb0iPAQq0Ugqc0qCDc9V
 Drk5mDXOGf8oeVsAQPTluLUDz2Y2jVek9oWK29p5UIQaGBEVhMX3qXiYiH837WLrBwwcSD
 2MfaEH8nXOXkSfc3c20BsOjsuu+YmJE=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-57NmJypeNHWWOwGJ7PBEhA-1; Mon, 25 Oct 2021 15:31:09 -0400
X-MC-Unique: 57NmJypeNHWWOwGJ7PBEhA-1
Received: by mail-vk1-f197.google.com with SMTP id
 t14-20020a1faa0e000000b002a26761be40so3734306vke.5
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gkgh0n2rrqzl7lD3E63cXACepubcySAmhU0RzeTULiI=;
 b=x0Q91XL/cGBWOagQEiIIpcAHUl/mqnucViFr9r4JHwyur0adbOfo74Qu69MtAbQ/A3
 yefxphzKG8VpVqD3T0QHS6MPbMSjhv6c/xtCg6NPt6HdnVM1x775GRglaPPfsmhQqGYT
 rMjBd7D9ZObJ20XT+Dd+VNHsq8k8wxQqoKfID26MeYV6Ck5+0TYsbx4u7akVIIGvezWs
 eIMLpcUvZX5a4CZehwdL1VlsUohqwwqm+t4XpLnUec4F1IYBq5hWqxTeTgD6Oj/saWz3
 5Y+pNwnCzdIVk4/H5hbuCglovIOJ3QCv6Fo4aP8TVjrcHsk/ObSyf0UCtysZK7ewzsts
 WSDQ==
X-Gm-Message-State: AOAM530MNxRkzo2dSTxe0yZomSjm4kQ47kFV34nF/ZLIRGZhKwRgVhcU
 I9oKDKFl/VDC/zzeUSEbYwUU3JfUIaFFiGcSQ4uxrb5wrJpDqQW+77Ws12DtxzF3CdLf3DOl900
 ox0EMm2feHmF7WcSq/VaSjOkHwREs1+w=
X-Received: by 2002:a05:6122:2214:: with SMTP id
 bb20mr17161138vkb.9.1635190268875; 
 Mon, 25 Oct 2021 12:31:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCka2mDudm3iugFriTiQf7WSY9m5DsU76Ig5Y2tZlAvoSWwrXSwvlEUtVR+/JtyG1TLy9AQB0hgWusXqi5NkM=
X-Received: by 2002:a05:6122:2214:: with SMTP id
 bb20mr17161115vkb.9.1635190268640; 
 Mon, 25 Oct 2021 12:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-7-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-7-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Oct 2021 15:30:58 -0400
Message-ID: <CAFn=p-ZZgZrBMZ-m5GvCf6FAMWfKa2u5LNAJ7G9KYK6iRx=6xg@mail.gmail.com>
Subject: Re: [PATCH 6/9] qapi: Generalize command policy checking
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001a536e05cf326730"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001a536e05cf326730
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com> wrote:

> The code to check command policy can see special feature flag
> 'deprecated' as command flag QCO_DEPRECATED.  I want to make feature
> flag 'unstable' visible there as well, so I can add policy for it.
>
> To let me make it visible, add member @special_features (a bitset of
> QapiSpecialFeature) to QmpCommand, and adjust the generator to pass it
> through qmp_register_command().  Then replace "QCO_DEPRECATED in
> @flags" by QAPI_DEPRECATED in @special_features", and drop
> QCO_DEPRECATED.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/qmp/dispatch.h          | 5 +++--
>  monitor/misc.c                       | 6 ++++--
>  qapi/qmp-dispatch.c                  | 2 +-
>  qapi/qmp-registry.c                  | 4 +++-
>  storage-daemon/qemu-storage-daemon.c | 3 ++-
>  scripts/qapi/commands.py             | 9 ++++-----
>  6 files changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
> index 0ce88200b9..1e4240fd0d 100644
> --- a/include/qapi/qmp/dispatch.h
> +++ b/include/qapi/qmp/dispatch.h
> @@ -25,7 +25,6 @@ typedef enum QmpCommandOptions
>      QCO_ALLOW_OOB             =  (1U << 1),
>      QCO_ALLOW_PRECONFIG       =  (1U << 2),
>      QCO_COROUTINE             =  (1U << 3),
> -    QCO_DEPRECATED            =  (1U << 4),
>  } QmpCommandOptions;
>
>  typedef struct QmpCommand
> @@ -34,6 +33,7 @@ typedef struct QmpCommand
>      /* Runs in coroutine context if QCO_COROUTINE is set */
>      QmpCommandFunc *fn;
>      QmpCommandOptions options;
> +    unsigned special_features;
>      QTAILQ_ENTRY(QmpCommand) node;
>      bool enabled;
>      const char *disable_reason;
> @@ -42,7 +42,8 @@ typedef struct QmpCommand
>  typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
>
>  void qmp_register_command(QmpCommandList *cmds, const char *name,
> -                          QmpCommandFunc *fn, QmpCommandOptions options);
> +                          QmpCommandFunc *fn, QmpCommandOptions options,
> +                          unsigned special_features);
>  const QmpCommand *qmp_find_command(const QmpCommandList *cmds,
>                                     const char *name);
>  void qmp_disable_command(QmpCommandList *cmds, const char *name,
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3556b177f6..c2d227a07c 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -230,11 +230,13 @@ static void monitor_init_qmp_commands(void)
>
>      qmp_init_marshal(&qmp_commands);
>
> -    qmp_register_command(&qmp_commands, "device_add", qmp_device_add, 0);
> +    qmp_register_command(&qmp_commands, "device_add",
> +                         qmp_device_add, 0, 0);
>
>      QTAILQ_INIT(&qmp_cap_negotiation_commands);
>      qmp_register_command(&qmp_cap_negotiation_commands,
> "qmp_capabilities",
> -                         qmp_marshal_qmp_capabilities,
> QCO_ALLOW_PRECONFIG);
> +                         qmp_marshal_qmp_capabilities,
> +                         QCO_ALLOW_PRECONFIG, 0);
>  }
>
>  /* Set the current CPU defined by the user. Callers must hold BQL. */
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index 7e943a0af5..8cca18c891 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -176,7 +176,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds,
> QObject *request,
>                    "The command %s has not been found", command);
>          goto out;
>      }
> -    if (cmd->options & QCO_DEPRECATED) {
> +    if (cmd->special_features & 1u << QAPI_DEPRECATED) {
>          switch (compat_policy.deprecated_input) {
>          case COMPAT_POLICY_INPUT_ACCEPT:
>              break;
> diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
> index f78c064aae..485bc5e6fc 100644
> --- a/qapi/qmp-registry.c
> +++ b/qapi/qmp-registry.c
> @@ -16,7 +16,8 @@
>  #include "qapi/qmp/dispatch.h"
>
>  void qmp_register_command(QmpCommandList *cmds, const char *name,
> -                          QmpCommandFunc *fn, QmpCommandOptions options)
> +                          QmpCommandFunc *fn, QmpCommandOptions options,
> +                          unsigned special_features)
>  {
>      QmpCommand *cmd = g_malloc0(sizeof(*cmd));
>
> @@ -27,6 +28,7 @@ void qmp_register_command(QmpCommandList *cmds, const
> char *name,
>      cmd->fn = fn;
>      cmd->enabled = true;
>      cmd->options = options;
> +    cmd->special_features = special_features;
>      QTAILQ_INSERT_TAIL(cmds, cmd, node);
>  }
>
> diff --git a/storage-daemon/qemu-storage-daemon.c
> b/storage-daemon/qemu-storage-daemon.c
> index 10a1a33761..52cf17e8ac 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -146,7 +146,8 @@ static void init_qmp_commands(void)
>
>      QTAILQ_INIT(&qmp_cap_negotiation_commands);
>      qmp_register_command(&qmp_cap_negotiation_commands,
> "qmp_capabilities",
> -                         qmp_marshal_qmp_capabilities,
> QCO_ALLOW_PRECONFIG);
> +                         qmp_marshal_qmp_capabilities,
> +                         QCO_ALLOW_PRECONFIG, 0);
>  }
>
>  static int getopt_set_loc(int argc, char **argv, const char *optstring,
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index c8a975528f..21001bbd6b 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -26,6 +26,7 @@
>      QAPISchemaModularCVisitor,
>      build_params,
>      ifcontext,
> +    gen_special_features,
>  )
>  from .schema import (
>      QAPISchema,
> @@ -217,9 +218,6 @@ def gen_register_command(name: str,
>                           coroutine: bool) -> str:
>      options = []
>
> -    if 'deprecated' in [f.name for f in features]:
> -        options += ['QCO_DEPRECATED']
> -
>      if not success_response:
>          options += ['QCO_NO_SUCCESS_RESP']
>      if allow_oob:
> @@ -231,10 +229,11 @@ def gen_register_command(name: str,
>
>      ret = mcgen('''
>      qmp_register_command(cmds, "%(name)s",
> -                         qmp_marshal_%(c_name)s, %(opts)s);
> +                         qmp_marshal_%(c_name)s, %(opts)s, %(feats)s);
>  ''',
>                  name=name, c_name=c_name(name),
> -                opts=' | '.join(options) or 0)
> +                opts=' | '.join(options) or 0,
> +                feats=gen_special_features(features))
>

Ah, you use the '0' return here. Alright then.


>      return ret
>
>
> --
> 2.31.1
>
>
Python bits: Acked-by: John Snow <jsnow@redhat.com>
C bits: "I believe in my heart that they probably work."

(for this and previous patch.)

--0000000000001a536e05cf326730
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 1:25 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
code to check command policy can see special feature flag<br>
&#39;deprecated&#39; as command flag QCO_DEPRECATED.=C2=A0 I want to make f=
eature<br>
flag &#39;unstable&#39; visible there as well, so I can add policy for it.<=
br>
<br>
To let me make it visible, add member @special_features (a bitset of<br>
QapiSpecialFeature) to QmpCommand, and adjust the generator to pass it<br>
through qmp_register_command().=C2=A0 Then replace &quot;QCO_DEPRECATED in<=
br>
@flags&quot; by QAPI_DEPRECATED in @special_features&quot;, and drop<br>
QCO_DEPRECATED.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qapi/qmp/dispatch.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++=
--<br>
=C2=A0monitor/misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++++--<br>
=C2=A0qapi/qmp-dispatch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0qapi/qmp-registry.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 4 +++-<br>
=C2=A0storage-daemon/qemu-storage-daemon.c | 3 ++-<br>
=C2=A0scripts/qapi/commands.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 9 ++++-----<br>
=C2=A06 files changed, 17 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h<br>
index 0ce88200b9..1e4240fd0d 100644<br>
--- a/include/qapi/qmp/dispatch.h<br>
+++ b/include/qapi/qmp/dispatch.h<br>
@@ -25,7 +25,6 @@ typedef enum QmpCommandOptions<br>
=C2=A0 =C2=A0 =C2=A0QCO_ALLOW_OOB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D=C2=A0 (1U &lt;&lt; 1),<br>
=C2=A0 =C2=A0 =C2=A0QCO_ALLOW_PRECONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=C2=A0=
 (1U &lt;&lt; 2),<br>
=C2=A0 =C2=A0 =C2=A0QCO_COROUTINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D=C2=A0 (1U &lt;&lt; 3),<br>
-=C2=A0 =C2=A0 QCO_DEPRECATED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
=C2=A0 (1U &lt;&lt; 4),<br>
=C2=A0} QmpCommandOptions;<br>
<br>
=C2=A0typedef struct QmpCommand<br>
@@ -34,6 +33,7 @@ typedef struct QmpCommand<br>
=C2=A0 =C2=A0 =C2=A0/* Runs in coroutine context if QCO_COROUTINE is set */=
<br>
=C2=A0 =C2=A0 =C2=A0QmpCommandFunc *fn;<br>
=C2=A0 =C2=A0 =C2=A0QmpCommandOptions options;<br>
+=C2=A0 =C2=A0 unsigned special_features;<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_ENTRY(QmpCommand) node;<br>
=C2=A0 =C2=A0 =C2=A0bool enabled;<br>
=C2=A0 =C2=A0 =C2=A0const char *disable_reason;<br>
@@ -42,7 +42,8 @@ typedef struct QmpCommand<br>
=C2=A0typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;<br>
<br>
=C2=A0void qmp_register_command(QmpCommandList *cmds, const char *name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 QmpCommandFunc *fn, QmpCommandOptions options);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 QmpCommandFunc *fn, QmpCommandOptions options,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned special_features);<br>
=C2=A0const QmpCommand *qmp_find_command(const QmpCommandList *cmds,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name);<br>
=C2=A0void qmp_disable_command(QmpCommandList *cmds, const char *name,<br>
diff --git a/monitor/misc.c b/monitor/misc.c<br>
index 3556b177f6..c2d227a07c 100644<br>
--- a/monitor/misc.c<br>
+++ b/monitor/misc.c<br>
@@ -230,11 +230,13 @@ static void monitor_init_qmp_commands(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qmp_init_marshal(&amp;qmp_commands);<br>
<br>
-=C2=A0 =C2=A0 qmp_register_command(&amp;qmp_commands, &quot;device_add&quo=
t;, qmp_device_add, 0);<br>
+=C2=A0 =C2=A0 qmp_register_command(&amp;qmp_commands, &quot;device_add&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qmp_device_add, 0, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INIT(&amp;qmp_cap_negotiation_commands);<br>
=C2=A0 =C2=A0 =C2=A0qmp_register_command(&amp;qmp_cap_negotiation_commands,=
 &quot;qmp_capabilities&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qmp_marshal_qmp_capabilities, QCO_ALLOW_PRECONFIG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qmp_marshal_qmp_capabilities,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0QCO_ALLOW_PRECONFIG, 0);<br>
=C2=A0}<br>
<br>
=C2=A0/* Set the current CPU defined by the user. Callers must hold BQL. */=
<br>
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c<br>
index 7e943a0af5..8cca18c891 100644<br>
--- a/qapi/qmp-dispatch.c<br>
+++ b/qapi/qmp-dispatch.c<br>
@@ -176,7 +176,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject=
 *request,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
The command %s has not been found&quot;, command);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (cmd-&gt;options &amp; QCO_DEPRECATED) {<br>
+=C2=A0 =C2=A0 if (cmd-&gt;special_features &amp; 1u &lt;&lt; QAPI_DEPRECAT=
ED) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (compat_policy.deprecated_input) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case COMPAT_POLICY_INPUT_ACCEPT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c<br>
index f78c064aae..485bc5e6fc 100644<br>
--- a/qapi/qmp-registry.c<br>
+++ b/qapi/qmp-registry.c<br>
@@ -16,7 +16,8 @@<br>
=C2=A0#include &quot;qapi/qmp/dispatch.h&quot;<br>
<br>
=C2=A0void qmp_register_command(QmpCommandList *cmds, const char *name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 QmpCommandFunc *fn, QmpCommandOptions options)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 QmpCommandFunc *fn, QmpCommandOptions options,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned special_features)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QmpCommand *cmd =3D g_malloc0(sizeof(*cmd));<br>
<br>
@@ -27,6 +28,7 @@ void qmp_register_command(QmpCommandList *cmds, const cha=
r *name,<br>
=C2=A0 =C2=A0 =C2=A0cmd-&gt;fn =3D fn;<br>
=C2=A0 =C2=A0 =C2=A0cmd-&gt;enabled =3D true;<br>
=C2=A0 =C2=A0 =C2=A0cmd-&gt;options =3D options;<br>
+=C2=A0 =C2=A0 cmd-&gt;special_features =3D special_features;<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INSERT_TAIL(cmds, cmd, node);<br>
=C2=A0}<br>
<br>
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-sto=
rage-daemon.c<br>
index 10a1a33761..52cf17e8ac 100644<br>
--- a/storage-daemon/qemu-storage-daemon.c<br>
+++ b/storage-daemon/qemu-storage-daemon.c<br>
@@ -146,7 +146,8 @@ static void init_qmp_commands(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INIT(&amp;qmp_cap_negotiation_commands);<br>
=C2=A0 =C2=A0 =C2=A0qmp_register_command(&amp;qmp_cap_negotiation_commands,=
 &quot;qmp_capabilities&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qmp_marshal_qmp_capabilities, QCO_ALLOW_PRECONFIG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qmp_marshal_qmp_capabilities,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0QCO_ALLOW_PRECONFIG, 0);<br>
=C2=A0}<br>
<br>
=C2=A0static int getopt_set_loc(int argc, char **argv, const char *optstrin=
g,<br>
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py<br>
index c8a975528f..21001bbd6b 100644<br>
--- a/scripts/qapi/commands.py<br>
+++ b/scripts/qapi/commands.py<br>
@@ -26,6 +26,7 @@<br>
=C2=A0 =C2=A0 =C2=A0QAPISchemaModularCVisitor,<br>
=C2=A0 =C2=A0 =C2=A0build_params,<br>
=C2=A0 =C2=A0 =C2=A0ifcontext,<br>
+=C2=A0 =C2=A0 gen_special_features,<br>
=C2=A0)<br>
=C2=A0from .schema import (<br>
=C2=A0 =C2=A0 =C2=A0QAPISchema,<br>
@@ -217,9 +218,6 @@ def gen_register_command(name: str,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 coroutine: bool) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0options =3D []<br>
<br>
-=C2=A0 =C2=A0 if &#39;deprecated&#39; in [<a href=3D"http://f.name" rel=3D=
"noreferrer" target=3D"_blank">f.name</a> for f in features]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 options +=3D [&#39;QCO_DEPRECATED&#39;]<br>
-<br>
=C2=A0 =C2=A0 =C2=A0if not success_response:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options +=3D [&#39;QCO_NO_SUCCESS_RESP&#3=
9;]<br>
=C2=A0 =C2=A0 =C2=A0if allow_oob:<br>
@@ -231,10 +229,11 @@ def gen_register_command(name: str,<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D mcgen(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0qmp_register_command(cmds, &quot;%(name)s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qmp_marshal_%(c_name)s, %(opts)s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qmp_marshal_%(c_name)s, %(opts)s, %(feats)s);<br>
=C2=A0&#39;&#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name=3Dname, =
c_name=3Dc_name(name),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=3D&#39; | &#3=
9;.join(options) or 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=3D&#39; | &#3=
9;.join(options) or 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feats=3Dgen_specia=
l_features(features))<br></blockquote><div><br></div><div>Ah, you use the &=
#39;0&#39; return here. Alright then.<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0return ret<br>
<br>
<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>Python bits: Acked-by: John Snow &lt;<=
a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div><div>C bit=
s: &quot;I believe in my heart that they probably work.&quot;<br></div><div=
><br></div><div>(for this and previous patch.)<br></div></div></div>

--0000000000001a536e05cf326730--


