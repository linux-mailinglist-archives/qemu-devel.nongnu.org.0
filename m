Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9011403DA6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:35:44 +0200 (CEST)
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0Y3-0007uu-Q4
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mO0WS-0006XR-Q4
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mO0WQ-0005v2-GC
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631118841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqAaHj+Qw9fJIDXO5aJpTzl5OOHAidl95tsS+U6GcwA=;
 b=KUMtkKJwq7AYUE03EjGY/V+ZQUufMf0dKsmMzHmV/AXeGqcgA7AFYbPHCjuM/klaUy3uUs
 K6Qf6sZd1jXLwCXVuGLIui/NuqcNjmBXuYuPsopDPZQ53rrfBeDDpNFqqX2KHv6dqJPAfE
 tcvaRxO3oRDCwOu5wRP/L4cKGt6CBKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-AN4dBfQFO_iml7x7hwq3GA-1; Wed, 08 Sep 2021 12:33:58 -0400
X-MC-Unique: AN4dBfQFO_iml7x7hwq3GA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD7A09F92A
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 16:33:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0E3060C04;
 Wed,  8 Sep 2021 16:33:53 +0000 (UTC)
Date: Wed, 8 Sep 2021 17:33:52 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Compatibility between -device sga and -machine graphics=off
Message-ID: <20210908163352.GA12952@redhat.com>
References: <YTjf6BhpPU3aLct9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTjf6BhpPU3aLct9@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Just commenting from the libguestfs POV:

We don't care about migration, and:

On Wed, Sep 08, 2021 at 05:08:08PM +0100, Daniel P. Berrangé wrote:
> On non-x86 emulators I see graphics=off has semantic effects beyond
> just controlling whether the firmware prints to the serial or not
> though. IOW it is overloaded to do multiple jobs, while -device sga
> only did one specific job. This makes graphics=off somewhat undesirable
> to use.  We're possibly lucky in this specific case though, because
> the 'sgabios.bin' ROM is x86 asm code, so was never valid to use in
> the non-x86 case.

we only enable <bios useserial=yes/> on i686 & x86-64.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


