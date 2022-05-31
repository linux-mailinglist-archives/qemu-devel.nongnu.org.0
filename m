Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ADB5397FE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 22:34:43 +0200 (CEST)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw8Ze-0008T2-LZ
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 16:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nw8Yl-0007iL-4L
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:33:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:31904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nw8Yh-0000uZ-OO
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654029223; x=1685565223;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=4Dt+UaknDrvUptvt8wTCHywhASH6MPbDyoTXaXk21HI=;
 b=AYBYvYsRVLxRyY6UzytJcCFAVOx+KAZNXhSUD4W8sCcdj/TZnNPyrx2D
 Hnj16R1XJ5cj+GWGcpTxISgmjNbX+8teLJa7/ZpvkOl9gUz1aY4/EDkgK
 Z5jOGWNlKTsA5/ugWyw70pyl43tst926EoZCmLnf6F0I8xFJ+OXoXXQ/V
 QECIP8IF6GQlsP8z/48eM9bsg3ZNKKJumiUqtQvQEyi8MTbzJYTsR48Du
 7D0axFBlWSbYcVbq9JgMGi+1k/s04ium7qLNBkn4QSF4EV8rfKyTICzBt
 ucIP/N6YS/DumTFMzp0rReMI9r7pldacmBI60bjzQnMgV7mKSm3hzMB7O w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="257448123"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="257448123"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 13:33:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="562483278"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.212.21.173])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 13:33:37 -0700
Date: Tue, 31 May 2022 13:33:35 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com
Subject: Re: [PATCH 0/3] ui/gtk: new options, monitor and detach-all
Message-ID: <20220531203335.GA124@dongwonk-MOBL.amr.corp.intel.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428231304.19472-1-dongwon.kim@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=dongwon.kim@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dropping this.
New series with suggested changes from reviewers can be found at
https://lists.nongnu.org/archive/html/qemu-devel/2022-05/msg06245.html

On Thu, Apr 28, 2022 at 04:13:01PM -0700, Dongwon Kim wrote:
> This patch series introduces two new gtk optional parameters, monitor
> and detach-all. "monitor" is for specifying a display where QEMU window
> will be launched from. "detach-all" is making all VCs detached upon
> QEMU's launch. The use-case we originally wanted to deal with is when
> multiple displays (max_output = n) are assigned to the guest os and
> each guest display needs to be full-screened to certain physical monitor.
> This can be achieved when these new parameters are properly configured
> together with existing full-screen option set to true.
> 
> Dongwon Kim (3):
>   ui/gtk: new param monitor to specify target monitor for launching QEMU
>   ui/gtk: detach_all option for making all VCs detached upon starting
>   ui/gtk: specify detached window's size and location
> 
>  qapi/ui.json    | 11 +++++++--
>  qemu-options.hx |  2 +-
>  ui/gtk.c        | 66 +++++++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 74 insertions(+), 5 deletions(-)
> 
> -- 
> 2.30.2
> 

