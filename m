Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C039D3A8CA6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 01:36:28 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltIbb-0003PV-DS
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 19:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ltIaI-0002ct-Vb
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 19:35:06 -0400
Received: from mga03.intel.com ([134.134.136.65]:10501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ltIaE-0008IY-Si
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 19:35:06 -0400
IronPort-SDR: v2N9UbHsFxwEjZSwx0rP8bqzMSWzqXspqUyyy9STk9X0ZSqDk0aGcUtxbNulREFkFWlrjHb7wq
 mtAJ6YLx7v/A==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="206122475"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="206122475"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 16:34:51 -0700
IronPort-SDR: OX0m688SOy8hM0QALSfRE0SNkPLuuXfyTXTInhqPi7jqfeZ49u4y4UkaSwYLaOw22W9F9F2DpE
 ru2Nb1uYT9ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="404377392"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 15 Jun 2021 16:34:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 16:34:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 16:34:50 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Tue, 15 Jun 2021 16:34:50 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v2 8/8] virtio-gpu: Add gl_flushed callback
Thread-Topic: [PATCH v2 8/8] virtio-gpu: Add gl_flushed callback
Thread-Index: AQHXXkyAAcqafR1P/UuqlBGOsdKVjKsVDW0AgACtc0A=
Date: Tue, 15 Jun 2021 23:34:50 +0000
Message-ID: <2439020937f0488abc7b56a22945c1b3@intel.com>
References: <20210610224837.670192-1-vivek.kasireddy@intel.com>
 <20210610224837.670192-9-vivek.kasireddy@intel.com>
 <20210615055026.m5az4qqmvh72iwbc@sirius.home.kraxel.org>
In-Reply-To: <20210615055026.m5az4qqmvh72iwbc@sirius.home.kraxel.org>
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
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=vivek.kasireddy@intel.com; helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

>=20
> > -    if (!cmd->finished) {
> > +    if (!cmd->finished && !(cmd->cmd_hdr.flags & VIRTIO_GPU_FLAG_FENCE=
)) {
> >          virtio_gpu_ctrl_response_nodata(g, cmd, cmd->error ? cmd->erro=
r :
> >                                          VIRTIO_GPU_RESP_OK_NODATA);
> >      }
>=20
> My idea would be more along the lines of ...
>=20
> if (!cmd->finished) {
>     if (renderer_blocked) {
>        g->pending_completion =3D cmd;
>     } else {
>        virtio_gpu_ctrl_response_nodata(...)
>     }
> }
>=20
> Then, when resuming processing after unblock check pending_completion
> and call virtio_gpu_ctrl_response_nodata if needed.
>=20
> Workflow:
>=20
> virtio_gpu_simple_process_cmd()
>  -> virtio_gpu_resource_flush()
>    -> dpy_gfx_update()
>      -> gd_gl_area_update()
>         call graphic_hw_gl_block(true), create fence.
[Kasireddy, Vivek] So, with blobs, as you know we call dpy_gl_update() and =
this call
just "queues" the render/redraw. And, GTK then later calls the render signa=
l callback=20
which in this case would be gd_gl_area_draw() which is where the actual Bli=
t happens
and also glFlush; only after which we can create a fence.

> virtio_gpu_simple_process_cmd()
>   -> will see renderer_blocked and delays RESOURCE_FLUSH completion.
>=20
> Then, when the fence is ready, gtk will:
>  - call graphic_hw_gl_block(false)
>  - call graphic_hw_gl_flush()
>    -> virtio-gpu resumes processing the cmd queue.
[Kasireddy, Vivek] Yeah, I think this can be done.

>=20
> When you use the existing block/unblock functionality the fence can be a
> gtk internal detail, virtio-gpu doesn't need to know that gtk uses a
> fence to wait for the moment when it can unblock virtio queue processing
> (the egl fence helpers still make sense).
[Kasireddy, Vivek] Ok, I'll try to include your suggestions in v3.

Thanks,
Vivek
>=20
> take care,
>   Gerd


