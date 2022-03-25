Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD2D4E6CE3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 04:47:43 +0100 (CET)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXavO-0000gb-3p
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 23:47:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nXats-00080e-B7
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 23:46:08 -0400
Received: from mga14.intel.com ([192.55.52.115]:6876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nXatn-00063V-I6
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 23:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648179963; x=1679715963;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tpKV/MmyESqBwhK/yoP6flHWrgLSOl1A98iyOeygUaw=;
 b=VWTQo6dNvMA9HuKUrZynIoT0dChbTOf7CEv2//LBnKfvAnMcfvVxpdkT
 lUiYATljIveXG3f2dsY3wTjvssHTsgc3SUmvrTOqg3tUtNZHYBf2iWRSz
 KLVZaEpN4G9xv9t/JNZTyHlDPNzHD7nEI3QPSJeROrQAG1R6m54E04PaB
 ruDZbfdSBWdBCvOS0P4p7RU5Q8CJLb8L60OFgM3SP0er7UXNMs3hIKXWm
 Tk+6PWsi3RQ/pCKhJ83ahHQN6VK8p0gTEbkMtinVlioHRQRSb6sIrM58N
 dL+kX1m385loyR6bq6jEczXaLWBgjvpJWjF02lghno6FLcYT1du6RIRKL A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="258740072"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="258740072"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 20:45:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="544921601"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.203.174])
 ([10.249.203.174])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 20:45:56 -0700
Message-ID: <a0c367ee-360e-6907-d4bb-3e1c865cc640@intel.com>
Date: Fri, 25 Mar 2022 11:45:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH RESEND v1 0/2] i386: Make PIT and PIC the property of
 common x86 base machine type
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220310122811.807794-1-xiaoyao.li@intel.com>
 <20220310080630-mutt-send-email-mst@kernel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220310080630-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=xiaoyao.li@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/2022 9:07 PM, Michael S. Tsirkin wrote:
> On Thu, Mar 10, 2022 at 08:28:09PM +0800, Xiaoyao Li wrote:
>> For PIT, it's straightforward to merge microvm::pit and
>> pc_machine::pit_enabled into x86ms::pit
>>
>> For PIC, move microvm::pic to x86ms:pic, which gives PC machine the
>> ability to dis-/en-able PIC and it's the preparation for future TDX
>> support.
> 
> 
> Looks ok but we are in freeze. I will tag this but pls do ping me
> after the release to make sure it's not lost. Thanks!

Michael,

Do we need to wait until final 7.0.0 release, or rc1 is enough?



