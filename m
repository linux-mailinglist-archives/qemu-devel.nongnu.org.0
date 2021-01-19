Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2902FB7A2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:27:09 +0100 (CET)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ryO-0005jZ-4o
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1rtz-0000Li-PT
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:22:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1rtw-00023b-V9
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611066152;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IRwjWxMFk5xcqeKwRUmXNgpu3xRd7gWXiJ8lkyrMePM=;
 b=fLOsQVra9W298x40FXwonmkVOudb5VHY9JqOsuql5JSrkSBx/EbdwGZ5wRHp+K0NHcHAo3
 dKiHWO1d/AIJWmjvmzmTa72Bs38GaskBXLRhl0wFbgxbUNhIkzW6Fib5L/gthlrCLu/SQp
 GlO1B/20mIKSRBxv8G/O4NKi/1Y1MbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-3M1dYn69MgmM8txPATycRA-1; Tue, 19 Jan 2021 09:22:29 -0500
X-MC-Unique: 3M1dYn69MgmM8txPATycRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF0F1180E482;
 Tue, 19 Jan 2021 14:22:28 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A60860C69;
 Tue, 19 Jan 2021 14:22:24 +0000 (UTC)
Date: Tue, 19 Jan 2021 14:22:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/check-block.sh: Refuse to run the iotests with
 BusyBox' sed
Message-ID: <20210119142221.GE2335568@redhat.com>
References: <20210119134749.401311-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210119134749.401311-1-thuth@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 02:47:49PM +0100, Thomas Huth wrote:
> BusyBox' sed reports itself as "This is not GNU sed version 4.0"
> when being run with the --version parameter. However, the iotests
> really need GNU sed, they do not work with the BusyBox version.
> So let's make sure that we really have GNU sed and refuse to run
> the tests with BusyBox' sed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/check-block.sh | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/check-block.sh b/tests/check-block.sh
> index fb4c1baae9..e4f37905be 100755
> --- a/tests/check-block.sh
> +++ b/tests/check-block.sh
> @@ -60,6 +60,13 @@ if ! (sed --version | grep 'GNU sed') > /dev/null 2>&1 ; then
>          echo "GNU sed not available ==> Not running the qemu-iotests."
>          exit 0
>      fi
> +else
> +    # Double-check that we're not using BusyBox' sed which says
> +    # that "This is not GNU sed version 4.0" ...
> +    if sed --version | grep -q 'not GNU sed' ; then
> +        echo "BusyBox sed not supported ==> Not running the qemu-iotests."
> +        exit 0
> +    fi
>  fi

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


