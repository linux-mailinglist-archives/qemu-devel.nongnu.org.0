Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E352B55C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:01:36 +0200 (CEST)
Received: from localhost ([::1]:57740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFYk-0003T5-Ns
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nrFLz-0006gd-L8
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nrFLw-0001wE-Ks
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652863699;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/oxxAqZ//ib8bOqo4bu/MMElfYgVbaec1l65hfKfwz0=;
 b=Ji9F9B6h4hd+m2tLk/toj2PJjcwIY3x85pTfPYRMtu1049awR/DYzm1H2nvkJR4w8RH5gK
 OrJS3YI2+ibU0frm6LOVRYav7t99aQVxmIpERD2JFSvBWuomQ988q9MV/ewxgh/ZqJ4kWY
 rhYDcgnuBdLJ5D4rkzlG4wYk/kC/9r0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-7gx9R_y4P4CxlbRHywikrw-1; Wed, 18 May 2022 04:48:18 -0400
X-MC-Unique: 7gx9R_y4P4CxlbRHywikrw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso2589290wms.1
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 01:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=/oxxAqZ//ib8bOqo4bu/MMElfYgVbaec1l65hfKfwz0=;
 b=uFF6JVPYNrXCPm3r1hrsP8LpJYbitzju0Cn1Uf1akb7hObxan3GY79XmsrQuqibRwL
 fvtd5A6YhVE3b62E6Tp1Hk7I8wnXVU59t66lWWq/JyFcxOLxDKcz6nMyGFHQAigjuRoD
 gz+acJEKTR/2bPJU7xoJuts56tVFhHxQ7N+t7Sk30Y7np1bKqw2DUBw7w3LTnE3Dh4C3
 7la5syvwuMoJWKe5lHnCYEEPPNKGcBosSWyoYsWWeJ4xirv73hWUYhrOtKLhJAIR4c3C
 zBOcEHOc9Op7Z+RHPscen/RPXp2RpPuivw2P9OBXbPSU7oofiSOQcxadGmE+xYxgKy8k
 cZvQ==
X-Gm-Message-State: AOAM530AphFUeoBu1Kz1nOEqW95+9W6UNbaFb+bPJFwWbFrCwx0pVLjN
 TvPMfD8kVf4RRDghPQlvLkvhsc/d0oJkHKHdgA/CTPe4U8gZtvb/E5pbW4f0WZbruBA0mtaVP2B
 f488plxCzkMYk5MM=
X-Received: by 2002:a7b:c3c7:0:b0:394:1aaa:1256 with SMTP id
 t7-20020a7bc3c7000000b003941aaa1256mr25235611wmj.172.1652863697174; 
 Wed, 18 May 2022 01:48:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR+pOEqszFnYZGylfEraJqFIOn0pgk8jKSiUP3fOYBEe9/2xzO+NbFFZsMhEgTojhu80HtXw==
X-Received: by 2002:a7b:c3c7:0:b0:394:1aaa:1256 with SMTP id
 t7-20020a7bc3c7000000b003941aaa1256mr25235598wmj.172.1652863697005; 
 Wed, 18 May 2022 01:48:17 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c489100b003942a244ed0sm1130383wmp.21.2022.05.18.01.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 01:48:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: peter.maydell@linaro.org,  qemu-devel@nongnu.org,  Eduardo Habkost
 <eduardo@habkost.net>,  Peter Xu <peterx@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Leonardo Bras <leobras@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v6 02/13] multifd: Create page_size fields into both
 MultiFD{Recv,Send}Params
In-Reply-To: <YoNgVHf4frHI05m8@work-vm> (David Alan Gilbert's message of "Tue, 
 17 May 2022 09:44:04 +0100")
References: <20220510224220.5912-1-quintela@redhat.com>
 <20220510224220.5912-3-quintela@redhat.com> <YoNgVHf4frHI05m8@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 18 May 2022 10:48:15 +0200
Message-ID: <874k1ngrao.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> We were calling qemu_target_page_size() left and right.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>

[Adding Richard]

> (Copying in Peter Maydell)
> Your problem here is most of these files are target independent
> so you end up calling the qemu_target_page_size functions, which I guess
> you're seeing popup in some perf trace?
> I mean they're trivial functions but I guess you do get the function
> call.

Hi

There are several problems here:

- Richard complained in previous reviews that we were calling
  qemu_target_page_size() inside loops or more than once per function
  (He was right)

- qemu_target_page_size() name is so long that basically means that I
  had to split the line for each appearance.

- All migration code assumes that the value is constant for a current
  migration, it can change.

So I decided to cache the value in the structure and call it a day.  The
same for the other page_count field.

I have never seen that function on a performance profile, so this is
just a taste/aesthetic issue.

I think your patch is still good, but it don't cover any of the issues
that I just listed.

Thanks, Juan.


>
> I wonder about the following patch instead
> (Note i've removed the const on the structure here); I wonder how this
> does performance wise for everyone:
>
>
> From abc7da46736b18b6138868ccc0b11901169e1dfd Mon Sep 17 00:00:00 2001
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Date: Mon, 16 May 2022 19:54:31 +0100
> Subject: [PATCH] target-page: Maintain target_page variable even for
>  non-variable
> Content-type: text/plain
>
> On architectures that define TARGET_PAGE_BITS_VARY, the 'target_page'
> structure gets filled in at run time by the number of bits and the
> TARGET_PAGE_BITS and TARGET_PAGE macros use that rather than being
> constant.
>
> On non-variable pagesize systems target_page is not filled in, and we
> rely on TARGET_PAGE_SIZE being compile time defined.
>
> The problem is that for source files that are target-independent
> they end up calling qemu_target_page_size to read the size, and that
> function call is annoying.
>
> Improve this by always filling in 'target_page' even for non-variable
> size CPUs, and inlining the functions that previously returned
> the macro values (that may have been constant) to return the
> values read from target_page.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


