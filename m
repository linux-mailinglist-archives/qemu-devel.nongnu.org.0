Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD334DDBB6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:32:27 +0100 (CET)
Received: from localhost ([::1]:37414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDeU-0005qs-7Q
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:32:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nVDda-0005As-3w
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 10:31:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nVDdX-0005Lr-Dw
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 10:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647613886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ez8liIrkA5jDkGSVnz5d9GpQROPPN5YmQa5MioyZI1A=;
 b=isxQK0ZBkUR9zS0cy5cj0GvBsDAtK8Y/oMDXt/J0e+l8howxo83MqBxYNTHvk1aQJICh5h
 d/8SOvBDSW8H+d6wwrXfsy922G9/GAqYcqrg1j71N81sdnT96xIsXt1kV4RWSf1nKLFjXJ
 i25rpHZJka201QzAJkrvkI5ym7W6P3Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-Qm-1iZ6LMiO4V5fBZMWlLA-1; Fri, 18 Mar 2022 10:31:25 -0400
X-MC-Unique: Qm-1iZ6LMiO4V5fBZMWlLA-1
Received: by mail-ej1-f70.google.com with SMTP id
 jx2-20020a170907760200b006dfc374c502so659862ejc.7
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 07:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ez8liIrkA5jDkGSVnz5d9GpQROPPN5YmQa5MioyZI1A=;
 b=c+ptYJMdDGELss7wPn3/n60WVCT/S/d98UkeKP5xbs38QJtRa3CplsaSoCHNKl6hya
 t8qBfSoFxnyOkBcCNG63ZSvUq7q6GfxpfO5orZ7FRZ4MTPjlW9ijf3RoDOVbNjQPyKfB
 YBKCIWMDBRSXwoTwXm7Hl9W1QH2IAl9r+u/cl6mvkonVtFuBj0mztery7CGiGB1/FVrC
 hZSlF95OwWVvTHXTnDxccsGcFg53rX8OuK5lr9TJ0QoZuN0ka3m0436pApMPtSozaflm
 FQqeQPFm9M3Qb/qJeMs1R4Drw9eUzF0BOdxz+sgU+qHzKmScMyNJNkT0+rycB2tGQxxz
 zdzg==
X-Gm-Message-State: AOAM5329YY0+wKakwVUi168pKL4dMuAE7K9+RmRH/MfNvliSOGCor8me
 LuPmJyJm3ZYFP7iHjWyQTVSNlVtjHOMBjmp/zi2I4A4V1FICAxaDpEQOMu+YDI7EmUQ1nWaxOsT
 ZYG84bw8biRxhL/4=
X-Received: by 2002:a17:906:32cf:b0:6d5:83bc:e962 with SMTP id
 k15-20020a17090632cf00b006d583bce962mr9302727ejk.108.1647613882559; 
 Fri, 18 Mar 2022 07:31:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFI3TxekZvIEGwM8fDhiTBZtbN3KLdk7CE5dj0hUHmjR7m6qFjFmfGWQuDHrpB/ygduzglmQ==
X-Received: by 2002:a17:906:32cf:b0:6d5:83bc:e962 with SMTP id
 k15-20020a17090632cf00b006d583bce962mr9302706ejk.108.1647613882374; 
 Fri, 18 Mar 2022 07:31:22 -0700 (PDT)
Received: from [10.43.2.152] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b006ce04bb8668sm3691909ejh.184.2022.03.18.07.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 07:31:22 -0700 (PDT)
Message-ID: <eb0d5aaf-940a-30fb-19dd-4d730bec30d6@redhat.com>
Date: Fri, 18 Mar 2022 15:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] x86/amx: compatible with older kernel release
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20220318115529.4850-1-yang.zhong@intel.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220318115529.4850-1-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, pkrempa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/22 12:55, Yang Zhong wrote:
> The AMX KVM introduced one new ARCH_GET_XCOMP_SUPP system attribute
> API to get host side supported_xcr0 and latest Qemu can decide if it
> can request dynamically enabled XSAVE features permission. But this
> implementation(19db68ca68) did not consider older kernel release.
> This patch can avoid to read this new KVM_GET_DEVICE_ATTR ioctl.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  target/i386/kvm/kvm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Tested-by: Michal Privoznik <mprivozn@redhat.com>

Thank you.

Michal


