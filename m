Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803DB23C8D3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 11:14:14 +0200 (CEST)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3FUz-0005jk-Jz
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 05:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k3FT4-0004Ij-QM
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 05:12:14 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26275
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k3FT3-0003Bu-5L
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 05:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596618732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DEsANkbLbGcSWPjjdtbAHQUu/vJ5DaDyj75MEXJWpA=;
 b=T4ofjh/t1ulkS/RQdzfA1iRXXdl9r4BVT8OV7z81ir1bPzeC4VBcpTcoiq8TIHbzJ4GUD/
 zRsjKIVNaqM95LwiTdzNeZxc/PfxyH8iDePemRU0/n/1kFk4oHMC4mEEpJK9+Z5pgdsvPq
 se5BVaEjuvY9IVSoQtlUCzLK8lBnUgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-26vUYQcjOHye5kOfSPKFoA-1; Wed, 05 Aug 2020 05:12:11 -0400
X-MC-Unique: 26vUYQcjOHye5kOfSPKFoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9C78102C7E9;
 Wed,  5 Aug 2020 09:12:09 +0000 (UTC)
Received: from gondolin (ovpn-113-4.ams2.redhat.com [10.36.113.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1082910013D0;
 Wed,  5 Aug 2020 09:11:57 +0000 (UTC)
Date: Wed, 5 Aug 2020 11:11:55 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: cleanups with long-term benefits
Message-ID: <20200805111155.25abfd26.cohuck@redhat.com>
In-Reply-To: <20200805090540.GC4127670@redhat.com>
References: <87ft94klyl.fsf@dusky.pond.sub.org>
 <490a0786-73f3-411e-4dfe-8c2ae90de251@redhat.com>
 <87y2mvhg3k.fsf@dusky.pond.sub.org>
 <facfef76-d880-82dd-f862-a64f8f487ba2@redhat.com>
 <87k0yeg7mc.fsf@dusky.pond.sub.org>
 <6e5df5fc-94f8-ee8e-0c14-f56135de25e4@redhat.com>
 <87o8np5ysp.fsf@dusky.pond.sub.org>
 <9f83eb93-5389-7aad-3031-0777de0c35b0@redhat.com>
 <20200805083949.GA3004@work-vm>
 <241436db-1aec-b804-314f-7893954e981b@redhat.com>
 <20200805090540.GC4127670@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 04:10:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 Aug 2020 10:05:40 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Wed, Aug 05, 2020 at 10:49:35AM +0200, Paolo Bonzini wrote:
> > On 05/08/20 10:39, Dr. David Alan Gilbert wrote: =20
> > >> Do you really use "git blame" that much?  "git log -S" does more or =
less
> > >> the same function (in a different way) and is not affected as much b=
y
> > >> large code movement and transformation patches. =20
> > >
> > > I use it a lot!   Following stuff back to find where a change came
> > > from and then asking people. =20
> >=20
> > Indeed, but I use "git log -S" instead. :)  Another possibility is to
> > just do "git log -p" and search for a relevant line of the code I'm
> > "blaming". =20
>=20
> I used git blame alot too, but I don't think its a reason to not do the
> cleanups. It is easy enough to just tell blame to use an earlier commit
> if you see it displaying a refactor. I don't think such mild inconvenienc=
e
> should stop us making otherwise desirable code changes

I don't think people argue that it should block changes; it it simply
another thing to consider when weighing benefits vs. drawbacks.


