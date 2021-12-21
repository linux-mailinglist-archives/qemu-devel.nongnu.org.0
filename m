Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D447BB73
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:06:07 +0100 (CET)
Received: from localhost ([::1]:42358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mza9u-0006gI-Af
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:06:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mza0z-0005Rn-SL
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:56:53 -0500
Received: from [2a00:1450:4864:20::431] (port=46683
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mza0x-0007aQ-8l
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:56:53 -0500
Received: by mail-wr1-x431.google.com with SMTP id i22so25070963wrb.13
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 23:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yFWQOiK4glEA0w2ITtzMHk0pcIumr8HRQYzcX/CQp3Q=;
 b=BwE1fFSmaSNxvXmkWgF/UejTKPY4ZDkdcWc6gZXALpjBupoZjTLoVNgmfCcUyorLOj
 Ltai8giCnTQb07ZQdbmmn4vhrTF8BFaffYzJRW3LYjYd/u5FpL4eHpopUezfQx3sWOOm
 +kwFp4mMgjjtBTTAhF5LY2/gXAuya1UGgwl/SPWIUmKvzAU3qMIUKaqqt05/z5jaQ5z3
 +MbNb6Bkn0GLOgSELrl1IoVEU+fiuNONrFon7K396QcPdATTNb6turjXX4KZ6fhypIgk
 zviifxNmz1/39W0iVLrm3wNmIML1iaRNgA4e9eYrl4X7RWVYHYFmY8SxxO7WeSqgmw1+
 51bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yFWQOiK4glEA0w2ITtzMHk0pcIumr8HRQYzcX/CQp3Q=;
 b=kRKGmnetAV42dcgLW1RG8OxQHXo5jrk1Wi8fc/F3NMbVZeroqtKebeNeRqdJIJom3/
 URdtFv8IfD2R7NKlJTPEzMSsjdrJy7Af79ncTdLrYvzEbM1SBBh7xv1Lh9DASAp501RH
 4WmIA8IE/bwaCTlWGIzOCsbAgKbvKBhznjMBcoYNi3P+9K0ajHJ2rDjnX+JZJJRjMc2z
 ksm0azzLzpfy3OYoTx2QnxvvAjarKHLKk+249nn5oJ9IgOcjNaxC5D4XzpPO78e4+Dew
 kECAFi87d7IMXMro0wzaLp0NkU88HojjWhouUO/iEM5nsilvCA4AvBFC+dTM6YiJzX9i
 +YeA==
X-Gm-Message-State: AOAM530XBuvIuUNx79R4pJrtr8lUzWvgVNRYs4IHpIgwAILXKAksPDVv
 QCg5S93jJYhVlbWoZKM4szNNswU5fLqGftDdsuc=
X-Google-Smtp-Source: ABdhPJwyfJU5Iee8q1qyaMC4CWoRvfgNl4KRCUn4+JKJSfK3i9VIvWEJXIjyZT+HLNNMOfvUqE9Lb3KdYv+XG2GKx1E=
X-Received: by 2002:a5d:47a1:: with SMTP id 1mr1581485wrb.436.1640073409440;
 Mon, 20 Dec 2021 23:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
 <20211220154418.1554279-2-vsementsov@virtuozzo.com>
In-Reply-To: <20211220154418.1554279-2-vsementsov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Dec 2021 11:56:36 +0400
Message-ID: <CAJ+F1CJ2Fc1BC5YiGN3VQ0EQFQtrBTnggATPWZ4UUsza=bUbDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ui/vnc: refactor arrays of addresses to
 SocketAddressList
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: multipart/alternative; boundary="000000000000f9ae1f05d3a3586a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f9ae1f05d3a3586a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Dec 20, 2021 at 10:21 PM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> Let's use SocketAddressList instead of dynamic arrays.
> Benefits:
>  - Automatic cleanup: don't need specific freeing function and drop
>    some gotos.
>  - Less indirection: no triple asterix anymore!
>  - Prepare for the following commit, which will reuse new interface of
>    vnc_display_listen().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>

Nice
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/vnc.c | 129 ++++++++++++++++++++++---------------------------------
>  1 file changed, 51 insertions(+), 78 deletions(-)
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index af02522e84..c9e26c70df 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3812,30 +3812,19 @@ static int vnc_display_get_address(const char
> *addrstr,
>      return ret;
>  }
>
> -static void vnc_free_addresses(SocketAddress ***retsaddr,
> -                               size_t *retnsaddr)
> -{
> -    size_t i;
> -
> -    for (i =3D 0; i < *retnsaddr; i++) {
> -        qapi_free_SocketAddress((*retsaddr)[i]);
> -    }
> -    g_free(*retsaddr);
> -
> -    *retsaddr =3D NULL;
> -    *retnsaddr =3D 0;
> -}
> -
>  static int vnc_display_get_addresses(QemuOpts *opts,
>                                       bool reverse,
> -                                     SocketAddress ***retsaddr,
> -                                     size_t *retnsaddr,
> -                                     SocketAddress ***retwsaddr,
> -                                     size_t *retnwsaddr,
> +                                     SocketAddressList **saddr_list_ret,
> +                                     SocketAddressList **wsaddr_list_ret=
,
>                                       Error **errp)
>  {
>      SocketAddress *saddr =3D NULL;
>      SocketAddress *wsaddr =3D NULL;
> +    g_autoptr(SocketAddressList) saddr_list =3D NULL;
> +    SocketAddressList **saddr_tail =3D &saddr_list;
> +    SocketAddress *single_saddr =3D NULL;
> +    g_autoptr(SocketAddressList) wsaddr_list =3D NULL;
> +    SocketAddressList **wsaddr_tail =3D &wsaddr_list;
>      QemuOptsIter addriter;
>      const char *addr;
>      int to =3D qemu_opt_get_number(opts, "to", 0);
> @@ -3844,23 +3833,16 @@ static int vnc_display_get_addresses(QemuOpts
> *opts,
>      bool ipv4 =3D qemu_opt_get_bool(opts, "ipv4", false);
>      bool ipv6 =3D qemu_opt_get_bool(opts, "ipv6", false);
>      int displaynum =3D -1;
> -    int ret =3D -1;
> -
> -    *retsaddr =3D NULL;
> -    *retnsaddr =3D 0;
> -    *retwsaddr =3D NULL;
> -    *retnwsaddr =3D 0;
>
>      addr =3D qemu_opt_get(opts, "vnc");
>      if (addr =3D=3D NULL || g_str_equal(addr, "none")) {
> -        ret =3D 0;
> -        goto cleanup;
> +        return 0;
>      }
>      if (qemu_opt_get(opts, "websocket") &&
>          !qcrypto_hash_supports(QCRYPTO_HASH_ALG_SHA1)) {
>          error_setg(errp,
>                     "SHA1 hash support is required for websockets");
> -        goto cleanup;
> +        return -1;
>      }
>
>      qemu_opt_iter_init(&addriter, opts, "vnc");
> @@ -3871,7 +3853,7 @@ static int vnc_display_get_addresses(QemuOpts *opts=
,
>                                       ipv4, ipv6,
>                                       &saddr, errp);
>          if (rv < 0) {
> -            goto cleanup;
> +            return -1;
>          }
>          /* Historical compat - first listen address can be used
>           * to set the default websocket port
> @@ -3879,13 +3861,16 @@ static int vnc_display_get_addresses(QemuOpts
> *opts,
>          if (displaynum =3D=3D -1) {
>              displaynum =3D rv;
>          }
> -        *retsaddr =3D g_renew(SocketAddress *, *retsaddr, *retnsaddr + 1=
);
> -        (*retsaddr)[(*retnsaddr)++] =3D saddr;
> +        QAPI_LIST_APPEND(saddr_tail, saddr);
>      }
>
> -    /* If we had multiple primary displays, we don't do defaults
> -     * for websocket, and require explicit config instead. */
> -    if (*retnsaddr > 1) {
> +    if (saddr_list && !saddr_list->next) {
> +        single_saddr =3D saddr_list->value;
> +    } else {
> +        /*
> +         * If we had multiple primary displays, we don't do defaults
> +         * for websocket, and require explicit config instead.
> +         */
>          displaynum =3D -1;
>      }
>
> @@ -3895,57 +3880,50 @@ static int vnc_display_get_addresses(QemuOpts
> *opts,
>                                      has_ipv4, has_ipv6,
>                                      ipv4, ipv6,
>                                      &wsaddr, errp) < 0) {
> -            goto cleanup;
> +            return -1;
>          }
>
>          /* Historical compat - if only a single listen address was
>           * provided, then this is used to set the default listen
>           * address for websocket too
>           */
> -        if (*retnsaddr =3D=3D 1 &&
> -            (*retsaddr)[0]->type =3D=3D SOCKET_ADDRESS_TYPE_INET &&
> +        if (single_saddr &&
> +            single_saddr->type =3D=3D SOCKET_ADDRESS_TYPE_INET &&
>              wsaddr->type =3D=3D SOCKET_ADDRESS_TYPE_INET &&
>              g_str_equal(wsaddr->u.inet.host, "") &&
> -            !g_str_equal((*retsaddr)[0]->u.inet.host, "")) {
> +            !g_str_equal(single_saddr->u.inet.host, "")) {
>              g_free(wsaddr->u.inet.host);
> -            wsaddr->u.inet.host =3D g_strdup((*retsaddr)[0]->u.inet.host=
);
> +            wsaddr->u.inet.host =3D g_strdup(single_saddr->u.inet.host);
>          }
>
> -        *retwsaddr =3D g_renew(SocketAddress *, *retwsaddr, *retnwsaddr =
+
> 1);
> -        (*retwsaddr)[(*retnwsaddr)++] =3D wsaddr;
> +        QAPI_LIST_APPEND(wsaddr_tail, wsaddr);
>      }
>
> -    ret =3D 0;
> - cleanup:
> -    if (ret < 0) {
> -        vnc_free_addresses(retsaddr, retnsaddr);
> -        vnc_free_addresses(retwsaddr, retnwsaddr);
> -    }
> -    return ret;
> +    *saddr_list_ret =3D g_steal_pointer(&saddr_list);
> +    *wsaddr_list_ret =3D g_steal_pointer(&wsaddr_list);
> +    return 0;
>  }
>
>  static int vnc_display_connect(VncDisplay *vd,
> -                               SocketAddress **saddr,
> -                               size_t nsaddr,
> -                               SocketAddress **wsaddr,
> -                               size_t nwsaddr,
> +                               SocketAddressList *saddr_list,
> +                               SocketAddressList *wsaddr_list,
>                                 Error **errp)
>  {
>      /* connect to viewer */
>      QIOChannelSocket *sioc =3D NULL;
> -    if (nwsaddr !=3D 0) {
> +    if (wsaddr_list) {
>          error_setg(errp, "Cannot use websockets in reverse mode");
>          return -1;
>      }
> -    if (nsaddr !=3D 1) {
> +    if (!saddr_list || saddr_list->next) {
>          error_setg(errp, "Expected a single address in reverse mode");
>          return -1;
>      }
>      /* TODO SOCKET_ADDRESS_TYPE_FD when fd has AF_UNIX */
> -    vd->is_unix =3D saddr[0]->type =3D=3D SOCKET_ADDRESS_TYPE_UNIX;
> +    vd->is_unix =3D saddr_list->value->type =3D=3D SOCKET_ADDRESS_TYPE_U=
NIX;
>      sioc =3D qio_channel_socket_new();
>      qio_channel_set_name(QIO_CHANNEL(sioc), "vnc-reverse");
> -    if (qio_channel_socket_connect_sync(sioc, saddr[0], errp) < 0) {
> +    if (qio_channel_socket_connect_sync(sioc, saddr_list->value, errp) <
> 0) {
>          object_unref(OBJECT(sioc));
>          return -1;
>      }
> @@ -3956,20 +3934,18 @@ static int vnc_display_connect(VncDisplay *vd,
>
>
>  static int vnc_display_listen(VncDisplay *vd,
> -                              SocketAddress **saddr,
> -                              size_t nsaddr,
> -                              SocketAddress **wsaddr,
> -                              size_t nwsaddr,
> +                              SocketAddressList *saddr_list,
> +                              SocketAddressList *wsaddr_list,
>                                Error **errp)
>  {
> -    size_t i;
> +    SocketAddressList *el;
>
> -    if (nsaddr) {
> +    if (saddr_list) {
>          vd->listener =3D qio_net_listener_new();
>          qio_net_listener_set_name(vd->listener, "vnc-listen");
> -        for (i =3D 0; i < nsaddr; i++) {
> +        for (el =3D saddr_list; el; el =3D el->next) {
>              if (qio_net_listener_open_sync(vd->listener,
> -                                           saddr[i], 1,
> +                                           el->value, 1,
>                                             errp) < 0)  {
>                  return -1;
>              }
> @@ -3979,12 +3955,12 @@ static int vnc_display_listen(VncDisplay *vd,
>                                           vnc_listen_io, vd, NULL);
>      }
>
> -    if (nwsaddr) {
> +    if (wsaddr_list) {
>          vd->wslistener =3D qio_net_listener_new();
>          qio_net_listener_set_name(vd->wslistener, "vnc-ws-listen");
> -        for (i =3D 0; i < nwsaddr; i++) {
> +        for (el =3D wsaddr_list; el; el =3D el->next) {
>              if (qio_net_listener_open_sync(vd->wslistener,
> -                                           wsaddr[i], 1,
> +                                           el->value, 1,
>                                             errp) < 0)  {
>                  return -1;
>              }
> @@ -4002,8 +3978,8 @@ void vnc_display_open(const char *id, Error **errp)
>  {
>      VncDisplay *vd =3D vnc_display_find(id);
>      QemuOpts *opts =3D qemu_opts_find(&qemu_vnc_opts, id);
> -    SocketAddress **saddr =3D NULL, **wsaddr =3D NULL;
> -    size_t nsaddr, nwsaddr;
> +    g_autoptr(SocketAddressList) saddr_list =3D NULL;
> +    g_autoptr(SocketAddressList) wsaddr_list =3D NULL;
>      const char *share, *device_id;
>      QemuConsole *con;
>      bool password =3D false;
> @@ -4028,8 +4004,8 @@ void vnc_display_open(const char *id, Error **errp)
>      }
>
>      reverse =3D qemu_opt_get_bool(opts, "reverse", false);
> -    if (vnc_display_get_addresses(opts, reverse, &saddr, &nsaddr,
> -                                  &wsaddr, &nwsaddr, errp) < 0) {
> +    if (vnc_display_get_addresses(opts, reverse, &saddr_list,
> &wsaddr_list,
> +                                  errp) < 0) {
>          goto fail;
>      }
>
> @@ -4211,16 +4187,16 @@ void vnc_display_open(const char *id, Error **err=
p)
>      }
>      qkbd_state_set_delay(vd->kbd, key_delay_ms);
>
> -    if (saddr =3D=3D NULL) {
> -        goto cleanup;
> +    if (saddr_list =3D=3D NULL) {
> +        return;
>      }
>
>      if (reverse) {
> -        if (vnc_display_connect(vd, saddr, nsaddr, wsaddr, nwsaddr, errp=
)
> < 0) {
> +        if (vnc_display_connect(vd, saddr_list, wsaddr_list, errp) < 0) =
{
>              goto fail;
>          }
>      } else {
> -        if (vnc_display_listen(vd, saddr, nsaddr, wsaddr, nwsaddr, errp)
> < 0) {
> +        if (vnc_display_listen(vd, saddr_list, wsaddr_list, errp) < 0) {
>              goto fail;
>          }
>      }
> @@ -4229,14 +4205,11 @@ void vnc_display_open(const char *id, Error **err=
p)
>          vnc_display_print_local_addr(vd);
>      }
>
> - cleanup:
> -    vnc_free_addresses(&saddr, &nsaddr);
> -    vnc_free_addresses(&wsaddr, &nwsaddr);
> +    /* Success */
>      return;
>
>  fail:
>      vnc_display_close(vd);
> -    goto cleanup;
>  }
>
>  void vnc_display_add_client(const char *id, int csock, bool skipauth)
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f9ae1f05d3a3586a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaTxicj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVv
dGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIERlYyAyMCwgMjAy
MSBhdCAxMDoyMSBQTSBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5ICZsdDs8YSBocmVmPSJt
YWlsdG86dnNlbWVudHNvdkB2aXJ0dW96em8uY29tIj52c2VtZW50c292QHZpcnR1b3p6by5jb208
L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkxldCYjMzk7cyB1c2UgU29ja2V0QWRkcmVz
c0xpc3QgaW5zdGVhZCBvZiBkeW5hbWljIGFycmF5cy48YnI+DQpCZW5lZml0czo8YnI+DQrCoC0g
QXV0b21hdGljIGNsZWFudXA6IGRvbiYjMzk7dCBuZWVkIHNwZWNpZmljIGZyZWVpbmcgZnVuY3Rp
b24gYW5kIGRyb3A8YnI+DQrCoCDCoHNvbWUgZ290b3MuPGJyPg0KwqAtIExlc3MgaW5kaXJlY3Rp
b246IG5vIHRyaXBsZSBhc3Rlcml4IGFueW1vcmUhPGJyPg0KwqAtIFByZXBhcmUgZm9yIHRoZSBm
b2xsb3dpbmcgY29tbWl0LCB3aGljaCB3aWxsIHJldXNlIG5ldyBpbnRlcmZhY2Ugb2Y8YnI+DQrC
oCDCoHZuY19kaXNwbGF5X2xpc3RlbigpLjxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IFZsYWRp
bWlyIFNlbWVudHNvdi1PZ2lldnNraXkgJmx0OzxhIGhyZWY9Im1haWx0bzp2c2VtZW50c292QHZp
cnR1b3p6by5jb20iIHRhcmdldD0iX2JsYW5rIj52c2VtZW50c292QHZpcnR1b3p6by5jb208L2E+
Jmd0Ozxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5OaWNlPC9kaXY+PGRpdj5S
ZXZpZXdlZC1ieTogTWFyYy1BbmRyw6kgTHVyZWF1ICZsdDs8YSBocmVmPSJtYWlsdG86bWFyY2Fu
ZHJlLmx1cmVhdUByZWRoYXQuY29tIj5tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb208L2E+Jmd0
OzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIw
NCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCi0tLTxicj4NCsKgdWkvdm5jLmMgfCAxMjkg
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxi
cj4NCsKgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDc4IGRlbGV0aW9ucygtKTxi
cj4NCjxicj4NCmRpZmYgLS1naXQgYS91aS92bmMuYyBiL3VpL3ZuYy5jPGJyPg0KaW5kZXggYWYw
MjUyMmU4NC4uYzllMjZjNzBkZiAxMDA2NDQ8YnI+DQotLS0gYS91aS92bmMuYzxicj4NCisrKyBi
L3VpL3ZuYy5jPGJyPg0KQEAgLTM4MTIsMzAgKzM4MTIsMTkgQEAgc3RhdGljIGludCB2bmNfZGlz
cGxheV9nZXRfYWRkcmVzcyhjb25zdCBjaGFyICphZGRyc3RyLDxicj4NCsKgIMKgIMKgcmV0dXJu
IHJldDs8YnI+DQrCoH08YnI+DQo8YnI+DQotc3RhdGljIHZvaWQgdm5jX2ZyZWVfYWRkcmVzc2Vz
KFNvY2tldEFkZHJlc3MgKioqcmV0c2FkZHIsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2l6ZV90ICpyZXRuc2FkZHIpPGJyPg0KLXs8YnI+DQot
wqAgwqAgc2l6ZV90IGk7PGJyPg0KLTxicj4NCi3CoCDCoCBmb3IgKGkgPSAwOyBpICZsdDsgKnJl
dG5zYWRkcjsgaSsrKSB7PGJyPg0KLcKgIMKgIMKgIMKgIHFhcGlfZnJlZV9Tb2NrZXRBZGRyZXNz
KCgqcmV0c2FkZHIpW2ldKTs8YnI+DQotwqAgwqAgfTxicj4NCi3CoCDCoCBnX2ZyZWUoKnJldHNh
ZGRyKTs8YnI+DQotPGJyPg0KLcKgIMKgICpyZXRzYWRkciA9IE5VTEw7PGJyPg0KLcKgIMKgICpy
ZXRuc2FkZHIgPSAwOzxicj4NCi19PGJyPg0KLTxicj4NCsKgc3RhdGljIGludCB2bmNfZGlzcGxh
eV9nZXRfYWRkcmVzc2VzKFFlbXVPcHRzICpvcHRzLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJvb2wgcmV2ZXJzZSw8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBT
b2NrZXRBZGRyZXNzICoqKnJldHNhZGRyLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNpemVfdCAqcmV0bnNhZGRyLDxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFNv
Y2tldEFkZHJlc3MgKioqcmV0d3NhZGRyLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNpemVfdCAqcmV0bndzYWRkciw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBT
b2NrZXRBZGRyZXNzTGlzdCAqKnNhZGRyX2xpc3RfcmV0LDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFNvY2tldEFkZHJlc3NMaXN0
ICoqd3NhZGRyX2xpc3RfcmV0LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEVycm9yICoqZXJycCk8YnI+DQrCoHs8YnI+DQrCoCDC
oCDCoFNvY2tldEFkZHJlc3MgKnNhZGRyID0gTlVMTDs8YnI+DQrCoCDCoCDCoFNvY2tldEFkZHJl
c3MgKndzYWRkciA9IE5VTEw7PGJyPg0KK8KgIMKgIGdfYXV0b3B0cihTb2NrZXRBZGRyZXNzTGlz
dCkgc2FkZHJfbGlzdCA9IE5VTEw7PGJyPg0KK8KgIMKgIFNvY2tldEFkZHJlc3NMaXN0ICoqc2Fk
ZHJfdGFpbCA9ICZhbXA7c2FkZHJfbGlzdDs8YnI+DQorwqAgwqAgU29ja2V0QWRkcmVzcyAqc2lu
Z2xlX3NhZGRyID0gTlVMTDs8YnI+DQorwqAgwqAgZ19hdXRvcHRyKFNvY2tldEFkZHJlc3NMaXN0
KSB3c2FkZHJfbGlzdCA9IE5VTEw7PGJyPg0KK8KgIMKgIFNvY2tldEFkZHJlc3NMaXN0ICoqd3Nh
ZGRyX3RhaWwgPSAmYW1wO3dzYWRkcl9saXN0Ozxicj4NCsKgIMKgIMKgUWVtdU9wdHNJdGVyIGFk
ZHJpdGVyOzxicj4NCsKgIMKgIMKgY29uc3QgY2hhciAqYWRkcjs8YnI+DQrCoCDCoCDCoGludCB0
byA9IHFlbXVfb3B0X2dldF9udW1iZXIob3B0cywgJnF1b3Q7dG8mcXVvdDssIDApOzxicj4NCkBA
IC0zODQ0LDIzICszODMzLDE2IEBAIHN0YXRpYyBpbnQgdm5jX2Rpc3BsYXlfZ2V0X2FkZHJlc3Nl
cyhRZW11T3B0cyAqb3B0cyw8YnI+DQrCoCDCoCDCoGJvb2wgaXB2NCA9IHFlbXVfb3B0X2dldF9i
b29sKG9wdHMsICZxdW90O2lwdjQmcXVvdDssIGZhbHNlKTs8YnI+DQrCoCDCoCDCoGJvb2wgaXB2
NiA9IHFlbXVfb3B0X2dldF9ib29sKG9wdHMsICZxdW90O2lwdjYmcXVvdDssIGZhbHNlKTs8YnI+
DQrCoCDCoCDCoGludCBkaXNwbGF5bnVtID0gLTE7PGJyPg0KLcKgIMKgIGludCByZXQgPSAtMTs8
YnI+DQotPGJyPg0KLcKgIMKgICpyZXRzYWRkciA9IE5VTEw7PGJyPg0KLcKgIMKgICpyZXRuc2Fk
ZHIgPSAwOzxicj4NCi3CoCDCoCAqcmV0d3NhZGRyID0gTlVMTDs8YnI+DQotwqAgwqAgKnJldG53
c2FkZHIgPSAwOzxicj4NCjxicj4NCsKgIMKgIMKgYWRkciA9IHFlbXVfb3B0X2dldChvcHRzLCAm
cXVvdDt2bmMmcXVvdDspOzxicj4NCsKgIMKgIMKgaWYgKGFkZHIgPT0gTlVMTCB8fCBnX3N0cl9l
cXVhbChhZGRyLCAmcXVvdDtub25lJnF1b3Q7KSkgezxicj4NCi3CoCDCoCDCoCDCoCByZXQgPSAw
Ozxicj4NCi3CoCDCoCDCoCDCoCBnb3RvIGNsZWFudXA7PGJyPg0KK8KgIMKgIMKgIMKgIHJldHVy
biAwOzxicj4NCsKgIMKgIMKgfTxicj4NCsKgIMKgIMKgaWYgKHFlbXVfb3B0X2dldChvcHRzLCAm
cXVvdDt3ZWJzb2NrZXQmcXVvdDspICZhbXA7JmFtcDs8YnI+DQrCoCDCoCDCoCDCoCDCoCFxY3J5
cHRvX2hhc2hfc3VwcG9ydHMoUUNSWVBUT19IQVNIX0FMR19TSEExKSkgezxicj4NCsKgIMKgIMKg
IMKgIMKgZXJyb3Jfc2V0ZyhlcnJwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICZxdW90O1NIQTEgaGFzaCBzdXBwb3J0IGlzIHJlcXVpcmVkIGZvciB3ZWJzb2NrZXRzJnF1b3Q7
KTs8YnI+DQotwqAgwqAgwqAgwqAgZ290byBjbGVhbnVwOzxicj4NCivCoCDCoCDCoCDCoCByZXR1
cm4gLTE7PGJyPg0KwqAgwqAgwqB9PGJyPg0KPGJyPg0KwqAgwqAgwqBxZW11X29wdF9pdGVyX2lu
aXQoJmFtcDthZGRyaXRlciwgb3B0cywgJnF1b3Q7dm5jJnF1b3Q7KTs8YnI+DQpAQCAtMzg3MSw3
ICszODUzLDcgQEAgc3RhdGljIGludCB2bmNfZGlzcGxheV9nZXRfYWRkcmVzc2VzKFFlbXVPcHRz
ICpvcHRzLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGlwdjQsIGlwdjYsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmFtcDtzYWRkciwgZXJycCk7PGJyPg0KwqAg
wqAgwqAgwqAgwqBpZiAocnYgJmx0OyAwKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIGdvdG8g
Y2xlYW51cDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIC0xOzxicj4NCsKgIMKgIMKg
IMKgIMKgfTxicj4NCsKgIMKgIMKgIMKgIMKgLyogSGlzdG9yaWNhbCBjb21wYXQgLSBmaXJzdCBs
aXN0ZW4gYWRkcmVzcyBjYW4gYmUgdXNlZDxicj4NCsKgIMKgIMKgIMKgIMKgICogdG8gc2V0IHRo
ZSBkZWZhdWx0IHdlYnNvY2tldCBwb3J0PGJyPg0KQEAgLTM4NzksMTMgKzM4NjEsMTYgQEAgc3Rh
dGljIGludCB2bmNfZGlzcGxheV9nZXRfYWRkcmVzc2VzKFFlbXVPcHRzICpvcHRzLDxicj4NCsKg
IMKgIMKgIMKgIMKgaWYgKGRpc3BsYXludW0gPT0gLTEpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoGRpc3BsYXludW0gPSBydjs8YnI+DQrCoCDCoCDCoCDCoCDCoH08YnI+DQotwqAgwqAgwqAg
wqAgKnJldHNhZGRyID0gZ19yZW5ldyhTb2NrZXRBZGRyZXNzICosICpyZXRzYWRkciwgKnJldG5z
YWRkciArIDEpOzxicj4NCi3CoCDCoCDCoCDCoCAoKnJldHNhZGRyKVsoKnJldG5zYWRkcikrK10g
PSBzYWRkcjs8YnI+DQorwqAgwqAgwqAgwqAgUUFQSV9MSVNUX0FQUEVORChzYWRkcl90YWlsLCBz
YWRkcik7PGJyPg0KwqAgwqAgwqB9PGJyPg0KPGJyPg0KLcKgIMKgIC8qIElmIHdlIGhhZCBtdWx0
aXBsZSBwcmltYXJ5IGRpc3BsYXlzLCB3ZSBkb24mIzM5O3QgZG8gZGVmYXVsdHM8YnI+DQotwqAg
wqAgwqAqIGZvciB3ZWJzb2NrZXQsIGFuZCByZXF1aXJlIGV4cGxpY2l0IGNvbmZpZyBpbnN0ZWFk
LiAqLzxicj4NCi3CoCDCoCBpZiAoKnJldG5zYWRkciAmZ3Q7IDEpIHs8YnI+DQorwqAgwqAgaWYg
KHNhZGRyX2xpc3QgJmFtcDsmYW1wOyAhc2FkZHJfbGlzdC0mZ3Q7bmV4dCkgezxicj4NCivCoCDC
oCDCoCDCoCBzaW5nbGVfc2FkZHIgPSBzYWRkcl9saXN0LSZndDt2YWx1ZTs8YnI+DQorwqAgwqAg
fSBlbHNlIHs8YnI+DQorwqAgwqAgwqAgwqAgLyo8YnI+DQorwqAgwqAgwqAgwqAgwqAqIElmIHdl
IGhhZCBtdWx0aXBsZSBwcmltYXJ5IGRpc3BsYXlzLCB3ZSBkb24mIzM5O3QgZG8gZGVmYXVsdHM8
YnI+DQorwqAgwqAgwqAgwqAgwqAqIGZvciB3ZWJzb2NrZXQsIGFuZCByZXF1aXJlIGV4cGxpY2l0
IGNvbmZpZyBpbnN0ZWFkLjxicj4NCivCoCDCoCDCoCDCoCDCoCovPGJyPg0KwqAgwqAgwqAgwqAg
wqBkaXNwbGF5bnVtID0gLTE7PGJyPg0KwqAgwqAgwqB9PGJyPg0KPGJyPg0KQEAgLTM4OTUsNTcg
KzM4ODAsNTAgQEAgc3RhdGljIGludCB2bmNfZGlzcGxheV9nZXRfYWRkcmVzc2VzKFFlbXVPcHRz
ICpvcHRzLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaGFzX2lwdjQsIGhhc19pcHY2LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaXB2NCwgaXB2Niw8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZhbXA7
d3NhZGRyLCBlcnJwKSAmbHQ7IDApIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgZ290byBjbGVh
bnVwOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLTE7PGJyPg0KwqAgwqAgwqAgwqAg
wqB9PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAvKiBIaXN0b3JpY2FsIGNvbXBhdCAtIGlmIG9u
bHkgYSBzaW5nbGUgbGlzdGVuIGFkZHJlc3Mgd2FzPGJyPg0KwqAgwqAgwqAgwqAgwqAgKiBwcm92
aWRlZCwgdGhlbiB0aGlzIGlzIHVzZWQgdG8gc2V0IHRoZSBkZWZhdWx0IGxpc3Rlbjxicj4NCsKg
IMKgIMKgIMKgIMKgICogYWRkcmVzcyBmb3Igd2Vic29ja2V0IHRvbzxicj4NCsKgIMKgIMKgIMKg
IMKgICovPGJyPg0KLcKgIMKgIMKgIMKgIGlmICgqcmV0bnNhZGRyID09IDEgJmFtcDsmYW1wOzxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCAoKnJldHNhZGRyKVswXS0mZ3Q7dHlwZSA9PSBTT0NLRVRf
QUREUkVTU19UWVBFX0lORVQgJmFtcDsmYW1wOzxicj4NCivCoCDCoCDCoCDCoCBpZiAoc2luZ2xl
X3NhZGRyICZhbXA7JmFtcDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgc2luZ2xlX3NhZGRyLSZn
dDt0eXBlID09IFNPQ0tFVF9BRERSRVNTX1RZUEVfSU5FVCAmYW1wOyZhbXA7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqB3c2FkZHItJmd0O3R5cGUgPT0gU09DS0VUX0FERFJFU1NfVFlQRV9JTkVU
ICZhbXA7JmFtcDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoGdfc3RyX2VxdWFsKHdzYWRkci0m
Z3Q7dS5pbmV0Lmhvc3QsICZxdW90OyZxdW90OykgJmFtcDsmYW1wOzxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCAhZ19zdHJfZXF1YWwoKCpyZXRzYWRkcilbMF0tJmd0O3UuaW5ldC5ob3N0LCAmcXVv
dDsmcXVvdDspKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgICFnX3N0cl9lcXVhbChzaW5nbGVf
c2FkZHItJmd0O3UuaW5ldC5ob3N0LCAmcXVvdDsmcXVvdDspKSB7PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqBnX2ZyZWUod3NhZGRyLSZndDt1LmluZXQuaG9zdCk7PGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIHdzYWRkci0mZ3Q7dS5pbmV0Lmhvc3QgPSBnX3N0cmR1cCgoKnJldHNhZGRyKVswXS0m
Z3Q7dS5pbmV0Lmhvc3QpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCB3c2FkZHItJmd0O3UuaW5l
dC5ob3N0ID0gZ19zdHJkdXAoc2luZ2xlX3NhZGRyLSZndDt1LmluZXQuaG9zdCk7PGJyPg0KwqAg
wqAgwqAgwqAgwqB9PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgICpyZXR3c2FkZHIgPSBnX3JlbmV3
KFNvY2tldEFkZHJlc3MgKiwgKnJldHdzYWRkciwgKnJldG53c2FkZHIgKyAxKTs8YnI+DQotwqAg
wqAgwqAgwqAgKCpyZXR3c2FkZHIpWygqcmV0bndzYWRkcikrK10gPSB3c2FkZHI7PGJyPg0KK8Kg
IMKgIMKgIMKgIFFBUElfTElTVF9BUFBFTkQod3NhZGRyX3RhaWwsIHdzYWRkcik7PGJyPg0KwqAg
wqAgwqB9PGJyPg0KPGJyPg0KLcKgIMKgIHJldCA9IDA7PGJyPg0KLSBjbGVhbnVwOjxicj4NCi3C
oCDCoCBpZiAocmV0ICZsdDsgMCkgezxicj4NCi3CoCDCoCDCoCDCoCB2bmNfZnJlZV9hZGRyZXNz
ZXMocmV0c2FkZHIsIHJldG5zYWRkcik7PGJyPg0KLcKgIMKgIMKgIMKgIHZuY19mcmVlX2FkZHJl
c3NlcyhyZXR3c2FkZHIsIHJldG53c2FkZHIpOzxicj4NCi3CoCDCoCB9PGJyPg0KLcKgIMKgIHJl
dHVybiByZXQ7PGJyPg0KK8KgIMKgICpzYWRkcl9saXN0X3JldCA9IGdfc3RlYWxfcG9pbnRlcigm
YW1wO3NhZGRyX2xpc3QpOzxicj4NCivCoCDCoCAqd3NhZGRyX2xpc3RfcmV0ID0gZ19zdGVhbF9w
b2ludGVyKCZhbXA7d3NhZGRyX2xpc3QpOzxicj4NCivCoCDCoCByZXR1cm4gMDs8YnI+DQrCoH08
YnI+DQo8YnI+DQrCoHN0YXRpYyBpbnQgdm5jX2Rpc3BsYXlfY29ubmVjdChWbmNEaXNwbGF5ICp2
ZCw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBT
b2NrZXRBZGRyZXNzICoqc2FkZHIsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc2l6ZV90IG5zYWRkciw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTb2NrZXRBZGRyZXNzICoqd3NhZGRyLDxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNpemVfdCBu
d3NhZGRyLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFNvY2tldEFkZHJlc3NMaXN0ICpzYWRkcl9saXN0LDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFNvY2tldEFkZHJlc3NMaXN0ICp3c2FkZHJf
bGlzdCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBFcnJvciAqKmVycnApPGJyPg0KwqB7PGJyPg0KwqAgwqAgwqAvKiBjb25uZWN0IHRvIHZpZXdl
ciAqLzxicj4NCsKgIMKgIMKgUUlPQ2hhbm5lbFNvY2tldCAqc2lvYyA9IE5VTEw7PGJyPg0KLcKg
IMKgIGlmIChud3NhZGRyICE9IDApIHs8YnI+DQorwqAgwqAgaWYgKHdzYWRkcl9saXN0KSB7PGJy
Pg0KwqAgwqAgwqAgwqAgwqBlcnJvcl9zZXRnKGVycnAsICZxdW90O0Nhbm5vdCB1c2Ugd2Vic29j
a2V0cyBpbiByZXZlcnNlIG1vZGUmcXVvdDspOzxicj4NCsKgIMKgIMKgIMKgIMKgcmV0dXJuIC0x
Ozxicj4NCsKgIMKgIMKgfTxicj4NCi3CoCDCoCBpZiAobnNhZGRyICE9IDEpIHs8YnI+DQorwqAg
wqAgaWYgKCFzYWRkcl9saXN0IHx8IHNhZGRyX2xpc3QtJmd0O25leHQpIHs8YnI+DQrCoCDCoCDC
oCDCoCDCoGVycm9yX3NldGcoZXJycCwgJnF1b3Q7RXhwZWN0ZWQgYSBzaW5nbGUgYWRkcmVzcyBp
biByZXZlcnNlIG1vZGUmcXVvdDspOzxicj4NCsKgIMKgIMKgIMKgIMKgcmV0dXJuIC0xOzxicj4N
CsKgIMKgIMKgfTxicj4NCsKgIMKgIMKgLyogVE9ETyBTT0NLRVRfQUREUkVTU19UWVBFX0ZEIHdo
ZW4gZmQgaGFzIEFGX1VOSVggKi88YnI+DQotwqAgwqAgdmQtJmd0O2lzX3VuaXggPSBzYWRkclsw
XS0mZ3Q7dHlwZSA9PSBTT0NLRVRfQUREUkVTU19UWVBFX1VOSVg7PGJyPg0KK8KgIMKgIHZkLSZn
dDtpc191bml4ID0gc2FkZHJfbGlzdC0mZ3Q7dmFsdWUtJmd0O3R5cGUgPT0gU09DS0VUX0FERFJF
U1NfVFlQRV9VTklYOzxicj4NCsKgIMKgIMKgc2lvYyA9IHFpb19jaGFubmVsX3NvY2tldF9uZXco
KTs8YnI+DQrCoCDCoCDCoHFpb19jaGFubmVsX3NldF9uYW1lKFFJT19DSEFOTkVMKHNpb2MpLCAm
cXVvdDt2bmMtcmV2ZXJzZSZxdW90Oyk7PGJyPg0KLcKgIMKgIGlmIChxaW9fY2hhbm5lbF9zb2Nr
ZXRfY29ubmVjdF9zeW5jKHNpb2MsIHNhZGRyWzBdLCBlcnJwKSAmbHQ7IDApIHs8YnI+DQorwqAg
wqAgaWYgKHFpb19jaGFubmVsX3NvY2tldF9jb25uZWN0X3N5bmMoc2lvYywgc2FkZHJfbGlzdC0m
Z3Q7dmFsdWUsIGVycnApICZsdDsgMCkgezxicj4NCsKgIMKgIMKgIMKgIMKgb2JqZWN0X3VucmVm
KE9CSkVDVChzaW9jKSk7PGJyPg0KwqAgwqAgwqAgwqAgwqByZXR1cm4gLTE7PGJyPg0KwqAgwqAg
wqB9PGJyPg0KQEAgLTM5NTYsMjAgKzM5MzQsMTggQEAgc3RhdGljIGludCB2bmNfZGlzcGxheV9j
b25uZWN0KFZuY0Rpc3BsYXkgKnZkLDxicj4NCjxicj4NCjxicj4NCsKgc3RhdGljIGludCB2bmNf
ZGlzcGxheV9saXN0ZW4oVm5jRGlzcGxheSAqdmQsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFNvY2tldEFkZHJlc3MgKipzYWRkciw8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2l6ZV90IG5zYWRkciw8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgU29ja2V0
QWRkcmVzcyAqKndzYWRkciw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgc2l6ZV90IG53c2FkZHIsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIFNvY2tldEFkZHJlc3NMaXN0ICpzYWRkcl9saXN0LDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBTb2NrZXRBZGRy
ZXNzTGlzdCAqd3NhZGRyX2xpc3QsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBFcnJvciAqKmVycnApPGJyPg0KwqB7PGJyPg0KLcKgIMKgIHNpemVf
dCBpOzxicj4NCivCoCDCoCBTb2NrZXRBZGRyZXNzTGlzdCAqZWw7PGJyPg0KPGJyPg0KLcKgIMKg
IGlmIChuc2FkZHIpIHs8YnI+DQorwqAgwqAgaWYgKHNhZGRyX2xpc3QpIHs8YnI+DQrCoCDCoCDC
oCDCoCDCoHZkLSZndDtsaXN0ZW5lciA9IHFpb19uZXRfbGlzdGVuZXJfbmV3KCk7PGJyPg0KwqAg
wqAgwqAgwqAgwqBxaW9fbmV0X2xpc3RlbmVyX3NldF9uYW1lKHZkLSZndDtsaXN0ZW5lciwgJnF1
b3Q7dm5jLWxpc3RlbiZxdW90Oyk7PGJyPg0KLcKgIMKgIMKgIMKgIGZvciAoaSA9IDA7IGkgJmx0
OyBuc2FkZHI7IGkrKykgezxicj4NCivCoCDCoCDCoCDCoCBmb3IgKGVsID0gc2FkZHJfbGlzdDsg
ZWw7IGVsID0gZWwtJmd0O25leHQpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChxaW9f
bmV0X2xpc3RlbmVyX29wZW5fc3luYyh2ZC0mZ3Q7bGlzdGVuZXIsPGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2Fk
ZHJbaV0sIDEsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZWwtJmd0O3ZhbHVlLCAxLDxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVy
cnApICZsdDsgMCnCoCB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLTE7
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KQEAgLTM5NzksMTIgKzM5NTUsMTIgQEAg
c3RhdGljIGludCB2bmNfZGlzcGxheV9saXN0ZW4oVm5jRGlzcGxheSAqdmQsPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
dm5jX2xpc3Rlbl9pbywgdmQsIE5VTEwpOzxicj4NCsKgIMKgIMKgfTxicj4NCjxicj4NCi3CoCDC
oCBpZiAobndzYWRkcikgezxicj4NCivCoCDCoCBpZiAod3NhZGRyX2xpc3QpIHs8YnI+DQrCoCDC
oCDCoCDCoCDCoHZkLSZndDt3c2xpc3RlbmVyID0gcWlvX25ldF9saXN0ZW5lcl9uZXcoKTs8YnI+
DQrCoCDCoCDCoCDCoCDCoHFpb19uZXRfbGlzdGVuZXJfc2V0X25hbWUodmQtJmd0O3dzbGlzdGVu
ZXIsICZxdW90O3ZuYy13cy1saXN0ZW4mcXVvdDspOzxicj4NCi3CoCDCoCDCoCDCoCBmb3IgKGkg
PSAwOyBpICZsdDsgbndzYWRkcjsgaSsrKSB7PGJyPg0KK8KgIMKgIMKgIMKgIGZvciAoZWwgPSB3
c2FkZHJfbGlzdDsgZWw7IGVsID0gZWwtJmd0O25leHQpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmIChxaW9fbmV0X2xpc3RlbmVyX29wZW5fc3luYyh2ZC0mZ3Q7d3NsaXN0ZW5lciw8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB3c2FkZHJbaV0sIDEsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZWwtJmd0O3ZhbHVlLCAxLDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGVycnApICZsdDsgMCnCoCB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZXR1cm4gLTE7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KQEAgLTQwMDIs
OCArMzk3OCw4IEBAIHZvaWQgdm5jX2Rpc3BsYXlfb3Blbihjb25zdCBjaGFyICppZCwgRXJyb3Ig
KiplcnJwKTxicj4NCsKgezxicj4NCsKgIMKgIMKgVm5jRGlzcGxheSAqdmQgPSB2bmNfZGlzcGxh
eV9maW5kKGlkKTs8YnI+DQrCoCDCoCDCoFFlbXVPcHRzICpvcHRzID0gcWVtdV9vcHRzX2ZpbmQo
JmFtcDtxZW11X3ZuY19vcHRzLCBpZCk7PGJyPg0KLcKgIMKgIFNvY2tldEFkZHJlc3MgKipzYWRk
ciA9IE5VTEwsICoqd3NhZGRyID0gTlVMTDs8YnI+DQotwqAgwqAgc2l6ZV90IG5zYWRkciwgbndz
YWRkcjs8YnI+DQorwqAgwqAgZ19hdXRvcHRyKFNvY2tldEFkZHJlc3NMaXN0KSBzYWRkcl9saXN0
ID0gTlVMTDs8YnI+DQorwqAgwqAgZ19hdXRvcHRyKFNvY2tldEFkZHJlc3NMaXN0KSB3c2FkZHJf
bGlzdCA9IE5VTEw7PGJyPg0KwqAgwqAgwqBjb25zdCBjaGFyICpzaGFyZSwgKmRldmljZV9pZDs8
YnI+DQrCoCDCoCDCoFFlbXVDb25zb2xlICpjb247PGJyPg0KwqAgwqAgwqBib29sIHBhc3N3b3Jk
ID0gZmFsc2U7PGJyPg0KQEAgLTQwMjgsOCArNDAwNCw4IEBAIHZvaWQgdm5jX2Rpc3BsYXlfb3Bl
bihjb25zdCBjaGFyICppZCwgRXJyb3IgKiplcnJwKTxicj4NCsKgIMKgIMKgfTxicj4NCjxicj4N
CsKgIMKgIMKgcmV2ZXJzZSA9IHFlbXVfb3B0X2dldF9ib29sKG9wdHMsICZxdW90O3JldmVyc2Um
cXVvdDssIGZhbHNlKTs8YnI+DQotwqAgwqAgaWYgKHZuY19kaXNwbGF5X2dldF9hZGRyZXNzZXMo
b3B0cywgcmV2ZXJzZSwgJmFtcDtzYWRkciwgJmFtcDtuc2FkZHIsPGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZhbXA7d3NhZGRyLCAmYW1w
O253c2FkZHIsIGVycnApICZsdDsgMCkgezxicj4NCivCoCDCoCBpZiAodm5jX2Rpc3BsYXlfZ2V0
X2FkZHJlc3NlcyhvcHRzLCByZXZlcnNlLCAmYW1wO3NhZGRyX2xpc3QsICZhbXA7d3NhZGRyX2xp
c3QsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGVycnApICZsdDsgMCkgezxicj4NCsKgIMKgIMKgIMKgIMKgZ290byBmYWlsOzxicj4NCsKg
IMKgIMKgfTxicj4NCjxicj4NCkBAIC00MjExLDE2ICs0MTg3LDE2IEBAIHZvaWQgdm5jX2Rpc3Bs
YXlfb3Blbihjb25zdCBjaGFyICppZCwgRXJyb3IgKiplcnJwKTxicj4NCsKgIMKgIMKgfTxicj4N
CsKgIMKgIMKgcWtiZF9zdGF0ZV9zZXRfZGVsYXkodmQtJmd0O2tiZCwga2V5X2RlbGF5X21zKTs8
YnI+DQo8YnI+DQotwqAgwqAgaWYgKHNhZGRyID09IE5VTEwpIHs8YnI+DQotwqAgwqAgwqAgwqAg
Z290byBjbGVhbnVwOzxicj4NCivCoCDCoCBpZiAoc2FkZHJfbGlzdCA9PSBOVUxMKSB7PGJyPg0K
K8KgIMKgIMKgIMKgIHJldHVybjs8YnI+DQrCoCDCoCDCoH08YnI+DQo8YnI+DQrCoCDCoCDCoGlm
IChyZXZlcnNlKSB7PGJyPg0KLcKgIMKgIMKgIMKgIGlmICh2bmNfZGlzcGxheV9jb25uZWN0KHZk
LCBzYWRkciwgbnNhZGRyLCB3c2FkZHIsIG53c2FkZHIsIGVycnApICZsdDsgMCkgezxicj4NCivC
oCDCoCDCoCDCoCBpZiAodm5jX2Rpc3BsYXlfY29ubmVjdCh2ZCwgc2FkZHJfbGlzdCwgd3NhZGRy
X2xpc3QsIGVycnApICZsdDsgMCkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBmYWls
Ozxicj4NCsKgIMKgIMKgIMKgIMKgfTxicj4NCsKgIMKgIMKgfSBlbHNlIHs8YnI+DQotwqAgwqAg
wqAgwqAgaWYgKHZuY19kaXNwbGF5X2xpc3Rlbih2ZCwgc2FkZHIsIG5zYWRkciwgd3NhZGRyLCBu
d3NhZGRyLCBlcnJwKSAmbHQ7IDApIHs8YnI+DQorwqAgwqAgwqAgwqAgaWYgKHZuY19kaXNwbGF5
X2xpc3Rlbih2ZCwgc2FkZHJfbGlzdCwgd3NhZGRyX2xpc3QsIGVycnApICZsdDsgMCkgezxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBmYWlsOzxicj4NCsKgIMKgIMKgIMKgIMKgfTxicj4N
CsKgIMKgIMKgfTxicj4NCkBAIC00MjI5LDE0ICs0MjA1LDExIEBAIHZvaWQgdm5jX2Rpc3BsYXlf
b3Blbihjb25zdCBjaGFyICppZCwgRXJyb3IgKiplcnJwKTxicj4NCsKgIMKgIMKgIMKgIMKgdm5j
X2Rpc3BsYXlfcHJpbnRfbG9jYWxfYWRkcih2ZCk7PGJyPg0KwqAgwqAgwqB9PGJyPg0KPGJyPg0K
LSBjbGVhbnVwOjxicj4NCi3CoCDCoCB2bmNfZnJlZV9hZGRyZXNzZXMoJmFtcDtzYWRkciwgJmFt
cDtuc2FkZHIpOzxicj4NCi3CoCDCoCB2bmNfZnJlZV9hZGRyZXNzZXMoJmFtcDt3c2FkZHIsICZh
bXA7bndzYWRkcik7PGJyPg0KK8KgIMKgIC8qIFN1Y2Nlc3MgKi88YnI+DQrCoCDCoCDCoHJldHVy
bjs8YnI+DQo8YnI+DQrCoGZhaWw6PGJyPg0KwqAgwqAgwqB2bmNfZGlzcGxheV9jbG9zZSh2ZCk7
PGJyPg0KLcKgIMKgIGdvdG8gY2xlYW51cDs8YnI+DQrCoH08YnI+DQo8YnI+DQrCoHZvaWQgdm5j
X2Rpc3BsYXlfYWRkX2NsaWVudChjb25zdCBjaGFyICppZCwgaW50IGNzb2NrLCBib29sIHNraXBh
dXRoKTxicj4NCi0tIDxicj4NCjIuMzEuMTxicj4NCjxicj4NCjxicj4NCjwvYmxvY2txdW90ZT48
L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGJyPi0tIDxicj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21h
aWxfc2lnbmF0dXJlIj5NYXJjLUFuZHLDqSBMdXJlYXU8YnI+PC9kaXY+PC9kaXY+DQo=
--000000000000f9ae1f05d3a3586a--

