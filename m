Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7096B3E0179
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 14:56:30 +0200 (CEST)
Received: from localhost ([::1]:40380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGRh-0005xw-0d
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 08:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBGOw-0003sb-Dp
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 08:53:39 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBGOt-0000m6-Fk
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 08:53:37 -0400
Received: by mail-ej1-x632.google.com with SMTP id yk17so3498527ejb.11
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rgo7CWM5nqFHsuPrsliFJT5C8pUpC9WpZKf7FxvS3kw=;
 b=DAohLFqWOtSWWW58HLZi/yeRSYzjoGufURNEh3VH6Ccg/HbXaQZUBYuCsWrKowECLo
 oHOhSgZz1kxlvjeF2N9j8cb5+4S575OP+DA+Ef0nhiVi/fRykKNoeZ527eoQn1nWzffj
 IOlRXhL2VbZQKZgfK9PjNARD4tde9AnO4h5wS17HVMqhX4q6yzlvSCISNoNbREEw5ET+
 iST57fBwwPf72t1zh2T9kFT1uXsiQSN6zxI/KgLu5r+tAK8CKN5WZ6KhQCIEkEX4AsuM
 Inf7mLN4XtATg/DIoJTbxS1bquwpWvXgyV9x2HvsNST0mAREiztW7TO7+AxrOsqkmDaw
 oj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rgo7CWM5nqFHsuPrsliFJT5C8pUpC9WpZKf7FxvS3kw=;
 b=eR63Lnw7Z9qQo1bDpvTWlGKpQD3nITLJURXXXmjgzz1OrrqoTrXiifwrhQbsnStsNa
 HqI6ApMeRN+Rv01BgtnSO14CnbFbMuUxtzwg4wSVnwl88FnktuMppNlP5xUvCAGkQIVb
 iv8g9snpl5SWol9DEjoi5T6bwXHI2VK7M6hiN/BRMRSrjNMfJPDU8n0SltyRZ0HlkoeG
 aGTDcDso1V1TViJ0tgBpVG30IulXNFnkI7Y2Dlf36RayIwM0d1g9uVUan1QrTSOmNvCe
 NhHU9ikQOhBdXYSOfshyrALoKTNsUlVrfn/xm9/VKfVnsbfopxt3IsgwpGYH0z+KxKNv
 BMcw==
X-Gm-Message-State: AOAM530Aai2TKDe478I5t4kUIsqYmY0rzbUWX75B1hgOU31lTO95ItoP
 Hp6vmt//lFrYWPXUGmp8Cb/cMTNlxycomJ1YTK4Jug==
X-Google-Smtp-Source: ABdhPJxLsRsV+Poe/sxAqcCpwgU97q5osAoYI4Ax11bEQ7VGqrVJpmtPqDN4m7ayn3tun1nw2t6f8igHEe3pYarPQWc=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr25128455ejb.382.1628081612873; 
 Wed, 04 Aug 2021 05:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210803173922.3599280-1-f4bug@amsat.org>
In-Reply-To: <20210803173922.3599280-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 13:52:49 +0100
Message-ID: <CAFEAcA_-08iN9d6G7YyRftBNML4_pC0RR_L6FK62hpRg2+kt4g@mail.gmail.com>
Subject: Re: [PULL 0/2] SD/MMC patches for 2021-08-03
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 18:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The following changes since commit acf8200722251a0a995cfa75fe5c15aea08864=
18:
>
>   Merge remote-tracking branch 'remotes/mdroth/tags/qga-pull-2021-08-03-p=
ull-tag' into staging (2021-08-03 14:48:57 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/sdmmc-20210803
>
> for you to fetch changes up to 4ac0b72bae85cf94ae0e5153b9c2c288c71667d4:
>
>   hw/sd/sdcard: Fix assertion accessing out-of-range addresses with CMD30=
 (2021-08-03 19:34:51 +0200)
>
> ----------------------------------------------------------------
> SD/MMC patches queue
>
> - sdcard: Fix assertion accessing out-of-range addresses
>   with SEND_WRITE_PROT (CMD30)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

