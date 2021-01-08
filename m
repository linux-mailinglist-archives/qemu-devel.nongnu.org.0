Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF62EF119
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 12:11:59 +0100 (CET)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxpgV-000119-11
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 06:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxpfF-0000Us-0t
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:10:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxpfD-00088S-7p
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610104238;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MN2ncVoUKe/bQdK02qw2407ov+jt8DZ1BYGp5oIDYFI=;
 b=IOsXxqVk+j9Qbc9MeprFF1oZBLfYsO2OOQrPRnPxSazgTxCUbm8dCXAkPkheCwcXP3Ivj9
 /NG2r82OGRQ78vXv0S02l9hhSglGEYjIvxmB197YfOLEXxqK18mjQeTw3NI8C76le43nG/
 NMTQWnp/UtYMX6E+kaIOngJQp4CUKLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337--1YWe36OORuD6nx3zWtNSg-1; Fri, 08 Jan 2021 06:10:33 -0500
X-MC-Unique: -1YWe36OORuD6nx3zWtNSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F07A1006C83;
 Fri,  8 Jan 2021 11:10:32 +0000 (UTC)
Received: from redhat.com (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DADBB5C8AA;
 Fri,  8 Jan 2021 11:10:27 +0000 (UTC)
Date: Fri, 8 Jan 2021 11:10:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] ci: ensure that all jobs use a shallow clone
Message-ID: <20210108111024.GG1082385@redhat.com>
References: <20210107171719.477856-1-pbonzini@redhat.com>
 <20210107182812.GI1029501@redhat.com>
 <dff4499e-eb4d-f96b-5f82-51352561d231@redhat.com>
 <CABgObfZt-8gG3c4WTZqd0Ls0VEe43MFc_mFuykoZvDP2ZGu0gA@mail.gmail.com>
 <20210108101645.GE1082385@redhat.com>
 <29312927-eb21-dab0-cea2-c2c9139a3e0c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <29312927-eb21-dab0-cea2-c2c9139a3e0c@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 08, 2021 at 12:06:01PM +0100, Thomas Huth wrote:
> On 08/01/2021 11.16, Daniel P. Berrangé wrote:
> 
> > IOW, despite travis giving us non-x86 builders, it is doomed to be
> > unusuable, unless we can convince them to give us a *massively*
> > larger free credit allowance on the qemu account.
> I think convincing them to do this will be very hard. I've tried to apply to
> the free OSS credits for my account, and in the mail that I've got back
> after a couple of weeks, they wrote that "Project must not be sponsored by a
> commercial company or organization (monetary or with employees paid to work
> on the project)" to qualify for the free credits. That doesn't sound like
> they'll accept QEMU, I think.

Yeah that makes their OSS program unviable for any project which isn't
essentially just a single person free time effort.

Lets drop Travis and not waste any more time on this.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


