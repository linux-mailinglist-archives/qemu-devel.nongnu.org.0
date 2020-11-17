Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B862B5F69
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:54:36 +0100 (CET)
Received: from localhost ([::1]:42498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf0VH-0004Et-FJ
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kf0UX-0003kC-3S
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:53:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kf0UV-0006lZ-3o
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605617626;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=blkc27L18NQV/Si/jdVpigRtarv+CI0Qtp7dUExob8A=;
 b=P9tuLpqQ3D0xuI/9JbrFnu3So0Rg5OP5zOgoxfuH1NgRGhUloKQvr1fi4jTlZ2EkuOBVKQ
 TUzMugCHDYIMqA9XOiy5smDs6BNYuDNePZgAQJycTkfDRLOunasQwgFCb8uKgdBOz1VXGi
 qaoxB7CAUtC/RI5kMMl1CLZh2/IWexk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-KBXeQqhLOFqK94bihdRY0Q-1; Tue, 17 Nov 2020 07:53:44 -0500
X-MC-Unique: KBXeQqhLOFqK94bihdRY0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E7F01017DC9;
 Tue, 17 Nov 2020 12:53:43 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D7825D9D3;
 Tue, 17 Nov 2020 12:53:42 +0000 (UTC)
Date: Tue, 17 Nov 2020 12:53:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] curl: remove compatibility code
Message-ID: <20201117125339.GD135624@redhat.com>
References: <20201117113850.64108-1-pbonzini@redhat.com>
 <20201117114659.GB135624@redhat.com>
 <76330bff-9d47-83b6-c566-7a28bb4cf83d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <76330bff-9d47-83b6-c566-7a28bb4cf83d@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 01:40:56PM +0100, Paolo Bonzini wrote:
> On 17/11/20 12:46, Daniel P. Berrangé wrote:
> > On Tue, Nov 17, 2020 at 12:38:50PM +0100, Paolo Bonzini wrote:
> > > cURL 7.16.0 was released in October 2006.  Just remove code that is
> > > in all likelihood not being used anywhere.
> > 
> > Rather than assuming that, we should be picking our minimum version
> > and enforcing that in configure/meson.
> > 
> > Currently, we have a manual code compile check for curl_multi_setopt,
> > after doing a pkg-config check with no min version.
> > 
> > We should set a min version in pkg-config and drop the compile check
> > in configure.
> > 
> > Based on repology.org and our platform support matrix, RHEL-7 looks
> > like the oldest curl that we need to care about, 7.29.0
> 
> That is complicated a bit by the fact that curl is detected with both
> pkg-config and curl-config.  That is probably unnecessary too, since we do
> not need any of the options that are exclusive to curl-config, such as --ca.
> If we can drop curl-config, moving the detection to meson is much easier.

That's just another bit of historical cruft - use of curl-config dates
back to when you introduced pkg-config for curl in 2010, to cope with
distros that didn't ship pkg-config files yet. Our supported platforms
today will all have pkg-config for curl, so we can drop curl-config too.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


