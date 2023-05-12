Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559C8700244
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 10:09:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxNqI-0007Go-DJ; Fri, 12 May 2023 04:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pxNqF-0007GS-2y
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:09:31 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pxNqB-0005AH-VY
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683878968; x=1715414968;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kCTtxsEhuZzQ+VZcfKh9R6zGcYO1oG4ee+atnmntaq0=;
 b=M3y1VaM8BVD/BSJmIPI8ECgieyzeJAlrO8ft2idW225wwCBZ4vRQdK++
 PUNF7G42qDG1aYvAkdBpLl+RwzE8LSnn+jAY8NFXTwgBdUKdEMExSezBb
 +ZtDyQvPHJxulpGieGT6s578Sz5SPJPJASEKJLfixEo4A++ZToBZT0/DK
 TckNFvjhVxDBkHt6G/jpkCAJEJU2gOMu2WsGD1pc9lc/lYYqY6aswo7pd
 pW2OMcJR56BREsNjO6CQZeJq2BQHJw7ULBR1A+3LcocDCffwz1SAecfht
 2//8r3cCHz+rmzrXTPhVkGKzIp2PGamDB6f7ywkDl0n4FtR4bWO40FUYg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="340045053"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="340045053"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 01:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="650546955"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="650546955"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.255.28.72])
 ([10.255.28.72])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 01:09:22 -0700
Message-ID: <f6e92f31-43ba-af11-6c33-0d2090e2b2c7@intel.com>
Date: Fri, 12 May 2023 16:09:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Subject: Re: [PATCH] docs: build-system: rename "default-configs" to "configs"
Content-Language: en-US
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, alex.bennee@linaro.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211004071203.2092017-1-kchamart@redhat.com>
From: "Wang, Lei" <lei4.wang@intel.com>
In-Reply-To: <20211004071203.2092017-1-kchamart@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=lei4.wang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.124, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There are also several "default-configs" in docs/devel/kconfig.rst, I think they
can also be updated in this patch.

BR,
Lei

On 10/4/2021 15:12, Kashyap Chamarthy wrote:
> Commit 812b31d3f9 (configs: rename default-configs to configs and
> reorganise, 2021-07-07) did the rename.
> 
> Reflect that update also in the documentation.
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/devel/build-system.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> index 0f636d620e..bfa5250802 100644
> --- a/docs/devel/build-system.rst
> +++ b/docs/devel/build-system.rst
> @@ -250,7 +250,7 @@ Target-dependent emulator sourcesets:
>    Each emulator also includes sources for files in the ``hw/`` and ``target/``
>    subdirectories.  The subdirectory used for each emulator comes
>    from the target's definition of ``TARGET_BASE_ARCH`` or (if missing)
> -  ``TARGET_ARCH``, as found in ``default-configs/targets/*.mak``.
> +  ``TARGET_ARCH``, as found in ``configs/targets/*.mak``.
>  
>    Each subdirectory in ``hw/`` adds one sourceset to the ``hw_arch`` dictionary,
>    for example::
> @@ -307,8 +307,8 @@ Utility sourcesets:
>  The following files concur in the definition of which files are linked
>  into each emulator:
>  
> -``default-configs/devices/*.mak``
> -  The files under ``default-configs/devices/`` control the boards and devices
> +``configs/devices/*.mak``
> +  The files under ``configs/devices/`` control the boards and devices
>    that are built into each QEMU system emulation targets. They merely contain
>    a list of config variable definitions such as::
>  
> @@ -317,11 +317,11 @@ into each emulator:
>      CONFIG_XLNX_VERSAL=y
>  
>  ``*/Kconfig``
> -  These files are processed together with ``default-configs/devices/*.mak`` and
> +  These files are processed together with ``configs/devices/*.mak`` and
>    describe the dependencies between various features, subsystems and
>    device models.  They are described in :ref:`kconfig`
>  
> -``default-configs/targets/*.mak``
> +``configs/targets/*.mak``
>    These files mostly define symbols that appear in the ``*-config-target.h``
>    file for each emulator [#cfgtarget]_.  However, the ``TARGET_ARCH``
>    and ``TARGET_BASE_ARCH`` will also be used to select the ``hw/`` and
> @@ -460,7 +460,7 @@ Built by Meson:
>    TARGET-NAME is again the name of a system or userspace emulator. The
>    config-devices.mak file is automatically generated by make using the
>    scripts/make_device_config.sh program, feeding it the
> -  default-configs/$TARGET-NAME file as input.
> +  configs/$TARGET-NAME file as input.
>  
>  ``config-host.h``, ``$TARGET-NAME/config-target.h``, ``$TARGET-NAME/config-devices.h``
>    These files are used by source code to determine what features

