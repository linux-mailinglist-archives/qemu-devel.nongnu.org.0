Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB369DDBF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:19:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPim-0004i9-DZ; Tue, 21 Feb 2023 05:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUPij-0004fi-NQ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:18:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUPih-0003Q6-HT
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676974678;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96Q/cUIGExaVcjVZD0FsSVH3j9KrGtMUEl3vmXKdxTs=;
 b=irJDdpZ6yHQZlyycNeLFGNQQPob6qX18hZ58k/8Dtd5bcmkXEA9by/yZb9DTRI3Q16JIed
 t5UXGiQyC5eIQ3Oh25JtKLicyY6XWxY33HMBWkcCyWRMtefsh3TNxmI76s3IuIbqWAxrpz
 DP370UY8DmH3RgE24I97XFJTSmy3eb0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-bvN8V9sEMwi5-WQyU6XbPQ-1; Tue, 21 Feb 2023 05:17:57 -0500
X-MC-Unique: bvN8V9sEMwi5-WQyU6XbPQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00B49811E9C;
 Tue, 21 Feb 2023 10:17:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC438492C3C;
 Tue, 21 Feb 2023 10:17:53 +0000 (UTC)
Date: Tue, 21 Feb 2023 10:17:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
Subject: Re: [PATCH 1/2] qga/win32: Remove change action from MSI installer
Message-ID: <Y/SaT59O2hhNpmHw@redhat.com>
References: <20230220174142.240393-1-kkostiuk@redhat.com>
 <20230220174142.240393-2-kkostiuk@redhat.com>
 <790be50d-9a52-6f92-f053-ee9a4eec0a31@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <790be50d-9a52-6f92-f053-ee9a4eec0a31@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Tue, Feb 21, 2023 at 09:15:15AM +0100, Philippe Mathieu-Daudé wrote:
> On 20/2/23 18:41, Konstantin Kostiuk wrote:
> > resolves: rhbz#2167436
> 
> "You are not authorized to access bug #2167436."
> 
> > fixes: CVE-2023-0664
> 
> This commit description is rather scarce...
> 
> I understand you are trying to fix a CVE, but we shouldn't play
> the "security by obscurity" card. How can the community and
> distributions know this security fix is enough with the bare
> "Remove change action from MSI installer" justification?
> Can't we do better?

Yes, commit messages should always describe the problem being
solved directly. Bug trackers usually make people wade through
piles of irrelevant comments & potentially misleading blind
alleys during the back & forth of triage. The important info
needs to be distilled down and put in the commit message,
concisely describing the problem faced. Bug tracker links have
been known to bit-rot too.

The commit message needs to focus on /why/ the change was made,
much more than describing /what/ was changed.

> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > ---
> >   qga/installer/qemu-ga.wxs | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> > index 51340f7ecc..feb629ec47 100644
> > --- a/qga/installer/qemu-ga.wxs
> > +++ b/qga/installer/qemu-ga.wxs
> > @@ -31,6 +31,7 @@
> >         />
> >       <Media Id="1" Cabinet="qemu_ga.$(var.QEMU_GA_VERSION).cab" EmbedCab="yes" />
> >       <Property Id="WHSLogo">1</Property>
> > +    <Property Id="ARPNOMODIFY" Value="yes" Secure="yes" />
> >       <MajorUpgrade
> >         DowngradeErrorMessage="Error: A newer version of QEMU guest agent is already installed."
> >         />

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


