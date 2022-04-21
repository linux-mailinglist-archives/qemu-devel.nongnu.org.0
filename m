Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2865A50A240
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:27:33 +0200 (CEST)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXmO-0000y8-2c
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhXQD-0001sA-Rd
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:04:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhXQA-0008Hh-AU
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CKDnkSm0HAb8weaRhyuPP6dOqg1U/PU9XCqIZmJHYNk=;
 b=QVH3Y1vWFQLcAr+RQXE+rOXh8rfCZNVl/p1MpFlBQ1RwZwpsBgXOWFXU3/2JPbbTsfbSF7
 ENe+8HZqVjB+xqBzm9p/RpNKg+YSoRsEbqyK3UZ47Wq2GAEqLC70lDOSyckmkO9KyFj+5W
 8HWU9Y7PKAsLmRhZ4a4RIC0jO6WMmRg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-syCs1HxEOdW9nT9TjSq_mA-1; Thu, 21 Apr 2022 10:04:30 -0400
X-MC-Unique: syCs1HxEOdW9nT9TjSq_mA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n4-20020a1ca404000000b00392b49c7ae3so982094wme.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 07:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CKDnkSm0HAb8weaRhyuPP6dOqg1U/PU9XCqIZmJHYNk=;
 b=6uZnxZX0oAa31IxP9tesjhh8JBytm+EUpBf9XCiva5luBje2y3aCjTNBS4NbWiZ1/1
 /G6/By8eCWV3koogBAUVWUB+I7ZdhtEZJKmmWfHaOa2K6570BlYES7/W6USz60HcEw+6
 9BVoK91Iol7ckxxE9hJvnYuV3ZluD65jO/MUOUHsAMqZKAyWQo1UqYZ97dhYxc2nKCVt
 Nl97KkQgI5DApCuqzTToZTWdcVC6eI5tv667Lc2/oeMcqk6gCtHHdhL+pTZOIjHkmST3
 m1aPUCvw9cXcaPIy27ZRqtgL79CS4YG3eAkRn1S1JqZbBlld62rSWhGBpzaT38ttqnim
 Vcsg==
X-Gm-Message-State: AOAM530LX+0mE2TxMMiVkuXLvlmnN8CYpb84h2LwSEklWKcH4OutElQs
 oxfXepVfnJ2rNz+RV4CTByMxR838ktYEFphXaaRyU6oVCOGMt1YDkrP0iSoYXJIO8XCNShadJQ6
 +WhEldBGch10F6Dc=
X-Received: by 2002:a1c:f30b:0:b0:380:e444:86b9 with SMTP id
 q11-20020a1cf30b000000b00380e44486b9mr8836623wmq.81.1650549869392; 
 Thu, 21 Apr 2022 07:04:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkpWK+Lsx9ojTSiSnvCgL6984eL6e79omORMqGttZaWrJ1ZZRfTfdnwLZDZJYEV0RQy7wN7Q==
X-Received: by 2002:a1c:f30b:0:b0:380:e444:86b9 with SMTP id
 q11-20020a1cf30b000000b00380e44486b9mr8836608wmq.81.1650549869193; 
 Thu, 21 Apr 2022 07:04:29 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 b11-20020a5d45cb000000b0020a810f7726sm2345578wrs.5.2022.04.21.07.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 07:04:28 -0700 (PDT)
Date: Thu, 21 Apr 2022 15:04:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] migration: Fix operator type
Message-ID: <YmFkajmPJwJiSwZS@work-vm>
References: <20220406102515.96320-1-dgilbert@redhat.com>
 <Yk2FIdSMF4LRoT8C@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yk2FIdSMF4LRoT8C@xz-m1.local>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: leobras@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Apr 06, 2022 at 11:25:15AM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Clang spotted an & that should have been an &&; fix it.
> > 
> > Reported by: David Binderman / https://gitlab.com/dcb
> > Fixes: 65dacaa04fa ("migration: introduce save_normal_page()")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/963
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>

Queued

> -- 
> Peter Xu
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


