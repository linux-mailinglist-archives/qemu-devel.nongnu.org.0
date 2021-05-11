Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D74C37B07E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:06:48 +0200 (CEST)
Received: from localhost ([::1]:59668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZaZ-0003sR-Ms
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZYw-00014Z-AB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:05:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZYu-0002Z7-QY
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620767104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPWQX7Pa+CR5frdU6BDuWiZzo5Dmyiyl0oKgWZEm41o=;
 b=IoHL39YKjb3HiKNGn30KY5WMEg5SYhsYT0w8b2qMUVo45I/ouLaGDdpPt2He3im5HoNnLH
 6aabclphv0LNXDFTFnoWr/9yN5GuywVS/CU0QV8QopUOH/8cODXN3m7Pk+bf8hLTc6lSjd
 KbiaWGw17GeTp+2kDiBQjKPiUv90aDM=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-aNngjObRMIyjPT_eYFDXTg-1; Tue, 11 May 2021 17:05:02 -0400
X-MC-Unique: aNngjObRMIyjPT_eYFDXTg-1
Received: by mail-vs1-f69.google.com with SMTP id
 z21-20020a67d2950000b02902271a3918c4so10160103vsi.20
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 14:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iPWQX7Pa+CR5frdU6BDuWiZzo5Dmyiyl0oKgWZEm41o=;
 b=VCJOaa3E7JPzFwy+PyvKiaH60s6fNN+RlJT3G1qiv+6DP5jADx0OMAxkHLzRK/8LY0
 PAs49/4iiGz+F/JEBKkykFZXQgjcQyCFLFNzqzhT9vVjPIc/Jm6Iy19YQWnoCIL92veU
 1USpvApb2rYViKcf03yHXF7ANQrcI/mi/JmcIpNWC2JyJhkioRzCRtdLf1fJJqOdSGKe
 QtkOSgVGqhABOws7Az148ieIoCsK28YBqvf9023Nv5b7blmSQsJe/vHOMWzmDoZp6Zw9
 nprW0ff2fvRGf5suaIbuula9TPNRySMvVPmHULVjEPclw9Gr52M/6JgL1LSiqHFMhUGt
 JzHA==
X-Gm-Message-State: AOAM531mGGwx0XZglc4xtRHb1+UVsefbK5GzN1nUXL1J238GM7ccvRUc
 +3gAjRVGL3HtLCzn14QmV2V74VflJBdeTA1Q4NveIl3kM2a/X4WIvwIPzWeOAVB1Th2zR570aTD
 htbJ0jZso3SSybuGl4VI1s4eIjynCt78=
X-Received: by 2002:a67:6f86:: with SMTP id k128mr24622148vsc.50.1620767102059; 
 Tue, 11 May 2021 14:05:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZYVyIuTsxcma57HwwxxJdc7s7LGOWekZw5P8WEuUC7tICeWhbAbNEQr7P4IueCj7aouEaxvk1XtqE5J07N9s=
X-Received: by 2002:a67:6f86:: with SMTP id k128mr24622135vsc.50.1620767101924; 
 Tue, 11 May 2021 14:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-12-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-12-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 18:04:36 -0300
Message-ID: <CAKJDGDbCObwkH1+0hWOv53+bYJ5csFxvnykR_Y_ha4xox-ee5A@mail.gmail.com>
Subject: Re: [PATCH 11/12] configure: bump min required GCC to 6.3.0
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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

On Tue, May 11, 2021 at 10:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> Several distros have been dropped since the last time we bumped the
> minimum required GCC version.
>
> Per repology, currently shipping versions are:
>
>              RHEL-8: 8.3.1
>      Debian Stretch: 6.3.0
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
> With this list Debian Stretch is the constraint at 6.3.0
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  configure | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


