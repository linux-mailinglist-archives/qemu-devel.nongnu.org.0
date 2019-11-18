Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393B1009D8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 17:57:42 +0100 (CET)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWkLM-0007ZM-OR
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 11:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iWkIq-0005Q7-Au
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:55:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iWkIo-0006eJ-Kv
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:55:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24063
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iWkIM-0006OC-BW
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574096072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5LPa6o5UzWJBsxQP0X3O/kdN8KWxDiK92E+o3UYD0qU=;
 b=RJOVKq1qeaDbR8bUaYddAVCH5yiAjkGI6zOzj521NPxrp1xdMSCe/CJuYK6KtmHqeVZHWF
 euezRMtn61rlF5hTWJ9HBXTysKwE7Q7vxnSz5qhniaBVc70BinkadrdZG+TG75kXIBcyF0
 ch5RbpPViCncERbN0tGjTyY39UVLbTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-HckrQ3gINyabPykNzjeW6Q-1; Mon, 18 Nov 2019 11:54:29 -0500
X-MC-Unique: HckrQ3gINyabPykNzjeW6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0FB68F3C85;
 Mon, 18 Nov 2019 16:54:27 +0000 (UTC)
Received: from localhost (unknown [10.36.118.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 854545D9C9;
 Mon, 18 Nov 2019 16:54:27 +0000 (UTC)
Date: Mon, 18 Nov 2019 16:54:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Micky Yun Chan <chanmickyyun@gmail.com>
Subject: Re: [PATCH v2] Implement backend program convention command for
 vhost-user-blk
Message-ID: <20191118165426.GB65432@stefanha-x1.localdomain>
References: <20191118064519.16072-1-michan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191118064519.16072-1-michan@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: michan <michan@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 02:45:19PM +0800, Micky Yun Chan wrote:
> +    context = g_option_context_new(NULL);
> +    g_option_context_add_main_entries(context, entries, NULL);
> +    if (!g_option_context_parse(context, &argc, &argv, &error)) {
> +        g_printerr("Option parsing failed: %s\n", error->message);
> +        exit(EXIT_FAILURE);
> +    }
> +    if (opt_print_caps) {
> +        g_option_context_get_help(context, true, NULL);

Where did the JSON from the previous patch go?

> +        exit(EXIT_SUCCESS);
> +    }
> +
> +    if (!opt_blk_file) {
> +        g_option_context_get_help(context, true, NULL);

Please check the documentation for this function:
https://developer.gnome.org/glib/stable/glib-Commandline-option-parser.html#g-option-context-get-help

It returns a newly allocated string and does not print it.

> +        exit(EXIT_FAILURE);
> +    }
> +
> +    if (opt_socket_path) {
> +        lsock = unix_sock_new(opt_socket_path);
> +        if (lsock < 0) {
> +           exit(EXIT_FAILURE);
>          }
> +    } else if(opt_fdnum < 0){
> +        g_option_context_get_help(context, true, NULL);

Same here.

exit(EXIT_FAILURE) is missing.

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3SzMIACgkQnKSrs4Gr
c8hyfgf/SLkve0jpAe7LCBIzt9j5dQpsP7etQ2iL2mxuHD2CGesaJYxn4JFTBQYj
Kw3oojYcDUOl/3q8lA6HCI7o0AGM2Phj4AbFwaNdcKx+uWY5t8L/eecyES7aAqdh
tacRA4+EhO39vuLZq06KfBba7aLOAxG7PQdFV/jX03zMt6o+HIFzwAuiE7CQ3y06
fON1wDpnL4a3BVBAZdEqqlnqeR84mE1EiOpfGlf/fizDw/YtjZX279i0XRyXARlG
khTTSVowlTgYyO1fKFjoVR+uCjtJ1sy/3KbLYO2fJ/ZxlgS+0lFShZmiH8CT5rH4
mU2xDYWHF9AVLkYu0BqgtlDa0AHJpA==
=rm6B
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--


