Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AE430BCCD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:19:21 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tiK-0003ZP-No
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6tgW-000350-4U
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6tgQ-0000sK-As
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612264641;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vjaUvl7is/97N0mSNFM1YCy5T+bjEvlbfnbSbRgu1oQ=;
 b=dRck5R3/1x0taE3qruP7w4qgXAU8V3Lzh8sf60XHRaLRmAydmuG9SSzQiYqPm3a4pbsiyN
 OqqT/yE1vDjk8Gq7T5oDPIlQ8oFs8stix+g57zHPLadoWuUL+zv9VwTyEAmCYl3YhONxZ8
 MU9T9fv+e7+eB2/CrNxEkXdCFQW3isQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-zLkW_i5TOVCDQg4yBnvYTg-1; Tue, 02 Feb 2021 06:17:17 -0500
X-MC-Unique: zLkW_i5TOVCDQg4yBnvYTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D8301DDE9
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 11:17:16 +0000 (UTC)
Received: from redhat.com (ovpn-112-202.ams2.redhat.com [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51D395FC19;
 Tue,  2 Feb 2021 11:17:12 +0000 (UTC)
Date: Tue, 2 Feb 2021 11:17:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210202111709.GB4168502@redhat.com>
References: <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
 <20210129143252.GE4008275@redhat.com>
 <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
 <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
 <20210202111015.peh4cslwvxuot6qv@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210202111015.peh4cslwvxuot6qv@sirius.home.kraxel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Christophe de Dinechin <cdupontd@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 12:10:15PM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > > How do you rate-limit intelligently to avoid overflowing the guest keyboard buffers?
> > 
> > Like I said earlier in this thread, this is a big problem with
> > keyboard injection.
> 
> It's a solved problem though, the qemu vnc server has throttling
> implemented already.  There even is an option to configure the delay
> (key-delay-ms).

Depends on your view of "solved" really. If I've highlighted a region
of text in openoffice that is 100 KB in size, and press "Ctrl-V" in
the VNC window for the VM, with a 10 ms delay, i'll be waiting 15
minutes for it to finish injecting keystrokes.

Anything longer than 1 second is unacceptable. If you make the delay
too short the guest keyboard handler will loose keys. So realistically
I think keyboard injection is limted to about 100 characters of text.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


