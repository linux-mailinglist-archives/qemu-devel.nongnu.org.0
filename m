Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1654A663D2D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:44:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFB04-0007BM-UH; Tue, 10 Jan 2023 04:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFAzy-0007AT-R8
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:32:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFAzw-0006O6-Lg
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673343167;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tu0VehlqnpbApZaN9icAT+Au/QQNJcQlcBGKPcjm6OU=;
 b=T1v9PDwVy5N/10XnSln/nG/T41H7c3wDzPkHgiOn8RBgAFFboPqRuy2wEA3hwiidGtYCyk
 zJhbVY7n1PcYdhNGTjrapQ3bO9j/YKZ7/POZ+HBIIp3friFnx0WLEJre6OxwZ6eDA7FK5R
 2OpBC0DaqqkikFDfLiyUZ+A7ha33lTk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-xE2QNvs7NKmcb7WuhV4u5g-1; Tue, 10 Jan 2023 04:32:46 -0500
X-MC-Unique: xE2QNvs7NKmcb7WuhV4u5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC2CF3828883;
 Tue, 10 Jan 2023 09:32:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C394C4085720;
 Tue, 10 Jan 2023 09:32:42 +0000 (UTC)
Date: Tue, 10 Jan 2023 09:32:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: Re: [PATCH 1/5] migration: Updated QAPI format for 'migrate' qemu
 monitor command
Message-ID: <Y70wtsbtIJ7VSgSq@redhat.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-2-het.gala@nutanix.com>
 <Y7wfoGpM6iwzy8L1@redhat.com>
 <2b1f1234-944f-756c-f952-c8096149191f@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b1f1234-944f-756c-f952-c8096149191f@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Jan 10, 2023 at 01:09:35PM +0530, Het Gala wrote:
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
> > > +# @MigrateExecAddr:
> > > + #
> > > + # Since 8.0
> > > + ##
> > > +{ 'struct': 'MigrateExecAddr',
> > > +   'data' : {'exec-str': 'str' } }
> > Currently for 'exec:cmdstr' the 'cmdstr' part is a shell command
> > that is passed
> > 
> >    const char *argv[] = { "/bin/sh", "-c", command, NULL };
> > 
> > I have a strong preference for making it possible to avoid use
> > of shell when spawning commands, since much of thue time it is
> > not required and has the potential to open up vulnerabilities.
> > It would be nice to be able to just take the full argv directly
> > IOW
> > 
> >   { 'struct': 'MigrateExecAddr',
> >      'data' : {'argv': ['str'] } }
> > 
> > If the caller wants to keep life safe and simple now they can
> > use
> >     ["/bin/nc", "-U", "/some/sock"]
> > 
> > but if they still want to send it via shell, they can also do
> > so
> > 
> >     ["/bin/sh", "-c", "...arbitrary shell script code...."]
> Okay Daniel. I get your point and it makes sense too. This will also have
> some code changes in exec.c file I assume.
> > > +
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
> Yes, It resembles to InetSocketAddress. Will make the relevant changes in
> rdma.c file.
> 
> With this, I had a small question in mind, do qemu need to develop /
> leverage some functionality to check the correctness for host or port.
> So that if the user enters an invalid host address, they get an error
> message to enter correct address, if trying to migrate via qmp command line
> interface.

When the RDMA code uses the host address to resolve the RDMA
endpoint, it will fail and report an error back.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


