Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2EE36F48B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 05:24:28 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcJlU-0001GL-3A
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 23:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lcJjy-0000pG-B8
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:22:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:3394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lcJjw-0003KQ-5W
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:22:54 -0400
IronPort-SDR: yuLbQYzhdijmTw64/85cAvA+0mir9TVovVG8erm9NXCvOlNgbCQ8e2kdo+dgz0ccj+UV0W0SQn
 hyYC71iPcK5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="184318073"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="184318073"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 20:22:47 -0700
IronPort-SDR: +Ql0zCkPlhqrJewjTluz9ybuPPaWlkMo+HKyYZojADPAhwYEYhGmJJEWuGeobW41G0+i5n4DeP
 3ghwCyixLzTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="388389619"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga006.jf.intel.com with ESMTP; 29 Apr 2021 20:22:44 -0700
Message-ID: <aa186a4f58a55b8c1a1203ff4ba94d6395817cf2.camel@linux.intel.com>
Subject: Re: Let's remove some deprecated stuff
From: Robert Hoo <robert.hu@linux.intel.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Date: Fri, 30 Apr 2021 11:22:43 +0800
In-Reply-To: <87y2d1csxe.fsf@dusky.pond.sub.org>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=robert.hu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-04-29 at 11:59 +0200, Markus Armbruster wrote:
> If you're cc'ed, you added a section to docs/system/deprecated.rst
> that
> is old enough to permit removal.  This is *not* a demand to remove,
> it's
> a polite request to consider whether the time for removal has come.
> Extra points for telling us in a reply.  "We should remove, but I
> can't
> do it myself right now" is a valid answer.  Let's review the file:
> 
>     System emulator command line arguments
>     --------------------------------------
> 
[...]
> 
> Robert Hoo:
> 
>     ``Icelake-Client`` CPU Model (since 5.2.0)
>     ''''''''''''''''''''''''''''''''''''''''''
> 
>     ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-
> Server`` CPU
>     Models instead.
> 
Yeah, please drop this entry.
Actually I've sent patches for this.
https://lore.kernel.org/qemu-devel/1619660147-136679-1-git-send-email-robert.hu@linux.intel.com/


