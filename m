Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E333B8813
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 19:56:20 +0200 (CEST)
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyeRf-0001AO-Vb
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 13:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyeQL-0000Uy-7P
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:54:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyeQJ-0003KJ-Gk
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625075694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BypkCkC4fJl1w6bwIjzIgNhcV2I86e8Vul75D3vlC3E=;
 b=E2y3JJBiE3ea59T+92uMAZgkTaWsq/K2LrVrBXS8llNkBwJ9ler41sf83KEpw55QLAf7zo
 8ZyXAHiX7dGRC05oUjdC+YX34SLgtlVkGskZ5cdzw57tBphWBSg021HfpjjwO7JCpY1c+L
 DXl4kTZmkMOLg087RIBWBtCVTDfixOA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-HbG2OgTMMomDNLNJT4Gygw-1; Wed, 30 Jun 2021 13:54:53 -0400
X-MC-Unique: HbG2OgTMMomDNLNJT4Gygw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so1275410wru.6
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 10:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BypkCkC4fJl1w6bwIjzIgNhcV2I86e8Vul75D3vlC3E=;
 b=Ie9COGeIvGUyqoIWta5t+4548qjo6wB9YXPqgloHhgCg731H+D5tYba3VseOiC1Pmh
 ndBcKsqz/N2ERC3xka5aD5mNczs9UfE25IjgalbUIoUO83Yc7nBNlPW9Ad3wuw+Nf8PQ
 MFxyXLZRH2AADWETPEdN+m+5hZXM2zdU1b89YUsJdLeeAe0lnADjwdjUIzf4wtmBDIfD
 gmg9ZgcK3FLu7zm6kjxVXEswq3H6vP2+/Yj1kjiMh5engq4u2Q7jFfVm736iXNK+6I5o
 6BroCJSOypv8jskiYkif79Rv1HXdxfxX9Y10a1jjctImT0oQ1ud7H1IfJupfC38TqDsH
 uufA==
X-Gm-Message-State: AOAM530JV+QsUPRrBDtggNAWZWNZ/RF6A2qCp8sM1LiWGgj59kg1XBbB
 aa390qh5gEOz6BG7KKV8mRZ/RQcehDsJGHCIQO+un8gFY3JA6+gJBTxrD8nB/eAKMbTz8a3AGMI
 vcP+DNGusW0HyOjA=
X-Received: by 2002:a05:6000:12d1:: with SMTP id
 l17mr2733498wrx.225.1625075692180; 
 Wed, 30 Jun 2021 10:54:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsWT/eSBCHcaXTpnHUj9DPs+TQl1K0+k8u27gO/vZ2Ln7mlggBmq9JFT5zn80IKt2a/EMAIw==
X-Received: by 2002:a05:6000:12d1:: with SMTP id
 l17mr2733488wrx.225.1625075691980; 
 Wed, 30 Jun 2021 10:54:51 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id d3sm22412896wrx.28.2021.06.30.10.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 10:54:51 -0700 (PDT)
Date: Wed, 30 Jun 2021 18:54:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 0/2] migration: failover: continue to wait card unplug on
 error
Message-ID: <YNyv6RjOsLp+XQU8@work-vm>
References: <20210629155007.629086-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210629155007.629086-1-lvivier@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> We need to wait the end of the unplug phase to be able
> to plug back the card.
> 
> Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1976852

Queued

> 
> Laurent Vivier (2):
>   migration: move wait-unplug loop to its own function
>   migration: failover: continue to wait card unplug on error
> 
>  migration/migration.c | 65 ++++++++++++++++++++++++-------------------
>  1 file changed, 37 insertions(+), 28 deletions(-)
> 
> -- 
> 2.31.1
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


