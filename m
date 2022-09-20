Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7B25BE1ED
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 11:29:41 +0200 (CEST)
Received: from localhost ([::1]:60616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaZZT-0007A5-SX
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 05:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oaYVr-00084p-Mf
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:21:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oaYVk-0007wE-EE
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663662103;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TOwv/1mW7Rxtk0DkzDdr9JmZY+hoIN+3mhmumLI28nQ=;
 b=AccwFRXgl+fOoAFJnPhfirE/9QYsm1t6KDBX+xmIYb+Af5V3nKXOUZEqq5Xt7zE3wIbdUT
 hOZW//2716Q1dd2cwdJ2fyHdbAhw+t0+5MynOG5ipSbntCIW4CIIs4944bNiTY+M+piYPT
 ISdB9CGUssod1cKqJKDZAGIhuWgYtPU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-CosQiTrjOpyYCBCEE5kVxQ-1; Tue, 20 Sep 2022 04:21:40 -0400
X-MC-Unique: CosQiTrjOpyYCBCEE5kVxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC857858F13;
 Tue, 20 Sep 2022 08:21:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C373D1121314;
 Tue, 20 Sep 2022 08:21:38 +0000 (UTC)
Date: Tue, 20 Sep 2022 09:21:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Brad Smith <brad@comstyle.com>, John Snow <jsnow@redhat.com>
Subject: Re: QEMU's FreeBSD 13 CI job is failing
Message-ID: <Yyl4EO0L5h02HOLN@redhat.com>
References: <b403c8e4-3788-7ba1-a038-3a71fa0bc7c6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b403c8e4-3788-7ba1-a038-3a71fa0bc7c6@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 20, 2022 at 08:44:27AM +0200, Thomas Huth wrote:
> 
> Seen here for example:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3050165356#L2543
> 
> ld-elf.so.1: /lib/libc.so.7: version FBSD_1.7 required by
> /usr/local/lib/libpython3.9.so.1.0 not found
> ERROR: Cannot use '/usr/local/bin/python3', Python >= 3.6 is required.
> 
> ... looks like the Python binary is not working anymore? Does anybody know
> what happened here?

FreeBSD ports is only guaranteed to work with latest minor release
base image. The python binary recently started relying on symbols
in the 13.1 base image, and we're using 13.0.

I updated lcitool last week to pick 13.1, so we just need a refresh
on the QEMU side to pick this up.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


