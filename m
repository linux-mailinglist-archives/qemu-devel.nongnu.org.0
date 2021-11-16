Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F4452DF3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 10:25:15 +0100 (CET)
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuiI-0003PF-Sh
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 04:25:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmugo-0002gk-VM
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmugn-000079-Cb
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637054620;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0vrLtCDJ9gL8MBQ1ewZJSg/di8vT6DQLqgyLkCbBUk4=;
 b=UV8z5F5hzbtk+7X8oU4JKWtyrMycSgs4EZTWAA5n5/yNcz+2+wb+hWLSbGhOH8eyhpsZiR
 uEmagRqjxLwfVtkqKwEmvemEnCIbGmz0mOJBX/J2wwMN6C5jmGCXf/rIjK0u14EJ1BCoHd
 6gny84pKwn1utgsXEYEWV5RykFDscG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-IglynhnsPq-e_HjdlD3eGQ-1; Tue, 16 Nov 2021 04:23:39 -0500
X-MC-Unique: IglynhnsPq-e_HjdlD3eGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3DDACC623;
 Tue, 16 Nov 2021 09:23:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 551AD60843;
 Tue, 16 Nov 2021 09:23:31 +0000 (UTC)
Date: Tue, 16 Nov 2021 09:23:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [RFC PATCH v2 00/12] Add AMD Secure Nested Paging (SEV-SNP)
 support
Message-ID: <YZN4kBG4A/Sr1kIq@redhat.com>
References: <20210826222627.3556-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210826222627.3556-1-michael.roth@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 05:26:15PM -0500, Michael Roth wrote:
> These patches implement SEV-SNP along with CPUID enforcement support for QEMU,
> and are also available at:
> 
>   https://github.com/mdroth/qemu/commits/snp-rfc-v2-upstream
> 
> They are based on the initial RFC submitted by Brijesh:
> 
>   https://lore.kernel.org/qemu-devel/20210722000259.ykepl7t6ptua7im5@amd.com/T/

What's the status of these patches ?  Is there going to be any non-RFC
version posted in the near future ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


