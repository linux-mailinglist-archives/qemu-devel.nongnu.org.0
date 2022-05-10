Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6420521767
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 15:23:38 +0200 (CEST)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noPpx-0003Yj-GU
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 09:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noPp1-0002ll-Gf
 for qemu-devel@nongnu.org; Tue, 10 May 2022 09:22:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noPow-0004SF-Sp
 for qemu-devel@nongnu.org; Tue, 10 May 2022 09:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652188953;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=L2lFQAwPE/gH82xVbDCOPaBz940AgvvdhqblHgxlhMk=;
 b=cNf002gJbUZNbPqB1e/xVmgSgOeOI/GSzyZhOLq/Z37ZJRJe77ZW+n1gAHpLJ2JD5JIdul
 HR7qSa5WexQ86umjlGnHltHwtsQXdh1dmCVpFenGJty6SEHtdKc4/yelVwQUCu7LkY414t
 u9566RUZvOaFo1RDeHJyQ8FSuWGd/JY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-M3vwEAjHM6uNWtpZqHOQZA-1; Tue, 10 May 2022 09:22:30 -0400
X-MC-Unique: M3vwEAjHM6uNWtpZqHOQZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4374E185A7BA;
 Tue, 10 May 2022 13:22:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0F5D40357BE;
 Tue, 10 May 2022 13:22:25 +0000 (UTC)
Date: Tue, 10 May 2022 14:22:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org,
 mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 imammedo@redhat.com, peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 06/17] vfio-user: build library
Message-ID: <YnpnD5Xzdobr+Vfw@redhat.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7560757f7e08842bbfc78bafdee6959f2ab43f80.1651586203.git.jag.raman@oracle.com>
 <YnPvtyp54seM8ibH@stefanha-x1.localdomain>
 <CAFEAcA9fOH1=hseVHwsvsJujeiB6cXn6BFnxyp36vYnmjVsp0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9fOH1=hseVHwsvsJujeiB6cXn6BFnxyp36vYnmjVsp0Q@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 05, 2022 at 05:17:01PM +0100, Peter Maydell wrote:
> On Thu, 5 May 2022 at 16:44, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > On Tue, May 03, 2022 at 10:16:47AM -0400, Jagannathan Raman wrote:
> > Ubuntu 20.04LTS has CMake 3.16.3:
> > https://packages.ubuntu.com/focal/cmake
> >
> > That does not meet the minimum version requirement in this patch series
> > (3.19.0).
> >
> > Please re-run container build to check if Ubuntu actually works.
> >
> > Hopefully libvfio-user will support meson and CMake can be dropped from
> > this patch series.
> 
> Yes, please. I really strongly don't want QEMU to acquire
> a dependency on yet another build system.

As of today, John has mergd my libvfio-user pull request to replace
cmake with meson, so we're sorted on that front now. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


