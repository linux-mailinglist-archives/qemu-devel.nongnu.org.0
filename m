Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C0852D3F1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 15:28:40 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgCl-00062j-5E
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 09:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nrgAj-0004af-JB
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nrgAf-00054g-J3
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652966788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BIcqEtUbbjJY9jgAqC5sOu0mE8I4xkBNPq5OCgRsHFk=;
 b=F0Cssl2cAFs4DyIwCkPZpEFsS/cpBFXxBsA6ElP0Oq8f8jNEplOp6WNkUfLKh8J6t4F0Pz
 Cddi5ws6ipkT8RMfmMMhKM2Nteo+hMP6hffgCf9983pOGvZe8auO+bcQmBdtZQTd678WSk
 jO9dbN1w3Wn/FRUE1SeNkSE7pHemokE=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-Xhs1MJhNPResZMocADZwkQ-1; Thu, 19 May 2022 09:26:27 -0400
X-MC-Unique: Xhs1MJhNPResZMocADZwkQ-1
Received: by mail-io1-f69.google.com with SMTP id
 y13-20020a056602164d00b0065a9dec1ef2so2267169iow.23
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 06:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BIcqEtUbbjJY9jgAqC5sOu0mE8I4xkBNPq5OCgRsHFk=;
 b=kBHnooIoRdkGObQLXlTlSVKM4v7kYincO5k5arIWFkcf/6J0zwrBNONmymQ+rmDXv1
 oTgSdePByNTuSLQg1NWgizX609VKGcctvDw261rx4dW+J3EypMRtpp8fdYpEABu8dYMJ
 A+eptstG4/JSbMDVVJ8zqAPG4Rr7KdpuiBwRmeeQ5zU7FYh9DpM18J+L4qnPqYqZePFO
 f4K0vMHR0fRo/06M7LGi5oApXJmABEVPmOtUkQM8yJ0z8VosNnRs5tfkzNvmMVhr8R+o
 oK9ffUL20zXY2XblAqDpYyxohep/UyaIThVlC5FI7e/uleyW1GaVBdCwjibJssWDqChN
 NnuQ==
X-Gm-Message-State: AOAM530ur0ginEh8G96JTem6lWsg+GHqeH2O0d7iz6hY6HQW9gvg0g1R
 PZwVNHsFrO4AJthutJzksJihm2wacDmGUwxf3AXNTTpBUMX9gZBP3ey63OlueLSLMT9/tQqoi8z
 bPBRa75KdNFco4YiCz1O3L6SNBiNMhIY=
X-Received: by 2002:a05:6e02:1788:b0:2d1:67a5:53ba with SMTP id
 y8-20020a056e02178800b002d167a553bamr1725784ilu.200.1652966786595; 
 Thu, 19 May 2022 06:26:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzslwib0uplfJlWIi+vnLDtx1M+lWJ3eCJE2B5Hrep1EjutpO52BrZMIfxQno6lTAuAwALHHPO5WrvQpEvJFc4=
X-Received: by 2002:a05:6e02:1788:b0:2d1:67a5:53ba with SMTP id
 y8-20020a056e02178800b002d167a553bamr1725774ilu.200.1652966786448; Thu, 19
 May 2022 06:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-2-afaria@redhat.com>
 <0a27845b-0b9a-992a-3360-a7cf16892a08@redhat.com>
 <265a7c93-ed2a-6464-eeb4-c396970c418a@redhat.com>
In-Reply-To: <265a7c93-ed2a-6464-eeb4-c396970c418a@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Thu, 19 May 2022 14:25:50 +0100
Message-ID: <CAELaAXwTsopo1RoWhSDGbHjWrroF0TL1fugfpxktuNn9U+3QmQ@mail.gmail.com>
Subject: Re: [PATCH 06/18] block: Implement blk_{pread,
 pwrite}() using generated_co_wrapper
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, May 18, 2022 at 2:34 PM Emanuele Giuseppe Esposito
<eesposit@redhat.com> wrote:
> This is the main patch: it just moves headers from block/coroutines.h to
> the script (block_gen.c).
>
> This allows you to keep generated_co_wrapper functions in the header
> where they originally were (no need to move the function in coroutines.h
> and include it everywhere).

Thanks. It doesn't look like it will conflict with this series.

> Btw @Alberto can you also cc me in the next series? So that I can follow
> too.

Will do!

Alberto


