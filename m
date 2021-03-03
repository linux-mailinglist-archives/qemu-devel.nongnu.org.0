Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911432B675
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:09:58 +0100 (CET)
Received: from localhost ([::1]:58330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOS5-000093-CW
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHOQk-0007hQ-Ps
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:08:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHOQh-0007BZ-W5
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614766111;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuPcxdwOm8MG/RdHVCw1gXP8pO9Q3aTIscv8jzdjoGs=;
 b=N9pIlV3ns6dQq6124qqWTKtNE2PI57twIjXYu/hz+LE2qYe0gMpmYWhAgA4hBcd/yyW8Hs
 d2llNChK90q36s05yr66y9I2vPj/AgwYPahRddz5jUqC+6cm+fdjLGGxuSCY7O94+cJC/e
 RCFpR6KEYTv36EMmjVkY1v/HELGUOxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-DScXdRzmNJqCBuv6TJA1XA-1; Wed, 03 Mar 2021 05:08:29 -0500
X-MC-Unique: DScXdRzmNJqCBuv6TJA1XA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 987B0100CCC2;
 Wed,  3 Mar 2021 10:08:28 +0000 (UTC)
Received: from redhat.com (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1292B669EC;
 Wed,  3 Mar 2021 10:08:22 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:08:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] qapi, audio: add query-audiodev command
Message-ID: <YD9gFCmX8BS/fLTQ@redhat.com>
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-2-berrange@redhat.com>
 <6ed46b74-c426-0c85-61eb-668f49a31795@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6ed46b74-c426-0c85-61eb-668f49a31795@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 10:10:56PM +0100, Philippe Mathieu-Daudé wrote:
> On 3/2/21 6:55 PM, Daniel P. Berrangé wrote:
> > Way back in QEMU 4.0, the -audiodev command line option was introduced
> > for configuring audio backends. This CLI option does not use QemuOpts
> > so it is not visible for introspection in 'query-command-line-options',
> > instead using the QAPI Audiodev type.  Unfortunately there is also no
> > QMP command that uses the Audiodev type, so it is not introspectable
> > with 'query-qmp-schema' either.
> > 
> > This introduces a 'query-audiodev' command that simply reflects back
> > the list of configured -audiodev command line options. This in turn
> > makes Audiodev introspectable via 'query-qmp-schema'.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  audio/audio.c   | 19 +++++++++++++++++++
> >  qapi/audio.json | 13 +++++++++++++
> >  2 files changed, 32 insertions(+)
> 
> > +
> > +##
> > +# @query-audiodevs:
> > +#
> > +# Returns information about audiodev configuration
> > +#
> > +# Returns: array of @Audiodev
> > +#
> > +# Since: 6.0
> > +#
> > +##
> > +{ 'command': 'query-audiodevs',
> > +  'returns': ['Audiodev'] }
> > 
> 
> Can we use 'query-audiodev-backends' similarly to
> 'query-chardev-backends'?

IMHO adding "-backends" is redundant, because audiodev and chardev
objects are always backends.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


