Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4A82D3279
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:59:51 +0100 (CET)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiDG-0006mZ-9g
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kmhsT-0004v7-Cx
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kmhsF-0001rg-Tw
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607452686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FIIzqf5kPiiiWI1rdNGNJKS6hAR1I5+C79o18LphJf0=;
 b=fr821gOPSi41j3NqlgbvizKP4vzgJENhMwTgvqYmnRPt3t2vScXxiCDNgPTQwV2j5E5gzW
 /NSMTiX6ukotPAKnJDjBUM98+ugrl04uuksQ9R8jT4L3lXdP8H1qdMv4bb96hdgSCa7yM1
 z8fX+EEqXnQoNlawcWzt2htYldorDNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-zEc2ey9pOlap3IldrJqG6w-1; Tue, 08 Dec 2020 13:38:03 -0500
X-MC-Unique: zEc2ey9pOlap3IldrJqG6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EF20195D560;
 Tue,  8 Dec 2020 18:38:01 +0000 (UTC)
Received: from work-vm (ovpn-114-53.ams2.redhat.com [10.36.114.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D9B76064B;
 Tue,  8 Dec 2020 18:37:56 +0000 (UTC)
Date: Tue, 8 Dec 2020 18:37:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] pcie_aer: Fix help message of pcie_aer_inject_error
 command
Message-ID: <20201208183753.GC31369@work-vm>
References: <20201204030953.837-1-yuzenghui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201204030953.837-1-yuzenghui@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Queued

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
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


