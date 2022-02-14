Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00544B4409
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:24:43 +0100 (CET)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWf4-00040k-PD
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:24:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWJ7-0000b3-UJ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:02:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWJ3-0005zP-KC
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644825691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+sGPhioMqYnuOVtiMi72S0QiVgmtVQmsaKGZBGLCO8=;
 b=UBoTV9dRp52apFmvIa5TWXH4Ktio/FsFXmZQZGVei+J3QhcPA5yDOquugg5qtOaM+4bYmH
 TUMuB1k7rYmJuS398G3SwPSVa/KNuQ4uxZ22VJipa9N0zVHtLBQU9xPgHbdHQEK5UNKEPP
 CtauCmM/whEoAtlNzuu/iYFgIguNurA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-lUljvR1cONaqyzdoseICtg-1; Mon, 14 Feb 2022 03:01:28 -0500
X-MC-Unique: lUljvR1cONaqyzdoseICtg-1
Received: by mail-pj1-f72.google.com with SMTP id
 hi22-20020a17090b30d600b001b8b33cf0efso11669112pjb.1
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 00:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R+sGPhioMqYnuOVtiMi72S0QiVgmtVQmsaKGZBGLCO8=;
 b=nKTxmnLC+Sj9tpvIYs9HfEKBHIlZZZNQXSMw8IUaC241rLVwQXj84tcnVYMm2NRDoe
 n/+1U2rivAPAUgwMLtZx60xbbb7ijeVDKHzVgZRstSQEeHR6M4Ux1p7cRhi8/Yv7lU3l
 jWCwRPhyhoca6K1U4WMofHIxDSyhauQSaXmPj00gpze7iVjK98JuivtYmHTtIuU+hmJd
 CeyhqXdcpo5A3SFfbs96OKoLbZWXdOnKHuU3PwBE/c4eEORxXqHD9klXckQhPCJIq59y
 WVffqbMxEZyt36cZbUIag6Nii5jNmCmGhNAR8EgJHjfsAxTnrn77y1R0Wu4pA2jaJYnc
 U2rQ==
X-Gm-Message-State: AOAM533/n8oVX1er2h2YIo3lCzPzS8jlRoGmWayy4lO9D5Wjj+Sb5Zix
 7LYHFhQHPqtKubUaaijNoO2L7kPqwneb6D8BtN6GzP5JHDUmUbqD1FQudNFcNALSG5XA95J70Ih
 OHYD3xXSPqaCCLGw=
X-Received: by 2002:a17:90a:d512:: with SMTP id
 t18mr13131260pju.49.1644825687675; 
 Mon, 14 Feb 2022 00:01:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqmjzmcI+T8HZChSo4oxQbsEZFap1F2/ZaXfX3qTfYzS250hSVTyQtW15MbVJB4Ky9wXtz4g==
X-Received: by 2002:a17:90a:d512:: with SMTP id
 t18mr13131231pju.49.1644825687440; 
 Mon, 14 Feb 2022 00:01:27 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id oo7sm14014908pjb.33.2022.02.14.00.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:01:27 -0800 (PST)
Date: Mon, 14 Feb 2022 16:01:19 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v14 4/7] softmmu/dirtylimit: Implement vCPU dirtyrate
 calculation periodically
Message-ID: <YgoMT99pOemrdZcD@xz-m1.local>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <bb6b75b8d47b4e8aaf00736e070005a2c383a0e0.1644509582.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <bb6b75b8d47b4e8aaf00736e070005a2c383a0e0.1644509582.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 12:17:38AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce the third method GLOBAL_DIRTY_LIMIT of dirty
> tracking for calculate dirtyrate periodly for dirty page
> rate limit.
> 
> Add dirtylimit.c to implement dirtyrate calculation periodly,
> which will be used for dirty page rate limit.
> 
> Add dirtylimit.h to export util functions for dirty page rate
> limit implementation.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


