Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A9406D2B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:53:46 +0200 (CEST)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgyP-0002x2-7x
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOgxX-0002H3-Er
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOgxV-0005vT-NH
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631281968;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mk/NVZRCNZgHeikrJ4wyDAN4nTp2njOGEWH+JseOaiw=;
 b=Kv7TgcrFgnxT/d55JluSxnnFp2M4q5HQ4WxE5HYkBO4CqK8XP7Onnh0vDJrZwDyGMFQCM1
 Ks5BLz14WPA6RmYhnauaIA8kN5DqELiTmZAIcFU9j5xeWWKag3cqSJ9M/xy+vbw42rra7N
 /wXQqdmhNXv1g5zTuUSiry+ZPxzgw9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-YG3yo-FUOPCVTF_Ak4skAg-1; Fri, 10 Sep 2021 09:52:47 -0400
X-MC-Unique: YG3yo-FUOPCVTF_Ak4skAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8C90801596;
 Fri, 10 Sep 2021 13:52:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E99919D9F;
 Fri, 10 Sep 2021 13:52:45 +0000 (UTC)
Date: Fri, 10 Sep 2021 14:52:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/5] docs/devel: document expectations for QAPI data
 modelling for QMP
Message-ID: <YTtjKjK8mLNQJcj2@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-2-berrange@redhat.com>
 <87tuium6u7.fsf@dusky.pond.sub.org> <YTtTwwXjG9/u653o@redhat.com>
 <87sfyca6jc.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87sfyca6jc.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 03:45:11PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Thu, Sep 09, 2021 at 11:33:20AM +0200, Markus Armbruster wrote:
> 
> [...]
> 
> >> There are many existing long lines in this file, so I'm not flagging
> >> yours, except for this one, because it increases the maximum.
> >
> > This line is at exactly 80 characters so checkstyle is happy with it.
> > We don't have any requirement for a differenet line limit for docs
> > afair ?
> 
> We don't.  I'm asking for a favour.
> 
> Humans tend to have trouble following long lines with our eyes (I sure
> do).  Typographic manuals suggest to limit columns to roughly 60
> characters for exactly that reason[1].
> 
> 70 is a reasonable compromise between legibility and "writability".  For
> code, we use 80-90, because there the actual width should still be fine
> due to indentation.
> 
> checkpatch.pl doesn't differentiate betwen code and prose.
> 
> This file is already hard to read for me.  Please consider not making it
> harder.

Ok, no worries, I just didn't understand the rationale.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


