Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B93C32B677
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:12:49 +0100 (CET)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOUq-00037A-3j
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHOQ8-00077S-Aj
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:07:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHOQ6-00070n-Ar
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614766073;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8rQydRYdwM7yO7QnEqS+ospXXGXPYtEjZC+OIv8Yyg=;
 b=iHGYK7uPJmLo9WyzlKWIiwNFYD3np8KbDt8TQIJdr1HV2Zdm18tyGiEfx3OxQf3PIJrEtk
 TlwL8ObJeecCAQYnjnJhUh0SpW/1/ZKQhPz+7A2zgahrzxRMnPo7WCXi26J3P75Xn7VStQ
 yu5ALGpw43A3o6eBbfZSyrsQe/IYwP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-X31-c4uMP5WQE-BnQo6gDg-1; Wed, 03 Mar 2021 05:07:51 -0500
X-MC-Unique: X31-c4uMP5WQE-BnQo6gDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEBFE107ACE4;
 Wed,  3 Mar 2021 10:07:49 +0000 (UTC)
Received: from redhat.com (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 617FA19C48;
 Wed,  3 Mar 2021 10:07:45 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:07:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] qapi, audio: add query-audiodev command
Message-ID: <YD9f7nkgz/MkLhOy@redhat.com>
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-2-berrange@redhat.com>
 <6ed46b74-c426-0c85-61eb-668f49a31795@redhat.com>
 <562f8b94-b222-7b31-5a3b-3b96817faea4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <562f8b94-b222-7b31-5a3b-3b96817faea4@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Tue, Mar 02, 2021 at 10:12:43PM +0100, Philippe Mathieu-Daudé wrote:
> On 3/2/21 10:10 PM, Philippe Mathieu-Daudé wrote:
> > On 3/2/21 6:55 PM, Daniel P. Berrangé wrote:
> >> Way back in QEMU 4.0, the -audiodev command line option was introduced
> >> for configuring audio backends. This CLI option does not use QemuOpts
> >> so it is not visible for introspection in 'query-command-line-options',
> >> instead using the QAPI Audiodev type.  Unfortunately there is also no
> >> QMP command that uses the Audiodev type, so it is not introspectable
> >> with 'query-qmp-schema' either.
> >>
> >> This introduces a 'query-audiodev' command that simply reflects back
> >> the list of configured -audiodev command line options. This in turn
> >> makes Audiodev introspectable via 'query-qmp-schema'.
> >>
> >> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> >> ---
> >>  audio/audio.c   | 19 +++++++++++++++++++
> >>  qapi/audio.json | 13 +++++++++++++
> >>  2 files changed, 32 insertions(+)
> > 
> >> +
> >> +##
> >> +# @query-audiodevs:
> >> +#
> >> +# Returns information about audiodev configuration
> >> +#
> >> +# Returns: array of @Audiodev
> 
> Also with chardev we return ChardevBackendInfo. I'm not sure
> if this is because I'm custom to read it, but it seems clearer.
> Can we return a AudiodevBackendInfo type?

Chardevs are not a good guide as they have this wierd split betweeen
manually written Chardev type and QAPI driven ChardeBackendInfo type.

With audio backends, we only have the Audiodev QAPI type. There is
no AudiodevBackendInfo.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


