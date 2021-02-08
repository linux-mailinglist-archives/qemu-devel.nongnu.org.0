Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D213141CF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:31:39 +0100 (CET)
Received: from localhost ([::1]:32954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9E8A-00058Y-DA
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l98fo-00060M-CP
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:42:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l98fi-0000bU-6A
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612798912;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQjdEZNbCl3Rb614kIRgnKf4CtrglhfF1917ffhKHEc=;
 b=ErUy8k8WWC0SPjUcpPvxCqNWnDgg6YJJj588wPuJvZs+lL3gsBrxSUQMvdZj9Nr8qBD432
 XQ5xiRcC7U3DNfpl7Gv6a4Wfh2qWtlUJqNnX63CzHMWx70H4JIN+RTHz1/TUSlEZXpClt7
 C9PxvopKGj7+tMxqCUlPJMLdJWd+PII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-QoYURmlPNxClgouJv20A5A-1; Mon, 08 Feb 2021 10:41:36 -0500
X-MC-Unique: QoYURmlPNxClgouJv20A5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9117FC7409;
 Mon,  8 Feb 2021 15:41:35 +0000 (UTC)
Received: from redhat.com (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74FC262467;
 Mon,  8 Feb 2021 15:41:29 +0000 (UTC)
Date: Mon, 8 Feb 2021 15:41:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] travis-ci: Disable C++ on Aarch64 container
Message-ID: <20210208154126.GL1141037@redhat.com>
References: <20210206200537.2249362-1-f4bug@amsat.org>
 <29f38036-9acd-abf4-1a75-5a4ac54273a6@redhat.com>
 <4304f273-2320-e302-f8ca-b72fb69061b5@amsat.org>
MIME-Version: 1.0
In-Reply-To: <4304f273-2320-e302-f8ca-b72fb69061b5@amsat.org>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 08, 2021 at 10:16:19AM +0100, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 2/8/21 6:54 AM, Thomas Huth wrote:
> > On 06/02/2021 21.05, Philippe Mathieu-Daudé wrote:
> >> Travis-CI seems to have enforced memory limit on containers,
> >> and the 'GCC check-tcg' job started to fail [*]:
> >>
> >>    [2041/3679] Compiling C++ object libcommon.fa.p/disas_nanomips.cpp.o
> >>    FAILED: libcommon.fa.p/disas_nanomips.cpp.o
> >>    {standard input}: Assembler messages:
> >>    {standard input}:577781: Warning: end of file not at end of a line;
> >> newline inserted
> >>    {standard input}:577882: Error: unknown pseudo-op: `.lvl35769'
> >>    {standard input}: Error: open CFI at the end of file; missing
> >> .cfi_endproc directive
> >>    c++: fatal error: Killed signal terminated program cc1plus
> >>    compilation terminated.
> > 
> > If disabling C++ "fixes" the issue, ok ...
> > Otherwise, we should maybe rather limit the amount of parallel jobs
> > there instead? (i.e. compiling with "make -j1" in the worst case?)
> 
> I exhausted my Travis-CI credits (frankly I don't plan to pay for it
> with my own money). If the project expects developers to use Travis-CI,
> we should think at some way to buy credits and give them to developers
> on demand? [Cc'ing Stefan]

We should just stop wasting our time here. Simply delete the travis
config right now and worry about adding more coverage to gitlab
separately.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


