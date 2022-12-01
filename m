Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9BC63EC56
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 10:22:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fkZ-0006sj-33; Thu, 01 Dec 2022 04:20:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0fkV-0006s8-0p
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 04:20:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0fkT-0006Gq-A7
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 04:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669886451;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sYaPgK726TJScWA2Q6C6F9h4qzg6iJ8opOUofIT6ylQ=;
 b=UGN0j7RF5/fmH+GNXBv4dnPqiOvQ2UAoPwMaaLcKUUKjxptmC1K3AFyz0+diOHjkeUCam+
 6MZ8EhebP96DlZR5EHAMiWko572AOo09y6FDvVywYLSsTrE2wO5k4VH5J8EnNdNj2xvqdJ
 UHg2bjdqXi09jmDJ0UXZNreJvV5ddvM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-qD267bPJMb6XWjoL4zRXmA-1; Thu, 01 Dec 2022 04:20:50 -0500
X-MC-Unique: qD267bPJMb6XWjoL4zRXmA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EE912999B2D
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 09:20:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3425F4A9254;
 Thu,  1 Dec 2022 09:20:49 +0000 (UTC)
Date: Thu, 1 Dec 2022 09:20:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Monitor commands related to display server passwords
Message-ID: <Y4hx5lfQetJQm19s@redhat.com>
References: <87mt88oonj.fsf@pond.sub.org>
 <Y4ccR2d2GUHpmHwx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y4ccR2d2GUHpmHwx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 30, 2022 at 09:03:03AM +0000, Daniel P. Berrangé wrote:
> On Wed, Nov 30, 2022 at 09:02:56AM +0100, Markus Armbruster wrote:

> > Related: QCryptoSecret objects.
> 
> snip
> 
> > Currently used by various block backends and the tls-creds-x509 object.
> > 
> > Would it make sense with display servers, too?
> 
> In 6.0 I introduced support for 'password-secret' to SPICE and VNC
> command line.
> 
> I don't know why, but I only deprecated 'password' in SPICE and
> not in VNC.

The 'password' option in VNC isn't actually setting a password,
it is more like saying  'auth=password'. The actualpassword
had to be set via the 'change' command, we never allowed it on
the CLI before. So there was nothing to deprecate for VNC, only
SPICE.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


