Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4755450D5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:29:23 +0200 (CEST)
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzK66-0007DV-5a
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzJrJ-0002Lb-7s
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:14:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzJr5-0006Jo-K5
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654787630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1NBaD1L2eAVL+8PZ9lU9oZfnpy1NfGUmrmO8j9nZ9E=;
 b=bZUw4Df4OQQiSJpxy8BE7QRwe0Gppgl6gWfXpoUzD8abm+2gwppcgrI30TpdrX9n0QUjSt
 OAN98JRZsxmTaqA8Cv0CMku/e6Dpj9YlAWH0K9YX4vxjmEvwAUpJpj/H5dcqCzBoL5f/Ew
 /QOETQTymYSOIifF6wm4iKA4Sf7ywvA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-VC8t9A_MOJ6AzyutwzB8IQ-1; Thu, 09 Jun 2022 11:13:47 -0400
X-MC-Unique: VC8t9A_MOJ6AzyutwzB8IQ-1
Received: by mail-il1-f200.google.com with SMTP id
 e4-20020a056e020b2400b002d5509de6f3so6217962ilu.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/1NBaD1L2eAVL+8PZ9lU9oZfnpy1NfGUmrmO8j9nZ9E=;
 b=RnnZ4bYTFck9KLhzKQOLBlRZne0o3iRNcY70Mby4U+x4FHj72sFGGie3v9Ud+0vdVB
 oB0csWT4BemmFAfoEW0HxGDLzNqgykGsworXcZH4GAJR+5dj/cwbP4G7yabH8T3QS0Wp
 vqKjguAv0M+Qr3Z2Uduj4MTkSUYVK8n9Qm+sGkSmsadX/VlcvsWZ1O60PDwvIXFyW9h9
 MGnQwERWhmAqczo0QFiNZh3zTHRI2cRs4pku9xQFE/JBxYh0+Yu3fWs0WAYBWvD2FAyS
 654wB6zQZzHZINtGvt/0G0qMVIOgJf3cgfWAuUJxINYybeDF0m2qCuPBKVp9WbLUiCtO
 EPhg==
X-Gm-Message-State: AOAM530Omx5Jo4Iy7YngfKC2sfyhu1u63fuHEG276ffak1lKDmBX9hte
 qqTC7zZR+SlqXaNYrzJ4M+o4Ndtte6jxsx9foIBMUARj4oh1cSl0p9akaemJBhXrr2Q41I8Muaj
 7xzlefcTrczqKOPqrMvwbDGvQiaL9EvQ=
X-Received: by 2002:a05:6638:1649:b0:331:b3c5:159b with SMTP id
 a9-20020a056638164900b00331b3c5159bmr7116964jat.130.1654787626629; 
 Thu, 09 Jun 2022 08:13:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTbiD20PS/ci02zYl3i6wRVShEzuBHBekciM1NxkrQ1Px+WS2hp+FWWd1AeVohLho8OtFIRaTvGhUWqvApKqA=
X-Received: by 2002:a05:6638:1649:b0:331:b3c5:159b with SMTP id
 a9-20020a056638164900b00331b3c5159bmr7116953jat.130.1654787626409; Thu, 09
 Jun 2022 08:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-8-afaria@redhat.com>
 <Yo9AhsmzrQlzIr/z@stefanha-x1.localdomain>
 <CAELaAXy-Pp75sdkEDiaUEfg-SL5FF1LKTJ7ntajNcz75+FpiaQ@mail.gmail.com>
 <20220527142506.wkl2al5vtle45qji@redhat.com>
 <YpS9Y0p18HJSNFsq@stefanha-x1.localdomain>
 <CAELaAXx23BK86W6oEzo9DANj=KCTpXAwDu0E85BGj19UW0M3VQ@mail.gmail.com>
 <YqCbDWy4kdBSzd43@stefanha-x1.localdomain>
In-Reply-To: <YqCbDWy4kdBSzd43@stefanha-x1.localdomain>
From: Alberto Faria <afaria@redhat.com>
Date: Thu, 9 Jun 2022 16:13:10 +0100
Message-ID: <CAELaAXxtQ_Nodtu_2xQJXgT6DmwamObqDZOkzogUQuzhPMKzTA@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] block: Implement bdrv_{pread, pwrite,
 pwrite_zeroes}() using generated_co_wrapper
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, 
 "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Fam Zheng <fam@euphon.net>, 
 Ari Sundholm <ari@tuxera.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 8, 2022 at 1:50 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Yes, that's fine. My main concern is that callers have been audited when
> errnos are changed. If you switch bdrv_{pread,pwrite}() to -EIO and have
> audited callers, then I'm happy.
>
> Consistent -EINVAL would be nice in the future, but I think it's lower
> priority and it doesn't have to be done any time soon.

Great. I'll send a v4 with the small change to patch 06/10 that
remains, and note in the email for this patch (07/10) that it required
quite a bit of auditing. As mentioned, there were ~140 call sites, so
I'm not positive I didn't make a mistake. Hopefully someone more
accustomed to the code base will have enough time to double-check
this.


