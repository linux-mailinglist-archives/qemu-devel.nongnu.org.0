Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE962370506
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 04:32:09 +0200 (CEST)
Received: from localhost ([::1]:56686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcfQO-0001hd-WD
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 22:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lcfNv-0007Xp-KU; Fri, 30 Apr 2021 22:29:35 -0400
Received: from mga05.intel.com ([192.55.52.43]:54865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lcfNt-0007MK-Ku; Fri, 30 Apr 2021 22:29:35 -0400
IronPort-SDR: oq42WJHtT79GkCTDEhncbG66xnwmQKcHnX6xqVqzrb28RKoJxaTSxUZMqX4j9J+douAvac/dbh
 HOly5lXLyZ/w==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="282760717"
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="282760717"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 19:29:30 -0700
IronPort-SDR: WfZLHPNjRyIYa4f6z6sFHz7HSC4jUo7ccP+ga+IMGDlMGwBKZ94Od+Ndf3HijFR/RN2hwPoZr4
 rzFsquFctPRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="620405252"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga005.fm.intel.com with ESMTP; 30 Apr 2021 19:29:29 -0700
Message-ID: <52be4506d86b899f185278373fc2e031000a7ab8.camel@linux.intel.com>
Subject: Re: [Trivial] docs: More precisely describe memory-backend-*::id's
 user
From: Robert Hoo <robert.hu@linux.intel.com>
To: mjt@tls.msk.ru, laurent@vivier.eu, qemu-trivial@nongnu.org
Date: Sat, 01 May 2021 10:29:28 +0800
In-Reply-To: <1619080922-83527-1-git-send-email-robert.hu@linux.intel.com>
References: <1619080922-83527-1-git-send-email-robert.hu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=robert.hu@linux.intel.com; helo=mga05.intel.com
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
Cc: robert.hu@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for review ...
Thanks.

On Thu, 2021-04-22 at 16:42 +0800, Robert Hoo wrote:
> 'id' of memory-backend-{file,ram} is not only for '-numa''s
> reference, but
> also other parameters like '-device nvdimm'.
> More clearly call out this to avoid misinterpretation.
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> ---
>  qemu-options.hx | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fd21002..635dc8a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4508,11 +4508,11 @@ SRST
>          the guest RAM with huge pages.
>  
>          The ``id`` parameter is a unique ID that will be used to
> -        reference this memory region when configuring the ``-numa``
> -        argument.
> +        reference this memory region in other parameters, e.g. ``-
> numa``,
> +        ``-device nvdimm``, etc.
>  
>          The ``size`` option provides the size of the memory region,
> and
> -        accepts common suffixes, eg ``500M``.
> +        accepts common suffixes, e.g. ``500M``.
>  
>          The ``mem-path`` provides the path to either a shared memory
> or
>          huge page filesystem mount.


