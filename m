Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B5D32A9FB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:09:12 +0100 (CET)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAON-0006ex-9W
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9jv-0005A9-DT
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:27:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9jr-0003kD-Tz
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614709638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5APo3CRLr2Ake+kz/JyQ4o6tFxIpDjHVWOqfK67YN6k=;
 b=Z+pI182D0kpVPGPk7OF8/oaui+XmEPVDvOeM8160AA6uHCE1B5Nhf/hi0vnuUu4N/uAVxD
 2z/aKbRRfUGwn5MxXyk/VkhgdMsOYKTOeqBTQs0bjgBM4uQSHckkc3V1G/lWsp5gfAqzMo
 p+p/OowuFC/UATz00AbvSkmrH9iiBxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-jiCFQgSCOoy38l4Q46TtrA-1; Tue, 02 Mar 2021 13:27:14 -0500
X-MC-Unique: jiCFQgSCOoy38l4Q46TtrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C132DC7402;
 Tue,  2 Mar 2021 18:27:13 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C77BA5D9E4;
 Tue,  2 Mar 2021 18:27:04 +0000 (UTC)
Date: Tue, 2 Mar 2021 19:27:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 11/31] qapi/qom: Add ObjectOptions for tls-*,
 deprecate 'loaded'
Message-ID: <20210302182703.GH5527@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-12-kwolf@redhat.com>
 <3f1ff9c1-0e96-e4d7-9c69-a78893a98a12@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3f1ff9c1-0e96-e4d7-9c69-a78893a98a12@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 20:33 hat Eric Blake geschrieben:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
> > This adds a QAPI schema for the properties of the tls-* objects.
> > 
> > The 'loaded' property doesn't seem to make sense as an external
> > interface: It is automatically set to true in ucc->complete, and
> > explicitly setting it to true earlier just means that additional options
> > will be silently ignored.
> > 
> > In other words, the 'loaded' property is useless. Mark it as deprecated
> > in the schema from the start.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qapi/crypto.json | 98 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  qapi/qom.json    | 12 +++++-
> >  2 files changed, 108 insertions(+), 2 deletions(-)
> > 
> > diff --git a/qapi/crypto.json b/qapi/crypto.json
> > index 0fef3de66d..7116ae9a46 100644
> > --- a/qapi/crypto.json
> > +++ b/qapi/crypto.json
> > @@ -442,3 +442,101 @@
> >  { 'struct': 'SecretKeyringProperties',
> >    'base': 'SecretCommonProperties',
> >    'data': { 'serial': 'int32' } }
> > +
> > +##
> > +# @TlsCredsProperties:
> > +#
> > +# Properties for objects of classes derived from tls-creds.
> > +#
> > +# @verify-peer: if true the peer credentials will be verified once the
> > +#               handshake is completed.  This is a no-op for anonymous
> > +#               credentials. (default: true)
> > +#
> > +# @dir: the path of the directory that contains the credential files
> > +#
> > +# @endpoint: whether the QEMU network backend that uses the credentials will be
> > +#            acting as a client or as a server (default: client)
> > +#
> > +# @priority: a gnutls priority string as described at
> > +#            https://gnutls.org/manual/html_node/Priority-Strings.html
> > +#
> > +# Since: 2.5
> > +##
> > +{ 'struct': 'TlsCredsProperties',
> > +  'data': { '*verify-peer': 'bool',
> > +            '*dir': 'str',
> > +            '*endpoint': 'QCryptoTLSCredsEndpoint',
> > +            '*priority': 'str' } }
> 
> Matches crypto/tlscreds.c:qcrypto_tls_creds_class_init().
> 
> > +
> > +##
> > +# @TlsCredsAnonProperties:
> > +#
> > +# Properties for tls-creds-anon objects.
> > +#
> > +# @loaded: if true, the credentials are loaded immediately when applying this
> > +#          option and will ignore options that are processed later. Don't use;
> > +#          only provided for compatibility. (default: false)
> > +#
> > +# Features:
> > +# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
> > +#              and false is already the default.
> > +#
> > +# Since: 2.5
> > +##
> > +{ 'struct': 'TlsCredsAnonProperties',
> > +  'base': 'TlsCredsProperties',
> > +  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] } } }
> 
> Since we documented that 'verify-peer' is a no-op for this struct, is it
> worth altering our type hierarchy to make it explicit, as in:
> 
> TlsCredsCommonProperties - dir, endpoint, priority
> TlsCredsProperties - TlsCredsCommonProperties + verify-peer
> TlsCredsAnonProperties - TlsCredsCommonProperties + loaded
> TlsCredsPskProperties - TlsCredsProperties + loaded, username
> 
> But even if not, this matches
> crypto/tlscredsanon.c:qcrypto_tls_creds_anon_class_init().

We can't turn a no-op into an error without a deprecation period.

> > +
> > +##
> > +# @TlsCredsPskProperties:
> > +#
> > +# Properties for tls-creds-psk objects.
> > +#
> > +# @loaded: if true, the credentials are loaded immediately when applying this
> > +#          option and will ignore options that are processed later. Don't use;
> > +#          only provided for compatibility. (default: false)
> > +#
> > +# @username: the username which will be sent to the server.  For clients only.
> > +#            If absent, "qemu" is sent and the property will read back as an
> > +#            empty string.
> > +#
> > +# Features:
> > +# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
> > +#              and false is already the default.
> > +#
> > +# Since: 3.0
> > +##
> > +{ 'struct': 'TlsCredsPskProperties',
> > +  'base': 'TlsCredsProperties',
> > +  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
> > +            '*username': 'str' } }
> 
> This matches crypto/tlscredspsk.c:qcrypto_tls_creds_psk_class_init().
> 
> Do we want to use QAPI type inheritance to declare a union where
> 'endpoint' is the union discriminator, and 'username' is only present
> for 'endpoint':'client'?  (Hmm, we'd have to improve the QAPI code
> generator to allow a flat union as the branch of yet another flat
> union...)

Probably not now then.

It also has the same problem as above, but I guess you could use the
deprecation period to build the required QAPI infrastructure. :-)

Kevin


