Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65A34EAA28
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:09:47 +0200 (CEST)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ7rG-0005i6-PE
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:09:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZ7lw-0002Cx-RC
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZ7ls-0003S4-1d
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648544651;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J6gZ5GpHwaWai2W7OjxtCyqrDVVgn3mgFy2SEUtKfdE=;
 b=gHa/UDBxE2Yb9sciZdepca0Ly2Ha94wgrOKWv+FsEAE1XFojwpZpQUIYLWthtWQu+vkslA
 eZ1TVa3d/HkQRo0L1f1osV7QHtKWI3FWIqiS77hXpTSC6iW8BZZfc820C4xTt15tE86Odx
 oNzZ/bxTLir9fOCklV7FvbYJdcoRS48=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-Jlup4F4_NkurngYsEBb1xg-1; Tue, 29 Mar 2022 05:04:07 -0400
X-MC-Unique: Jlup4F4_NkurngYsEBb1xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A11418ABF8D;
 Tue, 29 Mar 2022 09:04:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F456400F8FD;
 Tue, 29 Mar 2022 09:04:06 +0000 (UTC)
Date: Tue, 29 Mar 2022 10:04:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/lcitool: Do not use a hard-coded /usr/bin/python3
 as python interpreter
Message-ID: <YkLLhMkuVOFLjKT1@redhat.com>
References: <20220329063958.262669-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220329063958.262669-1-thuth@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 08:39:58AM +0200, Thomas Huth wrote:
> When running "make lcitool-refresh", this currently uses the hard-coded
> /usr/bin/python3 from the script's shebang line for running Python.
> That's bad, since neither /usr/bin/python3 is guaranteed to exist, nor
> does it honor the python interpreter that the user might have chosen
> while running the "configure" script. Thus let's rather use $(PYTHON)
> in the Makefile, and improve the shebang line in the script in case
> someone runs this directly.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/lcitool/Makefile.include | 2 +-
>  tests/lcitool/refresh          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


