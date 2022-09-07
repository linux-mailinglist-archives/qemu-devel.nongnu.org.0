Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BE5AFE45
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 09:59:55 +0200 (CEST)
Received: from localhost ([::1]:40220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVpyO-0001vM-QR
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 03:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVpwd-0000YL-RF
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 03:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVpwb-000367-24
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 03:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662537474;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2A7pM8z/KhzHmoG46+xBmRsLQRtsuvvaO5NdQhHRkBo=;
 b=TD4KkeXokY3F8311Et0QsyxR1lFxcXkEd+ENZvtwevrWZQAyE1gh5z/ySywMMAPdTIv5Nd
 tIqxlBhE72Pe46+kS+GJxz5b5iRrlZtc7VoApNVSdnvXZjErebXR1DFAB/POEtIGLibPSf
 qWtizFl986cq/890pLUCed8r9dKhM84=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-d3OzDvmVMOOpPpOTSDZ-kw-1; Wed, 07 Sep 2022 03:57:52 -0400
X-MC-Unique: d3OzDvmVMOOpPpOTSDZ-kw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A533A801231
 for <qemu-devel@nongnu.org>; Wed,  7 Sep 2022 07:57:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7C1940CF916;
 Wed,  7 Sep 2022 07:57:51 +0000 (UTC)
Date: Wed, 7 Sep 2022 08:57:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Maximum QMP reply size
Message-ID: <YxhO/bIBP9opP3gD@redhat.com>
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Sep 06, 2022 at 03:38:54PM -0400, John Snow wrote:
> Hi, I suspect I have asked this before, but I didn't write it down in
> a comment, so I forget my justification...
> 
> In the QMP lib, we need to set a buffering limit for how big a QMP
> message can be -- In practice, I found that the largest possible
> response was the QAPI schema reply, and I set the code to this:
> 
>     # Maximum allowable size of read buffer
>     _limit = (64 * 1024)
> 
> However, I didn't document if this was a reasonable limit or just a
> "worksforme" one. I assume that there's no hard limit for the protocol
> or the implementation thereof in QEMU. Is there any kind of value here
> that would be more sensible than another?

As a reference, libvirt arbitrarily chose 10 MB as the QMP reply
limit. It is huge enough it'll be hard to make a QMP reply exceed
that, but also still tiny in the context of managing VMs on a host
with GB's of RAM.  NB, this doesn't mean we allocate 10 MB every
time, it is just an upper bound - we only allocate what we actually
need.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


