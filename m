Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F4548EDAA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 17:08:51 +0100 (CET)
Received: from localhost ([::1]:48702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8P8E-0003J3-JO
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 11:08:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8OwA-0006tZ-QX
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:56:26 -0500
Received: from [2a00:1450:4864:20::430] (port=38430
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Ow9-0003D7-5F
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:56:22 -0500
Received: by mail-wr1-x430.google.com with SMTP id a5so16356413wrh.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eRRHK4obLE1jH4mya9xbT6tYy0v+/nVyPFk9JpkpaiM=;
 b=uQOQXOKAgksYpbmasD8l0JyOMvVRtYQD3dulCuc7DZ9V51qcpyZVNr1m5Vo7ntAdHY
 UiytlJtIBBKhmixV1gliPwRgAWGhzQjSjq9Wvt+P2RoKLdOddAEKFoP0HENueUqN2coP
 ssZVBF83c/YqrBpTwHMUWKOsnccZe1Q7zVqwkjO7jXse2oyV2Fv8SgBzHIgQDuT9Czut
 pwNhNS8AEzc9Cu4UZcwKe+9tl7e8AFbnH+jKQzgZhNQw6kBPw+k+7E2LXOvS0WSSp3K/
 2qRYJ96NnskavE3cOI9zAZmW0l0s5On3oWsW+uxfxeFgzwuz0Gw62nJ4YhUZQ65Q7hdO
 C2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRRHK4obLE1jH4mya9xbT6tYy0v+/nVyPFk9JpkpaiM=;
 b=Unky4lHBlnqt1CAa4CKNsuQAsgRUu6a/42iho1ZD59S+6JtfOtO2xET/0LV8DAvISZ
 rZqnsJn3R8l0XDJrnWPp/5sRYCXc5XR58hbQcZohQv8aw/gBYKjOTmvSVCohGBP7HxjG
 GxoxxNgQtkaZYKLmsYICqs30hq3Os463qclySW5yoHe9ohAgHSUpCVDrKA+01jaHtB/2
 6v1sEkz+b8RI5smPXc7FHqY+l5IhI2TL8e4CYRzvPtM6LhA4PsdjbN6O1RuCV2tGMQhw
 aIobonzsXrmBdXU3df8vlOnI90TkAlC/bhuF2j+261X8Qt9fJLWGSVhudDxcVS9LsoWH
 WuzQ==
X-Gm-Message-State: AOAM532sR5xkejZ3IqiR/ZTLfI7dNX11BhIb84UJ2fZyAV60BN1cZjO3
 7akkJC7OhutH/W38caRHMB9t55NVv2lu1PoRoS5r0A==
X-Google-Smtp-Source: ABdhPJxerf5TJsVCevdqVhHotZtpHIgpG2Qlpp3KmjEI1kr++5GGthgHxle2MHPuSiw+SURADvfzQkszeiHAN/Am7ls=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr9068897wrn.172.1642175779429; 
 Fri, 14 Jan 2022 07:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20220114065326.782420-1-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 15:56:08 +0000
Message-ID: <CAFEAcA_3NMAu6hfYu_xkRcbRnjyxP=xbDKRSCJSd=2G5OLPGqQ@mail.gmail.com>
Subject: Re: [PULL 00/20] Kraxel 20220114 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Jan 2022 at 06:54, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 91f5f7a5df1fda8c34677a7c49ee8a4bb5b56a36:
>
>   Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging (2022-01-12 11:51:47 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/kraxel-20220114-pull-request
>
> for you to fetch changes up to 17f6315ef883a142b6a41a491b63a6554e784a5c:
>
>   ui/input-legacy: pass horizontal scroll information (2022-01-13 15:33:18 +0100)
>
> ----------------------------------------------------------------
> - bugfixes for ui, usb, audio, display
> - change default display resolution
> - add horizontal scrolling support
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

