Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A792C880D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:34:03 +0100 (CET)
Received: from localhost ([::1]:42668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjlBi-0000KG-Aq
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kjl9d-0006bd-JA
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:31:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kjl9a-0004eh-9S
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606750309;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LBLTsn1CSjn5SFFZAkL+Sjb6YjVYkmH1EwbLZpyC+Y8=;
 b=IWFmh/kGBtpCMROT4TqVl/I4t7NJuDTRb1m4eitH+Bnm9Fs0oFAH6c3ZsNprdy6T2yVjtp
 3vSTRmU6kd+CjcbSVbjmjoeXAV5SoRRWdIz4l8DvnTJMbjKg+eWwOp9NhK2k+LkxV0qMjE
 +YQFu2JoxIYnBWfYjwyDBYLe3BWoVdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-7CX9WhKQNtK18bemegXvJg-1; Mon, 30 Nov 2020 10:31:34 -0500
X-MC-Unique: 7CX9WhKQNtK18bemegXvJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFA92817B86;
 Mon, 30 Nov 2020 15:31:07 +0000 (UTC)
Received: from redhat.com (ovpn-114-242.ams2.redhat.com [10.36.114.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD7D25C1A1;
 Mon, 30 Nov 2020 15:30:54 +0000 (UTC)
Date: Mon, 30 Nov 2020 15:30:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201130153051.GG2039965@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 03:58:23PM +0100, Paolo Bonzini wrote:
> On 30/11/20 13:25, Kevin Wolf wrote:
> > This series adds a QAPI type for the properties of all user creatable
> > QOM types and finally makes QMP object-add use the new ObjectOptions
> > union so that QAPI introspection can be used for user creatable objects.
> > 
> > After this series, there is least one obvious next step that needs to be
> > done: Change HMP and all of the command line parser to use
> > ObjectOptions, too, so that the QAPI schema is consistently enforced in
> > all external interfaces. I am planning to send another series to address
> > this.
> > 
> > In a third step, we can try to start deduplicating and integrating things
> > better between QAPI and the QOM implementation, e.g. by generating parts
> > of the QOM boilerplate from the QAPI schema.
> 
> With this series it's basically pointless to have QOM properties at all.
> Instead, you are basically having half of QEMU's backend data model into a
> single struct.
> 
> So the question is, are we okay with shoveling half of QEMU's backend data
> model into a single struct?  If so, there are important consequences.


In theory they should have the same set of options, but nothing in
this series will enforce that. So we're introducing the danger that
QMP object-add will miss some property, and thus be less functional
than the CLI -object.  If we convert CLI -object  to use the QAPI
parser too, we eliminate that danger, but we still have the struct
duplication.

> 1) QOM basically does not need properties anymore except for devices and
> machines (accelerators could be converted to QAPI as well). All
> user-creatable objects can be changed to something like chardev's "get a
> struct and use it fill in the fields", and only leave properties to devices
> and machines.
> 
> 2) User-creatable objects can have a much more flexible schema.  This means
> there's no reason to have block device creation as its own command and
> struct for example.
> 
> The problem with this series is that you are fine with deduplicating things
> as a third step, but you cannot be sure that such deduplication is possible
> at all.  So while I don't have any problems in principle with the
> ObjectOptions concept, I don't think it should be committed without a clear
> idea of how to do the third step.

I feel like we should at least aim to kill the struct duplication, even if
we ignore the bigger QOM stuff like setters/getters/constructors/etc. The
generated structs are not far off being usable.

eg for the secret object we have the QAPI schema

{ 'struct': 'SecretCommonProperties',
  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
            '*format': 'QCryptoSecretFormat',
            '*keyid': 'str',
            '*iv': 'str' } }

{ 'struct': 'SecretProperties',
  'base': 'SecretCommonProperties',
  'data': { '*data': 'str',
            '*file': 'str' } }

IIUC this will resulting in a QAPI generated flattened struct:

  struct SecretProperties {
    bool loaded;
    QCryptoSecretFormat format;
    char *keyid;
    char *iv;
    char *data;
    char *file;
  };

vs the QOM manually written structs

  struct QCryptoSecretCommon {
    Object parent_obj;
    uint8_t *rawdata;
    size_t rawlen;
    QCryptoSecretFormat format;
    char *keyid;
    char *iv;
  };

  struct QCryptoSecret {
    QCryptoSecretCommon parent_obj;
    char *data;
    char *file;
  };

The key differences

 - The parent struct is embedded, rather than flattened
 - The "loaded" property doesn't need to exist
 - Some extra fields are live state (rawdata, rawlen)

Lets pretend we just kill "loaded" entirely, so ignore that.

We could simply make QOM "Object" a well known built-in type, so
we can reference it as a "parent". Then any struct with "Object"
as a parent could use struct embedding rather flattening and thus
just work.

Can we invent a "state" field for fields that are internal
only, separate from the public "data" fields.

eg the secret QAPI def would only need a couple of changes:

{ 'struct': 'QCryptoSecretCommon',
  'base': 'Object',
  'state': { 'rawdata': '*uint8_t',
             'rawlen': 'size_t' },
  'data': { '*format': 'QCryptoSecretFormat',
            '*keyid': 'str',
            '*iv': 'str' } }

{ 'struct': 'QCryptoSecret',
  'base': 'QCryptoSecretCommon',
  'data': { '*data': 'str',
            '*file': 'str' } }

There would need to be a

   void QCryptoSecretCommonFreeState(QCryptoSecretCommon *obj)

method defined manually by the programmer to take care of free'ing any
pointers in the "state".

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


