Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE1A3F44A4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 07:32:29 +0200 (CEST)
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI2ZL-0000xn-6u
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 01:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mI2Xc-00080R-Vx
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 01:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mI2Xb-0000Fg-7m
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 01:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629696634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUcv38KmgHNqoIM37xueVJ/C/z0dJ+GC5w5bwRoT2VY=;
 b=bRM9Vrmc87DRrloPQC0UETr2KW4Cb7e/WOYJvwLPpsKX3UFfsZ/F8M+rqrBlOIsApngSrI
 difGnLnnERtCgPW25Z3gBTBdhzz/oCQ0+jF4g5XxCYas4n7ZrncT0Lzb4WO6Xd074LnPxU
 0Mhu/EgOD+0M64WNKIWHpsSiOjmEeUk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-jo-c5bPONXCgGZLF5wWI8A-1; Mon, 23 Aug 2021 01:30:33 -0400
X-MC-Unique: jo-c5bPONXCgGZLF5wWI8A-1
Received: by mail-wr1-f69.google.com with SMTP id
 z2-20020adff1c20000b0290154f60e3d2aso4718264wro.23
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 22:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KUcv38KmgHNqoIM37xueVJ/C/z0dJ+GC5w5bwRoT2VY=;
 b=AMGDmLQHl3aq6sA/54xrlSn3oRHWyH28tnQLO2h3FHPUNRC2GXrUcN51sDtA6nCqkm
 5stwwT2ozUyizLOKvtMvwAxx0ovTm1+dAw7J9RMjscnzD5+D19lyswCEZo2g3RCK1Fbi
 Ip9CYHW02hcx/2EDzsc6BBosYMKFPXJSOX3whB6QMeEWUQpRUT9bKo6Mx1ujflBU9Pv3
 EgiM72MT3YNejbQn0F+c40d4xRmpNgOBMFfwxTl2JTHQqvmihOVIwiQdnUsvg09BCu/C
 tP7t3elb+2qAmm+xn98FYAvgU6TD9oufcdsB/vQk6PRtKONcRXCsks516MASuAvjjfgV
 f1nQ==
X-Gm-Message-State: AOAM531ZHs9srfU5oUQPvmYkRlAtJlSzyQ0zd5sBe+aQ1MsrQE9wmuPk
 94YVtbZinKQ65dfHO4id1ZWkFect+GmmPDKTgjyQcQzaSbjR+6lvDag78dHA9hD5FYRFl6oWihu
 TwYNz6ihh6wIZsaE=
X-Received: by 2002:a05:600c:198a:: with SMTP id
 t10mr14439848wmq.181.1629696632078; 
 Sun, 22 Aug 2021 22:30:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ8Hi576z03A1f3jgvU7EiM4XOxQwPO18GG6ES+pE+2TjyAGs0jnnl0zfmFvanYDebRSi3MA==
X-Received: by 2002:a05:600c:198a:: with SMTP id
 t10mr14439825wmq.181.1629696631848; 
 Sun, 22 Aug 2021 22:30:31 -0700 (PDT)
Received: from thuth.remote.csb (p5791d4fd.dip0.t-ipconnect.de.
 [87.145.212.253])
 by smtp.gmail.com with ESMTPSA id s2sm742846wrp.81.2021.08.22.22.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 22:30:31 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] docs/about: Add the missing release record in the
 subject
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 libvir-list@redhat.com
References: <20210823030005.165668-1-wangyanan55@huawei.com>
 <20210823030005.165668-4-wangyanan55@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5995f025-70bc-7c69-d4df-e75ed1816806@redhat.com>
Date: Mon, 23 Aug 2021 07:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210823030005.165668-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/08/2021 05.00, Yanan Wang wrote:
> Commit 29e0447551
> (docs/about/removed-features: Document removed CLI options from QEMU v3.1)
> has recorded some CLI options as replaced/removed from QEMU v3.1, but one
> of the subjects has missed the release record. Let's fix it.
> 
> Reported-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>   docs/about/removed-features.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 1c926a8bc1..8feeead449 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -140,8 +140,8 @@ Use ``-rtc driftfix=slew`` instead.
>   
>   Replaced by ``-rtc base=date``.
>   
> -``-vnc ...,tls=...``, ``-vnc ...,x509=...`` & ``-vnc ...,x509verify=...``
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``-vnc ...,tls=...``, ``-vnc ...,x509=...`` & ``-vnc ...,x509verify=...`` (removed in 3.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Reviewed-by: Thomas Huth <thuth@redhat.com>


