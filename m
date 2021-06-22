Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0E3B10B1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 01:41:11 +0200 (CEST)
Received: from localhost ([::1]:40432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvq0z-0006LI-Tw
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 19:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1lvpzF-0005dk-Cx
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 19:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1lvpzC-0005B4-Qt
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 19:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624405156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B/I4TBFAQCd+aAnQYHJi30cBD4171Uu8WCaI5ljB+jI=;
 b=S02OIT37Hvop4z0dSB9dAscz4moiZxi1pnUL7P4tgTUpj0kLSmkGVHDKVDLjROPbOk8s0G
 K0+Lt7v9s2L1U8ngsmcnKESayhfHhwLU3hmABScL7TyLb2Rcn2GBF9K5FR5cawRBZkeoo6
 r+8/fYJby9MftXBhnd4aBzS7TWBVl+A=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-DM69b6QlPBSg-r8fQPLSNg-1; Tue, 22 Jun 2021 19:38:09 -0400
X-MC-Unique: DM69b6QlPBSg-r8fQPLSNg-1
Received: by mail-lj1-f197.google.com with SMTP id
 t4-20020a2e78040000b029015d4e9229dcso120065ljc.23
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 16:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/I4TBFAQCd+aAnQYHJi30cBD4171Uu8WCaI5ljB+jI=;
 b=RA0Wr+q4/MTJxuLQ4hJwGsf64AmJflWUcAhFkykItgWF8mzKbUoE+dyjAQOKfTWlOc
 fV4BiH6T6Kda1AgAgfeJKCrhCyjjnbvvh5c322sjqiE0h2z6mGhmNLDO+HOQhPyYLuFM
 mUouO4tU6KWFKYODdiESzhePkFbwhXAq7GPx/cFx2SJ8SxzzxOjXdSaXR+b3rQUOgfc0
 EWp/bATDKIY6kozW4goHHsO4WXcvPLtXMU4v7rJxPOAgjtnI2N72ycYLioXifJF7sVYN
 RduYQIcVD2qTQNbEeAV9ngQIbL97iMrwr2NseYsi9xSBPTCRs5RGF8G1TxixpLbuSlaf
 pbYg==
X-Gm-Message-State: AOAM531wYMX096ale2XXLUJG8WbCbMyHO39X59a1JGW2z4vQFPrFOROa
 FeRt02kqgnsGvsEgbpdq35stS3KRou228gwNS6aY9FGSEnVkZPX/76KFrC185Cj6f8mqopF2k0B
 zMGJge7nDPJIHpJhQ3c3WRgO7YZKo1Z8=
X-Received: by 2002:a05:6512:3d18:: with SMTP id
 d24mr4570779lfv.370.1624404635402; 
 Tue, 22 Jun 2021 16:30:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztNx686kp8GLc8O9mVF7piKrHdVV9Se3glRTkYB5SF5rqEnmZ/yPDola2QLWKiypa2UuflH5Qd0y7Bbz7A9eI=
X-Received: by 2002:a05:6512:3d18:: with SMTP id
 d24mr4570768lfv.370.1624404635198; 
 Tue, 22 Jun 2021 16:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210622024236.600347-1-leobras@redhat.com>
 <YNIgIAXaBnIP3MrR@t490s>
In-Reply-To: <YNIgIAXaBnIP3MrR@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 22 Jun 2021 20:31:15 -0300
Message-ID: <CAJ6HWG5SqzoSYieoGRM3TgPicHR-2h=8rvbKevcWdzGjcy6s4Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] migration: Unregister yank if migration setup fails
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: qemu-devel@nongnu.org, Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22, 2021 at 2:38 PM Peter Xu <peterx@redhat.com> wrote:
[...]
> Yes, looks right to me:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu

Thanks Peter!


