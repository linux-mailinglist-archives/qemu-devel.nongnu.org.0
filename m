Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21642CC052
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:07:44 +0100 (CET)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTjL-0003Q3-AL
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1kkThS-0002TN-JY
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:05:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1kkThO-0000kH-B3
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606921540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37HR1rPOCsaZprDQ6kpD5DvqKCgj2XPvjksXb07SkCo=;
 b=iUrPMdFqiRnW4LGqGdo5QTU/gMFXifkU4xZ3qayxCrsEEwGJpFO1O9n3cLqmiYLy/8Gqe6
 UcFyKCgT+A0HSLAz7QjzqHMdvb7jWOA8cR8wvucucs+R1+JLuVc8QPGe4v80S4/k7DuVH6
 Nz5MSFzKWLpoIyBxJNfVmBVitZZcFww=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-SzlwZJb9NXKQlV14Igb8BQ-1; Wed, 02 Dec 2020 10:05:39 -0500
X-MC-Unique: SzlwZJb9NXKQlV14Igb8BQ-1
Received: by mail-oo1-f69.google.com with SMTP id d7so951728oof.22
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 07:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=37HR1rPOCsaZprDQ6kpD5DvqKCgj2XPvjksXb07SkCo=;
 b=lkaLsHSUJuz7Pc9g8Sqrh2sodXbq8m1KgcTJjedFxpzU9ZmJmr8kr6mCaohpJyV2d8
 ODqcSNa656PK2DnfTEtb3EvVuDf+DfYm5Y2Om/6WnTxIN3B/ikrmQfEJ73p7hxehyrVv
 pTIZCA9CnaHMkfZ50Mx4JlHMg4IEORqtdSCnKaN4Wf0DFsPihMIt7FqhoE6mJb3QMLm7
 jYcmia714p66Ad1L0IYnYkX6SsNvRu/UeFZTdmQW2PIGPfK8OBXik65Wt/Zp1JHqfttf
 /lYIPOaZQgj68xnau0IaunZNwk+ZcrFnyISH4sCVVYije0pi3C3IxJcXmCtEu6dxb566
 sNwQ==
X-Gm-Message-State: AOAM530f5KRPwld96vlbQtMf3r9GKxVUxTy5F0z8dqEjY1kcx4puF4x2
 Tngf1JjBPHc8ujFpHM5H9DN49HAhLcF0JEqwRtnqkKY8ZvZUpeKU4VwRJWXI7hjYfiLcpyWG3eY
 yJLdOMrf0GU6o0XCzhOoGLen37N2ZkvU=
X-Received: by 2002:a05:6830:1002:: with SMTP id
 a2mr2115359otp.316.1606921538174; 
 Wed, 02 Dec 2020 07:05:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaceapKJNMui+xRoV8p7s2QKTeVoydWGaEu3tlATelw+UAeRp2fVDftSZYCZbh/FMvfJ+wqm2TC0E5po+IPz4=
X-Received: by 2002:a05:6830:1002:: with SMTP id
 a2mr2115340otp.316.1606921537988; 
 Wed, 02 Dec 2020 07:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20201202132038.1276404-1-philmd@redhat.com>
In-Reply-To: <20201202132038.1276404-1-philmd@redhat.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Wed, 2 Dec 2020 16:05:23 +0100
Message-ID: <CAMDeoFWm6TQirYh-B31A+V4rPnd+2ibis9X9fBFDJRoS_jhN1Q@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host/pam: Replace magic number by
 PAM_REGIONS_COUNT definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsuvorov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 2, 2020 at 2:24 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> While this change helps triskaidekaphobic developers, it
> is a good practice to avoid magic values and using constant
> definitions instead.
>
> Introduce the PAM_REGIONS_COUNT and use it. No logical change.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/pci-host/i440fx.h | 2 +-
>  include/hw/pci-host/pam.h    | 2 ++
>  include/hw/pci-host/q35.h    | 2 +-
>  hw/pci-host/pam.c            | 2 +-
>  hw/pci-host/q35.c            | 2 +-
>  5 files changed, 6 insertions(+), 4 deletions(-)

:D

Reviewed-by: Julia Suvorova <jusual@redhat.com>


