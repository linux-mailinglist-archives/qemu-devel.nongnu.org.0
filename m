Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894C22E6AC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 09:36:42 +0200 (CEST)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzxge-0005ay-Vt
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 03:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1jzxfr-0005AA-3O
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 03:35:51 -0400
Received: from mga04.intel.com ([192.55.52.120]:50148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1jzxfo-00050c-LF
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 03:35:50 -0400
IronPort-SDR: yHFcR5k7wsMg8gtPws5NLXmc1mtRVq9wubahL84CQU+Aqy7i27vJiMa7N/7QusPieUEOA9q28J
 EmAFo3mB/v3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="148444269"
X-IronPort-AV: E=Sophos;i="5.75,401,1589266800"; d="scan'208";a="148444269"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 00:35:45 -0700
IronPort-SDR: 0ffjI+i+TsbheWV9B1ekyPjpDXDKX5V9QqFeMTIOUgqFnBjB7356oNacj5t1wADBNDmVTD6CU1
 TSX+YyW3cBSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,401,1589266800"; d="scan'208";a="364039470"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga001.jf.intel.com with ESMTP; 27 Jul 2020 00:35:38 -0700
Date: Mon, 27 Jul 2020 15:24:40 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200727072440.GA28676@joy-OptiPlex-7040>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040>
 <20200717101258.65555978@x1.home>
 <20200721005113.GA10502@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721005113.GA10502@joy-OptiPlex-7040>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yan.y.zhao@intel.com;
 helo=mga04.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 03:35:45
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, eskultet@redhat.com, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 berrange@redhat.com, cohuck@redhat.com, dinechin@redhat.com, devel@ovirt.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > As you indicate, the vendor driver is responsible for checking version
> > information embedded within the migration stream.  Therefore a
> > migration should fail early if the devices are incompatible.  Is it
> but as I know, currently in VFIO migration protocol, we have no way to
> get vendor specific compatibility checking string in migration setup stage
> (i.e. .save_setup stage) before the device is set to _SAVING state.
> In this way, for devices who does not save device data in precopy stage,
> the migration compatibility checking is as late as in stop-and-copy
> stage, which is too late.
> do you think we need to add the getting/checking of vendor specific
> compatibility string early in save_setup stage?
>
hi Alex,
after an offline discussion with Kevin, I realized that it may not be a
problem if migration compatibility check in vendor driver occurs late in
stop-and-copy phase for some devices, because if we report device
compatibility attributes clearly in an interface, the chances for
libvirt/openstack to make a wrong decision is little.
so, do you think we are now arriving at an agreement that we'll give up
the read-and-test scheme and start to defining one interface (perhaps in
json format), from which libvirt/openstack is able to parse and find out
compatibility list of a source mdev/physical device?

Thanks
Yan

