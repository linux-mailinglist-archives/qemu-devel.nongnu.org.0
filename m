Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F94EE29A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:25:54 +0200 (CEST)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na1Mf-0005kz-FR
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:25:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1na1LU-0004s1-K8
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1na1LR-0003VD-UC
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648758276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kO0Zgc3CvYHtQXWcqYhNfutbAXrIgKp/gA8pdxySxcg=;
 b=KLZdIw2sUFC1ApNIhps0QBB9W5bqAGP2TXndhjiVWkzFtHQ21378FXgkS0MB7JlmcCa1UP
 KFLlYwNhZexQq/r095MiC95Eli7V+XsrWkW743lKGE3fvttrDSbZ64vUn7KoXuqRYHQ5hH
 WL4SXNPxOa3vgIzNU4v+CkCA4YjNyI4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-u8Am8Z_5N-CA-re62ww7HQ-1; Thu, 31 Mar 2022 16:24:34 -0400
X-MC-Unique: u8Am8Z_5N-CA-re62ww7HQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 t124-20020a1c4682000000b0038c8e8f8212so300418wma.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 13:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kO0Zgc3CvYHtQXWcqYhNfutbAXrIgKp/gA8pdxySxcg=;
 b=EBAqgoA3dHWpd5ktSZHlzilJmD+VTQopxUwcDRQiXO5d4y8ypR2Ees1MK0OpRTJnKa
 XCeLHzqHkaL6ig16TVXtCgh+95BS/CogrHJvbjrS/zdT8OQv9Cj2ZFD7bgiy6kpdDyl3
 WPeSDpga93FxnZctNzf1JV7lFZtwSZVn3RDA0KVlmCw+bIVuNWxI0rr8cOiCSzWtxLFQ
 vtjGE/a9/qr7MYtqtjR4zduh5ojtmMkd8z8zIig5u4+s5UX1tAFL/TwfrQEzSPSuCPKS
 GMDF7Z//+3E6gjbABIIkC1PAzomKzMbPeQ+V0wOWGOXNA1jO2PRfFZnhkk1g4SEjXQCI
 8OFw==
X-Gm-Message-State: AOAM531jLCwkY0/Po9unx0+AWaV6fr+T2U45svBhH3Uq57v0Qy9Ghey5
 aOBcPfodRKXVjgNnHUrzhM4QoukiBC9i1yB769QPMBCJHen6l+6mjpxXfMjUBdXZV+7cR5bbFCn
 pk08Tpu4ZgPTukHo=
X-Received: by 2002:adf:9bc5:0:b0:205:8ef8:c0be with SMTP id
 e5-20020adf9bc5000000b002058ef8c0bemr5152733wrc.22.1648758272511; 
 Thu, 31 Mar 2022 13:24:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhzCRwxdDklBfXcYB32Z6eSRqcRHg2M52W0qseynukG4FoIUcQN6jnaNeR/UAVX4gPhI1UEg==
X-Received: by 2002:adf:9bc5:0:b0:205:8ef8:c0be with SMTP id
 e5-20020adf9bc5000000b002058ef8c0bemr5152722wrc.22.1648758272320; 
 Thu, 31 Mar 2022 13:24:32 -0700 (PDT)
Received: from redhat.com ([2.55.151.201]) by smtp.gmail.com with ESMTPSA id
 a6-20020a05600c224600b0038cbfb9cfbcsm7941619wmm.47.2022.03.31.13.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:24:31 -0700 (PDT)
Date: Thu, 31 Mar 2022 16:24:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/3] i386: firmware parsing and sev setup for -bios
 loaded firmware
Message-ID: <20220331162404-mutt-send-email-mst@kernel.org>
References: <20220331083549.749566-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220331083549.749566-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 10:35:46AM +0200, Gerd Hoffmann wrote:
> 


Looks good.
Acked-by: Michael S. Tsirkin <mst@redhat.com>


Who's merging this? Yourself?

> Gerd Hoffmann (3):
>   i386: move bios load error message
>   i386: factor out x86_firmware_configure()
>   i386: firmware parsing and sev setup for -bios loaded firmware
> 
>  include/hw/i386/x86.h |  3 +++
>  hw/i386/pc_sysfw.c    | 36 ++++++++++++++++++++++--------------
>  hw/i386/x86.c         | 32 ++++++++++++++++++++++++--------
>  3 files changed, 49 insertions(+), 22 deletions(-)
> 
> -- 
> 2.35.1
> 


