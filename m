Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A853838855A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 05:35:58 +0200 (CEST)
Received: from localhost ([::1]:48652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljD01-0008Dj-OU
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 23:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ljCyn-0006QH-Fo
 for qemu-devel@nongnu.org; Tue, 18 May 2021 23:34:41 -0400
Received: from mga04.intel.com ([192.55.52.120]:51573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ljCyk-0001az-21
 for qemu-devel@nongnu.org; Tue, 18 May 2021 23:34:41 -0400
IronPort-SDR: GTOA0SqIwXEWu7co56CNKsWQuZgYw1VDP4SoWg2t7FzKCNQHCh75aSt9lbMCLwiNAlNI+CWul6
 C3AlNjqTgnyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="198928670"
X-IronPort-AV: E=Sophos;i="5.82,311,1613462400"; d="scan'208";a="198928670"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 20:34:30 -0700
IronPort-SDR: Ec7LN2+gF8F702cbovn8el4OeqJ6gFrJBECfWp/DHRNNk0VzSjR16crrfyU05O/z0R05Lv6kPp
 4QEOmTGHsnmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,311,1613462400"; d="scan'208";a="394234982"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 18 May 2021 20:34:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 18 May 2021 20:34:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 18 May 2021 20:34:28 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Tue, 18 May 2021 20:34:28 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v4 00/13] virtio-gpu: Add support for Blob resources
 feature (v4)
Thread-Topic: [PATCH v4 00/13] virtio-gpu: Add support for Blob resources
 feature (v4)
Thread-Index: AQHXRrlUBvCz0rn6Ak2CkSqVJBQ1x6rphawAgAB5BjA=
Date: Wed, 19 May 2021 03:34:28 +0000
Message-ID: <76b2f6d5f3ee4ffe879450f0d62b7e80@intel.com>
References: <20210511224719.387443-1-vivek.kasireddy@intel.com>
 <20210518101638.mvtys424rl2d72iu@sirius.home.kraxel.org>
In-Reply-To: <20210518101638.mvtys424rl2d72iu@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=vivek.kasireddy@intel.com; helo=mga04.intel.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,
>=20
> On Tue, May 11, 2021 at 03:47:06PM -0700, Vivek Kasireddy wrote:
> > Enabling this feature would eliminate data copies from the resource
> > object in the Guest to the shadow resource in Qemu. This patch series
> > however adds support only for Blobs of type VIRTIO_GPU_BLOB_MEM_GUEST
> > with property VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE.
> >
> > Most of the patches in this series are a rebased, refactored and
> > bugfixed versions of Gerd Hoffmann's patches located here:
> > https://gitlab.freedesktop.org/virgl/qemu/-/commits/virtio-gpu-next
>=20
> Doesn't apply cleanly to master, can you rebase and resend?
[Kasireddy, Vivek] Sure, just sent a v5.

Thanks,
Vivek

>=20
> thanks,
>   Gerd


