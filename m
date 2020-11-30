Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D692C89F1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:54:37 +0100 (CET)
Received: from localhost ([::1]:38836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmRf-0006iW-65
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kjmPb-0005Ns-LT
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:52:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kjmPY-0004l0-Ro
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606755142;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FszVDr4iSzb/dEQ2lLme4CdOozke8b7sJEfOxyJojo=;
 b=I5rshDbQIVB9fGzvFNJLRj/cWVmqdkhfr17aXUGWIDu9dpp6EDdh/5GTmuKj9paxfXX9ni
 tNkUCCcyYCENWAtXk1f1Cta92e/awDW08l18I6FUIUsus1g/sm5QrVW+xuSwUv6gScCpyK
 8jUlL6kU5QeHq5e8j3MXNUXfF1ivGA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-gjLzYECxOsO150kd4UGJ8w-1; Mon, 30 Nov 2020 11:52:16 -0500
X-MC-Unique: gjLzYECxOsO150kd4UGJ8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 213468558E4;
 Mon, 30 Nov 2020 16:52:15 +0000 (UTC)
Received: from redhat.com (ovpn-114-242.ams2.redhat.com [10.36.114.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7861D189C4;
 Mon, 30 Nov 2020 16:52:05 +0000 (UTC)
Date: Mon, 30 Nov 2020 16:52:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201130165201.GH2039965@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130153051.GG2039965@redhat.com>
 <20201130161357.GE5078@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201130161357.GE5078@merkur.fritz.box>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 jasowang@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 05:13:57PM +0100, Kevin Wolf wrote:
> Am 30.11.2020 um 16:30 hat Daniel P. BerrangÃÂ© geschrieben:
> > On Mon, Nov 30, 2020 at 03:58:23PM +0100, Paolo Bonzini wrote:
> > > On 30/11/20 13:25, Kevin Wolf wrote:
> > > > This series adds a QAPI type for the properties of all user creatable
> > > > QOM types and finally makes QMP object-add use the new ObjectOptions
> > > > union so that QAPI introspection can be used for user creatable objects.
> > > > 
> > > > After this series, there is least one obvious next step that needs to be
> > > > done: Change HMP and all of the command line parser to use
> > > > ObjectOptions, too, so that the QAPI schema is consistently enforced in
> > > > all external interfaces. I am planning to send another series to address
> > > > this.
> > > > 
> > > > In a third step, we can try to start deduplicating and integrating things
> > > > better between QAPI and the QOM implementation, e.g. by generating parts
> > > > of the QOM boilerplate from the QAPI schema.
> > > 
> > > With this series it's basically pointless to have QOM properties at all.
> > > Instead, you are basically having half of QEMU's backend data model into a
> > > single struct.
> > > 
> > > So the question is, are we okay with shoveling half of QEMU's backend data
> > > model into a single struct?  If so, there are important consequences.
> > 
> > In theory they should have the same set of options, but nothing in
> > this series will enforce that. So we're introducing the danger that
> > QMP object-add will miss some property, and thus be less functional
> > than the CLI -object.  If we convert CLI -object  to use the QAPI
> > parser too, we eliminate that danger, but we still have the struct
> > duplication.
> 
> I think converting the CLI is doable in the short term. I already have
> the patch for qemu-storage-daemon, but decided to keep it for a separate
> series.
> 
> The most difficult part is probably -readconfig, but with Paolo's RFC
> patches to move it away from QemuOpts, even that shouldn't be very hard.
> 
> > > 1) QOM basically does not need properties anymore except for devices and
> > > machines (accelerators could be converted to QAPI as well). All
> > > user-creatable objects can be changed to something like chardev's "get a
> > > struct and use it fill in the fields", and only leave properties to devices
> > > and machines.
> > > 
> > > 2) User-creatable objects can have a much more flexible schema.  This means
> > > there's no reason to have block device creation as its own command and
> > > struct for example.
> > > 
> > > The problem with this series is that you are fine with deduplicating things
> > > as a third step, but you cannot be sure that such deduplication is possible
> > > at all.  So while I don't have any problems in principle with the
> > > ObjectOptions concept, I don't think it should be committed without a clear
> > > idea of how to do the third step.
> > 
> > I feel like we should at least aim to kill the struct duplication, even if
> > we ignore the bigger QOM stuff like setters/getters/constructors/etc. The
> > generated structs are not far off being usable.
> > 
> > eg for the secret object we have the QAPI schema
> > 
> > { 'struct': 'SecretCommonProperties',
> >   'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
> >             '*format': 'QCryptoSecretFormat',
> >             '*keyid': 'str',
> >             '*iv': 'str' } }
> > 
> > { 'struct': 'SecretProperties',
> >   'base': 'SecretCommonProperties',
> >   'data': { '*data': 'str',
> >             '*file': 'str' } }
> > 
> > IIUC this will resulting in a QAPI generated flattened struct:
> > 
> >   struct SecretProperties {
> >     bool loaded;
> >     QCryptoSecretFormat format;
> >     char *keyid;
> >     char *iv;
> >     char *data;
> >     char *file;
> >   };
> > 
> > vs the QOM manually written structs
> > 
> >   struct QCryptoSecretCommon {
> >     Object parent_obj;
> >     uint8_t *rawdata;
> >     size_t rawlen;
> >     QCryptoSecretFormat format;
> >     char *keyid;
> >     char *iv;
> >   };
> > 
> >   struct QCryptoSecret {
> >     QCryptoSecretCommon parent_obj;
> >     char *data;
> >     char *file;
> >   };
> > 
> > The key differences
> > 
> >  - The parent struct is embedded, rather than flattened
> >  - The "loaded" property doesn't need to exist
> >  - Some extra fields are live state (rawdata, rawlen)
> > 
> > Lets pretend we just kill "loaded" entirely, so ignore that.
> > 
> > We could simply make QOM "Object" a well known built-in type, so
> > we can reference it as a "parent". Then any struct with "Object"
> > as a parent could use struct embedding rather flattening and thus
> > just work.
> > 
> > Can we invent a "state" field for fields that are internal
> > only, separate from the public "data" fields.
> > 
> > eg the secret QAPI def would only need a couple of changes:
> > 
> > { 'struct': 'QCryptoSecretCommon',
> >   'base': 'Object',
> >   'state': { 'rawdata': '*uint8_t',
> >              'rawlen': 'size_t' },
> >   'data': { '*format': 'QCryptoSecretFormat',
> >             '*keyid': 'str',
> >             '*iv': 'str' } }
> > 
> > { 'struct': 'QCryptoSecret',
> >   'base': 'QCryptoSecretCommon',
> >   'data': { '*data': 'str',
> >             '*file': 'str' } }
> 
> I haven't given much though to the details yet, but I was thinking of
> introducing a new QAPI entity type for objects. We could include
> additional fields there, where the type would just directly be a C type
> rather than being interpreted by QAPI.
> 
> Maybe like this:
> 
> { 'object': 'secret-common',
>   'abstract': true,
>   'properties': 'SecretCommonProperties',
>   'state': { 'rawdata': '*uint8_t',
>              'rawlen': 'size_t' } }
> 
> { 'object': 'secret',
>   'parent': 'secret-common',
>   'properties': 'SecretProperties' } }
> 
> Maybe it would actually be nicer to have 'state' just as a string
> property that contains the C type name of the state struct and then QAPI
> just adds a pointer to it.

Yep, it would be nice to have clear separation of the "state" from
the "config", as that also makes it more obvious what is derived
info. 

> 
> Either way, there is some duplication there because we have a
> parent-child relationship both between the object types themselves and
> between their property classes. Either we remove the base from
> SecretProperties (which would make object-add and the CLI more
> complicated) or we just let the QAPI generator check that they are
> consistent.

I don't really like the duplicate hierarchies there either. I did
consider, a new 'object' entity instead of 'struct', but if we go
that way we should exclusively use "object" for the QOM types.
eg an "object" entity type would be a specialization of the
"struct" entity type, rather than something bolted onto the
side.

Basically I think the QOM struct and the properties struct should
remain one & the same thing.

If we think of "object" as a specialization of 'struct' then and
have "state" as a separate struct, we avoid the duplicate hierarchies


  { 'object': 'QCryptoSecretCommon',
    'state': 'QCryptoSecretCommonState',
    'data': { '*format': 'QCryptoSecretFormat',
              '*keyid': 'str',
              '*iv': 'str' } }
 
  { 'object': 'QCryptoSecret',
    'base': 'QCryptoSecretCommon',
    'data': { '*data': 'str',
              '*file': 'str' } }

there's not really much difference to this than just carrying
on using "struct" entity type though, and having the special
"Object" parent type as a built-in type.

> > There would need to be a
> > 
> >    void QCryptoSecretCommonFreeState(QCryptoSecretCommon *obj)
> > 
> > method defined manually by the programmer to take care of free'ing any
> > pointers in the "state".
> 
> Isn't this the job of the normal .instance_finalize method?

Yes, but I was thinking the fact how to wire into the free methods that
QAPI generates. 


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


