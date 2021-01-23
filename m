Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B80301801
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 20:18:37 +0100 (CET)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3OQe-0005SS-9j
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 14:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3ONH-0004Vr-9U
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 14:15:09 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3ONF-0002QL-7j
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 14:15:07 -0500
Received: by mail-ej1-x630.google.com with SMTP id gx5so12364060ejb.7
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 11:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OQSLVxzrsAcAorytUbUgsyte+EBOhH1QRWlwOAR30pk=;
 b=V/0uJcYifl5n9y2uqzunW95MuDzvaK24MYwbeLiwFe/BpvLJz2Zw6DmMwBpp/QcM0A
 nBY26Bv7YnjU7HgKPTdCu1JlFMDh2ivZoeMPvwvziq3FQ2qFNgum7WIEINTVrg6Yuj+l
 VpXj4aEcmlRzMF05tNxR5JL86au6Nhh0LlXkBXRV9GIU0zpgcEZTPMrgCcsL+p2RZCTG
 85US8JMGFBkuM9jR+VipmVicEaSZwq8gIqueNL0BuacxaXR6U/HhH1MZne8fSnzzEr34
 czuWHHwVpL8npwuNtNnb7VTyWvVXXOxDfYrYZq09F9UIDs9OCDJNsvYGEz0DeIBPMScR
 nVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OQSLVxzrsAcAorytUbUgsyte+EBOhH1QRWlwOAR30pk=;
 b=METIknYK/jTMzJ9abuC57Xta5jW/ebip7RM7/PIZ6VJGJi319NLhTmD+jdb5IzRN7a
 OkhUlRsGFgmNNAJkDRRwsXT6jpAeROdUUjNLH4cc3zMSzrvzyLzVfhuBFL3uaquY3cti
 y06/vScX4d3bi/qcAPlNXpzFuwGt24N2XBCyiscDdRUJTlOuqYw8971eVhrKV9w9Iz0V
 nODLTB/C1mYbEq8htETdmrZav04c0IWNQyc7lnqfonqa7fcD9CcVoes5KB/T1Aqrf0Pj
 YFgosGib0Q7qYaGjxXgsIwqgudtEWid0XDnLxUN7PpICHUZaYjBo1158ncB2jg7fWN+v
 dVKA==
X-Gm-Message-State: AOAM533CXt8kKGw+wgJ7zJeazApLJ0/nYF5mAiMhZbd234fX1quC7Asv
 D7BAhLPVOt24iVhjgBFOwq4412tohTy6veMZs34PkA==
X-Google-Smtp-Source: ABdhPJwwhqHkzkfc62JLhGmgePjEylHg/0SoAgsV2v8JSBAAUtxKpTCLDrBAkiUymHKqqEYlG53+VLICHb44dSdHYbc=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr326965ejc.482.1611429302581; 
 Sat, 23 Jan 2021 11:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20210122174849.3936119-1-kraxel@redhat.com>
In-Reply-To: <20210122174849.3936119-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2021 19:14:50 +0000
Message-ID: <CAFEAcA_ZdncWS5xj5UG3Q9e5R-5=Lg496yykvjVLdQry9+PMSg@mail.gmail.com>
Subject: Re: [PULL 0/8] Usb 20210122 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 17:53, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 0e32462630687a18039464511bd0447ada5709c3:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-=
> request' into staging (2021-01-22 10:35:55 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20210122-pull-request
>
> for you to fetch changes up to 2980a316734c420e7398aec026909dcfc8614c1d:
>
>   usb-host: map LIBUSB_SPEED_SUPER_PLUS to USB_SPEED_SUPER (2021-01-22 14:51:=
> 35 +0100)
>
> ----------------------------------------------------------------
> usb: cleanups and fixes.
> usb: add pcap support.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

