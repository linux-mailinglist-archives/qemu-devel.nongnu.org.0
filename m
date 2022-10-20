Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5FC6066C7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:10:29 +0200 (CEST)
Received: from localhost ([::1]:52462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZ3d-0007j1-6w
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:10:16 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYnr-00056s-BG
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1olYg3-0007jf-BO
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:45:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1olYfp-0003U7-DD
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666284336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L9ccITVISTrC2osuaH7WvoQuKg8tvJwOXlGrZQiGGG4=;
 b=bZB6U2qgJB6P8zcNAbOcK4pF29kU6RsrYc/m8XUAM6pWRlon8BvYKjxbXvZfNujvC0bnOV
 pDAgztKQUo/M61Ctef+7NEEx8qtpAOfTCsOquXKQ8ZTnbcYzzvsZuIAfVe/d1Y3y5xPKn2
 WmERWgNGSjEl8PN651HtcvEQdFQv3OA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-dt7oxwD6OEyZXVrYgjCYsA-1; Thu, 20 Oct 2022 12:45:34 -0400
X-MC-Unique: dt7oxwD6OEyZXVrYgjCYsA-1
Received: by mail-qv1-f70.google.com with SMTP id
 y2-20020a0ce802000000b004b1ce1c4a70so32913qvn.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 09:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L9ccITVISTrC2osuaH7WvoQuKg8tvJwOXlGrZQiGGG4=;
 b=xDvWE8V1y1PwTVcg9++yzlAju3b6RU9fsA9k54s0OZgYILSQ+SPxdBkfFMSy5ywGAt
 rO2gdcAuzTT3DStdT++My3eIP6w/PTPOUACOZ69eqSMxn+M0yoHbLDlqIxcGbcDf6YRT
 JhHHYcatTfKd/H4PgFbtoRfZ9NS3dfvrNFX0CbsaJQdAinNGgkPcj7RpJzd72lslPr7T
 lJFjqyGffi0LHI5NF//tZdfTjF6G4+UG0BAxNuj+/w8A1xOKBdCUgooIEzgqSZuW07/u
 jIrlOL0Y0W8s+KneyEaN+dsLEshz4Oiq+eIQK9lJFctDYTZmxqt/IneypwLlDKsZ4/AB
 6BTw==
X-Gm-Message-State: ACrzQf2/nE7jr9DSyFRgLetaew/Gl6ckxN9b5v6RaAUzUSZeO0+z+724
 4BnBhKLaCry586arTri4Tpw6LY1NhuWUnEg3GvyALOaLKMvCoyKg4xataskZqoPoThgJOAFU78t
 vJfnX7VevSnrhN60=
X-Received: by 2002:a05:620a:1a04:b0:6ee:93fc:b44f with SMTP id
 bk4-20020a05620a1a0400b006ee93fcb44fmr10061060qkb.756.1666284333061; 
 Thu, 20 Oct 2022 09:45:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6WZVJWnEWNTwpX7ltQyBBqMhV1An9mrG9VMlcsMl77FUBOM2MKuS7YMr5LpdVmO9QrUcRbWg==
X-Received: by 2002:a05:620a:1a04:b0:6ee:93fc:b44f with SMTP id
 bk4-20020a05620a1a0400b006ee93fcb44fmr10061027qkb.756.1666284332675; 
 Thu, 20 Oct 2022 09:45:32 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05620a24cd00b006ce76811a07sm7677167qkn.75.2022.10.20.09.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 09:45:31 -0700 (PDT)
Date: Thu, 20 Oct 2022 12:45:29 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH] x86-iommu: Fail flag registration of DEVIOTLB if DT not
 supported
Message-ID: <Y1F7Iujybjr3kVCF@x1n>
References: <20221018215407.363986-1-peterx@redhat.com>
 <98df60ec-be6d-84aa-d2bd-3bb2ebf0d1a5@redhat.com>
 <Y1ADOivPsgWzOjF6@x1n>
 <1196d8bb-1a4f-06b7-f5e3-43ace827bfb0@redhat.com>
 <Y1APkKgg340u6qym@x1n>
 <CACGkMEuVOyW6e-U_79UruLotx2AygbjKxeAE16JZaE1uAdSwuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACGkMEuVOyW6e-U_79UruLotx2AygbjKxeAE16JZaE1uAdSwuw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 11:58:34AM +0800, Jason Wang wrote:
> Haven't tried but I guess there would be some issue other than the
> suggested configuration "ats=on, device-iotlb=on"
> 
> So we have:
> 
> 1) ats=on, device-iotlb=on, this is the configuration that libvirt is
> using and it should work
> 2) ats=off, device-iotlb=on, in this case, the DEVICEIOTLB_UNMAP
> notifier will succeed but there won't be a device iotlb invalidation
> sent from guest, so we will meet errors since there's no way to flush
> device IOTLB. According to the PCIe spec, the device should still work
> (using untranslated transactions). In this case we probably need a way
> to detect if device page fault (ats) is enabled and fallback to UNMAP
> if it doesn't.

Yeah, agreed that we should not register to dev-iotlb notifier if ats is
off in the first place.  Maybe worth another patch.

> 3) ats=on, device-iotlb=off, in this case, without your patch, it
> won't work since the DEVICEIOTLB_UNMAP will succeed but guest won't
> enable ATS so there will be no IOTLB invalidation. With your patch, we
> fallback to UNMAP and I think it should then work
> 4) ats=off, device-iotlb=off, similar to 3), it won't work without
> your patch, but with your patch we fallback to UNMAP so it should
> work.

I think the current patch should still be correct, but maybe something else
is missing.  I'll add this one into the todo list but I'd be more than glad
if anyone can look into this too before that..  Or as Eric suggested to
detect such a mismatch before it's fixed, but then if we know they're not
working we should fail hard rather than a warning anymore.

Thanks,

-- 
Peter Xu


