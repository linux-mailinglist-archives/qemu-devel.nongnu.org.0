Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40134380F3F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:49:46 +0200 (CEST)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbwX-0004JK-7t
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhbk9-000540-1Y
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhbjz-000227-0F
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621013806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpVKh4HKYoHH0lWn291/pKZz2SX/ft5mSiHl/bmJA5s=;
 b=VL1v8YKMx++kRB69qWNmgBP2ljezNtNe2YWMP3xM2b3soKMpPc+wvPzbtIlw2LLChjQuU2
 mzZBjjHxtmBnyW9mUMy+N8P64XlnXby5J/dCZkd+CvuiyDTe74eoYrN6lIRaBotyl3e7aT
 BUrIfrV0VeiE5UU7BJDAaF/HIV3WHDs=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-6Y3k5-HbNqmGhE4ZYKdNzg-1; Fri, 14 May 2021 13:36:44 -0400
X-MC-Unique: 6Y3k5-HbNqmGhE4ZYKdNzg-1
Received: by mail-vk1-f199.google.com with SMTP id
 w206-20020a1fadd70000b02901fb33a39f7aso101846vke.20
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 10:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MpVKh4HKYoHH0lWn291/pKZz2SX/ft5mSiHl/bmJA5s=;
 b=fAAbAQfi5OLbtUmvJLF2AN46xmfp9Kv2eUtFSJbNGfnefiYOwSsO5UCN2C93Nh1Q9g
 b3kGJwpQvA4JSBZqaIQp84ojmDa50woqKtSXvGYAgE4BvMSiG7gj5Llkb95YHDmlcrL4
 yVUAfzDKLIlkNXk5qoZmeFCGUXjqYuooCOmSmnZiUJ2iOsdUj+nOIbtlRkMbqwTkAsNJ
 YWNTcjdKUEznUUBNFhihRCGAwukcoBJjJwPywB8FabyJrEgt1HBl7JI1+MUQj3zjX0TV
 5KfA6I8L4vpk+dBcoPNkZqgmylraZeIBTcs4ldUCpWchICLeFUlj+3rCyPs+ekhhlSj0
 hI1w==
X-Gm-Message-State: AOAM533wUEYxfY5yPiLclAgYUdkeFobcNtT3M5FV8Pa+6jMEHUGkjHvI
 9RjZJ7uX8XYTvVEOmlL4XbnZSvzV73b52Y/R4x19MZ9VNU1fMvk7RCO+QLI2Q+JZzPm+BPpSDzC
 h75mX3oG5/a37a0t5DWkkH0FALaxx2q4=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr9359252vsi.45.1621013804507; 
 Fri, 14 May 2021 10:36:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKEmC62meuZHJJNycfxKyUFuwUcgHazZvk1AmrMc/PKa18OXwSAhSCmJX546P9B/sRRIkl0jYxR+DxFK1IZ8U=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr9359242vsi.45.1621013804384; 
 Fri, 14 May 2021 10:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-13-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-13-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 14 May 2021 14:36:18 -0300
Message-ID: <CAKJDGDa4ndiYM-gDBOxCzJJRqYKbh6O7sXP3TmjoNRXyLK2XGw@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] configure: bump min required CLang to 6.0 /
 XCode 10.0
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

On Fri, May 14, 2021 at 9:06 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> Several distros have been dropped since the last time we bumped the
> minimum required CLang version.
>
> Per repology, currently shipping versions are:
>
>              RHEL-8: 10.0.1
>       Debian Buster: 7.0.1
>  openSUSE Leap 15.2: 9.0.1
>    Ubuntu LTS 18.04: 6.0.0
>    Ubuntu LTS 20.04: 10.0.0
>          FreeBSD 12: 8.0.1
>           Fedora 33: 11.0.0
>           Fedora 34: 11.1.0
>
> With this list Ubuntu LTS 18.04 is the constraint at 6.0.0
>
> An LLVM version of 6.0.0 corresponds to macOS XCode version of 10.0
> which dates from Sept 2018.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  configure | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


