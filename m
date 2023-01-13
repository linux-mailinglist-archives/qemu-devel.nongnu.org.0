Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A70669198
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:50:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFkw-00049k-Oq; Fri, 13 Jan 2023 03:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGFku-00047X-Ai
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:49:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGFks-0006EC-Kr
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673599781;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ba2IJFdAUezeqofLYXJnObx5GxI6O197SyB8aBbzvdc=;
 b=S+W5F1sqIeCFpjLFoZXTlDG3xiwnOO/HY30h0z0DpP6YhKJZkq2i9hHj4WZQyAH2UIdoUs
 7LeK4gpjBMoCqxjYjCw+O2tHg0WdpwleKpA3JT1UVHid6CYvlyRZ7VhbJVK4kCjuI1Qqtx
 uzSInHzB0j/0Nd410AI3RpFxdq7G93A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-KSZQnU1sNyOuekW43eUnMw-1; Fri, 13 Jan 2023 03:49:40 -0500
X-MC-Unique: KSZQnU1sNyOuekW43eUnMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41D5B2804132;
 Fri, 13 Jan 2023 08:49:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58E511759E;
 Fri, 13 Jan 2023 08:49:39 +0000 (UTC)
Date: Fri, 13 Jan 2023 08:49:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: qemu-devel@nongnu.org
Subject: Re: regression in booting with -kernel in 7.2.0
Message-ID: <Y8EbHiZtPENQj4tm@redhat.com>
References: <Y8EJ9iXhEzmjI67A@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8EJ9iXhEzmjI67A@infradead.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 12, 2023 at 11:36:22PM -0800, Christoph Hellwig wrote:
> Hi all,
> 
> qemu 7.2.0 fails to boot my usual test setup using -kernel (see
> the actual script below).  I've bisected this down to:
> 
> commit ffe2d2382e5f1aae1abc4081af407905ef380311
> Author: Jason A. Donenfeld <Jason@zx2c4.com>
> Date:   Wed Sep 21 11:31:34 2022 +0200
> 
>     x86: re-enable rng seeding via SetupData
> 
> with this commit I don't even get to kernel console output, with it
> reverted it boots fine (although with 7.2 configuring the network
> takes forever, the actua bisection point before the commit does not
> show that issue)

Workaround is -machine pc-i440fx-7.1

Latest proposed fix IIRC is

  https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04862.html


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


