Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86FF6E5DB1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 11:42:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pohpQ-0007Ww-Nz; Tue, 18 Apr 2023 05:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pohpK-0007Wf-CB
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pohpC-0003dg-NI
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681810833;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2fMh88+y+HqfaRHe45i7Nes5KvRhOCGrjpPu2/aTgfI=;
 b=N/HmhqZqr/z0qd40IokG/bzieVq2myLJSqSrGytuht2E2ifW5vYBzm77V1Vu8vJmkh3vCF
 vHGwathDfrAgRTpBieasrfAtr8nn1QjtiU/aHtpTF2zUNCCCkIw8reF3xKi9b38iM4U5+j
 5vZ+/L5/k/ZapgMWqBJnnItirXOrH3I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-Y8EI6RXnOrGBak9clQqGEw-1; Tue, 18 Apr 2023 05:40:30 -0400
X-MC-Unique: Y8EI6RXnOrGBak9clQqGEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0762101A54F;
 Tue, 18 Apr 2023 09:40:29 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACFE3C15BB8;
 Tue, 18 Apr 2023 09:40:28 +0000 (UTC)
Date: Tue, 18 Apr 2023 10:40:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/2] tests: lcitool: Switch to OpenSUSE Leap 15.4
Message-ID: <ZD5livcyA/DONFVb@redhat.com>
References: <cover.1681735482.git.pkrempa@redhat.com>
 <a408b7f241ac59e5944db6ae2360a792305c36e0.1681735482.git.pkrempa@redhat.com>
 <20230417163258.65586555.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230417163258.65586555.olaf@aepfle.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Apr 17, 2023 at 04:32:58PM +0200, Olaf Hering wrote:
> Mon, 17 Apr 2023 14:46:54 +0200 Peter Krempa <pkrempa@redhat.com>:
> 
> > Switch the dockerfile to 15.4.
> 
> Given that Leap 15.5 is essentially done, please skip this meanwhile stale version of Leap.

15.4 is still the active release and doesn't have EOL until Dec this
year IIUC from:

  https://en.wikipedia.org/wiki/OpenSUSE

meanwhile 15.5 isn't out yet, and even when released, it is still valid
to be testing 15.4 as that's likely to remain more widely deployed for
a while after.

Ideally we would test both 15.4 and 15.5 but with limited CI resources
I think it is more valuable to test the older version, to ensure that
we don't accidentally introduce use of new features that break on the
older version.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


