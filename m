Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D3A27018E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 18:05:07 +0200 (CEST)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJIsk-0001DL-5a
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 12:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kJIcb-0001hE-MO
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 11:48:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kJIcY-0007dp-4Q
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 11:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600444100;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rS3Gcq9hQJh0YqJ+/qIUQxX8rNhyzWKnBWDDB9py1YI=;
 b=AjSH9lY/RrTzOeVe+0W5aLk3BKHjtK/1JbsY0irKfw86x90mW05T020GNaAeEVO7G0NkVX
 a93M6yGVVe+y02zuZdD7pooQhLVuwapMBPUYa6XvNCPoOej5BH7J0AgPF5lwlmUBV9Dhpv
 XhwILZeL97rScUtg9c0mHez4QSm5g/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-lCGB2YDxNr2cjgrZ4D14FA-1; Fri, 18 Sep 2020 11:48:10 -0400
X-MC-Unique: lCGB2YDxNr2cjgrZ4D14FA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1A5B801ABF;
 Fri, 18 Sep 2020 15:48:09 +0000 (UTC)
Received: from redhat.com (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DB0E68876;
 Fri, 18 Sep 2020 15:48:08 +0000 (UTC)
Date: Fri, 18 Sep 2020 16:48:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] tests/check-block: Do not run the iotests with old
 versions of bash
Message-ID: <20200918154805.GP1628512@redhat.com>
References: <20200918153514.330705-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200918153514.330705-1-thuth@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 00:20:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 18, 2020 at 05:35:14PM +0200, Thomas Huth wrote:
> macOS is shipped with a very old version of the bash (3.2), which
> is currently not suitable for running the iotests anymore (e.g.
> it is missing support for "readarray" which is used in the file
> tests/qemu-iotests/common.filter). Add a check to skip the iotests
> in this case - if someone still wants to run the iotests on macOS,
> they can install a newer version from homebrew, for example.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Use LANG=C and "-q"
> 
>  tests/check-block.sh | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


