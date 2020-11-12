Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33B62B05D7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 14:03:31 +0100 (CET)
Received: from localhost ([::1]:59704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdCGA-0004py-CQ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 08:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1kdCEX-0004Ku-Ta
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1kdCEV-0001qW-LN
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605186105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+XyeSdua6LG4ib3bOWHVrRxnCP0ai1o9ZzKHs9XK7EM=;
 b=VYF+qAyWO41Qvq79dZDmmV6ZDwUyV7NByUsMlCvmAOx5aSGCZvMBNTXKe1Xu8UYwkTwk45
 z2oiaHc4MkfivQplffbnyv1xPCnr+9c1A/BkznbL5lPkrKMyEZByTlftKplb5iYmGH8GEn
 sXzXaiUssCU8CEOaz4iz77Rr/jHo0Ow=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-_lqBOtE5MOmTT74kgUldwQ-1; Thu, 12 Nov 2020 08:01:43 -0500
X-MC-Unique: _lqBOtE5MOmTT74kgUldwQ-1
Received: by mail-qt1-f199.google.com with SMTP id 2so3355418qtb.5
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 05:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+XyeSdua6LG4ib3bOWHVrRxnCP0ai1o9ZzKHs9XK7EM=;
 b=WFEP8VlBC/ta4ZnQD8GqHSQjGHAxGzQ1ivsHGCeqBhpqF828sIB2uqUvlxEtLUH/0+
 JuAgBYuwrK7wyWJWVpFMK8Uhj+dX2dImtCv5dXjSHYfkFyfcQB39ZLE1N6xaYgddmtFp
 DThf0TXYxrjyRlnbjBriaMECefbLqAQE3zHHWoIS3znmvlaWlp57ASiZFSnP7A8qOh+L
 eQSZK60OnXb4MH+91KM+uxe2Ut3OGCImKjwIzU/RfSQ4AZzHtkVDl4OLp/94jOsYQhl3
 o7GFJOZvxfSreh1+urJuWCf4xySVIXV5ZgwAu/oFUo3FQEpPcGSS3gH3nA+6vPOt85EJ
 3X4Q==
X-Gm-Message-State: AOAM5305FWpS7mE9NHWs+EvB2dajpml/438xnvV/EI1MbPzYePjrm/AE
 iKe2ztP9toDhydel1gYc359wfMLc85b8lFfVTraYl7PanV1Z3lBwiHvffRdDu8Hm8wfYIqJvlGo
 vPa8GEvA9/wQGnzk1DX+m98q9Pkdc63c=
X-Received: by 2002:a37:9042:: with SMTP id s63mr29655088qkd.395.1605186102791; 
 Thu, 12 Nov 2020 05:01:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB/4vXTm0yaPQb6sGa2RDwEWwUhWApLjfGKp+o1lqgj1oFXdxbx6TNmDOGTukOA9oTcTpS3yfTU5IVaDpnhOM=
X-Received: by 2002:a37:9042:: with SMTP id s63mr29655053qkd.395.1605186102444; 
 Thu, 12 Nov 2020 05:01:42 -0800 (PST)
MIME-Version: 1.0
References: <20201105194416.GA1384085@redhat.com>
 <20201106223524.GG1436035@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
 <2033635.TJ2JW7Qltq@silver>
In-Reply-To: <2033635.TJ2JW7Qltq@silver>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Thu, 12 Nov 2020 14:01:31 +0100
Message-ID: <CAOssrKdNVwXsXA_q3UzcN0c7QKt3Bn-V758d8UJp=72cofQvug@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Miklos Szeredi <miklos@szeredi.hu>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 virtio-fs-list <virtio-fs@redhat.com>, "Shinde,
 Archana M" <archana.m.shinde@intel.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 12:34 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Donnerstag, 12. November 2020 10:06:37 CET Miklos Szeredi wrote:
> >
> > 9p:cache=none  <-> virtiofs:cache=none
> > 9p:cache=loose <-> virtiofs:cache=always
> >
> > "9p:cache=mmap" and "virtiofs:cache=auto" have no match.
>
> What does 'auto' do exactly?

It has a configurable timeout (default is 1s) for the attribute and
lookup cache and close-to-open consistency for data (flush on close,
invalidate on open).  This is similar to, but less refined as NFS.
It's something that could easily be improved if there's a need for it.

Thanks,
Miklos


