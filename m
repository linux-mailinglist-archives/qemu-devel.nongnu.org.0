Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A001148477F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:09:49 +0100 (CET)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4oFo-0007tI-Gc
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:09:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4oEB-0005ny-ID
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:08:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4oE7-0006Xx-2f
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641319682;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWxl6V9Gu5SG/i5n8cBrYliBxtzseDp5AMbGHekeOtI=;
 b=MZhZI6dlhX/LRYVfA7riIkDpprn2f0+rNYdEBPhEGJHdD5NtMwQeD0cL3Az8vCh7J2600K
 NMrr/N4Y2HTWTE7z/BYxiab0H1znF+/JOfZpHtOUZ5MIKw27tl0tbNBd/9qRGIKiMDa2gY
 bOvg9UgA8+zB3Sx+CTEFAUalKy2JPuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-GE6Ofy16OnSK_QF4ntexcQ-1; Tue, 04 Jan 2022 13:07:58 -0500
X-MC-Unique: GE6Ofy16OnSK_QF4ntexcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C2EF5A07F;
 Tue,  4 Jan 2022 18:07:56 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 572E8348F1;
 Tue,  4 Jan 2022 18:07:50 +0000 (UTC)
Date: Tue, 4 Jan 2022 18:07:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] [RESEND] docs: Add spec of OVMF GUIDed table for SEV
 guests
Message-ID: <YdSM8wFu4xiRcKMt@redhat.com>
References: <20220103091413.2869-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220103091413.2869-1-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 03, 2022 at 11:14:13AM +0200, Dov Murik wrote:
> Add docs/specs/sev-guest-firmware.rst which describes the GUIDed table
> in the end of OVMF's image which is parsed by QEMU, and currently used
> to describe some values for SEV and SEV-ES guests.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  docs/specs/index.rst              |   1 +
>  docs/specs/sev-guest-firmware.rst | 125 ++++++++++++++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 docs/specs/sev-guest-firmware.rst

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


