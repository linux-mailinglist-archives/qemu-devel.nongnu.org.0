Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0928286126
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 16:23:54 +0200 (CEST)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQAMD-0007rn-Cu
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 10:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kQALA-0007K1-TZ
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 10:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kQAL7-0002tL-Er
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 10:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602080563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lcXeQmTT5+A8VWHzD4fc4ICOX8t7yi2cYqFm3LNIR8A=;
 b=M7NOpvrjt/q6cTbIKReETArPl4RNNNY99iSU8Oc4PcW6PLYN/CGmSgTUAcJ+YtV7NZBhnr
 s69Mvbs+EhYk9T5u7tHK2UF9JtifUWeummf6q6kTyI5jPrt/v8I6NQLptCI1UKWsUGg8O1
 kQ6cwGz/kZYH8NhXH+mOazu2WZD6v5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-Qt14pmczM3OQWvor7jnSXg-1; Wed, 07 Oct 2020 10:22:40 -0400
X-MC-Unique: Qt14pmczM3OQWvor7jnSXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0912E108598D;
 Wed,  7 Oct 2020 14:22:30 +0000 (UTC)
Received: from localhost (ovpn-115-47.ams2.redhat.com [10.36.115.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2210E19930;
 Wed,  7 Oct 2020 14:22:28 +0000 (UTC)
Date: Wed, 7 Oct 2020 15:22:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: elena.ufimtseva@oracle.com
Subject: Re: [PATCH v10 06/19] multi-process: define MPQemuMsg format and
 transmission functions
Message-ID: <20201007142228.GA113587@stefanha-x1.localdomain>
References: <cover.1601923020.git.elena.ufimtseva@oracle.com>
 <45fd2f984d994d70b5d1780ac39ca2c03dcc10bf.1601923020.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <45fd2f984d994d70b5d1780ac39ca2c03dcc10bf.1601923020.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, thuth@redhat.com, ehabkost@redhat.com,
 konrad.wilk@oracle.com, dgilbert@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2020 at 11:50:54AM -0700, elena.ufimtseva@oracle.com wrote:
> +void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
> +{
> +    Error *local_err = NULL;
> +    int *fds = NULL;
> +    size_t nfds = 0;
> +    ssize_t len;
> +
> +    len = mpqemu_read(ioc, (void *)msg, MPQEMU_MSG_HDR_SIZE, &fds, &nfds,
> +                      &local_err);
> +    if (!local_err) {
> +        if (len == -EIO) {
> +            error_setg(&local_err, "Connection closed.");
> +            goto fail;
> +        }
> +        if (len < 0) {
> +            error_setg(&local_err, "Message length is less than 0");
> +            goto fail;
> +        }
> +        if (len != MPQEMU_MSG_HDR_SIZE) {
> +            error_setg(&local_err, "Message header corrupted");
> +            goto fail;
> +        }
> +    } else {
> +        goto fail;
> +    }
> +
> +    if (msg->size > sizeof(msg->data)) {
> +        error_setg(&local_err, "Invalid size for message");
> +        goto fail;
> +    }
> +
> +    if (mpqemu_read(ioc, (void *)&msg->data, msg->size, NULL, NULL,
> +                    &local_err) < 0) {
> +        goto fail;
> +    }
> +
> +    msg->num_fds = nfds;
> +    if (nfds) {
> +        memcpy(msg->fds, fds, nfds * sizeof(int));

msg->fds buffer overflow if nfds > G_N_ELEMENTS(msg->fds).

> +    }
> +
> +fail:

The fd[] array is leaked.

The file descriptors themselves are leaked on error, too.

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl99zyQACgkQnKSrs4Gr
c8gOUwf+MJ7Lu4WWRcMvwrKhOcBYXIdiRjvEEwL8nA+4cduy0kpjvbw5Gemf9Ol4
e9bAXb/9gc/PJ+AFKhGTpBDHVP9pWvZEAcG/7GypKsVXbLE470pPTYzKGLMtIr9Y
29exMHm3QSSqOv05UcYa3D07+afev+1GwCXBhcmjLliUUYIGgB7bsUgkagTozEb1
6cs9GcGcVWIPB6dyTZMBNlydCgO9TdidITwFnw6UFf4nFVPfWgdeW+YqLTGCxH8s
PodiPXs3oWId3TOt7SZNoU+U6Ko72pKwzX8DUHKxkUgaBZIdWqf5TSvk7Vpo1Ffc
O+vcZ9qrJa9xAnKqVDHAHk7QSUrvSQ==
=l2cn
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--


