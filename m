Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7692E369630
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:32:54 +0200 (CEST)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxnZ-0000aI-HM
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lZxlp-0007md-P2
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lZxlm-0000cG-EU
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619191861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xgYjixjgRF1rM4Au2Akfj0nFwMMU3SWxorFJOP5bps=;
 b=QoFdGXgOwlaMzJmyWJ4JUm2YfWHHQIHEg/LGkI6M0U+IySY3aDakNJNzXIQxsrT2Ycgi2v
 kOxL6epdbPpigO7dGhmjXvYOXp0K0o+GRA8D1v9pCkfx8/MOUvsObKft6hAkUqs9fA+I7+
 WpUFEGFu4B0QbHj9Mnvama9OMTI3Sro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-Z9F5A-0xNliGDWr4L-_Asw-1; Fri, 23 Apr 2021 11:29:43 -0400
X-MC-Unique: Z9F5A-0xNliGDWr4L-_Asw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D291E6D4E0;
 Fri, 23 Apr 2021 15:29:42 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.36.110.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 766235C1BB;
 Fri, 23 Apr 2021 15:29:42 +0000 (UTC)
Received: from elisabeth (238-055-210-188.ip-addr.inexio.net [188.210.55.238])
 by maya.cloud.tilaa.com (Postfix) with ESMTPSA id A712A40098;
 Fri, 23 Apr 2021 17:29:41 +0200 (CEST)
Date: Fri, 23 Apr 2021 17:29:40 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Ralph Schmieder <ralph.schmieder@gmail.com>
Subject: Re: socket.c added support for unix domain socket datagram transport
Message-ID: <20210423172940.14f48b49@elisabeth>
In-Reply-To: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ralph,

On Fri, 23 Apr 2021 08:56:48 +0200
Ralph Schmieder <ralph.schmieder@gmail.com> wrote:

> Hey...  new to this list.  I was looking for a way to use Unix domain
> sockets as a network transport between local VMs.
> 
> I'm part of a team where we run dozens if not hundreds of VMs on a
> single compute instance which are highly interconnected.
> 
> In the current implementation, I use UDP sockets (e.g. something like 
> 
> -netdev
> id=bla,type=socket,udp=localhost:1234,localaddr=localhost:5678) 
> 
> which works great.
> 
> The downside of this approach is that I need to keep track of all the
> UDP ports in use and that there's a potential for clashes.  Clearly,
> having Unix domain sockets where I could store the sockets in the
> VM's directory would be much easier to manage.
> 
> However, even though there is some AF_UNIX support in net/socket.c,
> it's
> 
> - not configurable
> - it doesn't work

I hate to say this, but I've been working on something very similar
just in the past days, with the notable difference that I'm using
stream-oriented AF_UNIX sockets instead of datagram-oriented.

I have a similar use case, and after some experiments I picked a
stream-oriented socket over datagram-oriented because:

- overhead appears to be the same

- message boundaries make little sense here -- you already have a
  32-bit vnet header with the message size defining the message
  boundaries

- datagram-oriented AF_UNIX sockets are actually reliable and there's
  no packet reordering on Linux, but this is not "formally" guaranteed

- it's helpful for me to know when a qemu instance disconnects for any
  reason

> As a side note, I tried to pass in an already open FD, but that
> didn't work either.

This actually worked for me as a quick work-around, either with:
	https://github.com/StevenVanAcker/udstools

or with a trivial C implementation of that, that does essentially:

	fd = strtol(argv[1], NULL, 0);
	if (fd < 3 || fd > INT_MAX || errno)
		usage(argv[0]);

	s = socket(AF_UNIX, SOCK_STREAM, 0);
	if (s < 0) {
		perror("socket");
		exit(EXIT_FAILURE);
	}

	if (connect(s, (const struct sockaddr *)&addr, sizeof(addr)) < 0) {
		perror("connect");
		exit(EXIT_FAILURE);
	}

	if (dup2(s, (int)fd) < 0) {
		perror("dup");
		exit(EXIT_FAILURE);
	}

	close(s);

	execvp(argv[2], argv + 2);
	perror("execvp");

where argv[1] is the socket number you pass in the qemu command line
(-net socket,fd=X) and argv[2] is the path to qemu.

> So, I added some code which does work for me... e.g.
> 
> - can specify the socket paths like -netdev
> id=bla,type=socket,unix=/tmp/in:/tmp/out
> - it does forward packets between two Qemu instances running
> back-to-back
> 
> I'm wondering if this is of interest for the wider community and, if
> so, how to proceed.
> 
> Thanks,
> -ralph
> 
> Commit
> https://github.com/rschmied/qemu/commit/73f02114e718ec898c7cd8e855d0d5d5d7abe362

I think your patch could be a bit simpler, as you could mostly reuse
net_socket_udp_init() for your initialisation, and perhaps rename it to
net_socket_dgram_init().

Anyway, I wonder, would my approach work for you instead? I'm posting my
patch in a minute.

-- 
Stefano


