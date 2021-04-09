Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F85359D15
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:18:36 +0200 (CEST)
Received: from localhost ([::1]:48162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUp9n-0004ix-5R
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUp92-0004JQ-I3
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUp8z-0005cP-91
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617967064;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EgnU/iXIKZMb+LzIC+MUlOgWLqUG3VBQfnnFHbr3QdE=;
 b=OV/qxEWuPC2qBqtEygbS/FNANwO1QLrEeP0IsZJYQvnc4cRsZZkNA0QqAOiVnJTacX/L8N
 7oi2mbRMF5aqbfO5GmEZ/JBi7lNFbAow9gKiaxbIxtoSkka8y+RbFUpLe5mYo1GlYZl8mZ
 82tocpS5bxk45zjcUTjFaYH32VRjyEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-ZNExKzJiPe2RZtZea0IFvg-1; Fri, 09 Apr 2021 07:17:39 -0400
X-MC-Unique: ZNExKzJiPe2RZtZea0IFvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23A07107ACE4
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 11:17:39 +0000 (UTC)
Received: from redhat.com (ovpn-115-36.ams2.redhat.com [10.36.115.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FAE060BE5;
 Fri,  9 Apr 2021 11:17:30 +0000 (UTC)
Date: Fri, 9 Apr 2021 12:17:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] qemu-trace-stap: changing SYSTEMTAP_TAPSET considered
 harmful.
Message-ID: <YHA3yGYQ9xSbbB+M@redhat.com>
References: <20210409105810.374976-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210409105810.374976-1-kraxel@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 12:58:10PM +0200, Gerd Hoffmann wrote:
> Setting SYSTEMTAP_TAPSET to some value other than
> /usr/share/systemtap/tapsets results in systemtap not finding the
> standard tapset library any more, which in turn breaks tracing because
> pid() and other standard systemtap functions are not available any more.
> 
> So using SYSTEMTAP_TAPSET to point systemtap to the qemu probes will
> only work for the prefix=/usr installs because both qemu and system
> tapsets in the same directory then.  All other prefixes are broken.
> 
> Fix that by using the "-I $tapsetdir" command line switch instead.

Do you know if "-I tapsetdir" appends or prepends to the search path ?

We need it to prepend to ensure that we override any QEMU stp files
that might be already present in /usr/share from an RPM provided
QEMU binary.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


