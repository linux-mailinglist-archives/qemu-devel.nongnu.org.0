Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916636D041
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 03:25:08 +0200 (CEST)
Received: from localhost ([::1]:34540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbYwn-00034C-Qo
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 21:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lbYvb-0002dh-W1
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 21:23:48 -0400
Received: from mga12.intel.com ([192.55.52.136]:3755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lbYvZ-0004lj-1w
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 21:23:47 -0400
IronPort-SDR: OE7/q5NFFu4R84fqDee1VXv1sPif5SxZpXlux9IHLatA8k7IFxMrztOmmwTOSsLR7r5KSAk9fU
 4qWzlUzDNnTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="176111386"
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; d="scan'208";a="176111386"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 18:22:40 -0700
IronPort-SDR: AxRBuWhC+YlA6sL0EHR7/cmggUI6ohf2DnzTMWUXA+zeVwSwJXSe/OHfN2yntqIVtDzn+hs+JV
 sShcMo5oZxkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; d="scan'208";a="403480997"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga002.jf.intel.com with ESMTP; 27 Apr 2021 18:22:38 -0700
Message-ID: <e2c98d83aba8d207695f2cdbc2d4926901350cff.camel@linux.intel.com>
Subject: Re: [PATCH] i386/cpu: Remove the deprecated cpu model 'Icelake-Client'
From: Robert Hoo <robert.hu@linux.intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Date: Wed, 28 Apr 2021 09:22:37 +0800
In-Reply-To: <20210427205549.lcrl3rm3d5xgg44p@habkost.net>
References: <1619084536-89845-1-git-send-email-robert.hu@linux.intel.com>
 <20210427205549.lcrl3rm3d5xgg44p@habkost.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=robert.hu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 robert.hu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-04-27 at 16:55 -0400, Eduardo Habkost wrote:
> On Thu, Apr 22, 2021 at 05:42:16PM +0800, Robert Hoo wrote:
> > As it's been marked deprecated since v5.2, now I think it's time
> > remove it
> > from code.
> > 
> > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> 
> Thanks!  There's only one issue: we need to update
> docs/system/deprecated.rst and docs/system/removed-features.rst
> when removing the CPU model.

OK, going to send v2 soon.
> 


