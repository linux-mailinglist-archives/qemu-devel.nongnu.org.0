Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4BE3E071C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:03:25 +0200 (CEST)
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLEi-0002De-1B
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBJ8S-0000nF-VQ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBJ8Q-0005os-3L
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628092124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qfm13GfOLKig6tnOxjUxxob5R+AMui9iAEaLXzD7DKw=;
 b=WzXhBlaFz4pha3Q4ub2xKpmdIYiQyWQmPkWFjzyfaGl2/8VLtAJmogXUR0PxrE/ymJJ1aU
 mJKj2BX+cNC3m2QvkdaGgGMZ5Z7Q7otqmuhX63q9IFaEOSpkkMp/SXnBJp1/p8O8IywAl3
 IR8Lep5iPw5WwpOzMZZpSL4lw2mUVgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-dHgHf1NoMjamh997qsCYcQ-1; Wed, 04 Aug 2021 11:48:42 -0400
X-MC-Unique: dHgHf1NoMjamh997qsCYcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CADE8190A7A1;
 Wed,  4 Aug 2021 15:48:40 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6578790A9;
 Wed,  4 Aug 2021 15:48:25 +0000 (UTC)
Date: Wed, 4 Aug 2021 10:48:23 -0500
From: Eric Blake <eblake@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V5 03/25] cpr: QMP interfaces for reboot
Message-ID: <20210804154823.xr75z5u65nk7oufg@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-4-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1625678434-240960-4-git-send-email-steven.sistare@oracle.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 10:20:12AM -0700, Steve Sistare wrote:
> cprsave calls cprsave().  Syntax:
>   { 'enum': 'CprMode', 'data': [ 'reboot' ] }
>   { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'CprMode' } }
> 
> cprload calls cprload().  Syntax:
>   { 'command': 'cprload', 'data': { 'file': 'str' } }

Does this also allow the magic "/dev/fdset/NNN" syntax for opening an
fd already passed in previously?
/me goes back to patch 2 to check
Yes, it looks like it should.

> 
> cprinfo returns a list of supported modes.  Syntax:
>   { 'struct': 'CprInfo', 'data': { 'modes': [ 'CprMode' ] } }
>   { 'command': 'cprinfo', 'returns': 'CprInfo' }

As pointed out elsewhere, relying on introspection seems nicer than
adding this command.

> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---

> +++ b/qapi/cpr.json
> @@ -0,0 +1,74 @@
> +# -*- Mode: Python -*-
> +#
> +# Copyright (c) 2021 Oracle and/or its affiliates.
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.
> +# See the COPYING file in the top-level directory.
> +
> +##
> +# = CPR

Might be worth expanding what this acronym stands for here.

> +##
> +
> +{ 'include': 'common.json' }
> +
> +##
> +# @CprMode:
> +#
> +# @reboot: checkpoint can be cprload'ed after a host kexec reboot.
> +#
> +# Since: 6.1

As this missed 6.1, you'll need to (eventually) rebase the series to
mention 6.2 everywhere.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


