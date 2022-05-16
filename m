Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3592528B97
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:08:22 +0200 (CEST)
Received: from localhost ([::1]:44004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeCj-0000jz-Rn
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nqdTA-0003sZ-5M
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:21:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nqdT7-0007XK-EU
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652718072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F4L3pba9X2qa1PBJuUZHmYMXDPTt0Fxq1nGqIiFHWes=;
 b=QHJqgbSMnlka47mIcBIVa023ATyUpsGIUGX3+rB8GDlCvXnl6HhsH78ENPnLnWd1xqf385
 2vvSO6NuQTumfyX3ahRbZNPnXe86DaIPOWjraNk4aj3PhX/O6M2PeV5W1WcH78kS0IkLf+
 IEP3ltZU4DbhpLOhZVRo8vH/JGncY68=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-3bYENTKoP3qg6lb8gDVzNg-1; Mon, 16 May 2022 12:21:11 -0400
X-MC-Unique: 3bYENTKoP3qg6lb8gDVzNg-1
Received: by mail-io1-f70.google.com with SMTP id
 n5-20020a056602340500b0065a9f426e7aso10769563ioz.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 09:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F4L3pba9X2qa1PBJuUZHmYMXDPTt0Fxq1nGqIiFHWes=;
 b=U2d4Uff5kmETvJv5geJ5YHMYKck1jXZU8tBh+5Z9f7+yeQOHQnAa/d01pJmVtLxNfn
 kRgApSSVkIyhvdZR1q87ZdP1SIhkvngc9DttmUlOfm+gQL+oaRqZXHaYT3x88XN1kCXM
 4qKvY4YUq5EgCFcAIx8d+iwE6mLTS4XiVIRYI4M1BcC6VwP0fyn5tfCzCxRSHSPSyQVZ
 gYXDvfADa/ao4dxsMnteuXtB0TapBxuvZxyAloeEXz51MTAL3HRU09Dpj6dBLzPpzeTA
 CCqoatLM4AP2l8UFlmN1ryJEzK1Ag7J5+PtPI/MuNWe8BPwSjIGD6DNkLG083A1ICdyj
 bhSg==
X-Gm-Message-State: AOAM532lEqbt7J7IfSfW7q9j/Jc8dLeSng0344ugeK3EbTDWTxJBiNvV
 5A3Xsi6slu9uvWdpPXnFlS5RAzYKHzfmfEcy7RLJ18NsulDCY6S5YLBN2syG50VqKrcXGS/x0GD
 s6WPTToe0Vigco6U=
X-Received: by 2002:a02:a894:0:b0:32e:298f:1041 with SMTP id
 l20-20020a02a894000000b0032e298f1041mr3443344jam.172.1652718070320; 
 Mon, 16 May 2022 09:21:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCvYutv5gEHXeahIszh3O3KBKbgv9NItLAt/vRKkGwVr3R/Hb0mjk+Z7boKB25aHV7MI238A==
X-Received: by 2002:a02:a894:0:b0:32e:298f:1041 with SMTP id
 l20-20020a02a894000000b0032e298f1041mr3443327jam.172.1652718070085; 
 Mon, 16 May 2022 09:21:10 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a05660214c200b0065a47e16f60sm2714347iow.50.2022.05.16.09.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:21:09 -0700 (PDT)
Date: Mon, 16 May 2022 12:21:08 -0400
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 14/21] migration: Create the postcopy preempt channel
 asynchronously
Message-ID: <YoJ59CuHYS2BBBKg@xz-m1.local>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-15-peterx@redhat.com>
 <0ad87fcb-28d2-1be7-eece-d57931af23e8@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ad87fcb-28d2-1be7-eece-d57931af23e8@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 16, 2022 at 08:32:01PM +0530, manish.mishra wrote:
> Reviewed-by: Manish Mishra <manish.mishra@nutanix.com>
> 
> This also looks good to me, sorry if i mis-understood and this is not correct way to add review tag.

This is, and I'll collect it when I repost. :)

Thanks,

-- 
Peter Xu


