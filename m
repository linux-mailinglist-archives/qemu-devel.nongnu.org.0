Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF54116D3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:25:05 +0200 (CEST)
Received: from localhost ([::1]:46152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKEC-0003Y3-OA
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carpeddiem@gmail.com>)
 id 1mSJq4-0006uv-4F
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:00:08 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:40476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carpeddiem@gmail.com>)
 id 1mSJq2-0004UJ-2g
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:00:07 -0400
Received: by mail-io1-f44.google.com with SMTP id r75so4564194iod.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=meET+TGb+sjtgoR/gdiLGlBIROtyXuAo3V06F7SAYio=;
 b=v+CG7DMMhGqhzczNXaofTjcVXLTJkuogBTaSyYxhP2TjviDh93fsslyljVn80jEMbn
 B6lA0CiCWmSYNdAiPqU4HX5nR4W2hWr6RNOGI79DBJP/Eq5tRMV46/XS/iAIXkZo1HmU
 hvzO51KC1gwjSwyAt6CvleNipQdqLAjPkL2FYNcuKPJnn6CmFVOZInzOGs+Fc8ZRm70r
 qfrGS6rrkazqGiOv+EvlWwWjYgkT0gCRWBxQmT+o6cCNnURMdkqCSpbT0EdMz3y+izGZ
 Ya+5l8wdps82SuRIoZvfyabk5wJk0c0i2uLN/jMtKCWyzsIvkAuFoLwzeBloZGN7NXUF
 /dHw==
X-Gm-Message-State: AOAM532hPcmoWjmzyiw+qmLECto7fcQcdLOVdQv6HgCQr+lHCq+8W1VL
 6rRILtVOoegWkUF7/d0mfHkdaFz1xfz4jHORC+rQyuqV
X-Google-Smtp-Source: ABdhPJypyvqj+VJ+CenJoguMS7g22+p3oiNFzNqv5nNfEHkLYbymiC4qFBwnm1IZW88AwMHwvsF88wVZrt/1NU+qUWw=
X-Received: by 2002:a05:6638:d03:: with SMTP id
 q3mr19717254jaj.64.1632146404635; 
 Mon, 20 Sep 2021 07:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <YURYvaOpya498Xx2@yekko> <YUR9RXXZ4lSRfcyB@redhat.com>
 <CANCZdfoezvfO+wKgqwMf7oCO3dAgpJ28RGecnZs31_o3+iUdGA@mail.gmail.com>
 <YUgFuFwRKABXnCM8@yekko>
In-Reply-To: <YUgFuFwRKABXnCM8@yekko>
From: Ed Maste <emaste@freebsd.org>
Date: Mon, 20 Sep 2021 09:58:57 -0400
Message-ID: <CAPyFy2BfGh_=BydBvCX_4wToCNxzL2M2Ju2wWYt0VTJGeTjMWg@mail.gmail.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.44; envelope-from=carpeddiem@gmail.com;
 helo=mail-io1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 01:14, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> I've updated my table entry to N/A on that basis.  Thanks for the
> clarification, this wasn't obvious to me from
> https://www.freebsd.org/platforms/ (it says "Tier 4", without
> explaining what that means).

That is indeed a bit confusing. If you click on the "Support Tier"
link (in the table heading) it's documented as:

21.6. Tier 4: Unsupported Architectures
Tier 4 platforms are not supported in any form by the project.

We (FreeBSD) should really just remove that and replace Tier 4 with unsupported.

> Might be worth talking to the Rust people as well, to see if you can
> get a promotion from Tier3 to Tier2.

Yes, good idea. I've had discussions with a few Arm folks about
improving the rust tier for FreeBSD/arm64, but should do this for
x86_64 as well.

