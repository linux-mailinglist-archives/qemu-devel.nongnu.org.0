Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31D359C2A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:32:51 +0200 (CEST)
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUoRW-0008PJ-Tb
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUoQQ-0007mx-NF
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUoQN-0002vO-UC
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617964299;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvxzrqfd8U4cOb7W7+fvoF/MGbYoBMyEFlAPygX/qEM=;
 b=UO4AljPV5r9biyIryZu9Jp6XYA3qwmJ9FWtGVkTfuB6RdkzKxSP1zZqcj4OE+9JCw1tu7i
 PCkXuWETKmcOhjfTQecoMrDSDhLtz8jOb3RWVYmGJ3pAzsBliGSgNvshzebbeF5fpCT+76
 OXj2UPJkIt5UkqqNFcAYWCz6OIsoePw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-rBcmHxcUM-6p3VEmE2Atjg-1; Fri, 09 Apr 2021 06:31:33 -0400
X-MC-Unique: rBcmHxcUM-6p3VEmE2Atjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20C038030BB;
 Fri,  9 Apr 2021 10:31:32 +0000 (UTC)
Received: from redhat.com (ovpn-115-36.ams2.redhat.com [10.36.115.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65CD219C71;
 Fri,  9 Apr 2021 10:31:30 +0000 (UTC)
Date: Fri, 9 Apr 2021 11:31:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: iotests 041 intermittent failure (netbsd)
Message-ID: <YHAs/+BEnkuPgWkO@redhat.com>
References: <CAFEAcA_-ARyPM0gB2Y_FKdUp9DYRNbz1GFU1AzFE9UZgjWNazQ@mail.gmail.com>
 <6cf410f9-6566-5921-fecc-6adaafbce068@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6cf410f9-6566-5921-fecc-6adaafbce068@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 12:22:26PM +0200, Philippe Mathieu-Daudé wrote:
> On 4/9/21 11:43 AM, Peter Maydell wrote:
> > Just hit this (presumably intermittent) 041 failure running
> > the build-and-test on the tests/vm netbsd setup. Does it look
> > familiar to anybody?
> 
> This one is known as the mysterious failure:
> https://www.mail-archive.com/qemu-block@nongnu.org/msg73321.html

If the test has been flakey with no confirmed fix since Sept 2020,
then it is well overdue to be switched to disabled by default, at
least on the platforms it is known to be flakey on.

Non-determinsitic failures accumulate until you find yourself in
a situation where its impossible to get CI to pass. We must be
aggressive in either (a) fixing non-deterministic failures promptly,
or (b) disabling the test until someone has time to work on a fix.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


