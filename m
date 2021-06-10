Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492553A349A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 22:10:50 +0200 (CEST)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrR0q-00042I-Uj
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 16:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrQzZ-0003LJ-5Y
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 16:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrQzV-0003hG-PG
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 16:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623355765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rj/vLkFW0adT0/UDYqCqgfmJxTYpCB82ij4uXlbpJU8=;
 b=Adg+uz0pdsz3hDAloS4zz/+AoKHeeS8wkvMmzp96YPxtAHHg6kx/fCRD10g81gp5ez8nwl
 viu5YbAbhK4RiwSQKEeo/1/KcsNKDmDAsomAw4XvmU3k3V7OttshBKQ3GN5N95y/NEcXXH
 naXxCM78jE+8bs42d6r2eIgg3pNVyRs=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-LOXUlzKMOweZxQbGCwsYnQ-1; Thu, 10 Jun 2021 16:09:24 -0400
X-MC-Unique: LOXUlzKMOweZxQbGCwsYnQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 o2-20020a4ad4820000b0290208a2516d36so294065oos.16
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 13:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rj/vLkFW0adT0/UDYqCqgfmJxTYpCB82ij4uXlbpJU8=;
 b=uYDj5E+3AYUop8Gd5tP0KyU8YJJ9IAXH4keGZOPRzxYBacwoYdPRrH/RlQTRpm803Q
 5hQ4F1FANUTZRdEQ3yfMCxwiO3WcZ2Qnxe5muhkbZNrYVvQADGNkGnkvyhknN9QC1p0F
 5Ejs70bOVbB4QH/aB9UR+mYi3SE6gBKw5S5xtIp6rDN6V1ENg39E18FZWiltahLhuLJG
 Kc5UmaCP85xOs4AgMFmG2MDKWE/R5rlu9ipVjkquJflZ7ql2PyNmBKgrhe5OjJqRYSIE
 q+Fa4SlG0mLHAJdPX+0DCU1padfmZHN+fXL0fYSRCSwRF1Qqtm8mpQzQ9e1Anhwo6BvA
 ZHBg==
X-Gm-Message-State: AOAM530RFgeCx69pLO8AiZDXY0ZS+h4W7uu45VR8e8cCuXkJvs+dH3lm
 E9MEeupXWj1yzJrspKfr4pYKbP4fz/Naq4VhDLILaj3IRmrGoQr/WCsj/GK0eCTeoAn32N7Tj28
 HsR2BBBgODuDE23qjjnoR/FfpPiQ49LY=
X-Received: by 2002:a54:448d:: with SMTP id v13mr145594oiv.41.1623355761690;
 Thu, 10 Jun 2021 13:09:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhfvkLsmWJqXsHpsIXGcizOS8NtI6xLeLhlNpq2y2qieWP/P9coRLf5IUTlS+UqU48SstIhSwcsEwTqsqlI2I=
X-Received: by 2002:a54:448d:: with SMTP id v13mr145583oiv.41.1623355761518;
 Thu, 10 Jun 2021 13:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210610183443.clk43ngkobzyjopy@redhat.com>
In-Reply-To: <20210610183443.clk43ngkobzyjopy@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 10 Jun 2021 23:09:05 +0300
Message-ID: <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Nir Soffer <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 9:35 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Tue, Jun 08, 2021 at 07:38:10PM +0300, Nir Soffer wrote:
> > The example I provided was not detailed enough, what we actually do is:
> >
> >     qemu-nbd .. 'json:{"driver": "qcow2", "backing": null, "file":
> > {"driver": "file", "filename": "top.qcow2"}}'
> >
> > So there is no backing chain and allocation depth is not relevant.
> > - Allocated areas should be reported with flags 0
> > - Zero areas which are not holes should be reported as NBD_STATE_ZERO
> > - Zero areas which are holes (not allocated in this image) should be
> > reported as NBD_STATE_HOLE
>
> Thinking about this a bit more, here's something I noticed:
>
> $ qemu-img map --output=json -f raw base.raw
> [{ "start": 0, "length": 196608, "depth": 0, "zero": false, "data": true, "offset": 0},
> { "start": 196608, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": 196608}]
>
> which matches what I've said elsewhere in this thread: the entire
> image is reported as "depth":0 because the raw file is responsible for
> 100% of the content.
>
> But:
>
> $ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2","backing":null, \
>   "file":{"driver":"file","filename":"top.qcow2"}}'
> [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false},
> { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
> { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false}]
>
> also reports the entire file at "depth":0, which is misleading, since
> we have just been arguing from the qemu:allocation-depth perspective
> (and also from bdrv_block_status) that the qcow2 image is NOT 100%
> allocated (in the sense where allocation == data comes locally).
> Perhaps it might be better if we tweaked the above qemu-img map to
> produce:
>
> [{ "start": 0, "length": 65536, "depth": -1, "zero": true, "data": false},
> { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
> { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
> { "start": 196608, "length": 65536, "depth": -1, "zero": true, "data": false}]

It will be more consistent with "offset" to drop "depth" from output
if we don't have it:

    [{ "start": 0, "length": 65536, "zero": true, "data": false},
     { "start": 65536, "length": 65536, "depth": 0, "zero": false,
"data": true, "offset": 327680},
     { "start": 131072, "length": 65536, "depth": 0, "zero": true,
"data": false},
     { "start": 196608, "length": 65536, "zero": true, "data": false}]


