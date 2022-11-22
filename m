Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98CE634229
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 18:05:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWgi-0002oa-Gr; Tue, 22 Nov 2022 12:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxWgH-0002ja-SR
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxWgE-00062J-08
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669136608;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+6QBplxhGdsVFcDy/81siHRU0UOHUlAv75rPYZ5Cmw=;
 b=a6cOM2JqgF0r5bUJxZME0rqCxVgy6d+U2VgpifbXcGn+YlnobE7EO2P5beutsKt+RZ9H0D
 KULPNDaKjB4M9/hiBybagHojGiJtFyXIzsNmMkwUxt2xVkMS6HllLRlIxh9pJrIfJ4YAzI
 7WLSGd0LtgTtSuGFc8CI5OJJEkBQf3A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-2mvh7H0DP7yh3VxbtYg-Xg-1; Tue, 22 Nov 2022 12:03:24 -0500
X-MC-Unique: 2mvh7H0DP7yh3VxbtYg-Xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C9D83C0F42B;
 Tue, 22 Nov 2022 17:03:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47A021400C30;
 Tue, 22 Nov 2022 17:03:22 +0000 (UTC)
Date: Tue, 22 Nov 2022 17:03:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: Juan Quintela <quintela@redhat.com>, Het Gala <het.gala@nutanix.com>,
 qemu-devel@nongnu.org, prerna.saxena@nutanix.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: Re: [PATCH] multifd: Updated QAPI format for 'migrate' qemu monitor
 command
Message-ID: <Y30A1U4sO1gouHgs@redhat.com>
References: <20221121110427.198431-1-het.gala@nutanix.com>
 <87pmdgtr9g.fsf@secure.mitica> <Y3yVHpH2080Dm9eM@redhat.com>
 <132c1dbf-e953-0736-fb3a-169baebd7e75@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <132c1dbf-e953-0736-fb3a-169baebd7e75@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 22, 2022 at 09:27:52PM +0530, manish.mishra wrote:
> 
> On 22/11/22 2:53 pm, Daniel P. Berrangé wrote:
> > For our future sanity I think we need to define a brand new migration
> > protocol which is bidirectional from the start. A large number of the
> > MigrateParameters would become obsolete immediately, as QEMU could
> > negotiate them automatically. This would let QEMU introduce new
> > migration features without requiring any work in libvirt in many
> > cases. Libvirt should only be required when there are performance
> > tunables that need exposing, never for protocol feature negotiation.
> > 
> > I think introducing a new QMP command, without introducing a fully
> > new protocol would be a big mistake as the QMP command is not the
> > problem we have.
> > 
> 
> Daniel, Totally agree on above mentioned discussion. Does this
> account for verifying other things too along with migration
> capabilities e.g. if qemu machine type, vm config or cpu
> features are excatly same of both side. Currently libvirt
> takes that responsibility, but as you mentioned libvirt may
> take some time to get to level where qemu is so causing
> potential issues till then. Similar to this discussion we
> had on libvirt list https://www.mail-archive.com/libvir-list@redhat.com/msg233725.html.
> If these things too were managed by qemu indepenedelty
> things could have been much better. I mean those too are
> kind of related to live migration. :)

Today libvirt has no choice, because if there's an ABI compat
mistake in the dest QEMU config, vs the src QEMU config, then
when loading VMstate on the target, the dst QEMU will often be
unable to de-serialize the migration device stream and end
up printing an error on stderr and exiting. Getting that info
back to the src QEMU is impossible.

If QEMU had a bi-directional migration stream, then the dst
QEMU could simply send an error message back to the src QEMU
and 'query-migrate' could actually display this.

There may still be validation libvirt wants to do as well,
but at least there would be the possiblity of offloading
to QEMU without sacrificing error reporting.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


