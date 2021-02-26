Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CA1326619
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 18:07:45 +0100 (CET)
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFgae-0002I5-LD
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 12:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFgSz-0004ZA-MD
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:59:50 -0500
Received: from mx2.suse.de ([195.135.220.15]:50598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFgSv-0007H3-1d
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:59:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 188B6AB8C;
 Fri, 26 Feb 2021 16:59:43 +0000 (UTC)
Subject: Re: [PATCH 0/2] target/i386: Fix cpu_x86_{fsave,frstor,fxsave,fxrstor}
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210226162022.375654-1-richard.henderson@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <bba3bfb8-6f8c-9a14-d7c6-b19b904be020@suse.de>
Date: Fri, 26 Feb 2021 17:59:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210226162022.375654-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.349,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, philmd@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 5:20 PM, Richard Henderson wrote:
> As discussed during review of Claudio's "i386 cleanup" patch set.
> 
> 
> r~
> 
> 
> Richard Henderson (2):
>   target/i386: Rename helper_fldt, helper_fstt
>   target/i386: Split out do_fsave, do_frstor, do_fxsave, do_fxrstor
> 
>  target/i386/tcg/fpu_helper.c | 65 +++++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 24 deletions(-)
> 
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Tested-by: Claudio Fontana <cfontana@suse.de>


