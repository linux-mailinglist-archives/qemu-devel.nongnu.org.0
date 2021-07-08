Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD663C17B5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:05:35 +0200 (CEST)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XSw-0002Qf-QW
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m1X1I-0000wJ-OO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m1X1F-00076D-0x
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625762215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/cDttigQU1L1wgSGMJ7TJIjn/DO7IyQRUfbrAmnZm8k=;
 b=OXx2X90SmUOdXB74kSzax4hGXB7MnxPg3J5/CGJiRjQLwJR3O9NGI+NM/F+/mx0i/qhIDw
 pYxNDvz2Wy0yS2ujiwwqM6BOzPE9hF6jQKBa6/C6ZWE7AdBjpoE/913cVVwAEXGIqjNczD
 XCdqEzoV3BZ5PGmaqoTJTDbE3iMJcx0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-GVCF8r7iO42KliHxTU9k9w-1; Thu, 08 Jul 2021 12:36:54 -0400
X-MC-Unique: GVCF8r7iO42KliHxTU9k9w-1
Received: by mail-wm1-f71.google.com with SMTP id
 b26-20020a7bc25a0000b0290218757e2783so1087694wmj.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/cDttigQU1L1wgSGMJ7TJIjn/DO7IyQRUfbrAmnZm8k=;
 b=U31OjhXN7P1Fe1VVpv658CM6BZXEonoF0Qw62IqtexI2DlEJFmFSrXMTHDPCgmAbr3
 CRi5I0wYR2E/7VnkFdKovEqTCUpLo3qAWAKj2+3xu1jqmhEiACooEofuUXjefjIX0GyH
 +woqlxXdfUVa4tYBVh5CowsJ/WoCdQidPtKIfO48vKOAV7+6QKGjE6pCO2s6ZUTk7bL9
 XqKUr8ZNDTCCe3gGdaFR1/cU8LmpkoKawGrVzlk33UrZkyAa18hqgbiJnJ6nS8CVGN+3
 omGv3FAdUZce6Q+ezvOEXlE6Psqvshep1b0i7R2E4eAhyBdYJU1Q72FeWUq+JfEr2PP0
 NpAA==
X-Gm-Message-State: AOAM531zM79uXu33pvwLTRYf+gSWcaZEAugjiBlFG0Cx1k4SluapAhLY
 RdfPHEiI78IcAnkGDSq0JQlw5UmRG/MzUy4JfdL8gW9IlcfdPrEGoWwhCu7Dn5pzwL1xtNxQALc
 uE1cBefrjOcVHEzQ=
X-Received: by 2002:adf:a183:: with SMTP id u3mr16800815wru.175.1625762213420; 
 Thu, 08 Jul 2021 09:36:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzE21FmBQvw7GbrO7sCIdOCJijvwD1g9RcE315RO+JUw+DtZ+P0UrbtpBRyDK6H4CeL3iLZg==
X-Received: by 2002:adf:a183:: with SMTP id u3mr16800788wru.175.1625762213194; 
 Thu, 08 Jul 2021 09:36:53 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id d3sm2662203wrx.77.2021.07.08.09.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:36:52 -0700 (PDT)
Date: Thu, 8 Jul 2021 17:36:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] migration: fix typo in mig_throttle_guest_down comment
Message-ID: <YOcpogHz4GMigdwp@work-vm>
References: <20210708162159.18045-1-olaf@aepfle.de>
MIME-Version: 1.0
In-Reply-To: <20210708162159.18045-1-olaf@aepfle.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Olaf Hering (olaf@aepfle.de) wrote:
> Fixes commit 3d0684b2ad82a5dde68e3f08b0d7786dccaf619c ("ram: Update
> all functions comments")
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 723af67c2e..88ff34f574 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -600,7 +600,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
>  }
>  
>  /**
> - * mig_throttle_guest_down: throotle down the guest
> + * mig_throttle_guest_down: throttle down the guest

Ah yes, Juan frequently throotles.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>   *
>   * Reduce amount of guest cpu execution to hopefully slow down memory
>   * writes. If guest dirty memory rate is reduced below the rate at
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


