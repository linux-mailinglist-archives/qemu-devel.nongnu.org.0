Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC498380F36
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:48:24 +0200 (CEST)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbvD-0001Jz-Oo
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhbjC-0003Oo-PG
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:35:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhbj7-0001Wn-RK
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621013752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6PpsMTKYESNfevQ4jUmTrRAz50jCPGCXpqaovuaDxdg=;
 b=gr3kvhTjjvcxxQUK18E07uM7tVhW9vHCRusZqVxwESqtSwCOY2BtyNcUt679jgv4VOUTfx
 tqLP+nOQOAIR3oHRfrG0pxu8Xx48rj1FZDHHCehuWaTJ0TmRARAUDttZGq1gXUuKfoYrDD
 EfT2P2pi9jAkZIjCNir+ViTlZ0GAMc0=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-Bj-FnomcPruilzRBJDYmvQ-1; Fri, 14 May 2021 13:35:51 -0400
X-MC-Unique: Bj-FnomcPruilzRBJDYmvQ-1
Received: by mail-vs1-f72.google.com with SMTP id
 w23-20020a67d1970000b029022afcb86374so6975785vsi.3
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 10:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6PpsMTKYESNfevQ4jUmTrRAz50jCPGCXpqaovuaDxdg=;
 b=HAPh2Gh5dIkntf76Za6KjFkfvd1hEjJhmXO33RUr9FwVyceYlvM640O3txK7IZVLpp
 M/lLF04Q45t1j6mwSqGkYzAdwc8JykYOazBc2CaPsXBBeMWF1WgQzUtpPxLRltHhokSw
 /O/X1irMzt2XyoAK2E9P772zGTRzbpEbXtAcR7/lfs21hmhRCHsi9C3opIqNXwSf+bQz
 tK88vogAUupkXCZjr/W+gYxrIDQ+pZLxvrT4U6pMyX7H1uz5pzzVZclsi1inFU+zBynb
 XPE/ybQ9wNJoyRATqX6ZttdWkwQN7lUPhvxooDSOuPMb3A1yZFvde2gdxLSyCJ4Ty7as
 ttVg==
X-Gm-Message-State: AOAM531l0p0eIrwia6v2Y0CL9H63pDNYmNPrb75jiLEpOQiIStRpiUi8
 c+PV8OCeUy/uzV1OUdSZGhaAEImpTy5Ilo2Yy6eBcM7FkHq901IXWOBEN2VSlj+nH0+xFMYlp/m
 F5M8ZxQ1PfbYs9q6mcgHzeRjwno5+QKM=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr45130689uad.133.1621013750935; 
 Fri, 14 May 2021 10:35:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNx/ppzq8CJUUcyl9+2uzKhishMJWAEGglaL7BbdshCPI3l9ju6VlSrsOG7h5E6sSNnqqDD7OjpbdwQExPBXw=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr45130672uad.133.1621013750794; 
 Fri, 14 May 2021 10:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-12-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-12-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 14 May 2021 14:35:24 -0300
Message-ID: <CAKJDGDZgcA5Wr8bvM_4=hNk1AHXZtn3aprpM8WoZhijG_h_xGw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] configure: bump min required GCC to 7.5.0
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 9:05 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> Several distros have been dropped since the last time we bumped the
> minimum required GCC version.
>
> Per repology, currently shipping versions are:
>
>              RHEL-8: 8.3.1
>       Debian Buster: 8.3.0
>  openSUSE Leap 15.2: 7.5.0
>    Ubuntu LTS 18.04: 7.5.0
>    Ubuntu LTS 20.04: 9.3.0
>             FreeBSD: 10.3.0
>           Fedora 33: 9.2.0
>           Fedora 34: 11.0.1
>             OpenBSD: 8.4.0
>      macOS HomeBrew: 11.1.0
>
> With this list Ubuntu LTS 18.04 / openSUSE Leap 15.2 are the
> constraint at 7.5.0
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  configure | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


