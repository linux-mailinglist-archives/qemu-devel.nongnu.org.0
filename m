Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8BE6F6862
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:36:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVNV-0003HJ-W9; Thu, 04 May 2023 05:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puVNC-0003Gq-8t
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:35:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puVNA-0004zC-Jc
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683192935;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnxP0InMrcZ5IZi3UVHua/gB6t8tmQB3GGVxS1lxqAo=;
 b=UDc6FrD1mX6RZY3ArSV++ZlmOIWVuFy3p3HrxolIHXmgXgSK4VYnP6602oKkqDEI0jvg3V
 uUErwzk2T7BTmu8adrBlwymiIFaHIwq1JIvMIbHw7ipFbFaRqyTP8K96yv4CMs9VLZI7Hp
 G2uFuWMpdLXi7AZbEiPWcMhT/NiTS8I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-IyrjsqdFMtaPgvnPLwYtFA-1; Thu, 04 May 2023 05:35:34 -0400
X-MC-Unique: IyrjsqdFMtaPgvnPLwYtFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6245E3C10232;
 Thu,  4 May 2023 09:35:34 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7044A4020961;
 Thu,  4 May 2023 09:35:32 +0000 (UTC)
Date: Thu, 4 May 2023 10:35:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 philmd@linaro.org, wainersm@redhat.com, bleal@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
Message-ID: <ZFN8YBO9MXM0qiKi@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
 <ZFNmhT9Fosay1bee@redhat.com>
 <550DF0FD-701E-408D-924B-C33ABC0BFF10@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <550DF0FD-701E-408D-924B-C33ABC0BFF10@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 04, 2023 at 02:19:21PM +0530, Ani Sinha wrote:
> 
> 
> > On 04-May-2023, at 1:32 PM, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > On Thu, May 04, 2023 at 08:35:53AM +0200, Thomas Huth wrote:
> >> On 03/05/2023 16.55, Ani Sinha wrote:
> >>> mformat and xorriso tools are needed by biosbits avocado tests. This patchset
> >>> adds those two tools in the docker container images.
> >> 
> >> tests/qtest/cdrom-test.c already uses genisoimage to create ISO images, and
> >> the containers already have that tool installed. Could you maybe switch the
> >> biosbits test to use that tool? Or the other way round? ... at least having
> >> two tools to create ISO images in our containers sounds IMHO excessive.
> > 
> > It looks like this series wasn't tested, because it doesn't even install
> > the alpine image:
> > 
> > ERROR: unable to select packages:
> >  cdrkit-1.1.11-r3:
> >    conflicts: xorriso-1.5.4-r2[cmd:mkisofs=1.1.11-r3]
> >    satisfies: world[cdrkit]
> >  xorriso-1.5.4-r2:
> >    conflicts: cdrkit-1.1.11-r3[cmd:mkisofs=1.5.4-r2]
> >    satisfies: world[xorriso]
> > 
> > 
> > We definitely need to have either biosbits or cdrom-test.c changed to
> > use the same tool.
> 
> Wait, it seems xorriso package also provides geninsoimage?
> 
> xorriso-1.5.4-4.el9.x86_64 : ISO-9660 and Rock Ridge image manipulation tool
> Repo        : @System
> Matched from:
> Filename    : /usr/bin/genisoimage
> 
> xorriso-1.5.4-4.el9.x86_64 : ISO-9660 and Rock Ridge image manipulation tool
> Repo        : rhel-9-for-x86_64-appstream-rpms
> Matched from:
> Filename    : /usr/bin/genisoimage
> 
> $ rpm -ql  xorriso-1.5.4-4.el9.x86_64 | grep bin
> /usr/bin/cdrecord
> /usr/bin/genisoimage
> /usr/bin/mkisofs
> /usr/bin/osirrox
> /usr/bin/wodim
> /usr/bin/xorrecord
> /usr/bin/xorriso
> /usr/bin/xorriso-dd-target
> /usr/bin/xorrisofs

That is not the case in Fedora.  xorriso does not provide any
genisoimage binary, that's provided by a 'genisoimage' RPM
which was created from cdrkit src RPM.

Alpine likewise has no 'genisoimage' binary provided by
xorriso.

For even more fun, xorriso is now a sub-RPM of the libisoburn
source RPM


If we could make cdrom-test  use 'mkisofs' binary then we could
likely use the xorriso package on all platforms IIUC.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


