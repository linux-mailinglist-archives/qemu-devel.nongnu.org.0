Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6832DC06C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 13:42:30 +0100 (CET)
Received: from localhost ([::1]:39204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpW8S-000372-7Z
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 07:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpW6v-0002Az-V8
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 07:40:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpW6r-0000P4-3p
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 07:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608122448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwaJIsXE6HK22iU9sMmhNcYYnH/WoPlOJUMwiXyqyR8=;
 b=iQtO2PAQPuZT2QtGye/N2z6No8xe/2ApSvIn611wmgY+wKEWVFdH9b388EFIyio6DzKG2P
 SeBjBUBEeRbPdu4q1hL1J5ZJtTtolhWJQzlF5gZB5Srg2iWKZOcEXtYMw8goTWeK6mbi51
 B0BD8DS91BcrJ9fm3sUZXmsVx3ACJns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-ca1mD09JM_6k5EOO5csATw-1; Wed, 16 Dec 2020 07:40:44 -0500
X-MC-Unique: ca1mD09JM_6k5EOO5csATw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 133F01015C80;
 Wed, 16 Dec 2020 12:40:43 +0000 (UTC)
Received: from gondolin (ovpn-113-163.ams2.redhat.com [10.36.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDDD85D9C0;
 Wed, 16 Dec 2020 12:40:41 +0000 (UTC)
Date: Wed, 16 Dec 2020 13:40:39 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-6.0] qga/commands-posix: Send CCW address on s390x
 with the fsinfo data
Message-ID: <20201216134039.41655931.cohuck@redhat.com>
In-Reply-To: <19721a4f-d566-44d5-6eb6-ff892e5cb502@redhat.com>
References: <20201125105417.380317-1-thuth@redhat.com>
 <19721a4f-d566-44d5-6eb6-ff892e5cb502@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 09:53:21 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 25/11/2020 11.54, Thomas Huth wrote:
> > We need the CCW address on the libvirt side to correctly identify
> > the disk, so add this information to the GuestDiskAddress on s390x.
> > 
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1755075
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  qga/commands-posix.c | 34 ++++++++++++++++++++++++++++++++++
> >  qga/qapi-schema.json | 19 ++++++++++++++++++-
> >  2 files changed, 52 insertions(+), 1 deletion(-)

> Ping!
> 
> Michael, any comments on this, or do you think that it ready to go?

If nobody objects, I can also merge this (or rather the v2 of this
patch) through the s390x tree.


