Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7D233304
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 15:27:16 +0200 (CEST)
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k18aZ-0003kc-K4
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 09:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k18Yh-0002HT-V6
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 09:25:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49525
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k18Yd-000668-05
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 09:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596115510;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSjVnntkY5YpBZyQYeTMzAbu2FCnWOvkxgswYSRBvoM=;
 b=LYsgKbIpc+yTXwnv48tYqwNW8vqhdHAxJ26SWZfgikNRtGGD7J4NgmyEeI38Gj9KunwLdd
 vH/xh7MwiCMlL9djAczUUXOIN104bUPutAYN/K3LoGQQ+q5mRWjApnEuRa1mvwjh9LUb3H
 rbngxnzFnKxvF+p+3YubBXl6Kpz+bp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-HfJ2Hk_YPFK1hePtYNlqMA-1; Thu, 30 Jul 2020 09:25:02 -0400
X-MC-Unique: HfJ2Hk_YPFK1hePtYNlqMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6945C107BEF7;
 Thu, 30 Jul 2020 13:25:01 +0000 (UTC)
Received: from redhat.com (ovpn-114-181.ams2.redhat.com [10.36.114.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17E6359;
 Thu, 30 Jul 2020 13:24:48 +0000 (UTC)
Date: Thu, 30 Jul 2020 14:24:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] schemas: Add vim modeline
Message-ID: <20200730132446.GL3477223@redhat.com>
References: <20200729185024.121766-1-abologna@redhat.com>
 <87ime52wxd.fsf@dusky.pond.sub.org>
 <20200730093732.GB3477223@redhat.com>
 <87k0ylz0ep.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87k0ylz0ep.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:51:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 30, 2020 at 01:51:10PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> >                               modify them so that we can load the 
> > files straight into the python intepretor as code, and not parse 
> > them as data. I feel unhappy about treating data as code though.
> 
> Stress on *can* load.  Doesn't mean we should.
> 
> Ancient prior art: Lisp programs routinely use s-expressions as
> configuration file syntax.  They don't load them as code, they read them
> as data.
> 
> With Python, it's ast.parse(), I think.

Yes, that could work


> > struct: ImageInfoSpecificQCow2
> > data:
> >   compat: str
> >   "*data-file": str
> >   "*data-file-raw": bool
> >   "*lazy-refcounts": bool
> >   "*corrupt": bool
> >   refcount-bits: int
> >   "*encrypt": ImageInfoSpecificQCow2Encryption
> >   "*bitmaps":
> >     - Qcow2BitmapInfo
> >   compression-type: Qcow2CompressionType
> >
> >
> > Then we could use a regular off the shelf YAML parser in python.
> >
> > The uglyiness with quotes is due to the use of "*". Slightly less ugly
> > if we simply declare that quotes are always used, even where they're
> > not strictly required.
> 
> StrictYAML insists on quotes.

I wouldn't suggest StrictYAML, just normal YAML is what pretty much
everyone uses.

If we came up with a different way to mark a field as optional
instead of using the magic "*" then we wouldn't need to quote
anything

> I hate having to quote identifiers.  There's a reason we don't write
> 
>     'int'
>     'main'('int', 'argc', 'char' *'argv'[])
>     {
>         'printf'("hello world\n");
>         return 0;
>     }
> 
> > struct: ImageInfoSpecificQCow2
> > data:
> >   "compat": "str"
> >   "*data-file": "str"
> >   "*data-file-raw": "bool"
> >   "*lazy-refcounts": "bool"
> >   "*corrupt": "bool"
> >   "refcount-bits": "int"
> >   "*encrypt": "ImageInfoSpecificQCow2Encryption"
> >   "*bitmaps":
> >     - "Qcow2BitmapInfo"
> >   "compression-type": "Qcow2CompressionType"
> >
> > With the use of "---" to denote the start of document, we have no trouble 
> > parsing our files which would actually be a concatenation of multiple 
> > documents. The python YAML library provides the easy yaml.load_all()
> > method.
> 
> Required reading on YAML:
> https://www.arp242.net/yaml-config.html

I don't think this is especially helpful to our evaluation. You can write
such blog posts about pretty much any thing if you want to pick holes in a
proposal. Certainly there's plenty of awful stuff you can write about
JSON, and Python.

> Some of the criticism there doesn't matter for our use case.

Yeah, what matters is whether it can do the job we need in a way that is
better than what we have today, and whether there are any further options
to consider that might be viable alternatives.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


