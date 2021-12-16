Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F14F476E75
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:01:16 +0100 (CET)
Received: from localhost ([::1]:35684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnZb-0002dF-Jd
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:01:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxnXQ-000198-O1
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:59:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxnXP-00043a-Af
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639648738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yzAtiaT8w4gdjWnUg55dJZqKKQYGm0eRxgrWFg9omQ=;
 b=bU2kNKfPpBQ9Wcay52Kq1PGs7KbP0lEjtAzk5nSpa29/kWX55a6XrcEagnqm1a8P8TkqBH
 /5dbBYAV6m2Q8kY1zrQGoOlaQjQMKErYw4YB2Gv5mU+AMBw7sgbSLMTo2VDIiiBZuJ6w6g
 ktA3kuMGOdCsKzp7kprzDxkPOOxtZ6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-kOTvo5YtPoCu8gIJykGaRg-1; Thu, 16 Dec 2021 04:58:55 -0500
X-MC-Unique: kOTvo5YtPoCu8gIJykGaRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC572640A2;
 Thu, 16 Dec 2021 09:58:53 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69D5B2BCC1;
 Thu, 16 Dec 2021 09:58:53 +0000 (UTC)
Date: Thu, 16 Dec 2021 09:58:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 04/14] vfio-user: define vfio-user-server object
Message-ID: <YbsN3CLL827zMvna@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <22b0d82a54d53043323bda2ae0b409fb54cbf007.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <22b0d82a54d53043323bda2ae0b409fb54cbf007.1639549843.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="61eaI58N975nrzLp"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 bleal@redhat.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--61eaI58N975nrzLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 15, 2021 at 10:35:28AM -0500, Jagannathan Raman wrote:
> +static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
> +                                  void *opaque, Error **errp)
> +{
> +    VfuObject *o = VFU_OBJECT(obj);
> +
> +    qapi_free_SocketAddress(o->socket);
> +
> +    o->socket = NULL;
> +
> +    visit_type_SocketAddress(v, name, &o->socket, errp);
> +
> +    if (o->socket->type != SOCKET_ADDRESS_TYPE_UNIX) {
> +        qapi_free_SocketAddress(o->socket);
> +        o->socket = NULL;
> +        error_setg(errp, "vfu: Unsupported socket type - %s",
> +                   o->socket->u.q_unix.path);
> +        return;
> +    }
> +
> +    trace_vfu_prop("socket", o->socket->u.q_unix.path);
> +}
> +
> +static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
> +{
> +    VfuObject *o = VFU_OBJECT(obj);
> +
> +    g_free(o->device);
> +
> +    o->device = g_strdup(str);
> +
> +    trace_vfu_prop("device", str);
> +}

It appears "socket" and "device" can be changed after the
vfio-user server has started. In the best case it just means the
properties contain values that do not reflect the actual socket/device
currently in use, which is confusing.

It's safer to refuse changing these properties once the vfio-user
server has started.

Stefan

--61eaI58N975nrzLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7DdwACgkQnKSrs4Gr
c8jM6Af/fhM/f4wKvyAnvrviVPd8xJnM8kQu53ExDJo892p73176qSD3XdLzCVtm
DKtwzGo1eXsvztiBhmtZ7EOy+GR7nwFPZQpfv5y+sskLRz4iGoNjmoN3ezaXNc/d
8dNprurWVLuF7DExER5ZGiyFm3n1T6KTJLHBEcfbetpTYtdAMabjRbAtu1vEmDrT
c67jYkMmodmPH597a+miDNZxJhV4mbFCJb8JsYvLGu5bbM10P8dYOLNx8ygg95lP
IeVQaYB4SQEz+Jdp+6SmsV3mGZ2upCCAO1/PX03yCx5MKfD4p2ZgDNx9EgjTKsJ8
kBBOTVSbH5FpPSjhOdBrzxLUbeZKbw==
=FYXM
-----END PGP SIGNATURE-----

--61eaI58N975nrzLp--


