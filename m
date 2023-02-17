Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCAA69B1B3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:21:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4Q2-0002WZ-5w; Fri, 17 Feb 2023 12:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pT4Py-0002WL-Vt
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:21:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pT4Px-0007Q4-5d
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676654464;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=H1aok+YUuu/SVL9DaaFfopjW593iFvC/Z2Rz3nBCet8=;
 b=guCLW18UKoBd96UzB40hljhLhEM32rAOebpsu9BNAwalT5zAO0pOIakUF0UPcCmlM0YHo+
 CPtpK2KBM77GATa3AixyVHLBEND+sf6hOMmMqqryYNJ+6inYEsTbhgZoUcxIHcU9P0KMRO
 dlez/xzq35EkoWGiQDx2esFsCMT7IGg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-X9l0myFeOyqyiwGnomHefQ-1; Fri, 17 Feb 2023 12:20:59 -0500
X-MC-Unique: X9l0myFeOyqyiwGnomHefQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA58A3C14869;
 Fri, 17 Feb 2023 17:20:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CD622166B30;
 Fri, 17 Feb 2023 17:20:56 +0000 (UTC)
Date: Fri, 17 Feb 2023 17:20:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Reinoud Zandijk <reinoud@netbsd.org>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Message-ID: <Y++3deW3JDukiRGr@redhat.com>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org>
 <Y++mEtUSmWYPTkPN@gorilla.13thmonkey.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y++mEtUSmWYPTkPN@gorilla.13thmonkey.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Feb 17, 2023 at 05:06:42PM +0100, Reinoud Zandijk wrote:
> On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
> > I feel the discussion petered out without a conclusion.
> > 
> > I don't think letting the status quo win by inertia is a good outcome
> > here.
> > 
> > Which 32-bit hosts are still useful, and why?
> 
> NetBSD runs on a bunch of 32 bit-only hosts (sparc32, ppc32, armv7, vax,
> mips32 etc.) that all run Qemu fine. They are all actively maintained and
> released as part of the main releases.
> 
> Maintaining 32 bit host support is thus vital for those machines; not everyone
> runs a 64 bit system.

In the context of NetBSD, is QEMU a leaf node package, or is it a
dependancy of anything involved in delivery of the distro ?

ie, if QEMU were to drop 32-bit support, if it is merely a leaf node
package, then end users of NetBSD would not have access to QEMU, but
you would still be able to deliver the rest of NetBSD on those platforms
without the QEMU package present ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


