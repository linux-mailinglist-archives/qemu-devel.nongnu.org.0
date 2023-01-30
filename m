Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196786813F6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:59:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVbw-000247-NF; Mon, 30 Jan 2023 09:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMVbu-00023I-NU
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:58:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMVbs-0001Kb-Pq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675090696;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3Os1cc3Uo1yhimk558/jHOwTQOMbrcSqXo4IMH5pRWc=;
 b=hSMKn31vSFb4IWhHmxT0e+os775obKhyLM+JnrGD4wj8ctWg/GSLZBPcRWkIDN9cxypSZa
 8g6whTKBgiCe7vZwr1E5kuk7KtAYB/0L3S72OypxeEtHRM0C3xuPFghnHrAujE8yxGEhfg
 MzvTBFzA7TDZP3CYuUZVsCfn6e8skOw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-G-EHIDGPOxqudl_MeW0eXQ-1; Mon, 30 Jan 2023 09:58:12 -0500
X-MC-Unique: G-EHIDGPOxqudl_MeW0eXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4E703823A14;
 Mon, 30 Jan 2023 14:58:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5951340C2064;
 Mon, 30 Jan 2023 14:58:10 +0000 (UTC)
Date: Mon, 30 Jan 2023 14:58:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, rjones@redhat.com,
 kwolf@redhat.com
Subject: Re: RFC: towards systemd socket activation in q-s-d
Message-ID: <Y9fa+Zm5VLNoDDo0@redhat.com>
References: <20230127212233.k6rlqkmubhovjxs4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230127212233.k6rlqkmubhovjxs4@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Jan 27, 2023 at 03:26:15PM -0600, Eric Blake wrote:
> In https://bugzilla.redhat.com/show_bug.cgi?id=2055229, the question
> was raised on how to make qemu-storage-daemon sufficiently powerful to
> be a full-blown replacement to qemu-nbd.  One of the features still
> lacking is the ability to do systemd socket activation (qemu-nbd does
> this, qemu-storage-daemon needs a way to do it).
> 
> But that bug further noted that systemd supports LISTEN_FDNAMES to
> supply names to a passed-in fd (right now, qemu-nbd does not use
> names, but merely expects one fd in LISTEN_FDS).  Dan had the idea
> that it would be nice to write a systemd file that passes in a socket
> name for a QMP socket, as in:
> 
>  [Socket]
>  ListenStream=/var/run/myapp/qsd.qmp
>  FileDescriptorName=qmp
>  Service=myapp-qsd.service
> 
> and further notes that QAPI SocketAddressType supports @fd which is a
> name in QMP (a previously-added fd passed through the older 'getfd'
> command, rather than the newer 'add-fd' command), but an integer on
> the command line.  With LISTEN_FDNAMES, we could mix systemd socket
> activation with named fds for any command line usage that already
> supports SocketAddressType (not limited to just q-s-d usage).

Yes, I think should really frame the problem more generally than
merely q-s-d and/or single sockets, so we don't tie ourselves into
something overly limited in scope.

I'm particularly thinking about our long term desire to be able to
fully manage QEMU system emulators via QMP with zero command line
guest config aspects. q-s-d is simply special in that it is fairly
close in operation to what we want to eventially achieve with the
QEMU system emulators with near 100% QMP configurability.


Currently with runtime configuration we can use getfd to pass a
FD over a UNIX socket, associating it with a name, that you can
reference in SocketAddress structs (and potentially elsewhere).

If we assume that QEMU could be started with  -config /some/guest.json
which contains a sequence of QMP commands, then the 'getfd' command is
not usable because QEMU would just be loading the commands from the
JSON file and have no UNIX socket over which to receive the FDs. 

Obviously at startup QEMU can trivially inherit the FDs from whatever
spawned it. The only task is to identify the FDs that are passed into,
and systemd defined a mechanism for this using LISTEN_FDNAMES. IOW the
socket activation can fully replace 'getfd' for purpose of initial
startup. This will get rid of the annoying difference that SocketAddress
only allows numeric FDs at startup and named FDs at runtime, by making
named FDs the consistent standard. We could thus deprecate the use of
non-named numeric FDs in SocketAddress to improve our sanity.

The question is how to define semantics for the LISTEN_FDNAMES while
also still remaining back compat with the existing QEMU utilities
that allow socket activation. Some kind of naming scheme would need
to be decided upon, as well as handling the use of activation without
LISTEN_FDNAMES BEING SET. 

> I'm at a point where I can take a shot at implementing this, but want
> some feedback on whether it is better to try to shoehorn a generic
> solution into the existing @fd member of the SocketAddressType union,
> or whether it would be better to add yet another union member
> @systemd-fd or some similar name to make it explicit when a command
> line parameter wants to refer to an fd being passed through systemd
> socket activation LISTEN_FDS and friends.

I don't think we should change SocketAddress at all, just use the
@fd member that already exists, by fixing its semantics to always
take an alphanumeric FD name and deprecate the use of pure numeric
FD numbers.

Currently the socket code has an annoying structural connection
to the monitor code, because the monitor is tracking the passed
in FDs.

It would be nice to separate this by introducing some dedicated
APIs for handling named FDs. The monitor can feed named FDs into
this from getfd, and the CLI can feed named FDS into this from
activation.   The socket code can then use these named FD handling
APIs and thus isolate/detach itself from the monitor.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


