Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848351E2F46
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 21:51:21 +0200 (CEST)
Received: from localhost ([::1]:51906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdfbc-0000sv-2L
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 15:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jdfaP-000090-1J; Tue, 26 May 2020 15:50:05 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:40620 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jdfaO-0007Ca-0Z; Tue, 26 May 2020 15:50:04 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 881704C80C;
 Tue, 26 May 2020 19:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1590522597; x=1592336998; bh=FVT/trrJgIfKMhmT84JJlK
 bLQPWgFe3TOBzRG1JQjs0=; b=EynrEIbhIjqUg8mWD0wefAPZofuKcxIq+rJbc7
 viKxbkNRU15Ce2ycJTtPaijHJ2ZFMw3ur3LbJxrOdwZn8tW+l55jlJJSNLZnMn0H
 FfLP5DD5AARZMCmD/+NJJhXRCVFEB9ggljQKt7usfEnl3VbAo18YVEeHurfq1evv
 L3xDY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ds3rRuzpHzvi; Tue, 26 May 2020 22:49:57 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0F3D446420;
 Tue, 26 May 2020 22:49:56 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 26
 May 2020 22:49:57 +0300
Date: Tue, 26 May 2020 22:49:57 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/7] sysemu/accel: Restrict machine methods to
 system-mode
Message-ID: <20200526194957.GC4851@SPB-NB-133.local>
References: <20200526172427.17460-1-f4bug@amsat.org>
 <20200526172427.17460-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526172427.17460-2-f4bug@amsat.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 15:16:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Edgar E .
 Iglesias" <edgar.iglesias@xilinx.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 26, 2020 at 07:24:21PM +0200, Philippe Mathieu-Daud� wrote:
> Restrict init_machine(), setup_post() and has_memory()
> to system-mode.
> 
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud� <f4bug@amsat.org>
> ---
>  include/sysemu/accel.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
> index 47e5788530..e08b8ab8fa 100644
> --- a/include/sysemu/accel.h
> +++ b/include/sysemu/accel.h
> @@ -37,10 +37,12 @@ typedef struct AccelClass {
>      /*< public >*/
>  
>      const char *name;
> +#ifndef CONFIG_USER_ONLY
>      int (*init_machine)(MachineState *ms);
>      void (*setup_post)(MachineState *ms, AccelState *accel);
>      bool (*has_memory)(MachineState *ms, AddressSpace *as,
>                         hwaddr start_addr, hwaddr size);
> +#endif
>      bool *allowed;
>      /*
>       * Array of global properties that would be applied when specific
> -- 
> 2.21.3
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman

