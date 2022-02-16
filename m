Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6234B869B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:25:17 +0100 (CET)
Received: from localhost ([::1]:42260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKIQu-0008GN-FE
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:25:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKIPq-0007Ou-Be
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKIPo-0000KC-Oj
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645010641;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dNDM/h4xg6d0fEE3idt2myrYsts31lHQA03na0hswHw=;
 b=QglPDl6WeigrEu1Hp1ZYpXohLjKRZZgefjKpHWjtEX1A0gemK9djM6B/9s+qGga9mq42+2
 2gi/7T0dAqjIufKhgsapnMMn+fIpRQ3RkOT7mUUu26u5MwRpTHczDyZB4+8+6XsgE3+05G
 sDX/Akflj9jPjWL+gQ/rGV3dfkqDnHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-cAIU1zBzM1a4X2CrFEQwng-1; Wed, 16 Feb 2022 06:23:53 -0500
X-MC-Unique: cAIU1zBzM1a4X2CrFEQwng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B511801B0B;
 Wed, 16 Feb 2022 11:23:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1299E60C59;
 Wed, 16 Feb 2022 11:23:43 +0000 (UTC)
Date: Wed, 16 Feb 2022 11:23:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <YgzevUGKlwtOSFWe@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
MIME-Version: 1.0
In-Reply-To: <YgzZhHKSAFYTYFDc@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, thuth@redhat.com, mst@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 11:01:24AM +0000, Dr. David Alan Gilbert wrote:
> * Gerd Hoffmann (kraxel@redhat.com) wrote:
> >   Hi,
> >  
> > > Given the semantic differences from 'i440fx', changing the default
> > > machine type has effects that are equivalent to breaking command
> > > line syntax compatibility, which is something we've always tried
> > > to avoid.
> > 
> > And if we are fine breaking backward compatibility I'd rather *not* pick
> > a default, effectively making -M $something mandatory, similar to arm.
> 
> Oh, that's probably easy to do;  what are other peoples thoughts on
> that?

On the libvirt side it won't matter & will have no effect. Libvirt ignores
QEMU defaults an explicitly sets 'pc' as the default, so that our users
are protected against QEMU changes in defaults that could break app usage.

We would of course suggest that all apps using libvirt explicitly pick
a machine type they want, but if they dont, we'll set it for them and
guarantee that default won't change as long as the machine type exists
in QEMU.

IOW, whether QEMU selects 'q35' or <nothing at all>  as the default
machine, libvirt will continue to set 'pc' as the default in absence
of a mgmt app explicit choice.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


