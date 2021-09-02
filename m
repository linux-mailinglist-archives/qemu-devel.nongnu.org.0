Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E3B3FEF08
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:57:19 +0200 (CEST)
Received: from localhost ([::1]:36066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLnDS-00078o-QT
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLnBg-0004pI-MB
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLnBd-0006x1-Vq
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630590924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vD0coD+6uunZIho/vV3f/6WUDRvVstXAuPIxYof5Z7o=;
 b=ZV8Op6uO0SoaQ355UcIheIq3kxsBOMjGYE2HOhR5qv4y1jca9GAL08i86oKuZ2PNBhFnUz
 VIOo35BLy+jsuyBcFd7n+2v/rzIvfsRNIzl6OfYTpn76dw56LirinS2XQbcnRVwEtsP21D
 cVUB3WkboGRexZWbiX+WMsSBLpr3UMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-J000XcwmNBajvzHyhI3elQ-1; Thu, 02 Sep 2021 09:55:22 -0400
X-MC-Unique: J000XcwmNBajvzHyhI3elQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 182C0104FB69;
 Thu,  2 Sep 2021 13:55:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 005E45D9C6;
 Thu,  2 Sep 2021 13:55:09 +0000 (UTC)
Date: Thu, 2 Sep 2021 14:55:09 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Guest Agent issue with 'guest-get-osinfo' command on Windows
Message-ID: <20210902135509.GU26415@redhat.com>
References: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
 <YTDTc9NC9k7hJjpx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTDTc9NC9k7hJjpx@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Michael Roth <michael.roth@amd.com>, Developers <qemu-devel@nongnu.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Tomas Golembiovsky <tgolembi@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Konstantin Kostiuk <konstantin@daynix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 02:36:51PM +0100, Daniel P. Berrangé wrote:
> On Thu, Sep 02, 2021 at 03:36:01PM +0300, Konstantin Kostiuk wrote:
> > Hi Team,
> > 
> > We have several bugs related to 'guest-get-osinfo' command in Windows Guest
> > Agent:
> > https://bugzilla.redhat.com/show_bug.cgi?id=1998919
> > https://bugzilla.redhat.com/show_bug.cgi?id=1972070
> > 
> > This command returns the following data:
> > {
> > "name": "Microsoft Windows",
> > "kernel-release": "20344",
> > "version": "N/A",
> > "variant": "server",
> > "pretty-name": "Windows Server 2022 Datacenter",
> > "version-id": "N/A",
> > "variant-id": "server",
> > "kernel-version": "10.0",
> > "machine": "x86_64",
> > "id": "mswindows"
> > }
> > 
> > The problem is with "version" and "pretty-name". Windows Server
> > 2016/2019/2022 and Windows 11 have the same MajorVersion ("kernel-version")
> 
> Yes, this is a long standing issue with version mapping Windows
> guests, to which no one has ever come up with a nice solution
> that I know of.
> 
> In libosinfo database, we just report the kernel version as the
> OS version, and accept the fact that there's a clash in version
> between various Windows products.
> 
>   https://gitlab.com/libosinfo/osinfo-db/-/blob/master/data/os/microsoft.com/win-2k19.xml.in
> 
>   https://gitlab.com/libosinfo/osinfo-db/-/blob/master/data/os/microsoft.com/win-10.xml.in
> 
> Apps that need to distinguish simply have to look at the
> product name, even if this causes localization pain.
> 
> Similarly in libguestfs, the virt-inspector tool just reports
> the kernel version, and product name from the registry:
> 
> # virt-inspector -d win2k8r2
> <?xml version="1.0"?>
> <operatingsystems>
>   <operatingsystem>
>     <root>/dev/sda2</root>
>     <name>windows</name>
>     <arch>x86_64</arch>
>     <distro>windows</distro>
>     <product_name>Windows Server 2008 R2 Standard</product_name>
>     <product_variant>Server</product_variant>
>     <major_version>6</major_version>
>     <minor_version>1</minor_version>
> 
> 
> # virt-inspector -d win10x64
> <?xml version="1.0"?>
> <operatingsystems>
>   <operatingsystem>
>     <root>/dev/sda2</root>
>     <name>windows</name>
>     <arch>x86_64</arch>
>     <distro>windows</distro>
>     <product_name>Windows 10 Pro</product_name>
>     <product_variant>Client</product_variant>
>     <major_version>10</major_version>
>     <minor_version>0</minor_version>
>     <windows_systemroot>/Windows</windows_systemroot>
>     <windows_current_control_set>ControlSet001</windows_current_control_set>
>     <hostname>DESKTOP-GR8HTR3</hostname>
>     <osinfo>win10</osinfo>

We actually try to turn it into a libosinfo compatible short string as
you can see from Dan's second example above and this code:

  https://github.com/libguestfs/libguestfs/blob/master/lib/inspect-osinfo.c

Which is I think what every tool should return.  libosinfo is the only
project that attempts to classify a broad range of OSes and is
constantly being updated.

> > This solution has several problems: need to update the conversion matrix
> > for each Windows build, one Windows name can have different build numbers.
> > For example, Windows Server 2022 (preview) build number is 20344, Windows
> > Server 2022 build number is 20348.
> > 
> > There are two possible solutions:
> > 1. Use build number range instead of one number. Known implementation
> > issue: Microsoft provides a table (
> > https://docs.microsoft.com/en-Us/windows-server/get-started/windows-server-release-info)
> > only with stable build numbers. So, we exactly don't know the build number
> > range.
> 
> Yep, this looks troublesome when considering non-GA releases.
> 
> > 2. We can read this string from the registry
> > (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion). Known
> > implementation issues: ProductName value is localized (in a Russian version
> > of Windows, the word "Microsoft' is translated), so we should ignore it.
> > ReleaseId value does not equal to Windows Server version (for Windows
> > Server 2019, ReleaseId is 1809)
> 
> This reg key is what libguestfs reports IIUC
> 
> https://github.com/libguestfs/libguestfs/blob/master/daemon/inspect_fs_windows.ml#L227
> 
> > In conclusion, I have the next questions:
> > What solution we should implement to get the Windows release name?
> > Does someone know how end-users use this information? Should it be English
> > only or it can be localized? Should we have exactly the same output as now?
> > What should we do with the 'Standard' server edition? Currently, the guest
> > agent always returns 'Datacenter'.
> 
> This is equiv ot libguestfs' "product variant" data,w hich it gets
> from InstallationType registry key
> 
>   https://github.com/libguestfs/libguestfs/blob/master/daemon/inspect_fs_windows.ml#L259
> 
> Personally I think there's value in having consistent treatment of this
> info across qemu guest agent and libguestfs / libosinfo.

Agree.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


