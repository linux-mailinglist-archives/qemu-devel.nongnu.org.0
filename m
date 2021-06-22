Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5413B0B88
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 19:36:36 +0200 (CEST)
Received: from localhost ([::1]:57766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvkKC-0004s3-0C
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 13:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lvkJ9-0003pp-UZ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lvkJ6-0007d1-Ti
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624383327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nEtS+hRrExaDXfVvNYp0/RvU0PHBaspb0foMmEsGHyc=;
 b=IFUbNNWnDpefrdr0IFvkv/1Ivg0JPCIBKidwWdKacXHouYaTE6nV7bXLynmgqtLILsKNOm
 2iVbpMmSAJ9foQhvflK7kpnLzAh8alNpopgjjrCupHVbI+Zv44mUyb6i0QbeBJZcNEaB28
 G2bd9ZVNZc6Vu9Bm0RQDJfRcG6AD1/k=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-QlHkrOvpO06Hk_pDLRbOPA-1; Tue, 22 Jun 2021 13:35:25 -0400
X-MC-Unique: QlHkrOvpO06Hk_pDLRbOPA-1
Received: by mail-qv1-f72.google.com with SMTP id
 r15-20020a0562140c4fb0290262f40bf4bcso18281653qvj.11
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 10:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nEtS+hRrExaDXfVvNYp0/RvU0PHBaspb0foMmEsGHyc=;
 b=CtUNvOmdz4sXyosLOUXW6XgM3V3daj37/jhCjIP0j0c3p436cogMACkBA7Zyi/FIRu
 rLXMOlTtgTP5s2HkNnMscMUqyrb1DCFthcaLl/TG56KjcKkiCJ9sSsRSLxxRvPkzfxyx
 wp3rHUd/3ya4bqeRyP+7a+wuOK1MZbp9Y9BKyl5PuT400sd8uwWGei93+RQwvR5fMUdB
 NpH+decXGDa+C7rV0yCv5xOKghv/dRaEHoBHicyLjtGXzkTd+p/rH5xV+JrgHARGGTEX
 QNZj+vVbE0QNgKorMg0Rw/7xkyNcwneMZlanp301AE3biQvq6d53rQ7nbbc9JqJIH0YD
 WQAg==
X-Gm-Message-State: AOAM533gGh7BC9F8eqGtA6FwCMh4jEU0kQdGKy3w+8D5epHbAafpUT0Z
 l7/PWSBxJjeZaTbPCGKckIapdhvQwz2a5XqALfHFOxFZI6VsvMVAIGgkBz1Uoy2Z3ECGVOUOQJT
 +PK3tLAlg2XI17S4=
X-Received: by 2002:ac8:a84:: with SMTP id d4mr4481898qti.109.1624383325149;
 Tue, 22 Jun 2021 10:35:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIIQxszUf3LP2KtI1JDJpJ0a15w5Ncp6hVBeHJWhtysM7aqOp9CX1x/IXjgmxWWmhOFG3QUA==
X-Received: by 2002:ac8:a84:: with SMTP id d4mr4481884qti.109.1624383324949;
 Tue, 22 Jun 2021 10:35:24 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id z13sm2126972qtn.4.2021.06.22.10.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 10:35:24 -0700 (PDT)
Date: Tue, 22 Jun 2021 13:35:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 3/3] avocado_qemu: Add Intel iommu tests
Message-ID: <YNIfWwY6HCfOvxRg@t490s>
References: <20210621080824.789274-1-eric.auger@redhat.com>
 <20210621080824.789274-4-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210621080824.789274-4-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: crosa@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Eric,

On Mon, Jun 21, 2021 at 10:08:24AM +0200, Eric Auger wrote:
> Add Intel IOMMU functional tests based on fedora 31.
> Different configs are checked:
> - strict
> - caching mode, strict
> - passthrough.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

Thanks for adding this test!

-- 
Peter Xu


