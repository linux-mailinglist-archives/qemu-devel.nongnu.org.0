Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412122B8185
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:10:18 +0100 (CET)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQ2D-0000KU-1f
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfQ1S-0008KX-0v
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:09:30 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:59854 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfQ1O-0000oO-Sd
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:09:29 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8DF4241316;
 Wed, 18 Nov 2020 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1605715763;
 x=1607530164; bh=4ZC5MoASCFVjpIsNm4cjbnvtsOHXcf3i8V9tBdLq7ww=; b=
 OUD1yHoVw/zCMtEICAzY9wCpYP8IkvQRw4O0jXVyb83tsVpNFv3BK5mrDXuqr4r2
 R2M4OLLYly/8Kfsf9Lpnxr6HLg2iY+DEcJT8Hb8mWDw73iEyaEsBZjPeoB+siMna
 IeHzJX1xOM8x/JoCoEngfK0QcAUDUFu/vjesppEaXJg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naAeO-fP_pGZ; Wed, 18 Nov 2020 19:09:23 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E2C32412E2;
 Wed, 18 Nov 2020 19:09:19 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 18
 Nov 2020 19:09:19 +0300
Date: Wed, 18 Nov 2020 19:09:18 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v3 4/9] i386: hvf: remove stale MAINTAINERS entry for old
 hvf stubs
Message-ID: <20201118160918.GB81070@SPB-NB-133.local>
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-5-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201118102936.25569-5-cfontana@suse.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 11:09:24
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Olaf Hering <ohering@suse.de>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 haxm-team@intel.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 11:29:31AM +0100, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 463317784c..e892dd2220 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -443,7 +443,6 @@ M: Cameron Esfahani <dirty@apple.com>
>  M: Roman Bolshakov <r.bolshakov@yadro.com>
>  W: https://wiki.qemu.org/Features/HVF
>  S: Maintained
> -F: accel/stubs/hvf-stub.c
>  F: target/i386/hvf/
>  F: include/sysemu/hvf.h
>  
> -- 
> 2.26.2
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman

