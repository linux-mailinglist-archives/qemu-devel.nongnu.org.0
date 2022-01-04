Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71FE483C7B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 08:29:33 +0100 (CET)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4eGC-0004AQ-Bb
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 02:29:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n4eCw-0003Pn-54
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 02:26:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n4eCs-0007Ja-UD
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 02:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641281165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JLdAwjDTJp7sVDMx/x79697JdW13Yd7WBoM1+jZqjQ=;
 b=K3/tssT1hDesxJpvVKNwx9TQ4HjCpxwV1eiHNT3mi4/9HCu6EWxJMrDoc9dlFxmkMEn6FY
 CLqGsEEEwH4FELmbhEWgGfp4viOsd2NTJ8BHki/duxBQbpD+vTQFEBDfKcqBniXtbfuDTq
 71mBdNOQG6j/QH4m+giJIKZvtHZQUG0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-v3MM8YxFNZutJ7deysiApQ-1; Tue, 04 Jan 2022 02:26:05 -0500
X-MC-Unique: v3MM8YxFNZutJ7deysiApQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 l6-20020a633e06000000b0034006440151so19298841pga.23
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 23:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/JLdAwjDTJp7sVDMx/x79697JdW13Yd7WBoM1+jZqjQ=;
 b=MELEuaGJ9EnK5tSU6qu+uG3NZr3LRWiTurquxKLpvAkabQq7m2rNGezh0MjHotH6I6
 mEmHDq6mzvzvCiSR/Rzry2bb14eMMEhYDhCsEZTu/v3ZIdOD5aoCVSI0S52SNgGPrqTZ
 DzrbyBpsyAKF06OqEuzbgvMuEHkn09TxZ+TdFnKBK1cfg8IXeQaRqLW9AugVXgeaIoG/
 1xEEzcjr+xLteZIefkUgGYqHqIo8pCpjKknUs6q02oMP4KhLHtlMon7wpSciOqPH4GxY
 F+O3v4Qi5Pjv0pBADLXs37arzaGUmFzAmpCCVFnWd4s9oHh1co3dwNTouEaWLele2oHq
 RmPw==
X-Gm-Message-State: AOAM532F8O/E8Kcei2JcnfzyoR9hDjpZcN6SXTFHohPpPdzkimBOPvJ4
 xq5SQ+tmq4WXOqnYDmpyDQgb1qxxVYav4dl0VLMsa/UVyFdekAtm8Vq4FlZ3ZewnJZ9PoREEr4h
 ocF2RQLM8mKb003o=
X-Received: by 2002:a17:90a:b108:: with SMTP id
 z8mr59109742pjq.99.1641281163839; 
 Mon, 03 Jan 2022 23:26:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwt9+1MVaa5lYT1V4AJhNK2xzUIV1PtGBP02ky91k9AXUoqUd1kHeXjHt2KV3Kpi4o3N6QcNA==
X-Received: by 2002:a17:90a:b108:: with SMTP id
 z8mr59109719pjq.99.1641281163560; 
 Mon, 03 Jan 2022 23:26:03 -0800 (PST)
Received: from xz-m1.local ([191.101.132.50])
 by smtp.gmail.com with ESMTPSA id f7sm39602686pfc.141.2022.01.03.23.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 23:26:03 -0800 (PST)
Date: Tue, 4 Jan 2022 15:25:55 +0800
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 3/8] hw/pci: Document pci_dma_map()
Message-ID: <YdP2g1kKQ7azrwV4@xz-m1.local>
References: <20211231114901.976937-1-philmd@redhat.com>
 <20211231114901.976937-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211231114901.976937-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 31, 2021 at 12:48:56PM +0100, Philippe Mathieu-Daudé wrote:
> +/**
> + * pci_dma_map: Map a physical memory region into a device PCI address space.

Shouldn't this be: "Map device PCI address space range into host virtual
address"?

-- 
Peter Xu


