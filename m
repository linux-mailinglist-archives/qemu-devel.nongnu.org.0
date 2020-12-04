Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BE2CEB7C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 10:56:09 +0100 (CET)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl7ou-00007l-97
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 04:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kl7o8-0007wy-5T
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 04:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kl7o5-00012O-Tj
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 04:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607075716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UdkMXnDf1BrUmuc2WT5EEKE5m4sPrlR2iJn49MdYmI4=;
 b=Ek7MXFLh+mr3ySgO1N9tkH7/kfs8a7VfOS7ArC0Ut0LFMezNYi6YTCGnfJmus3T9iVkIvZ
 c4uXv2hckW9Bu/6nF4MB6kSCC2tDATlJSCoIaE41tQOsYS1jiHXc6g3JS5/Dv/Wzd9vuh+
 c3ZNEq4ZeZ0wrX40pcSdkkdjz3clvLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-gLFqwnMSMVOLR7G4z2vIsQ-1; Fri, 04 Dec 2020 04:55:15 -0500
X-MC-Unique: gLFqwnMSMVOLR7G4z2vIsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 174D0107ACE3;
 Fri,  4 Dec 2020 09:55:14 +0000 (UTC)
Received: from work-vm (ovpn-114-202.ams2.redhat.com [10.36.114.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A611002391;
 Fri,  4 Dec 2020 09:55:09 +0000 (UTC)
Date: Fri, 4 Dec 2020 09:55:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] pcie_aer: Fix help message of pcie_aer_inject_error
 command
Message-ID: <20201204095506.GA2883@work-vm>
References: <20201204030953.837-1-yuzenghui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201204030953.837-1-yuzenghui@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wanghaibin.wang@huawei.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zenghui Yu (yuzenghui@huawei.com) wrote:
> There is an interesting typo in the help message of pcie_aer_inject_error
> command. Use 'tlp' instead of 'tlb' to match the PCIe AER term.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

Well spotted; thanks!


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hmp-commands.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index ff2d7aa8f3..dd460eb908 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1302,8 +1302,8 @@ ERST
>  	              " -c for correctable error\n\t\t\t"
>                        "<id> = qdev device id\n\t\t\t"
>                        "<error_status> = error string or 32bit\n\t\t\t"
> -                      "<tlb header> = 32bit x 4\n\t\t\t"
> -                      "<tlb header prefix> = 32bit x 4",
> +                      "<tlp header> = 32bit x 4\n\t\t\t"
> +                      "<tlp header prefix> = 32bit x 4",
>          .cmd        = hmp_pcie_aer_inject_error,
>      },
>  
> -- 
> 2.19.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


