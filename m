Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3302072A9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:57:38 +0200 (CEST)
Received: from localhost ([::1]:53106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo424-0005LH-OX
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jo41D-0004cy-Eb
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:56:43 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24181
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jo41A-0001wa-Bf
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592999798;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hPgG+QNz7Ag3vyev3AAZSuIE6qYdSdP3b4ZpTVcWbvw=;
 b=DJf4dRA81fqUbZ7MrhyzpaOmdX++r3CzkJpsxPMf6m8DFqCMH9zEfiKPT5PAkaCh37Cmhm
 lfJ9Zn1YY7pCrwsm58XJ7nlJeJlmwBTbn4LT3k8RH8umWsVLA2mLxusD51q2JRqdAB709J
 YUg9a8EnIcHsNh1mWnZkILIR/jEWy2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-oMS8yBkfMiK36jGipPb1BA-1; Wed, 24 Jun 2020 07:56:28 -0400
X-MC-Unique: oMS8yBkfMiK36jGipPb1BA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E52E98064AC;
 Wed, 24 Jun 2020 11:56:27 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F4BA619C8;
 Wed, 24 Jun 2020 11:56:18 +0000 (UTC)
Date: Wed, 24 Jun 2020 12:56:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Szymon Lukasz <noh4hss@gmail.com>
Subject: Re: [PATCH v2 0/6] virtio-console: notify about the terminal size
Message-ID: <20200624115615.GI774096@redhat.com>
References: <20200624112640.82673-1-noh4hss@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200624112640.82673-1-noh4hss@gmail.com>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: lvivier@redhat.com, mst@redhat.com, amit@kernel.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 24, 2020 at 01:26:34PM +0200, Szymon Lukasz wrote:
> In this series resize notifications are only supported for the stdio
> backend but I think it should be easy to add support for the vc backend.
> Support for tty/serial backends is complicated by the fact that there is
> no clean way to detect resizes of the underlying terminal.

In a libvirt managed scenario it is typical to have the virtio console
connected to a UNIX socket. It would be desirable to have a way to
deal with resizes there.

QEMU socket chardev (TCP & UNIX socket) supports a "telnet" protocol
addition. Currently it doesn't almost nothing useful, but in theory
we could wire up support for the telnet resize message:

   https://tools.ietf.org/html/rfc1073


Another option is to allow dealing with resizes out of band, via the
QMP monitor. ie we can introduce a qmp_chardev_winsize command that
a client app can use to trigger the resize message to the guest OS.
From libvirt's POV, this would be quite easy to support & useful to
have.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


