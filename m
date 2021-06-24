Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD08B3B34F1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 19:42:14 +0200 (CEST)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTMi-0003n3-UK
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 13:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwTLA-0002h2-El
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwTL7-00037H-4i
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624556432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ysRU4P0avuwxXQ6c9uA3QcHc+59TGuics2DbAJdOO+A=;
 b=Z9AlzQ1e7snDse2DYwGZB/b6I8lDBGjrvuTW7jQUEyhIVKrtGMIxpX/O/HuVva5y0GRKxZ
 JZCN/UMmS2Ve9kQWdmkjWzG3KFSNK6n7w4IROskyxwZaMZBB+coWksPcj0Yy4e6VkGzUNy
 mxHWzF7i135rv7QgkGkJZldeJ3g+dvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-FXMP9bsOMNO5E0YNwWJIVg-1; Thu, 24 Jun 2021 13:40:30 -0400
X-MC-Unique: FXMP9bsOMNO5E0YNwWJIVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B64A5801596;
 Thu, 24 Jun 2021 17:40:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EB0119D7C;
 Thu, 24 Jun 2021 17:40:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7E852180060E; Thu, 24 Jun 2021 19:40:15 +0200 (CEST)
Date: Thu, 24 Jun 2021 19:40:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 30/34] monitor: allow register hmp commands
Message-ID: <20210624174015.kn2oevipk6bau44z@sirius.home.kraxel.org>
References: <20210624103836.2382472-1-kraxel@redhat.com>
 <20210624103836.2382472-31-kraxel@redhat.com>
 <YNSc4TGa1EIb61H/@work-vm>
MIME-Version: 1.0
In-Reply-To: <YNSc4TGa1EIb61H/@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 03:55:29PM +0100, Dr. David Alan Gilbert wrote:
> * Gerd Hoffmann (kraxel@redhat.com) wrote:
> > Allow commands having a NULL cmd pointer, add a function to set the
> > pointer later.  Use case: allow modules implement hmp commands.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> So this is OK, so
> 
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> however, I can imagine:
>   a) Auto load as you suggest

Not sure about that.  The tcg monitor commands are pointless when you
picked another accelerator, and "info usbhost" would probably also be
most useful when trouble-shooting usb-host issues.  That's why I left
it as FIXME question for now.  But can certainly be done, we can add
something along the lines of 'module_hmp("info usbhost");' to the
meta-data database and autoload based on that (or use it for more
verbose error messages).

>   c) Don't actually define the command in the tables at all; make
>      the module actually add the command to the table.

Another possible approach.  I don't see a need for modules to expand the
list of commands though, so I only set the function pointer for existing
table entries ...

take care,
  Gerd


