Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531882EAB2A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 13:49:17 +0100 (CET)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwlm0-0007Ge-E9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 07:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwlkd-0006cm-1U
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:47:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwlkT-0003ER-P6
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609850858;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYEH/urlViPMzo9QS5dJfTUbKOyku1AwwXNBs0wksS0=;
 b=hTTSuFWauOu841+rX5dWzJ8B0RcG2cEdURnQfv9583CghCpdg133tdEDpji5eiMMOnC9ZP
 u1vbTKDZ7IAK+BaNXXYi7T9MEgEREuo3xOEgjChxqlgX++5un6dKjP/ohstb4VoeGevD6z
 8VBVfG5zws7Dg+1y5rpK1f5bgSwJw6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-qQn5CaSMNIC0jffrVpEbuQ-1; Tue, 05 Jan 2021 07:47:31 -0500
X-MC-Unique: qQn5CaSMNIC0jffrVpEbuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C348180E489;
 Tue,  5 Jan 2021 12:47:30 +0000 (UTC)
Received: from redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43E1A5D9CC;
 Tue,  5 Jan 2021 12:47:23 +0000 (UTC)
Date: Tue, 5 Jan 2021 12:47:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] tests/acceptance: bound the size of readline in
 s390_ccw_virtio
Message-ID: <20210105124720.GE724458@redhat.com>
References: <20210105124405.15424-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210105124405.15424-1-alex.bennee@linaro.org>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: thuth@redhat.com, Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 05, 2021 at 12:44:05PM +0000, Alex Bennée wrote:
> The read binary data as text via a PPM export of the frame buffer
> seems a bit sketchy and it did blow up in the real world when the
> assertion failed:
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/943183183
> 
> However short of cleaning up the test to be more binary focused at
> least limit the attempt to dump the whole file as hexified zeros in
> the logs.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


