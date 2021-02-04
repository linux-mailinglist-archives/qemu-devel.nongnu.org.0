Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43FD30F0D9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:36:51 +0100 (CET)
Received: from localhost ([::1]:49842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7c0I-0001qu-Pi
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7bUb-00087p-Lk
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7bUV-0002YR-Cb
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612433037;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9BDVADQ0mcVQaOwNxj8VHctsIgIoQKuqytJauAGeKTo=;
 b=GWBGAJsn7tryxUqcz6D0KQ700BCucPVV/Qi9dKZRmePgN5oXGDd3IEYLBCzSKlJt74X2xD
 /ifIB6tP2qbnDeozseCnSL8F1YrvR9IVllmC+DZ2GQ8J5o/mfPPLxA/CzjrVp0kbcE7FfV
 ie2L6JcjWPiGrqDywF3cOM6zm1TNIP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-CH-KwBwuP56XA_eczak3NQ-1; Thu, 04 Feb 2021 05:03:54 -0500
X-MC-Unique: CH-KwBwuP56XA_eczak3NQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93FBB107ACC7;
 Thu,  4 Feb 2021 10:03:53 +0000 (UTC)
Received: from redhat.com (ovpn-115-169.ams2.redhat.com [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55B53722E4;
 Thu,  4 Feb 2021 10:03:52 +0000 (UTC)
Date: Thu, 4 Feb 2021 10:03:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH v3 0/3]
Message-ID: <20210204100349.GF549438@redhat.com>
References: <20210203233539.1990032-1-dje@google.com>
MIME-Version: 1.0
In-Reply-To: <20210203233539.1990032-1-dje@google.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 03:35:36PM -0800, dje--- via wrote:
> Add support for ipv6 host forwarding
> 
> This patchset takes the original patch from Maxim,
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
> and updates it.
> 
> New option: -ipv6-hostfwd
> 
> New commands: ipv6_hostfwd_add, ipv6_hostfwd_remove
> 
> These are the ipv6 equivalents of their ipv4 counterparts.

Before I noticed this v3, I send a reply to your v2 sugesting
that we don't need to add any new commands/options. We can
use existing inet_parse() helper function to parse the address
info and transparently support IPv4/6 in the existing commands
and options. This matches normal practice elsewhere in QEMU
for IP dual stack.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


