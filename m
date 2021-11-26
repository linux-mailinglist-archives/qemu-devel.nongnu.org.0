Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A3145E57F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:44:41 +0100 (CET)
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqRE9-0005le-3f
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqRDF-00055s-Hc
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:43:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqRDD-0002sY-N6
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637894621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EWNXcEY64b0gspAa3jUUXMQRB9Fa+FCKAqtQrIJZ4HA=;
 b=BaWHDRtYPPF+V75HI7KSKWIGOsBv57l0ZCYSQQ1WPaqOScUtLk86fxaKgvP5JWfX0YD6BS
 /mhh7+e8B9x+SLId2RUR+EgPpZO00oQp0GyS7BApBPXzAbL/lvGmTJlmCGlvDO9vK74IwI
 bxCTQTunqSeW2Jxyof1Sv7XA2Yyh7B0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-6W4hlkhHN2SuCz2pJGXkhw-1; Thu, 25 Nov 2021 21:43:40 -0500
X-MC-Unique: 6W4hlkhHN2SuCz2pJGXkhw-1
Received: by mail-lf1-f71.google.com with SMTP id
 24-20020ac25f58000000b0041799ebf529so3656893lfz.1
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 18:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EWNXcEY64b0gspAa3jUUXMQRB9Fa+FCKAqtQrIJZ4HA=;
 b=v7b6czy8P2lMpopTKhgw7Sh8Qc7Qnxbmv08vmPjlirx3+f7mjFKhaRWuXr1KzwRV9y
 5cPjeGhrWUGQ7DAoR4Dyz7e36DBoJFRwBEKpu9aGM52JuGKr98NxoS1UpP1GfSLVgpZv
 x7mpOB74yKQzI7NJmgyt6cNm+ymAW/JsTDVIxqvjNrp1wz+T4uKTNFJ95Bbtw1/L/nrh
 QZ2GlIBBcOMRbHhDD+zygnAw49Lx433Rc1eFCvrC4VkT4EAu0TjLWH0CuCexW9uCPyWO
 0jcS2jmjlNadzcwZTeKGXUlVxj1MloMT1rt+cKcZ8Z+RhpSV/qTcDx5vSzdXiv/iuC0R
 jcPw==
X-Gm-Message-State: AOAM532WH2BsaYOilM+Kc9jimg4pdC56th3n8kJvR+QwTSXDaNPF1CHu
 bYqr0jfW6aW3aWSUqlHaHEIhjkuOzG0WaugFMu3ycsPrPgWmj8h33qVhCBTPKQ+yZSjmlbB9jp/
 ofHIFMQM0AP7QSWXbf7yG/923W2mBqPg=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr27850940lfr.348.1637894619181; 
 Thu, 25 Nov 2021 18:43:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyH+Sm9VDkgzsst5YJRY6X2uTEqTDqNCN/MpFpLCu8s/OmBKiHlc7NNX1b8Uh7/GLCxhEgtGjLd6tc1d0OCtz8=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr27850924lfr.348.1637894619019; 
 Thu, 25 Nov 2021 18:43:39 -0800 (PST)
MIME-Version: 1.0
References: <20211125022046.10433-1-jasowang@redhat.com>
 <f4ae1d19-1409-7250-5149-8831b2cfa1d2@redhat.com>
 <20211125110724-mutt-send-email-mst@kernel.org>
 <d162f85f-214b-3d4b-c860-47b3367e7099@redhat.com>
 <b8d226cb51d04484861f1e1809043c1d@intel.com>
 <CACGkMEtKazhmn=1AfiGszoOYUNAyEnyBQtbw79jh2wL=hm+Pcg@mail.gmail.com>
 <79943b517d394d4fbfb0850af5458798@intel.com>
In-Reply-To: <79943b517d394d4fbfb0850af5458798@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 26 Nov 2021 10:43:28 +0800
Message-ID: <CACGkMEu7dbK09fyB91r2vtmfuvFEmGX37g=skjpatRJnW-1Tzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
To: "Wang, Wei W" <wei.w.wang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 10:40 AM Wang, Wei W <wei.w.wang@intel.com> wrote:
>
> On Friday, November 26, 2021 10:31 AM, Jason Wang wrote:
> >
> > I've tested the code with migration before sending the patches, I see the hint
> > works fine.
> >
>
> That's great (assume you saw great reduction in the migration time as well).
> Reviewed-by: Wei Wang <wei.w.wang@intel.com>

I don't measure that. But it should be sufficient to see the hint
considering we don't modify any logic at dirty bitmap layer.

Thanks

>
> Thanks,
> Wei


