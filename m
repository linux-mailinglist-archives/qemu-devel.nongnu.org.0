Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE47E4288D8
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 10:34:16 +0200 (CEST)
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZqlD-0004d0-9M
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 04:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1mZqjw-0003TY-PC
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 04:32:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:17541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1mZqju-0006mf-03
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 04:32:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="225600573"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="225600573"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 01:32:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="490382951"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.2.71])
 ([10.238.2.71])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 01:32:39 -0700
Subject: Re: [PATCH v2 2/2] target/i386: Remove core-capability in Snowridge
 CPU model
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
References: <20210827064818.4698-1-chenyi.qiang@intel.com>
 <20210827064818.4698-3-chenyi.qiang@intel.com>
From: Chenyi Qiang <chenyi.qiang@intel.com>
Message-ID: <090602ec-839d-ca48-e225-ef4b601f150d@intel.com>
Date: Mon, 11 Oct 2021 16:31:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210827064818.4698-3-chenyi.qiang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=chenyi.qiang@intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

Ping for this minor change.

On 8/27/2021 2:48 PM, Chenyi Qiang wrote:
> Because core-capability releated features are model-specific and KVM
> won't support it, remove the core-capability in CPU model to avoid the
> warning message.
> 
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> ---
>   target/i386/cpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index aebf81d9c9..86a15af1ed 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -3684,9 +3684,10 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>               },
>               {
>                   .version = 4,
> -                .note = "no split lock detect",
> +                .note = "no split lock detect, no core-capability",
>                   .props = (PropValue[]) {
>                       { "split-lock-detect", "off" },
> +                    { "core-capability", "off" },
>                       { /* end of list */ },
>                   },
>               },
> 

