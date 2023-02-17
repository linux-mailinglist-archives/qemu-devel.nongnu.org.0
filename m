Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C61969AAB9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 12:48:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSzDX-0006hr-AD; Fri, 17 Feb 2023 06:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSzDR-0006hS-RJ
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:47:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSzDQ-00054l-9o
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:47:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676634467;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7OWKTzw15EPMDjNZ/isxd8k89Q8TB9CPbHjt3t/Zc0=;
 b=K5QZQtiR3xS/BIeaJHWBn6RzXMyxGxdd1q8zOwjowX08Db3dvTU2tngKgAv7pabz8+aVAT
 k59bHq4AdhSrgttSpe6Q2Bti7fGHDff6+UN12DPVq63UYNnm06n4JmLG3M5YDXeYLCAiFS
 uLGi8ean3s5xTH8ys3fjK5yBORi/wk0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-LZBOoAxDMFaBTY_PbY7FVg-1; Fri, 17 Feb 2023 06:47:44 -0500
X-MC-Unique: LZBOoAxDMFaBTY_PbY7FVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFE4E1019CBC;
 Fri, 17 Feb 2023 11:47:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F960140EBF4;
 Fri, 17 Feb 2023 11:47:41 +0000 (UTC)
Date: Fri, 17 Feb 2023 11:47:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Message-ID: <Y+9pW43XDp1qt7T6@redhat.com>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org> <Y+9bSHshiNnek31J@redhat.com>
 <39bc9b17-e6f2-ed1b-0d6d-31bbb98842cf@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39bc9b17-e6f2-ed1b-0d6d-31bbb98842cf@weilnetz.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

On Fri, Feb 17, 2023 at 12:05:46PM +0100, Stefan Weil wrote:
> On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
> 
> > Which 32-bit hosts are still useful, and why?
> 
> 
> Citing my previous mail:
> 
>    I now checked all downloads of the latests installers since 2022-12-30.
> 
>    qemu-w32-setup-20221230.exe – 509 different IP addresses
>    qemu-w64-setup-20221230.exe - 5471 different IP addresses
> 
>    339 unique IP addresses are common for 32- and 64-bit, either
>    crawlers or people who simply got both variants. So there remain 170
>    IP addresses which only downloaded the 32-bit variant in the last week.
> 
>    I see 437 different strings for the browser type, but surprisingly
>    none of them looks like a crawler.
> 
> So there still seems to be a certain small need for QEMU installers for
> 32-bit Windows: 170 users für 32 bit only, 339 users for both 32 and 64 bit,
> 5132 users for 64 bit only.

The question which is hard/impossible to answer is whether the people
who downloaded the 32-bit build genuinely needed a 32-bit build or
just did so out of habit or confusion.

I know you can't believe everything you see with statistics, but as an
example, the chart at the bottom of this page suggests new deployments
of 32-bit Windows are negligible today:

    https://www.pcbenchmarks.net/os-marketshare.html

there are existing deployments not accounted for there, but that may
still suggest many of the 32-bit downloads of QEMU will end up being
run on 64-bit hosts.

If we were to apply our support platform rule of only targetting the
latest 2 versions of the OS, this limits our targets to Win 10 and
Win 11. Windows 11 dropped 32-bit IIUC, so we're talking about
32-bit installs of Windows 10 only - even in Win10 days all new
physical hardware would have been 64-bit capable.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


