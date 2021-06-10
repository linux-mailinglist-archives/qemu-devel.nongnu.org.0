Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA723A2CD3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:22:06 +0200 (CEST)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKdJ-0002Cv-6m
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrKb3-00072c-7T
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:19:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrKb0-00037K-CP
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623331180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MEj7kbJL5407lTAOue8pwEgg5S+xFwao/XHDv56+6DQ=;
 b=f9ZOUdpspSkiA9YuT0L8i1tMTAILolB7pOuLAIUzI5RngWwUvrvTGGakYI3fNgs8GgGDHD
 Cuv6Eep+fxBz/mRviMR4gqrpiHLCnHoICrkYw/BFVITYJUmK15nlst0d0lToFlOU5+uprI
 jdUlKya1WrsoQfe6AY3k0LKtCSeJMoo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-u6lpCMiVNkSrzMp22s-Zjg-1; Thu, 10 Jun 2021 09:19:39 -0400
X-MC-Unique: u6lpCMiVNkSrzMp22s-Zjg-1
Received: by mail-ot1-f69.google.com with SMTP id
 r16-20020a0568301350b0290363e6a9392fso18337367otq.13
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MEj7kbJL5407lTAOue8pwEgg5S+xFwao/XHDv56+6DQ=;
 b=q5V4537+YQFxyGrHVCovaIanaw2aQILGl39m7GDlwpDJSavxjI9CiIyl4sHOQ/gO6E
 K7uKiqNSJWvFrlzNgxXv6eSHO2K9dhR3JUTAjJ2AlHUtUm+iYH3jOXuUwDfzOXRd6Rot
 FgNne78EstTBX30NTILkxy14J71iOLvSYXTRY9cJJ5ggCypjaKgKw3ca1djrYmX3pxw7
 2E4e8FjuH5S1TgofJknxyQUUdMUa93li8QvS2Wt+K4WU6VlS+FEWoLHRe5ZgRNb0sau3
 APuGJ78cjJAyFRPLUhcAUnngo27yjSAQB0QAqfkFWM2M4XXIW4TJJi7xT4wob5Y8deRG
 fvJQ==
X-Gm-Message-State: AOAM532MZ6Pcy9h9yAorztP4nyL3Wv7DIeJKPyNbGmXvHNto23bHQx58
 tofBiniJyj30DAAGeXeEFsrlPF38ZErvRd7aQLYqEXsZWNGHFk+usCQxm7F7DfpFVVCSW3UU8yJ
 Ym0Wb0v6jMcijoRFvttLgcoxpeE/ZpcQ=
X-Received: by 2002:a4a:3796:: with SMTP id r144mr2356227oor.79.1623331178967; 
 Thu, 10 Jun 2021 06:19:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA7zl7ShbD65QKFYyIJP5koDTszSE7IDQSZ11ImuDSY3bBInUdNiBM/Hp6uFa1r/3a2Uf25djeldblk0QgsYw=
X-Received: by 2002:a4a:3796:: with SMTP id r144mr2356216oor.79.1623331178798; 
 Thu, 10 Jun 2021 06:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609213154.1012848-1-eblake@redhat.com>
 <CAMRbyysYRyALDan9D0L-FphGqQLUOkKrKp0eg0iP8ThHnSatgw@mail.gmail.com>
 <20210610130616.nmmckl7v5l5n3agn@redhat.com>
In-Reply-To: <20210610130616.nmmckl7v5l5n3agn@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 10 Jun 2021 16:19:22 +0300
Message-ID: <CAMRbyyu1N+PGMGN2y+KcGpp_jZXO10t8WPke8kVKOx1hiRi97w@mail.gmail.com>
Subject: Re: [RFC libnbd PATCH] info: Add support for new qemu:joint-allocation
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
Cc: qemu-block <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 4:06 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Thu, Jun 10, 2021 at 01:20:13AM +0300, Nir Soffer wrote:
> > > +  else if (strcmp (metacontext, "qemu:joint-allocation") == 0) {
> > > +    /* Combo of base:allocation and stripped-down qemu:allocation-depth */
> > > +    const char *base, *depth;
> > > +    switch (type & 3) {
> > > +    case 0: base = "allocated"; break;
> > > +    case 1: base = "hole"; break;
> > > +    case 2: base = "zero"; break;
> > > +    case 3: base = "hole,zero"; break;
> > > +    }
> > > +    switch (type & 0xc) {
> > > +    case 0: depth = "unallocated"; break;
> >
> > Is this possible? qemu reports BDRV_BLOCK_DATA but not BDRV_BLOCK_ALLOCATED?
>
> No, qemu should never report a status of 0 (which in this code would
> produce the string "allocated,unallocated", although a v2 may change
> to print "<unexpected value>").
>
> Remember, BDRV_BLOCK_ALLOCATED is a bit of a misnomer - it has nothing
> to do with whether a cluster occupies allocated space, but rather
> whether the local image in the backing chain provides the contents of
> the cluster (rather than deferring to the backing chain).  The code in
> block/io.c guarantees that if a block device reports BDRV_BLOCK_DATA,
> then the block layer also reports BDRV_BLOCK_ALLOCATED (that is, any
> cluster that provides guest-visible data by necessity implies that the
> current layer of the backing chain is important).
>
> However, it DOES point out that "allocated" might not be the best name
> in libnbd; perhaps "data" or "normal" would be better for the NBD
> base:allocation status of 0.

Yes! it also aligns better with zero, and the output is similar to qemu-img map.
Hopefully the semantics of "data" in qemu-img map and libnbd is the same.


