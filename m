Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59F749047D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:59:49 +0100 (CET)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Nrg-0001WA-FW
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:59:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9Npr-0000Ze-PL
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:57:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9Npq-0008Hr-75
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:57:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642409873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lkM9D+hKZicLzPjC4IAzPnNgmKE5BQxg+XnuzvHlA0=;
 b=Ek0cpnkvEpGm03+zpDlEmx1Ead3362xeDq0YuA79eQjicfQJInmIHe+hIK6qJn4yMG3lSW
 o8InWxpmjfmDkjTviDr5tMuK4ohJvZkCHb7meOeWKTbMTVEJ1vh4G53TGr6oDwStKEqTbH
 l50Xou+0vHcXaMHpJ0jDLjuaIS8sSR8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-L7Gmp3xjOKCyBeNbmG4Jxg-1; Mon, 17 Jan 2022 03:57:50 -0500
X-MC-Unique: L7Gmp3xjOKCyBeNbmG4Jxg-1
Received: by mail-pf1-f197.google.com with SMTP id
 n203-20020a628fd4000000b004be3d8ec115so5872401pfd.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 00:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9lkM9D+hKZicLzPjC4IAzPnNgmKE5BQxg+XnuzvHlA0=;
 b=TtODw3MrUX+/kTjMZIu0c9JOmgciTDeUJ/+ruVrBYezb/V1GuRnGkSG4kpjqxTJKgW
 WHiOdkzA75pAANDZX1QQMmEivkSALWQQJby6qKyjtW/7gunjEqmV0+wNYZQ1hL+jXkJs
 sqcrpRHZTLhn7EfXijgIiZ3swT7cbKjJ3daK8BLqfafxOCFdkeU+CCgAxDEqbYwYo+7B
 ekUx88k1o1SP+rTNRfxrZzFTgPt6tL7qHUs1OSs1/Vd0d1+Mw9aUCnZv9i+Zu/pD1ORd
 N8eDlSLWy3Wr5fpqk2rCdj1sj+DwzAB+8F+PHR5FwcipX1oDRZw+5Nzbp4yS76PofTcc
 INpA==
X-Gm-Message-State: AOAM532gCR8FBHWc5Nk5890nK7ARGl5O4jXYRw18p8PhRxQ/YDjShLja
 jeGxnirwxQruVutzYQkpRIVEN1l7EqERHSQyd1mNRh1g7MbSav5IOz5kai82YohbSlzVNb1lYD+
 YtYYdBMTWWusV6Ag=
X-Received: by 2002:a17:902:e9d3:b0:14a:aae2:7bce with SMTP id
 19-20020a170902e9d300b0014aaae27bcemr7307164plk.34.1642409869363; 
 Mon, 17 Jan 2022 00:57:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdKC6csyzA9lEOYFcMCUsUDudM5vrzICEKNV2tJA9MzjC0POpwYoumPxXIxBCyuaOVK/i+5Q==
X-Received: by 2002:a17:902:e9d3:b0:14a:aae2:7bce with SMTP id
 19-20020a170902e9d300b0014aaae27bcemr7307155plk.34.1642409869140; 
 Mon, 17 Jan 2022 00:57:49 -0800 (PST)
Received: from xz-m1.local ([191.101.132.74])
 by smtp.gmail.com with ESMTPSA id f125sm12834329pfa.28.2022.01.17.00.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:57:48 -0800 (PST)
Date: Mon, 17 Jan 2022 16:57:43 +0800
From: Peter Xu <peterx@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 1/3] exec/memory: Extract address_space_set() from
 dma_memory_set()
Message-ID: <YeUvh+OBefyxDEvv@xz-m1.local>
References: <20220115203725.3834712-1-laurent@vivier.eu>
 <20220115203725.3834712-2-laurent@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <20220115203725.3834712-2-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 15, 2022 at 09:37:23PM +0100, Laurent Vivier wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> dma_memory_set() does a DMA barrier, set the address space with
> a constant value. The constant value filling code is not specific
> to DMA and can be used for AddressSpace. Extract it as a new
> helper: address_space_set().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> [lv: rebase]
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


