Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50F83A1006
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:15:50 +0200 (CEST)
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvFV-00081p-Ji
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lqvDj-0006sr-OT
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:13:59 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lqvDh-0003pZ-5t
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:13:59 -0400
Received: by mail-ed1-x531.google.com with SMTP id t3so28066761edc.7
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HKIQO+oO4pdC5+NmN6v8BIY/AXmF0VIqqgqKfKMzQAw=;
 b=jVuFXCM0bN11U/hPo+d7j5gNiqwtKF9XlKKZBylkwvgXPJ+MZYocQg8rd1KOA6S8Wg
 lDDz8knFPtBNWadktkTsRKKU5oPrP2/0vIapFuL5dIFUj0WY5ViGHrr2D/iJN2i+DM8J
 lmbDQq22HfqhckWvAXgOJtnQs3vzkp6RfXZOmwqNPTxtC2Pvj2uzhpKhKUh7kPScaGyu
 3/5ctv22BSXeqTJz7ScnNLlPHkvCIMvoB92FuzmmmQCfTBX7pac39gnM903+Vo6z0NKC
 5/nBnUQbJ5kDK8f6xZyunkS2yGHFPxtdSFFKp7SRU82JBOk2aj70gsfiuzMgv2MtZz02
 a7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HKIQO+oO4pdC5+NmN6v8BIY/AXmF0VIqqgqKfKMzQAw=;
 b=ewfnYA9XtmO58sWdZbycDqAz6c5sBj1fciuhYvrlmQbnv2y3G+VdPU7OeL1LH8uVMM
 JoUhvjOzWhLQcYtvjtH5guV82izBYfaf+38EubPLEFosE4Yvddx4amSZasvxtpkeMebW
 NOWHzXlOnOgjjUyAb+5JudQc/+jYcvO9aQ7T/DyUyRSP0++5TNboee2JIIaPPlqg0KVU
 SbBsXdYFmCziijozd0WpJmS/JlGr0DrtTlDl2t2lLRYUCO+s+Blsv8BbGdSP//5krl4V
 mJeYE9B5niZ/67jDeH1SJkVZG1pnJCYTClaueAzbpu2rubYv5/CDhlXvOgsePekmPNj/
 LPoQ==
X-Gm-Message-State: AOAM532FNq+z8uU+RW9qgKCAe2qtr6WSORAs3oI3niiQyTJAn31C+wWy
 xCx0IPOxwnxYsjd5N3eHCJMquVaotLc47WbYlnA=
X-Google-Smtp-Source: ABdhPJw3L0vh3h1ltIlUn2fswcBaoXMOJlhhvQJFp4Xlg29yeFYWzq1cgPAuVTejNTEwBlNwj+LedraEcQvNNs3EC3c=
X-Received: by 2002:aa7:cd42:: with SMTP id v2mr30402435edw.245.1623233635616; 
 Wed, 09 Jun 2021 03:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <87o8cgxxel.fsf@dusky.pond.sub.org> <YL+Op6F7wFoVYum2@redhat.com>
 <6528dfe1-7cc7-c530-a56f-06517a627cda@huawei.com>
In-Reply-To: <6528dfe1-7cc7-c530-a56f-06517a627cda@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Jun 2021 14:13:42 +0400
Message-ID: <CAJ+F1CLDMdayOG8DJ1kQ=027qSEbfd-U9Kmu=MBzDT-ZVRw4uQ@mail.gmail.com>
Subject: Re: A bug of Monitor Chardev ?
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000003d0cb905c45288a7"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: chenjiashang@huawei.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003d0cb905c45288a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 9, 2021 at 4:21 AM Longpeng (Mike, Cloud Infrastructure Service
Product Dept.) <longpeng2@huawei.com> wrote:

>
>
> =E5=9C=A8 2021/6/8 23:37, Daniel P. Berrang=C3=A9 =E5=86=99=E9=81=93:
> > On Tue, Jun 08, 2021 at 04:07:30PM +0200, Markus Armbruster wrote:
> >> "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
> >> <longpeng2@huawei.com> writes:
> >>
> >>> We find a race during QEMU starting, which would case the QEMU proces=
s
> coredump.
> >>>
> >>> <main loop>                             |    <MON iothread>
> >>>                                         |
> >>> [1] create MON chardev                  |
> >>> qemu_create_early_backends              |
> >>>   chardev_init_func                     |
> >>>                                         |
> >>> [2] create MON iothread                 |
> >>> qemu_create_late_backends               |
> >>>   mon_init_func                         |
> >>>     aio_bh_schedule----------------------->
> monitor_qmp_setup_handlers_bh
> >>> [3] enter main loog                     |
> tcp_chr_update_read_handler
> >>> (* A client come in, e.g. Libvirt *)    |      update_ioc_handlers
> >>> tcp_chr_new_client                      |
> >>>   update_ioc_handlers                   |
> >>>                                         |
> >>>     [4] create new hup_source           |
> >>>         s->hup_source =3D *PTR1*          |
> >>>           g_source_attach(s->hup_source)|
> >>>                                         |        [5]
> remove_hup_source(*PTR1*)
> >>>                                         |            (create new
> hup_source)
> >>>                                         |             s->hup_source =
=3D
> *PTR2*
> >>>         [6] g_source_attach_unlocked    |
> >>>               *PTR1* is freed by [5]    |
> >>>
> >>> Do you have any suggestion to fix this bug ? Thanks!
> >>
> >> Do we?  We talked, but I'm not sure we reached a conclusion.
> >
> > Seems like we ended up with two options.
> >
> >   1. A workaround for the current  specific problem by rearranging
> >      the initilization code in the monitor a little.
> >
> >   2. A design fix of splitting the chardev creation into two
> >      parts, one creation, and one activation.
> >
> > The latter is significantly more work, but is a better long term bet
> IMHO.
> > But what we really is someone motivated to actually implement one of th=
e
> > two options.
> >
>
> How about the following implementation of option-1 ? We've tested it for
> several
> weeks, it works fine.
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>

If we go with this option, disable_handler will need to be implemented for
all chardevs that have some (or use a QEMU_CHAR_FEATURE_DISABLE_HANDLER
flag, which will limit the chardevs that can be associated with a monitor
and knowingly break previously working setups).


index a484641..ecb3db9 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -722,6 +722,19 @@ static void tcp_chr_update_read_handler(Chardev *chr=
)
>      update_ioc_handlers(s);
>  }
>
> +static void tcp_chr_disable_handler(Chardev *chr)
> +{
> +    SocketChardev *s =3D SOCKET_CHARDEV(chr);
> +
> +    if (s->listener && s->state =3D=3D TCP_CHARDEV_STATE_DISCONNECTED) {
> +        qio_net_listener_set_client_func_full(s->listener, NULL, NULL,
> +                                              NULL, chr->gcontext);
> +    }
> +
> +    remove_fd_in_watch(chr);
> +    remove_hup_source(s);
> +}
> +
>  static bool tcp_chr_is_connected(Chardev *chr)
>  {
>      SocketChardev *s =3D SOCKET_CHARDEV(chr);
> @@ -1703,6 +1716,7 @@ static void char_socket_class_init(ObjectClass *oc,
> void
> *data)
>      cc->chr_add_watch =3D tcp_chr_add_watch;
>      cc->chr_set_reconnect_time =3D tcp_chr_set_reconnect_time;
>      cc->chr_update_read_handler =3D tcp_chr_update_read_handler;
> +    cc->chr_disable_handler =3D tcp_chr_disable_handler;
>      cc->chr_is_connected =3D tcp_chr_is_connected;
>      cc->chr_get_connect_id =3D tcp_chr_get_connect_id;
>
> diff --git a/chardev/char.c b/chardev/char.c
> index ff0a3cf..990fe4f 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -238,6 +238,15 @@ void qemu_chr_be_update_read_handlers(Chardev *s,
>      }
>  }
>
> +void qemu_chr_be_disable_handlers(Chardev *s)
> +{
> +    ChardevClass *cc =3D CHARDEV_GET_CLASS(s);
> +
> +    if (cc->chr_disable_handler) {
> +        cc->chr_disable_handler(s);
> +    }
> +}
> +
>  int qemu_chr_add_client(Chardev *s, int fd)
>  {
>      return CHARDEV_GET_CLASS(s)->chr_add_client ?
> diff --git a/include/chardev/char.h b/include/chardev/char.h
> index d1ec628..7a8c740 100644
> --- a/include/chardev/char.h
> +++ b/include/chardev/char.h
> @@ -212,6 +212,8 @@ void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf,
> int len);
>  void qemu_chr_be_update_read_handlers(Chardev *s,
>                                        GMainContext *context);
>
> +void qemu_chr_be_disable_handlers(Chardev *s);
> +
>  /**
>   * qemu_chr_be_event:
>   * @event: the event to send
> @@ -282,6 +284,7 @@ typedef struct ChardevClass {
>      int (*chr_sync_read)(Chardev *s, const uint8_t *buf, int len);
>      GSource *(*chr_add_watch)(Chardev *s, GIOCondition cond);
>      void (*chr_update_read_handler)(Chardev *s);
> +    void (*chr_disable_handler)(Chardev *s);
>      int (*chr_ioctl)(Chardev *s, int cmd, void *arg);
>      int (*get_msgfds)(Chardev *s, int* fds, int num);
>      int (*set_msgfds)(Chardev *s, int *fds, int num);
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 9a69ae4..2c2248c 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -413,11 +413,13 @@ void monitor_init_qmp(Chardev *chr, bool pretty)
>           * e.g. the chardev is in client mode, with wait=3Don.
>           */
>          remove_fd_in_watch(chr);
> +
>          /*
> -         * We can't call qemu_chr_fe_set_handlers() directly here
> -         * since chardev might be running in the monitor I/O
> -         * thread.  Schedule a bottom half.
> +         * Before schedule a bottom half, we should clean up the handler
> in the
> +         * default context to prevent the race between main thread and
> iothread
>           */
> +        qemu_chr_be_disable_handlers(chr);
> +
>          aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothread),
>                                  monitor_qmp_setup_handlers_bh, mon);
>          /* The bottom half will add @mon to @mon_list */
> --
> 1.8.3.1
>
>
> > Regards,
> > Daniel
> >
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003d0cb905c45288a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 9, 2021 at 4:21 AM Long=
peng (Mike, Cloud Infrastructure Service Product Dept.) &lt;<a href=3D"mail=
to:longpeng2@huawei.com">longpeng2@huawei.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
=E5=9C=A8 2021/6/8 23:37, Daniel P. Berrang=C3=A9 =E5=86=99=E9=81=93:<br>
&gt; On Tue, Jun 08, 2021 at 04:07:30PM +0200, Markus Armbruster wrote:<br>
&gt;&gt; &quot;Longpeng (Mike, Cloud Infrastructure Service Product Dept.)&=
quot;<br>
&gt;&gt; &lt;<a href=3D"mailto:longpeng2@huawei.com" target=3D"_blank">long=
peng2@huawei.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt;&gt; We find a race during QEMU starting, which would case the QEMU=
 process coredump.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &lt;main loop&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 &=
lt;MON iothread&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|<br>
&gt;&gt;&gt; [1] create MON chardev=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt;&gt;&gt; qemu_create_early_backends=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |<br>
&gt;&gt;&gt;=C2=A0 =C2=A0chardev_init_func=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|<br>
&gt;&gt;&gt; [2] create MON iothread=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt;&gt;&gt; qemu_create_late_backends=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|<br>
&gt;&gt;&gt;=C2=A0 =C2=A0mon_init_func=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0aio_bh_schedule-----------------------&gt; =
monitor_qmp_setup_handlers_bh<br>
&gt;&gt;&gt; [3] enter main loog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 tcp_chr_update_read_handle=
r<br>
&gt;&gt;&gt; (* A client come in, e.g. Libvirt *)=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 update_ioc_handlers<br>
&gt;&gt;&gt; tcp_chr_new_client=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt;&gt;&gt;=C2=A0 =C2=A0update_ioc_handlers=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0[4] create new hup_source=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;hup_source =3D *PTR1*=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_source_attach(s-&gt;=
hup_source)|<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 [5] remove_hup_source(*PTR1*)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (create new hup_source=
)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;hup_source=
 =3D *PTR2*<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[6] g_source_attach_unlocked=
=C2=A0 =C2=A0 |<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*PTR1* i=
s freed by [5]=C2=A0 =C2=A0 |<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>
&gt;&gt;&gt; Do you have any suggestion to fix this bug ? Thanks!<br>
&gt;&gt;<br>
&gt;&gt; Do we?=C2=A0 We talked, but I&#39;m not sure we reached a conclusi=
on.<br>
&gt; <br>
&gt; Seems like we ended up with two options.<br>
&gt; <br>
&gt;=C2=A0 =C2=A01. A workaround for the current=C2=A0 specific problem by =
rearranging<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the initilization code in the monitor a little.<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A02. A design fix of splitting the chardev creation into two=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parts, one creation, and one activation.<br>
&gt; <br>
&gt; The latter is significantly more work, but is a better long term bet I=
MHO.<br>
&gt; But what we really is someone motivated to actually implement one of t=
he<br>
&gt; two options.<br>
&gt; <br>
<br>
How about the following implementation of option-1 ? We&#39;ve tested it fo=
r several<br>
weeks, it works fine.<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br></blockquote>=
<div><br></div><div>If we go with this option, disable_handler will need to=
 be implemented for all chardevs that have some (or use a QEMU_CHAR_FEATURE=
_DISABLE_HANDLER flag, which will limit the chardevs that can be associated=
 with a monitor and knowingly break previously working setups).</div><div><=
br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
index a484641..ecb3db9 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -722,6 +722,19 @@ static void tcp_chr_update_read_handler(Chardev *chr)<=
br>
=C2=A0 =C2=A0 =C2=A0update_ioc_handlers(s);<br>
=C2=A0}<br>
<br>
+static void tcp_chr_disable_handler(Chardev *chr)<br>
+{<br>
+=C2=A0 =C2=A0 SocketChardev *s =3D SOCKET_CHARDEV(chr);<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;listener &amp;&amp; s-&gt;state =3D=3D TCP_CHARDEV=
_STATE_DISCONNECTED) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_net_listener_set_client_func_full(s-&gt;li=
stener, NULL, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 NULL, chr-&gt;gcontext);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 remove_fd_in_watch(chr);<br>
+=C2=A0 =C2=A0 remove_hup_source(s);<br>
+}<br>
+<br>
=C2=A0static bool tcp_chr_is_connected(Chardev *chr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SocketChardev *s =3D SOCKET_CHARDEV(chr);<br>
@@ -1703,6 +1716,7 @@ static void char_socket_class_init(ObjectClass *oc, v=
oid<br>
*data)<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_add_watch =3D tcp_chr_add_watch;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_set_reconnect_time =3D tcp_chr_set_reconnect=
_time;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_update_read_handler =3D tcp_chr_update_read_=
handler;<br>
+=C2=A0 =C2=A0 cc-&gt;chr_disable_handler =3D tcp_chr_disable_handler;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_is_connected =3D tcp_chr_is_connected;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_get_connect_id =3D tcp_chr_get_connect_id;<b=
r>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index ff0a3cf..990fe4f 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -238,6 +238,15 @@ void qemu_chr_be_update_read_handlers(Chardev *s,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+void qemu_chr_be_disable_handlers(Chardev *s)<br>
+{<br>
+=C2=A0 =C2=A0 ChardevClass *cc =3D CHARDEV_GET_CLASS(s);<br>
+<br>
+=C2=A0 =C2=A0 if (cc-&gt;chr_disable_handler) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cc-&gt;chr_disable_handler(s);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0int qemu_chr_add_client(Chardev *s, int fd)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return CHARDEV_GET_CLASS(s)-&gt;chr_add_client ?<br>
diff --git a/include/chardev/char.h b/include/chardev/char.h<br>
index d1ec628..7a8c740 100644<br>
--- a/include/chardev/char.h<br>
+++ b/include/chardev/char.h<br>
@@ -212,6 +212,8 @@ void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, i=
nt len);<br>
=C2=A0void qemu_chr_be_update_read_handlers(Chardev *s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GMainCont=
ext *context);<br>
<br>
+void qemu_chr_be_disable_handlers(Chardev *s);<br>
+<br>
=C2=A0/**<br>
=C2=A0 * qemu_chr_be_event:<br>
=C2=A0 * @event: the event to send<br>
@@ -282,6 +284,7 @@ typedef struct ChardevClass {<br>
=C2=A0 =C2=A0 =C2=A0int (*chr_sync_read)(Chardev *s, const uint8_t *buf, in=
t len);<br>
=C2=A0 =C2=A0 =C2=A0GSource *(*chr_add_watch)(Chardev *s, GIOCondition cond=
);<br>
=C2=A0 =C2=A0 =C2=A0void (*chr_update_read_handler)(Chardev *s);<br>
+=C2=A0 =C2=A0 void (*chr_disable_handler)(Chardev *s);<br>
=C2=A0 =C2=A0 =C2=A0int (*chr_ioctl)(Chardev *s, int cmd, void *arg);<br>
=C2=A0 =C2=A0 =C2=A0int (*get_msgfds)(Chardev *s, int* fds, int num);<br>
=C2=A0 =C2=A0 =C2=A0int (*set_msgfds)(Chardev *s, int *fds, int num);<br>
diff --git a/monitor/qmp.c b/monitor/qmp.c<br>
index 9a69ae4..2c2248c 100644<br>
--- a/monitor/qmp.c<br>
+++ b/monitor/qmp.c<br>
@@ -413,11 +413,13 @@ void monitor_init_qmp(Chardev *chr, bool pretty)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * e.g. the chardev is in client mode, wi=
th wait=3Don.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remove_fd_in_watch(chr);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We can&#39;t call qemu_chr_fe_set_hand=
lers() directly here<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since chardev might be running in the =
monitor I/O<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* thread.=C2=A0 Schedule a bottom half.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Before schedule a bottom half, we shou=
ld clean up the handler in the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* default context to prevent the race be=
tween main thread and iothread<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_disable_handlers(chr);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aio_bh_schedule_oneshot(iothread_get_aio_=
context(mon_iothread),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_setup_handlers_bh,=
 mon);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The bottom half will add @mon to @mon_=
list */<br>
-- <br>
1.8.3.1<br>
<br>
<br>
&gt; Regards,<br>
&gt; Daniel<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003d0cb905c45288a7--

