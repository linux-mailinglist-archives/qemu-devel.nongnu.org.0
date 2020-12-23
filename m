Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23FF2E19F2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 09:29:40 +0100 (CET)
Received: from localhost ([::1]:51384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krzWd-0003Dr-DI
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 03:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1krzVr-0002iO-Mu
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 03:28:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1krzVo-0007hN-8E
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 03:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608712125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xQFw7SyYE9jDVH/AuywH2uMkjLhb7ncaHln8NmO0aEA=;
 b=HXNMCCAQc8yRfzLpdWzBTTArGDY6FNrykwn8QKa4K/EyUhTnv/oeNTHkZ7l3M6IGVqY9Qs
 kDmavFQpbhXufYtmsV3jBUFt6JoTnYX3ESnGcc8xLt/iKhyWHrzbDtdXX/H9FEL+xMcg8S
 DQmU2/+SZY7AFmrihWvh29zekRLnft0=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-bwACVPptOUmzPdZ7aMAUXw-1; Wed, 23 Dec 2020 03:28:42 -0500
X-MC-Unique: bwACVPptOUmzPdZ7aMAUXw-1
Received: by mail-il1-f198.google.com with SMTP id s23so13709205ilk.14
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 00:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xQFw7SyYE9jDVH/AuywH2uMkjLhb7ncaHln8NmO0aEA=;
 b=jzPgnMt3lP+R+i2Av559qPmyEnFvlJyVi99yqJXSMNChRWVCtFJXYRhJa+entqnjmx
 wjQz54w6q/EGcW1TrJORJMNcBolXDBo0610SULPkyVv8Etfnl1jqXNL6fq9hX9B+jjgu
 NquKVp8zhc3zy5SXzq70YFSRzd9Ovgzb/vrFcfgRQ6eaIsC6mKGAg1FY4v/LfBeXKWOE
 rN+lyg4axG63dmPrYLtsWVl+qhrSS7CqtqSvQaG7WOYpXpeBO+veCyzDz5hDTj+JXI0f
 jkogwCInq7dB4DKOsEVM0moVnCVp0OiU5dnmzL+UfAtTLe62zYxzAwC8HFsS8a0LRTiY
 VgYw==
X-Gm-Message-State: AOAM531F3GjqNBHd1bVHt24V79sTWLqcP1eGXXPsGQoCTTxzVdDgZL3x
 GjmaxQuoCcB53+tCa7oZH47/4hPLcZ+yNihAusqFKvxpMJLYrm0ieatYYEZ4cqRmHX5a/aU59Mh
 NRJFQScKtESF2Xceb092ARiS5T941tYc=
X-Received: by 2002:a02:a88c:: with SMTP id l12mr22808482jam.53.1608712121716; 
 Wed, 23 Dec 2020 00:28:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX2B0VAkNvjlyUjm43ipGmNaf14f3HfFlE8nWUgZQxHpphdBtPG40P1tbPax6fVvEn60LsAGmic+OM7dMkyRI=
X-Received: by 2002:a02:a88c:: with SMTP id l12mr22808465jam.53.1608712121489; 
 Wed, 23 Dec 2020 00:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20201221134957.1353-1-wangxinxin.wang@huawei.com>
In-Reply-To: <20201221134957.1353-1-wangxinxin.wang@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 23 Dec 2020 12:28:30 +0400
Message-ID: <CAMxuvaxMDTY81W6vg+C3MgGXRZ0JXn222FcJ=Qm5f4bQBcQM6A@mail.gmail.com>
Subject: Re: [PATCH] char-socket: disable reconnect timer in the sync connect
To: Wang Xin <wangxinxin.wang@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008c329905b71d7a31"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: suruifeng <suruifeng@huawei.com>, weidong.huang@huawei.com,
 qemu-devel <qemu-devel@nongnu.org>, lidonglin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008c329905b71d7a31
Content-Type: text/plain; charset="UTF-8"

Hi

On Mon, Dec 21, 2020 at 6:06 PM Wang Xin <wangxinxin.wang@huawei.com> wrote:

> From: suruifeng <suruifeng@huawei.com>
>
> The qio_channel_socket_connect_sync maybe called twice if the
> openvswitchd restart during we attaching a vhost-user nic.
>
> -> call trace 1:
>   net_vhost_user_init
>     tcp_chr_wait_connected //loop call sync connect until socekt connected
>       tcp_chr_connect_client_sync //return, but socekt state still
> disconnected
>         qio_channel_socket_connect_sync //socket connect sucess
>           tcp_chr_new_client
>             tcp_chr_connect
>               qemu_chr_be_event
>                 net_vhost_user_event //CHR_EVENT_OPENED
>                   vhost_user_start
>                     tcp_chr_write  //Broken Pipe, as peer restart
>                       tcp_chr_disconnect_locked //disconnect & reconnect
> timer create
>
> -> call trace 2:
>   socket_reconnect_timeout //timeout, and the peer restart just finished
>     tcp_chr_connect_client_async //concurrent with
> tcp_chr_connect_client_sync
>

What do you mean by "concurrent with tcp_chr_connect_client_sync"? Are we
talking about threads? If not, could you provide the full backtrace?

       tcp_chr_connect_client_task
>           qio_channel_socket_connect_sync //try connect same socket

This patch disabled tcp reconnect timer when we try to connect in
> synchronous mode,
>
it seems to work.
>
> Signed-off-by: suruifeng <suruifeng@huawei.com>
> Signed-off-by: Wang Xin <wangxinxin.wang@huawei.com>
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 213a4c8dd0..da1befca9e 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -80,6 +80,7 @@ struct SocketChardev {
>
>      bool is_websock;
>
> +    bool async_reconnect_disable;
>      GSource *reconnect_timer;
>      int64_t reconnect_time;
>      bool connect_err_reported;
> @@ -506,7 +507,9 @@ static void tcp_chr_disconnect_locked(Chardev *chr)
>      if (emit_close) {
>          qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
>      }
> -    if (s->reconnect_time && !s->reconnect_timer) {
> +    if (s->reconnect_time &&
> +        !s->reconnect_timer &&
> +        !s->async_reconnect_disable) {
>          qemu_chr_socket_restart_timer(chr);
>      }
>  }
> @@ -954,15 +957,23 @@ static int tcp_chr_connect_client_sync(Chardev *chr,
> Error **errp)
>  {
>      SocketChardev *s = SOCKET_CHARDEV(chr);
>      QIOChannelSocket *sioc = qio_channel_socket_new();
> +
> +    s->async_reconnect_disable = true;
>

Instead of having a new field, we could probably zero s->reconnect_timer
temporarily.

     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
>      tcp_chr_set_client_ioc_name(chr, sioc);
>      if (qio_channel_socket_connect_sync(sioc, s->addr, errp) < 0) {
>          tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
>          object_unref(OBJECT(sioc));
> +        s->async_reconnect_disable = false;
>          return -1;
>      }
>      tcp_chr_new_client(chr, sioc);
>      object_unref(OBJECT(sioc));
> +    s->async_reconnect_disable = false;
> +
> +    if (s->state != TCP_CHARDEV_STATE_CONNECTED) {
> +        return -1;
> +    }
>

How is this related?

     return 0;
>  }
>
> --
> 2.26.0.windows.1
>
>

--0000000000008c329905b71d7a31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 21, 2020 at 6:06 PM Wan=
g Xin &lt;<a href=3D"mailto:wangxinxin.wang@huawei.com">wangxinxin.wang@hua=
wei.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: suruifeng &lt;<a href=3D"mailto:suruifeng@huawei.com" target=
=3D"_blank">suruifeng@huawei.com</a>&gt;<br>
<br>
The qio_channel_socket_connect_sync maybe called twice if the<br>
openvswitchd restart during we attaching a vhost-user nic.<br>
<br>
-&gt; call trace 1:<br>
=C2=A0 net_vhost_user_init<br>
=C2=A0 =C2=A0 tcp_chr_wait_connected //loop call sync connect until socekt =
connected<br>
=C2=A0 =C2=A0 =C2=A0 tcp_chr_connect_client_sync //return, but socekt state=
 still disconnected<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_socket_connect_sync //socket connec=
t sucess<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_chr_new_client<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_chr_connect<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_event<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 net_vhost_user_even=
t //CHR_EVENT_OPENED<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vhost_user_s=
tart<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_c=
hr_write=C2=A0 //Broken Pipe, as peer restart<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tcp_chr_disconnect_locked //disconnect &amp; reconnect timer create<br>
<br>
-&gt; call trace 2:<br>
=C2=A0 socket_reconnect_timeout //timeout, and the peer restart just finish=
ed<br>
=C2=A0 =C2=A0 tcp_chr_connect_client_async //concurrent with tcp_chr_connec=
t_client_sync<br></blockquote><div><br></div><div>What do you mean by &quot=
;concurrent with  tcp_chr_connect_client_sync&quot;? Are we talking about t=
hreads? If not, could you provide the full backtrace?<br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_connect_client_task<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_socket_connect_sync //try co=
nnect same socket=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This patch disabled tcp reconnect timer when we try to connect i=
n synchronous mode,<br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
it seems to work.<br>
<br>
Signed-off-by: suruifeng &lt;<a href=3D"mailto:suruifeng@huawei.com" target=
=3D"_blank">suruifeng@huawei.com</a>&gt;<br>
Signed-off-by: Wang Xin &lt;<a href=3D"mailto:wangxinxin.wang@huawei.com" t=
arget=3D"_blank">wangxinxin.wang@huawei.com</a>&gt;<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index 213a4c8dd0..da1befca9e 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -80,6 +80,7 @@ struct SocketChardev {<br>
<br>
=C2=A0 =C2=A0 =C2=A0bool is_websock;<br>
<br>
+=C2=A0 =C2=A0 bool async_reconnect_disable;<br>
=C2=A0 =C2=A0 =C2=A0GSource *reconnect_timer;<br>
=C2=A0 =C2=A0 =C2=A0int64_t reconnect_time;<br>
=C2=A0 =C2=A0 =C2=A0bool connect_err_reported;<br>
@@ -506,7 +507,9 @@ static void tcp_chr_disconnect_locked(Chardev *chr)<br>
=C2=A0 =C2=A0 =C2=A0if (emit_close) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_be_event(chr, CHR_EVENT_CLOSED);=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (s-&gt;reconnect_time &amp;&amp; !s-&gt;reconnect_timer) =
{<br>
+=C2=A0 =C2=A0 if (s-&gt;reconnect_time &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !s-&gt;reconnect_timer &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !s-&gt;async_reconnect_disable) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_socket_restart_timer(chr);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
@@ -954,15 +957,23 @@ static int tcp_chr_connect_client_sync(Chardev *chr, =
Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SocketChardev *s =3D SOCKET_CHARDEV(chr);<br>
=C2=A0 =C2=A0 =C2=A0QIOChannelSocket *sioc =3D qio_channel_socket_new();<br=
>
+<br>
+=C2=A0 =C2=A0 s-&gt;async_reconnect_disable =3D true;<br></blockquote><div=
><br></div><div>Instead of having a new field, we could probably zero s-&gt=
;reconnect_timer temporarily.</div><div> <br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);<=
br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, sioc);<br>
=C2=A0 =C2=A0 =C2=A0if (qio_channel_socket_connect_sync(sioc, s-&gt;addr, e=
rrp) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STATE=
_DISCONNECTED);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(sioc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;async_reconnect_disable =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_new_client(chr, sioc);<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(sioc));<br>
+=C2=A0 =C2=A0 s-&gt;async_reconnect_disable =3D false;<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;state !=3D TCP_CHARDEV_STATE_CONNECTED) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>How is this related?</=
div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
-- <br>
2.26.0.windows.1<br>
<br>
</blockquote></div></div>

--0000000000008c329905b71d7a31--


