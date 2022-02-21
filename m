Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678354BD94A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 12:02:14 +0100 (CET)
Received: from localhost ([::1]:33578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM6SK-0005ev-Qs
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 06:02:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nM6PO-0004Hf-8v
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 05:59:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nM6PL-0006vt-0X
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 05:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645441145;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEj3DHdsaiD9nxflcEnOTBxEwHUt9fIqWMWGT6IBg5E=;
 b=IO7rb80a46LzHdQyISM2oHdihhxfCPjOqYzm4b+aBydTGhoSZ1DH/j9AURREBYD4DC4Bxb
 540WDkmwdBO3Gfysl39KNkANldDrBvxnsGD5as60h8MsBp2n7Nd0b4B5W6RuXfrqIaMZTt
 saxfcZQeEG7mvqYdJjFiKBNgWRfUBck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-4zZs1wQLOMesbrDns9HQ-w-1; Mon, 21 Feb 2022 05:59:02 -0500
X-MC-Unique: 4zZs1wQLOMesbrDns9HQ-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 918451F2DA;
 Mon, 21 Feb 2022 10:59:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A86F17B03C;
 Mon, 21 Feb 2022 10:58:52 +0000 (UTC)
Date: Mon, 21 Feb 2022 10:58:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/avocado/machine_s390_ccw_virtio: Adapt test to new
 default resolution
Message-ID: <YhNwaWH+DzPr4Gf2@redhat.com>
References: <20220221101933.307525-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220221101933.307525-1-thuth@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 11:19:33AM +0100, Thomas Huth wrote:
> QEMU's default screen resolution recently changed to 1280x800, so the
> resolution in the screen shot header changed of course, too.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: de72c4b7cd ("edid: set default resolution to 1280x800 (WXGA)")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/avocado/machine_s390_ccw_virtio.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


