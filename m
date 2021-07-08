Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E130E3C15CD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:19:12 +0200 (CEST)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vnz-000145-PV
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1VmP-00080c-FZ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1VmK-00080G-Gb
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625757446;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1e1tvQBw/84zFvF7VNxT2oAs/mUcMgyF6kBxFogzn8=;
 b=c+x+JBy+FYmOUqZcEasQ674Wp/VvVnBUbGrkdMPRXRgag6XA1eVTKZeznshnwVy7fmxTCv
 dId46bk+mDcX3fmmUXujBEo9m2CVvaX3e/WQMwLxTzPxfB8wDvHvDTDn4wdLMswTExlKJm
 jBF+G5zYIuQLAsX9pkbhtreXARN2dPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-HPawcN4UO2-cTqVM_kdhOA-1; Thu, 08 Jul 2021 11:17:23 -0400
X-MC-Unique: HPawcN4UO2-cTqVM_kdhOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B59E101F000
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 15:17:22 +0000 (UTC)
Received: from redhat.com (ovpn-114-169.ams2.redhat.com [10.36.114.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 277995C1C2;
 Thu,  8 Jul 2021 15:17:20 +0000 (UTC)
Date: Thu, 8 Jul 2021 16:17:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH] audio: Make the AudiodevDriver enum conditional
Message-ID: <YOcW8TRGCTenHOJS@redhat.com>
References: <20210624183716.515721-1-thuth@redhat.com>
 <YNWUGh2XmQ7eXtmQ@redhat.com>
 <4c27da0d-ef3c-c1da-0d80-d8496292b85c@redhat.com>
 <87v95kdfc2.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87v95kdfc2.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 04:56:29PM +0200, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
> > On 25/06/2021 10.30, Daniel P. Berrangé wrote:
> >> On Thu, Jun 24, 2021 at 08:37:16PM +0200, Thomas Huth wrote:
> >>> This way, the upper layers like libvirt could have the possibility
> >>> to use QAPI to find out which audio drivers have been enabled during
> >>> compile-time of QEMU.
> >>>
> >>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >>> ---
> >>>   Note: Marked as RFC since it's quite a lot of ifdef'ing here...
> >>>         not sure whether I really like it...
> >> Same as my patch here:
> >>    https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00654.html
> >
> > Oh, nice, I guess it means that it's not such a bad idea to introduce
> > all those #ifdefs here :-)
> >
> > Anyway, looks like my patch was incomplete anyway (I just hacked it
> > together after my corresponding DisplayType patch - see 
> > https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06529.html),
> > since it lacks the wiring via a qapi command, so please disregard this
> > RFC PATCH. Are you going to respin your series from March, Daniel?
> 
> I reviewed Daniel's series back then, and pointed out a few minor
> issues, mostly in commit messages.  I hope that wasn't the reason for it
> getting stuck :)

No, I'm mostly just side-tracked on other work I'm afraid.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


