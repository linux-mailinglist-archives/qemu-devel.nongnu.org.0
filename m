Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B730C21FED1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 22:48:19 +0200 (CEST)
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvRqc-0007cC-9W
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 16:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1jvRpt-00078n-5J
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 16:47:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49102
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1jvRpq-0002GW-CT
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 16:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594759649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8umdrM37U6a6XZjrgtkvMu3RYrDH+UAXw+egZm/UTKQ=;
 b=B6eaWKF75+JA2Eb7OWaaPBATMe70MB5dFgMGQ0AWkL1Dm/9Lg6x2sXhKHFC6Bjg9Xj3F8c
 aZ6tntresm0Grz86R+TFcMTrjKBcXqfE7B1CX5lNRPTHe2NSnF7zVEKOoORYl6gEcQ3su7
 ZatUeajrAeRxcMtE5bJW7/5yO1ZXWdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-9NN1jPDHMCiBgYKFXjPtBA-1; Tue, 14 Jul 2020 16:47:27 -0400
X-MC-Unique: 9NN1jPDHMCiBgYKFXjPtBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B6171080;
 Tue, 14 Jul 2020 20:47:24 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59FC31992D;
 Tue, 14 Jul 2020 20:47:16 +0000 (UTC)
Date: Tue, 14 Jul 2020 14:47:15 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200714144715.0ef70074@x1.home>
In-Reply-To: <20200714164722.GL25187@redhat.com>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <20200714102129.GD25187@redhat.com>
 <20200714101616.5d3a9e75@x1.home>
 <20200714164722.GL25187@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=alex.williamson@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 03:57:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, eskultet@redhat.com,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, cohuck@redhat.com, dinechin@redhat.com,
 devel@ovirt.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Jul 2020 17:47:22 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Jul 14, 2020 at 10:16:16AM -0600, Alex Williamson wrote:
> > On Tue, 14 Jul 2020 11:21:29 +0100
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >  =20
> > > On Tue, Jul 14, 2020 at 07:29:57AM +0800, Yan Zhao wrote: =20
> > > >=20
> > > > The string read from migration_version attribute is defined by devi=
ce vendor
> > > > driver and is completely opaque to the userspace.
> > > > for a Intel vGPU, string format can be defined like
> > > > "parent device PCI ID" + "version of gvt driver" + "mdev type" + "a=
ggregator count".
> > > >=20
> > > > for an NVMe VF connecting to a remote storage. it could be
> > > > "PCI ID" + "driver version" + "configured remote storage URL"
> > > >=20
> > > > for a QAT VF, it may be
> > > > "PCI ID" + "driver version" + "supported encryption set".
> > > >=20
> > > > (to avoid namespace confliction from each vendor, we may prefix a d=
river name to
> > > > each migration_version string. e.g. i915-v1-8086-591d-i915-GVTg_V5_=
8-1) =20
> >=20
> > It's very strange to define it as opaque and then proceed to describe
> > the contents of that opaque string.  The point is that its contents
> > are defined by the vendor driver to describe the device, driver version,
> > and possibly metadata about the configuration of the device.  One
> > instance of a device might generate a different string from another.
> > The string that a device produces is not necessarily the only string
> > the vendor driver will accept, for example the driver might support
> > backwards compatible migrations. =20
>=20
>=20
> > > IMHO there needs to be a mechanism for the kernel to report via sysfs
> > > what versions are supported on a given device. This puts the job of
> > > reporting compatible versions directly under the responsibility of the
> > > vendor who writes the kernel driver for it. They are the ones with the
> > > best knowledge of the hardware they've built and the rules around its
> > > compatibility. =20
> >=20
> > The version string discussed previously is the version string that
> > represents a given device, possibly including driver information,
> > configuration, etc.  I think what you're asking for here is an
> > enumeration of every possible version string that a given device could
> > accept as an incoming migration stream.  If we consider the string as
> > opaque, that means the vendor driver needs to generate a separate
> > string for every possible version it could accept, for every possible
> > configuration option.  That potentially becomes an excessive amount of
> > data to either generate or manage.
> >=20
> > Am I overestimating how vendors intend to use the version string? =20
>=20
> If I'm interpreting your reply & the quoted text orrectly, the version
> string isn't really a version string in any normal sense of the word
> "version".
>=20
> Instead it sounds like string encoding a set of features in some arbitrary
> vendor specific format, which they parse and do compatibility checks on
> individual pieces ? One or more parts may contain a version number, but
> its much more than just a version.
>=20
> If that's correct, then I'd prefer we didn't call it a version string,
> instead call it a "capability string" to make it clear it is expressing
> a much more general concept, but...

I'd agree with that.  The intent of the previous proposal was to
provide and interface for reading a string and writing a string back in
where the result of that write indicated migration compatibility with
the device.  So yes, "version" is not the right term.
=20
> > We'd also need to consider devices that we could create, for instance
> > providing the same interface enumeration prior to creating an mdev
> > device to have a confidence level that the new device would be a valid
> > target.
> >=20
> > We defined the string as opaque to allow vendor flexibility and because
> > defining a common format is hard.  Do we need to revisit this part of
> > the discussion to define the version string as non-opaque with parsing
> > rules, probably with separate incoming vs outgoing interfaces?  Thanks,=
 =20
>=20
> ..even if the huge amount of flexibility is technically relevant from the
> POV of the hardware/drivers, we should consider whether management apps
> actually want, or can use, that level of flexibility.
>=20
> The task of picking which host to place a VM on has alot of factors to
> consider, and when there are a large number of hosts, the total amount
> of information to check gets correspondingly large.  The placement
> process is also fairly performance critical.
>=20
> Running complex algorithmic logic to check compatibility of devices
> based on a arbitrary set of rules is likely to be a performance
> challenge. A flat list of supported strings is a much simpler
> thing to check as it reduces down to a simple set membership test.
>=20
> IOW, even if there's some complex set of device type / vendor specific
> rules to check for compatibility, I fear apps will ignore them and
> just define a very simplified list of compatible string, and ignore
> all the extra flexibility.

There's always the "try it and see if it works" interface, which is
essentially what we have currently.  With even a simple version of what
we're trying to accomplish here, there's still a risk that a management
engine might rather just ignore it and restrict themselves to 1:1 mdev
type matches, with or without knowing anything about the vendor driver
version, relying on the migration to fail quickly if the devices are
incompatible.  If the complexity of the interface makes it too
complicated or time consuming to provide sufficient value above such an
algorithm, there's not much point to implementing it, which is why Yan
has included so many people in this discussion.

> I'm sure OpenStack maintainers can speak to this more, as they've put
> alot of work into their scheduling engine to optimize the way it places
> VMs largely driven from simple structured data reported from hosts.

I think we've weeded out that our intended approach is not worthwhile,
testing a compatibility string at a device is too much overhead, we
need to provide enough information to the management engine to predict
the response without interaction beyond the initial capability probing.

As you've identified above, we're really dealing with more than a
simple version, we need to construct a compatibility string and we need
to start defining what goes into that.

The first item seems to be that we're defining compatibility relative
to a vfio migration stream, vfio devices have a device API, such as
vfio-pci, so the first attribute might simply define the device API.
Once we have a class of devices we might then be able to use bus
specific attributes, for example the PCI vendor and device ID (other
bus types TBD).

We probably also need driver version numbers, so we need to include
both the driver name as well as version major and minor numbers.  Rules
need to be put in place around what we consider to be viable version
matches, potentially as Sean described.  For example, does the major
version require a match?  Do we restrict to only formward, ie.
increasing, minor number matches within that major verison?

Do we then also have section that includes any required device
attributes to result in a compatible device.  This would be largely
focused on mdev, but I wouldn't rule out others.  For example if an
aggregation parameter is required to maintain compatibility, we'd want
to specify that as a required attribute.

So maybe we end up with something like:

{
  "device_api": "vfio-pci",
  "vendor": "vendor-driver-name",
  "version": {
    "major": 0,
    "minor": 1
  },
  "vfio-pci": { // Based on above device_api
    "vendor": 0x1234, // Values for the exposed device
    "device": 0x5678,
      // Possibly further parameters for a more specific match
  }
  "mdev_attrs": [
    { "attribute0": "VALUE" }
  ]
}

The sysfs interface would return an array containing one or more of
these for each device supported.  I'm trying to account for things like
aggregation via the mdev_attrs section, but I haven't really put it all
together yet.  I think Intel folks want to be able to say mdev type
foo-3 is compatible with mdev type foo-1 so long as foo-1 is created
with an aggregation attribute value of 3, but I expect both foo-1 and
foo-3 would have the same user visible PCI vendor:device IDs  If we
use mdev type rather than the resulting device IDs, then we introduce
an barrier to phys<->mdev migration.  We could specify the subsystem
values though, for example foo-1 might correspond to subsystem IDs
8086:0001 and foo3 8086:0003, then we can specify that creating an
foo-1 from this device doesn't require any attributes, but creating a
foo-3 does.  I'm nervous how that scales though.

NB. I'm also considering how portions of this might be compatible with
mdevctl such that we could direct mdevctl to create a compatible device
using information from this compatibility interface.

Thanks,
Alex


