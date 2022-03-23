Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0274E4A84
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 02:33:42 +0100 (CET)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWpsa-0005tw-Vo
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 21:33:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWpr9-00055P-QK
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 21:32:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWpr7-0004Od-6d
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 21:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647999127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3XCFzOH5iV3JMT1fksxrLVSdyZRwVFfq5DbrCQIUO7o=;
 b=doYmbShm5/V872tS4TCQ6aAwBPz/wZ46X/BhoHhTsCETaCKkCzXDTxye+AllJjNBPKa9aQ
 ZwUnt+RG9CvpYZi340M2A83QCZa64QpvjE3G0AuOmMAQ9koKfLJfvMVKR2x+JoN9I2VFed
 Jk8c/XPWXwK/ZemEl3ziSur+22WnjY4=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-N6LxUjh1N_aefqxYhJFx-w-1; Tue, 22 Mar 2022 21:32:06 -0400
X-MC-Unique: N6LxUjh1N_aefqxYhJFx-w-1
Received: by mail-ua1-f69.google.com with SMTP id
 d11-20020ab0724b000000b003513507a46bso71929uap.16
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 18:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3XCFzOH5iV3JMT1fksxrLVSdyZRwVFfq5DbrCQIUO7o=;
 b=L0/nlBPP7wljKZphiHF5iyltWR5+rJ4rz+b73lR5mAdPjqto+JbdAB9hNYK1QxDd5n
 k0Jmp3yYt6qf9dcFTmvyfO6cRRhPCUz6ZIiiCpnfgaPbRV4XbjvKReAId0yNj6jJaDRl
 GDa+VwTv6Ux453R8frODyATbT0AT3fj+JHykgkiGmtxXbrI/rp2ihAFYVENPWNaS/fpD
 VTVi8d0DVgzZvJMUXz+niO4L3pLxQuUvNXZThbcDkxozJPPm6zwRY4GO6IdNzQNxxGVe
 T+3A64qWEmRWtneqtK/h3G3/8SVgulfp6mKEFubWcy/saeYi0hWDf4LE5a3zeHnoFn54
 sitw==
X-Gm-Message-State: AOAM531VfNW3b3HFavROiCHbo+PJ6FTpSwVpmCsKSnaw0++7puud59q4
 6+NUiY6D1GJ8pQ1wcQ1zG+QH1Y2L+TtIubrepSb7gDT+vflmlgxHuXW7xknWBv4nLCX9vY+oGcq
 q6RKkndrJ28hQe9yiX/c92IVV+LHLh5Y=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr10119379uar.109.1647999126231; 
 Tue, 22 Mar 2022 18:32:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqUpjRpuISjHk9BSZq/4/UmFk+atalV8PITom/lROVhp9k/oHcoovhhHMIypwp2UOEjhErcNIcfvbSIFQs2lk=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr10119366uar.109.1647999125984; Tue, 22
 Mar 2022 18:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
 <20220314213226.362217-2-v.sementsov-og@mail.ru>
 <20220316211840.cq7m3ji4m2y6drgi@redhat.com>
In-Reply-To: <20220316211840.cq7m3ji4m2y6drgi@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Mar 2022 21:31:55 -0400
Message-ID: <CAFn=p-ZLmQDPHk5yYQN6gHDDOxQ3KxKAoOjAg_c--ZX5CiwSZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] qapi: rename BlockDirtyBitmapMergeSource to
 BlockDirtyBitmapOrStr
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, v.sementsov-og@ya.ru,
 yuriy.vasiliev@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 5:18 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Tue, Mar 15, 2022 at 12:32:24AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> >
> > Rename the type to be reused. Old name is "what is it for". To be
> > natively reused for other needs, let's name it exactly "what is it".
> >
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
> > ---
> >  block/monitor/bitmap-qmp-cmds.c        | 6 +++---
> >  include/block/block_int-global-state.h | 2 +-
> >  qapi/block-core.json                   | 6 +++---
> >  qemu-img.c                             | 8 ++++----
> >  4 files changed, 11 insertions(+), 11 deletions(-)
>
> The type name does not affect QAPI interface stability, so this is safe.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Sounds right.

Acked-by: John Snow <jsnow@redhat.com>


