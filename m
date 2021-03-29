Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000BD34D414
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:37:24 +0200 (CEST)
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQtxE-0007SC-2W
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lQtvm-0006MO-4B
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lQtvj-0003qo-II
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617032150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z5cLgN018yR85x+tLXbEY+YFGEIHVYRWPGBvmzqoU2Q=;
 b=hwdHohaH2wOKXtSLA0dz47E1x1avRgjvjvbrGYK+GUDSxmlzPKBr0/L4Zz7SzG8Njl6lwu
 LO85dhR7Pvp7P9qKleGpsVoLQ1QIrKdsLeNooSbALHVpHM20h7/DBPxOCFGBUVrnhJulmZ
 XH3dubeGgFKGPoYEK8Za7rpLHyi4LHM=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-FymVqd2LMji_pqX77ONxHg-1; Mon, 29 Mar 2021 11:35:48 -0400
X-MC-Unique: FymVqd2LMji_pqX77ONxHg-1
Received: by mail-vs1-f72.google.com with SMTP id 1so2051541vsw.16
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 08:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z5cLgN018yR85x+tLXbEY+YFGEIHVYRWPGBvmzqoU2Q=;
 b=K4VQyfVKvqaXi8yVII6t+0/0R8evGbctTSaGGY6NSByV/tdXoB6T1SlQKCatruzODW
 Aeg/8VcrSzwNr27HGNgMuvGGQwlRNamjvmH/87VPAf9QnGevyEcke6CCTwLiiqlb0X1i
 IHXv3L/r25pLu+Ytnzd7iHOuouuBV07OgbqIbO6VMVU44ddx8VAKzBEwKZZ6nzE8ooCY
 +ZueCYQy1QcATiY4McMpcWd5skKTRQgCBT2gXf87WQB9fYIop0vxlg1zKoRN5gLyegJc
 0dpbPfoJaBg++tyRZynVwsVRItQQDnPvvuWzt6Wor4B/EITht2oMtNOzFwOWAuKBYnXf
 DZrg==
X-Gm-Message-State: AOAM532zW4GGIM4f+4KikTqV0N/Fwgiapa0V7tJff6+3WesA+cb6RkxY
 jbhH7MGjr+8PBr2EnMzfoPWNy1/m/j0/NwAQMFBB0UsKDf+lD7tlGugZAZNGEu6ZsaFsAwjIeEq
 2jURwDnlOxRNgOajLCUGydFjARmFdSWc=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr8109492uad.133.1617032148167; 
 Mon, 29 Mar 2021 08:35:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7pELfysjiYiVI4xOGdCpHz/qngpPSD9kEKBd/Vv79is+glGXvBwiCbLxEygExw49A65/aBTILxx9QtpCVhhA=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr8109472uad.133.1617032147921; 
 Mon, 29 Mar 2021 08:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210329132632.68901-1-mreitz@redhat.com>
 <20210329132632.68901-2-mreitz@redhat.com>
In-Reply-To: <20210329132632.68901-2-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 29 Mar 2021 12:35:21 -0300
Message-ID: <CAKJDGDYD91GPs4tvMUOGt2uYo433TC16FFzcNVbb5kspuz28tA@mail.gmail.com>
Subject: Re: [PATCH 1/4] iotests/297: Drop 169 and 199 from the skip list
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 10:28 AM Max Reitz <mreitz@redhat.com> wrote:
>
> 169 and 199 have been renamed and moved to tests/ (commit a44be0334be:
> "iotests: rename and move 169 and 199 tests"), so we can drop them from
> the skip list.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/297 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


