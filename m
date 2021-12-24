Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27047EB88
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 06:19:10 +0100 (CET)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0cyz-0002aW-8K
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 00:19:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0cxi-0001JS-QO
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 00:17:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0cxc-00029M-LA
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 00:17:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640323064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqJSz13F3kg3zGDMBn7d0I3shfUWBDGnQgf5PXpzMs0=;
 b=ezqi7rp4bvAdET4hNZzeAKjbjNLKdD1ajzzr0CAtg+Es+pDE2gl4B5I2AjwaTDSB7ulA1w
 BEyPJCaMqVX8hFrRpXRFy4erTvQgVAuvFQqPFBDRuPXM2FHtDc6M0rfN5fMtPf3o48FTIC
 Z76OByVkgLBZODPc7RhZxGcDue5ttZw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-FN3K3dOONRGRiHlBbif7Rg-1; Fri, 24 Dec 2021 00:17:42 -0500
X-MC-Unique: FN3K3dOONRGRiHlBbif7Rg-1
Received: by mail-wm1-f71.google.com with SMTP id
 b20-20020a05600c4e1400b003457da1c91eso2857235wmq.4
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 21:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MqJSz13F3kg3zGDMBn7d0I3shfUWBDGnQgf5PXpzMs0=;
 b=sDzqsZplQawMQvg2tyB1Zi6QY6Q3cvX84QA50R4nRvsBBjK8/KPPsZjICFAofA/bfd
 FsqSX1uH4Zz9v20a3Ab5LTLXSSnaKVhZWtTJ7Nm43tnx8vc6JjXOQDMjceboeGSuVDEB
 BglDb1e/mWHJ+/GvN73NI4Lb9eA0CG/foC09fOUwQ0cpBRnJ/9Ydah8WX8veg+y/CcP1
 MIX2nTZC65oIJhUcSuOKCBw3yQMIsg5keE88kDjixmjIBcACTdXbLjMKt22XNttCxgkI
 01wxAUN82Am1WOQUYRAqlEBvI14u6ewp+xJzjYuDpcac3lboaCiXXr1HvAmt/xxBurzX
 xMpw==
X-Gm-Message-State: AOAM531zJVMjHUoi/So2IESMkCOqmG068+DWnDsQfA2O0LBPy7nEJKES
 SNERp3up4OUsJLhlIWfRVmi6evL8GNGNrP9RJFY6iOBWqIMYI32nY8WS5W70bBalxBXB0sHFX2m
 BGT8S+ApwOzLdkK4=
X-Received: by 2002:a05:6000:18aa:: with SMTP id
 b10mr3565477wri.305.1640323061511; 
 Thu, 23 Dec 2021 21:17:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzgGPaAh5STrWfCGa8Ro/LgyoRVrxn/8UwLK8x2hN9HOaEAJmuKJfBkx9zg3Au2pzGiR32pA==
X-Received: by 2002:a05:6000:18aa:: with SMTP id
 b10mr3565465wri.305.1640323061372; 
 Thu, 23 Dec 2021 21:17:41 -0800 (PST)
Received: from xz-m1.local ([85.203.46.180])
 by smtp.gmail.com with ESMTPSA id n12sm7540766wrf.29.2021.12.23.21.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 21:17:41 -0800 (PST)
Date: Fri, 24 Dec 2021 13:17:34 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v10 0/3] support dirty restraint on vCPU
Message-ID: <YcVX7n1lTh2j2F8l@xz-m1.local>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1639479557.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 07:07:31PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> v10:
> - rebase on master
> - make the following modifications on patch [1/3]:
>   1. Make "dirtylimit-calc" thread joinable and join it after quitting.
> 
>   2. Add finalize function to free dirtylimit_calc_state
> 
>   3. Do some code clean work

I played with v10, much, much better and usable, thanks!

I still got some other comments though, please have a look on whether they're
sane.  Also sorry again for the delay on reviewing.

-- 
Peter Xu


