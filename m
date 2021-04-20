Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435136542E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:33:20 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYlot-0004OY-BJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYljG-0005QC-K2
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYljB-0002pa-FF
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618907243;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=h4DGUX0t65ID/2m1i5VSTlpy2dDTwxsq+BUks5c0cko=;
 b=MVJBGn7Zmu1CcK7KcWqphs+fdUVrxkKEgoQRq8ofvNBXg+SccVAaZzVvysIZs1vWn/RbUa
 BlcxRNvCWVxzg5sh/LoXVn1JG6W9tszT2eFrmJ1/Dl4jKl5v7+dG/vT1+szXqJlwrAH5mF
 y31Ishb1/fOxnG37F6gNYl90uyidD5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-cV0vzdssMCuk4Ztr95G1Kg-1; Tue, 20 Apr 2021 04:27:19 -0400
X-MC-Unique: cV0vzdssMCuk4Ztr95G1Kg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BCCD1922036;
 Tue, 20 Apr 2021 08:27:18 +0000 (UTC)
Received: from redhat.com (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5752F5D756;
 Tue, 20 Apr 2021 08:27:17 +0000 (UTC)
Date: Tue, 20 Apr 2021 09:27:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Live migration using a specified networking adapter
Message-ID: <YH6QYlHQiVZqAPX/@redhat.com>
References: <CAFKS8hW6mwS89HHteyYcjRuvw7c5LxLdUrYo705Op7XreJBjTQ@mail.gmail.com>
 <YH3UrzZ4L4/tGIK2@work-vm>
MIME-Version: 1.0
In-Reply-To: <YH3UrzZ4L4/tGIK2@work-vm>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jing-Wei Su <jwsu1986@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 08:06:23PM +0100, Dr. David Alan Gilbert wrote:
> * Jing-Wei Su (jwsu1986@gmail.com) wrote:
> > Hello experts,
> > 
> > 
> > I have a network topology like this diagram.
> > 
> > When start live migration moving a VM from Host A to B,
> > 
> > the migration process uses either 10GbE (10.0.0.1) or 1 GbE (10.0.0.2),
> > 
> > but the user cannot specify the source NIC by current migrate command.
> > 
> > 
> > To solve the problem, my rough idea is to add a source ipv4:port argument,
> > 
> > the migration command seems like
> > 
> > ```
> > 
> > migrate -b tcp:10.0.0.1:4444 -d tcp:10.0.0.3:4444.
> 
> I'm not sure what the OS lets us do, but if it lets us pick the IP and
> port I think that would work; I don't think you need another tcp:
> since we already know which protocol we're using.
> 
> > 
> > ```
> > 
> > Is it an available solution? Or, is there any concern and sugesstion?
> > 
> > Besides the idea, is there any good way to this issue?
> 
> It's unusual; I don't think I've seen anyone ask for it before.
> I assume there's a wayto get the host network stack to prefer
> the 10GbE interface.
> Or to use separate subnets; rememember that each interface
> can have multiple IP addresses.

Yes, the recommended way is to have separate subnets for the
two NICs, and then use the IP address associated with the
fast NIC. Network routing will ensure migration traffic flows
over the main NIC. This is known to work well as OpenStack
uses this approach with QEMU/libvirt already.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


