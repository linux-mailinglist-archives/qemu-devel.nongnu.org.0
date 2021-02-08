Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38A3142AF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:15:07 +0100 (CET)
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EoE-0004zQ-Cy
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9AFs-00012i-8d
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9AFl-0000i4-7I
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612804992;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhePwkTVj7n4UyEBCTvBEUOn8cDrgaI2rc1MzJ5vPwg=;
 b=GU4gzwh5lhDIJIvjRdOgLwr8So93FSqptabUcY0xNttEF97OKJIS9uH3kagDjtVTz5dJHQ
 8uIesjQWVH0C4MrbHLIIOYYcHC0gbjcZRiQ2DUFmgJiWFRAba7ui/LoBbMAHI1LNr1mqHZ
 /enzKZpWl0QYqcm3Zq0UVrjNw631C/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-xjpAdOY4PO-7-4U-Pi5Q1Q-1; Mon, 08 Feb 2021 12:23:07 -0500
X-MC-Unique: xjpAdOY4PO-7-4U-Pi5Q1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66C42107ACC7;
 Mon,  8 Feb 2021 17:23:06 +0000 (UTC)
Received: from redhat.com (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EC2F1ABE1;
 Mon,  8 Feb 2021 17:23:00 +0000 (UTC)
Date: Mon, 8 Feb 2021 17:22:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] fix build failures from incorrectly skipped
 container build jobs
Message-ID: <20210208172256.GM1141037@redhat.com>
References: <20210208163339.1159514-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210208163339.1159514-1-berrange@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 08, 2021 at 04:33:36PM +0000, Daniel P. Berrangé wrote:
> This series fixes a problem with our gitlab CI rules that cause
> container builds to be skipped. See the commit description in the
> first patch for the details on this problem.
> 
> The overall result of this series though is a small increase in overall
> pipeline time.
> 
> Previously
> 
>  - When container jobs are skipped: approx 1hr 5 mins
>  - When container jobs are run, cached by docker: approx 1hr 15 mins
>  - When container jobs are run, not cached by docker: approx 1hr 30 mins
> 
> With this series applied the first scenario no longer exists, so
> all piplines are either 1hr 15 or 1hr 30 depending on whether the
> container phase is skipped.

I mean to say the biggest problem I see is the cross-win64-system
job. This consumes 1 hour 5 minutes all on its own. It is at least
15 minutes longer that every other job AFAICT. So no matter how
well we parallelize stuff, 1 hr 5 is a hard lower limit on pipeline
duration right now.

We might want to consider how to split the win64 job or cut down
what it does in some way ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


