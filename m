Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5602F64EA1F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:19:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68jf-0000St-W1; Fri, 16 Dec 2022 06:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p68jX-0000SK-Dc
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:18:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p68jU-0005Ld-G4
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671189502;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtiV3gBDQOJUUvidDLnevOvl7ZWDg5ISwHt+/xVCS6I=;
 b=JJO22wc4oyCucm97KVckV6CYFmT4UMDiB8NGTJ8bFwdhfpKad6eSbCjHD1RukPhiRaFbC6
 rXdbOS3yUPLHabO1AXSumNmJ6CvVqCJRgUR5YIknsnuQW/fyhxvp+jXHAVfBilg0QzPDPE
 WyNVczjExgihtqIwwEwGDeqexsy2E8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-nBfkuk1GNwiGEr14Gbpp1g-1; Fri, 16 Dec 2022 06:18:19 -0500
X-MC-Unique: nBfkuk1GNwiGEr14Gbpp1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87B7F1871D94;
 Fri, 16 Dec 2022 11:18:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0E5E2026D68;
 Fri, 16 Dec 2022 11:18:15 +0000 (UTC)
Date: Fri, 16 Dec 2022 11:18:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Peter Lieven <pl@kamp.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, libvir-list@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 1/3] block: mention 'password-secret' option for -iscsi
Message-ID: <Y5xT9XfIoB2hcs9u@redhat.com>
References: <20221201101959.419545-1-berrange@redhat.com>
 <20221201101959.419545-2-berrange@redhat.com>
 <87fsdz5li3.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsdz5li3.fsf@suse.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Dec 01, 2022 at 09:58:12AM -0300, Fabiano Rosas wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > The 'password-secret' option was added
> >
> >   commit b189346eb1784df95ed6fed610411dbf23d19e1f
> >   Author: Daniel P. Berrangé <berrange@redhat.com>
> >   Date:   Thu Jan 21 14:19:21 2016 +0000
> >
> >     iscsi: add support for getting CHAP password via QCryptoSecret API
> >
> > but was not mentioned in the command line docs
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  qemu-options.hx | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 7f99d15b23..055df73306 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -1889,7 +1889,7 @@ SRST
> >  ERST
> >  
> >  DEF("iscsi", HAS_ARG, QEMU_OPTION_iscsi,
> > -    "-iscsi [user=user][,password=password]\n"
> > +    "-iscsi [user=user][,password=password],password-secret=secret-id]\n"
> 
> Loos like you're missing a bracket before the comma.
> 
> The line below also lacks one at the end.

Thanks, will fix both.

> 
> >      "       [,header-digest=CRC32C|CR32C-NONE|NONE-CRC32C|NONE\n"
> >      "       [,initiator-name=initiator-iqn][,id=target-iqn]\n"
> >      "       [,timeout=timeout]\n"
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


