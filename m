Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529DA36E2E8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 03:20:17 +0200 (CEST)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbvLj-0005bf-R5
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 21:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lbvKV-0005BD-0E
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 21:18:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:47973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lbvKT-0006ii-3P
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 21:18:58 -0400
IronPort-SDR: 8VanwWIQtSiR/M7KwzHj12oYJEqzuvvh7gMyfejIEHtvzHWEQIC8fShAQV/RGOVKcrr+C+7tmx
 H68qXwWqwYVw==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="196946910"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="196946910"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 18:18:54 -0700
IronPort-SDR: 3FD+HONlAzPHCKqYn9eH6Vq2IlUZjUer73tUEDWqJl97+scB9xVl3NCx6ag2g+dWStKLtC2ZOq
 6NpMunmOisxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="448232084"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2021 18:18:53 -0700
Message-ID: <945111d60becf218aa5aabbbfb2a6bab2d94890c.camel@linux.intel.com>
Subject: Re: [PATCH RESEND v2] i386/cpu: Remove the deprecated cpu model
 'Icelake-Client'
From: Robert Hoo <robert.hu@linux.intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Date: Thu, 29 Apr 2021 09:18:52 +0800
In-Reply-To: <20210428152447.tf2xugpiptgl3hej@habkost.net>
References: <1619577673-152264-1-git-send-email-robert.hu@linux.intel.com>
 <20210428152447.tf2xugpiptgl3hej@habkost.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=robert.hu@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Wed, 2021-04-28 at 11:24 -0400, Eduardo Habkost wrote:
> On Wed, Apr 28, 2021 at 10:41:13AM +0800, Robert Hoo wrote:
> > As it's been marked deprecated since v5.2, now I think it's time
> > remove it
> > from code.
> > 
> > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > ---
> > (Sorry, forgot to append changelog in last send.)
> > Changelog:
> > v2:
> >     Update removed-features.rst.
> >     Since previously no its deprecation info was recorded in
> > docs/system/deprecated.rst, nothing to update in it.
> 
> deprecated.rst has an entry for Icelake-Client.  See commit
> 3e6a015cbd0f ("i386: Mark Icelake-Client CPU models deprecated").
> 
Oh, my carelessness in the search. Thanks Eduardo!
Going to send v3 soon.


