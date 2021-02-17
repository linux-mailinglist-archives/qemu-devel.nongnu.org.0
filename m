Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FACF31D74B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 11:12:21 +0100 (CET)
Received: from localhost ([::1]:50548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCJoi-00038K-KL
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 05:12:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lCJnb-0002gd-Gm
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:11:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lCJnV-0003na-1T
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613556664;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGCARYHuqeK1GNAJ740oM3RPb5pbPTzxRtLvNV6oGEU=;
 b=GXvlXvnwq4JS+t/XWJ4G1IFFUzqnHy976hnrIB75k7Opm1R7K/JCs1BpHK5wNpF7NMnZgf
 eT7VYE3k8+JgZzLG71Z3xKpdOORURsdaAVmDP+3T+tN3qCzTQ2CoattNvXK04NqNV0s9PE
 5u6wXbgRg/5/9U5snpWCrnQsLVexnAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-whju3sFcMZSpFYYwHwRL8Q-1; Wed, 17 Feb 2021 05:11:02 -0500
X-MC-Unique: whju3sFcMZSpFYYwHwRL8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77ED58799EC;
 Wed, 17 Feb 2021 10:11:01 +0000 (UTC)
Received: from redhat.com (ovpn-115-175.ams2.redhat.com [10.36.115.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6977060C5F;
 Wed, 17 Feb 2021 10:11:00 +0000 (UTC)
Date: Wed, 17 Feb 2021 10:10:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 02/10] qemu-options: update to show preferred boolean
 syntax for -chardev
Message-ID: <YCzrsWuxoXXolo8U@redhat.com>
References: <20210216191027.595031-1-berrange@redhat.com>
 <20210216191027.595031-3-berrange@redhat.com>
 <CAFEAcA8Pjz8SuzuZVKNGCmS-QkewD-0MLSu+coOOvG88jKJq5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Pjz8SuzuZVKNGCmS-QkewD-0MLSu+coOOvG88jKJq5Q@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 09:08:39PM +0000, Peter Maydell wrote:
> On Tue, 16 Feb 2021 at 19:10, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > The preferred syntax is to use "foo=on|off", rather than a bare
> > "foo" or "nofoo".
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > -    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4][,ipv6][,nodelay][,reconnect=seconds]\n"
> > -    "         [,server][,nowait][,telnet][,websocket][,reconnect=seconds][,mux=on|off]\n"
> > +    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,delay=on|off][,reconnect=seconds]\n"
> 
> Watch out, 'nodelay' is a special case, where the option name itself
> starts with 'no':
> 
> { 'struct': 'ChardevSocket',
>   'data': { 'addr': 'SocketAddressLegacy',
>             '*tls-creds': 'str',
>             '*tls-authz'  : 'str',
>             '*server': 'bool',
>             '*wait': 'bool',
>             '*nodelay': 'bool',
>             '*telnet': 'bool',
>             '*tn3270': 'bool',
>             '*websocket': 'bool',
>             '*reconnect': 'int' },
>   'base': 'ChardevCommon' }
> 
> (because it's setting the TCP_NODELAY option).
> 
> This probably applies elsewhere, eg I suspect the 'nodelay' in
> patch 1 also should remain.

For added fun that's not what we call it in QemuOpts though !

In qemu_chr_parse_socket we do:

    sock->has_nodelay = qemu_opt_get(opts, "delay");
    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true);

So we really were relying on the "no$FOO" syntax here

Arguably it would be saner if we really did call it "nodelay" at the
QemuOpts level. I guess we trying to avoid having "nonodelay".

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


