Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A611542534A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:39:22 +0200 (CEST)
Received: from localhost ([::1]:33934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSgD-0003Hu-7B
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mYSdq-0001LU-NX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mYSdl-0005aF-Mt
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633610207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CcGPGpziD5kNKYViwUUcx3zPLGr+VsoJRPJNDVh11k=;
 b=I0CwSKje2Bc0+5PJ+NGQIcaMw9fHE+vIsFpOxI3Ynz4oLEN/L+idestB76oBNW6HnH2n8Y
 Aum4K9jMRaOl+3i4TvQDV/EWBF6OjO7Veih0953tPEzvYOmgR1Hilfry2kJ5pEskUkUipr
 4HvC46r/nXSstgIsFDGxZpPiYy+Yg38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-YqoWThQxPleA_VD6hJtH7w-1; Thu, 07 Oct 2021 08:36:46 -0400
X-MC-Unique: YqoWThQxPleA_VD6hJtH7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5763101F001;
 Thu,  7 Oct 2021 12:36:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 582D560583;
 Thu,  7 Oct 2021 12:36:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 97D62113865F; Thu,  7 Oct 2021 14:36:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: jsnow@redhat.com
Subject: Re: Invitation: QAPI Sync meeting @ Thu Oct 7, 2021 9am - 10am
 (EDT) (qemu-devel@nongnu.org)
References: <00000000000093852d05cd8d38f6@google.com>
Date: Thu, 07 Oct 2021 14:36:27 +0200
In-Reply-To: <00000000000093852d05cd8d38f6@google.com> (jsnow@redhat.com's
 message of "Mon, 04 Oct 2021 21:01:46 +0000")
Message-ID: <87a6jlggfo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: damien.hedde@greensocs.com, kwolf@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thursday crept up on me...  I just noticed we haven't gotten around to
circulate a one-page summary of the topics of interest.  In the hope
that late & crude is better than never, here's mine.  If I misunderstand
you, please be lenient, and correct me on the call.

=3D Technical =3D

Marc-Andr=C3=A9 is interested in language bindings, Rust in particular.  He
explored this some.  There are problems.

Kevin and Markus are interested in CLI QAPIfication, and QAPI/QOM
integration.

Daniel is interested in 100% pure QAPI-based QEMU configuration.

For proper CLI QAPIfication, the traditional / "human-friendly"syntax
should become a wrapper around "machine-friendly", just like HMP is /
should be a wrapper around QMP.  He's exploring techniques that let us
avoid writing these wrappers completely by hand.

The external QOM interfaces are not specified in QAPI, and therefore not
covered by QAPI introspection.  QAPI/QOM integration could fix that, and
also generate QOM boilerplate.

The way -device / device_add is implemented defeats type checking.  If
we fix that, users that get the types wrong break.  Libvirt does.

John and Markus are interested in making the QAPI code generator easier
to maintain.  Type hints, in particular

Markus is interested in extending QAPI special feature flags and -compat
beyond "deprecated".

=3D Process =3D

How can we make the merging of non-trivial QAPI language work less
painfully slow?


