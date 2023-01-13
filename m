Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D641669192
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:48:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFit-0002hL-4b; Fri, 13 Jan 2023 03:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGFin-0002dQ-RE
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:47:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGFik-0005mE-Cf
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673599642;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7V5TMHgrt1xc0OZEMfV9RpCgMOcUS5udB/zNy64tdk=;
 b=BUk2AWgX3ycWaU+QifGD6j0pgmFndeHWO4czhluOVrriocPIa+YTNdaxad4yHqv4P7O1bb
 Jk4Y5QqJ7OLqIAoU8KdTY0ap/sthnM1hFxkC3OYdhhO3pjQtjqaGrCra8PgGyH+W2fW4fX
 tbTapc+/S+REO5EzfnvL7DLzhSFrcz4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408--bpDCEyEMK-RQa8fplPjrw-1; Fri, 13 Jan 2023 03:47:21 -0500
X-MC-Unique: -bpDCEyEMK-RQa8fplPjrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C66912804135;
 Fri, 13 Jan 2023 08:47:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75DCC4078903;
 Fri, 13 Jan 2023 08:47:15 +0000 (UTC)
Date: Fri, 13 Jan 2023 08:47:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: Re: [PATCH 1/5] migration: Updated QAPI format for 'migrate' qemu
 monitor command
Message-ID: <Y8EaezDrIjqmiAKu@redhat.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-2-het.gala@nutanix.com>
 <Y7wfoGpM6iwzy8L1@redhat.com>
 <e8d413c9-d030-fbf1-16a3-4a4e2116df0f@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8d413c9-d030-fbf1-16a3-4a4e2116df0f@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Fri, Jan 13, 2023 at 01:37:26PM +0530, Het Gala wrote:
> 
> On 09/01/23 7:37 pm, Daniel P. Berrangé wrote:
> > On Mon, Dec 26, 2022 at 05:33:25AM +0000, Het Gala wrote:
> > > From: Author Het Gala <het.gala@nutanix.com>
> > > 
> > > Existing 'migrate' QAPI design enforces transport mechanism, ip address
> > > of destination interface and corresponding port number in the form
> > > of a unified string 'uri' parameter. This scheme does seem to have an issue
> > > in it, i.e. double-level encoding of URIs.
> > > 
> > > The current patch maps existing QAPI design into a well-defined data
> > > structure - 'MigrateChannel' only from the design perspective. Please note that
> > > the existing 'uri' parameter is kept untouched for backward compatibility.
> > > 
> > > +##
> > > +# @MigrateRdmaAddr:
> > > +#
> > > +# Since 8.0
> > > +##
> > > +{ 'struct': 'MigrateRdmaAddr',
> > > +   'data' : {'rdma-str': 'str' } }
> > Loooking at the RDMA code it takes the str, and treats it
> > as an IPv4 address:
> > 
> > 
> >          addr = g_new(InetSocketAddress, 1);
> >          if (!inet_parse(addr, host_port, NULL)) {
> >              rdma->port = atoi(addr->port);
> >              rdma->host = g_strdup(addr->host);
> >              rdma->host_port = g_strdup(host_port);
> >          }
> > 
> > so we really ought to accept an InetSocketAddress struct
> > directly
> > 
> >   { 'struct': 'MigrateRdmaAddr',
> >      'data' : {'rdma-str': 'InetSocketAddress' } }
> > 
> Hi Daniel. I was going through the rdma code, and I think we also need
> 'host_port' for rdma_return_path context
> https://github.com/qemu/qemu/commit/44bcfd45e9806c78d9d526d69b0590227d215a78.
> I dont have much understanding but If you have any suggestion or a
> workaround for this, please suggest :)

The return path calls back into qemu_rdma_data_init() which takes
host_port, but you'll already be changing that to take InetSocketAddress,
so that'll be fine.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


