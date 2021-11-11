Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B644D43A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:41:18 +0100 (CET)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6a5-0007t6-Vj
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:41:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ml6Ye-0005y9-0t
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:39:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ml6Yb-0006HY-L1
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636623585;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XZrI821gqzWe3cc6afXPtBvIBh2HZIVZ0LTpliUv7qs=;
 b=gmJ785imSCDnu9xTZSA6iKRomEuN8eZNBePC1cIKa2LsMz1rB2nhvf0iajBNSVRc3F0yr4
 ss9+Tb0UPn7z91Ktncyp/rNA2SJLb9q1DpJeHDGvyER1z73Gsa0RUupZ+SWJEmoJAO3clD
 8snmXj0dUJ1oI6WdFM0aRP/aPTmiy3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-scdvx_6UMSm22e8PLO_PZA-1; Thu, 11 Nov 2021 04:39:42 -0500
X-MC-Unique: scdvx_6UMSm22e8PLO_PZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A696987D541;
 Thu, 11 Nov 2021 09:39:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBCEA19C59;
 Thu, 11 Nov 2021 09:39:20 +0000 (UTC)
Date: Thu, 11 Nov 2021 09:39:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v2 0/6] SEV: add kernel-hashes=on for measured -kernel
 launch
Message-ID: <YYzkxhd5+gK7wcTf@redhat.com>
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 08, 2021 at 01:48:34PM +0000, Dov Murik wrote:
> Tom Lendacky and Brijesh Singh reported two issues with launching SEV
> guests with the -kernel QEMU option when an old [1] or wrongly configured [2]
> OVMF images are used.
> 
> To fix these issues, these series "hides" the whole kernel hashes
> additions behind a kernel-hashes=on option (with default value of
> "off").  This allows existing scenarios to work without change, and
> explicitly forces kernel hashes additions for guests that require that.

We need to to get this into 6.2 to adress the regression vs  previous
QEMU releases.

There's just a couple of small review points. If you can repost
with the easy fixes, then we can get this queued.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


