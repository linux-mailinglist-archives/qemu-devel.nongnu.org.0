Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56158524D96
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 14:55:46 +0200 (CEST)
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np8M5-0003ar-FC
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 08:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np8KO-0002uF-5M
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np8KK-0001Cb-9F
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652360035;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eVweywNouTO6Fz1uTtJvF3r4GsqGHaGT8DQxUNXIYFI=;
 b=Ca/7M5GYUH6O9bfF1JZgtSQxvyLEymocyFNXXfXggJFA5MYENZAWInxzSfrU8CKxQ8CMpc
 rhulZvyYdEIbcMP03TxCCQAdvb6wdQ1LsPfeGSDr4Xt2EJKI8NrDlWeWg2cdWP0Hg+pD1S
 Rw8/4g5W2st7ohjRjvIJjLhs+065rWE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-qHoMOA1sPBOsKR7YTiIC2w-1; Thu, 12 May 2022 08:53:53 -0400
X-MC-Unique: qHoMOA1sPBOsKR7YTiIC2w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71A6F1C00AC1
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 12:53:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 682065737DA;
 Thu, 12 May 2022 12:53:52 +0000 (UTC)
Date: Thu, 12 May 2022 13:53:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] qapi: make machine type deprecation a warning
Message-ID: <Yn0DXRo7NhxJ51KX@redhat.com>
References: <20220511175043.27327-1-pbonzini@redhat.com>
 <87a6bn9gg3.fsf@pond.sub.org>
 <4970cd1d-6801-9a57-04a7-1e907c1b7fcf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4970cd1d-6801-9a57-04a7-1e907c1b7fcf@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Thu, May 12, 2022 at 02:24:35PM +0200, Paolo Bonzini wrote:
> On 5/12/22 12:46, Markus Armbruster wrote:
> > Commit message nitpick: not sure this is "qapi:".  The commit that
> > introduced "Machine type ... is deprecated" (08fe68244eb) used
> > "hw/i386:".  We commonly use "vl:", "softmmu:", and "softmmu/vl:" for
> > this file.
> 
> Will do.
> 
> I wonder if I should already propose renaming vl.c to climain.c, even if
> there's no qmpmain.c yet.  Emotional/historical attachment is probably not
> good enough of a reason to keep that name.
> 
> I suppose this is already a proposal.

For all the othe tools we just use the filename $TOOL.c,  eg qemu-img.c,
etc. So what about qemu-system.c

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


