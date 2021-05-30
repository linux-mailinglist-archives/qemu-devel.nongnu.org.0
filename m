Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88751395293
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 20:58:30 +0200 (CEST)
Received: from localhost ([::1]:39990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnQdp-0001yK-6x
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 14:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnQb6-000194-CG
 for qemu-devel@nongnu.org; Sun, 30 May 2021 14:55:40 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnQb1-0007oG-Qa
 for qemu-devel@nongnu.org; Sun, 30 May 2021 14:55:40 -0400
Received: by mail-ej1-x631.google.com with SMTP id lz27so13194496ejb.11
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vwXdIBomopEDPprR56Ctlx6vh3zeq57+JSb9smpjfGw=;
 b=eeV242ZawSCCAy8ypD5HV0Q/h21P9UrKyV9T02V6l5EdLgybhbwfHIIltxP+w6j91f
 Da1R2pWOvfE5Imm/sw36pV/cM8vNER+91NDLsWJblDUnBOfTHcleMLQzHqxlmkfY8mxk
 FTORrAXSPesYLG9YjhkM78AAvnL8p5T5npQJrhGuvTwZ751KjJ9Rc1X1InQGc+9JzgFb
 NQJdPoWk0nGsP85mJzVHbqL9cO4eHoKJdOPeW58ZNYCf4mIN3w54KBz6Hd2HkM5twhqu
 wDaaIB8dl9X6qTCKD9d59fcqWqIJTeAU250rH12VwDP5rWO5Q5WBxexSaFDygFQDr+6Y
 5dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vwXdIBomopEDPprR56Ctlx6vh3zeq57+JSb9smpjfGw=;
 b=mBrttXa5EVoaMXDfVSQJlvqNTV1CRXR49mASfdGbA5XvFJBvkatWhlP8XXPUHue/IM
 pQ0UAy7PIA5e3nwQavS+SAGMwQRf0PrvnDz6c0VgaUSxcBnFH95swHlD8z50qziN9YTF
 EEV0goI8mvKPs5F6jJYVfvFCcPFw0HgiLKh33t2vLJqtcBK6+MEQ8VKjhvftkNeiC2Nz
 Y28c+5163YJXst0r5WXC+MoptmNyck6SfzKbhzx6UFuxciRlABoBI8y4IgPfkb87fdfB
 Yh0pMYIFWLVDRs70h5owNPc5g9wGpNLyQ/xjpAn528Bc2cELZXUXONhji2e7gdY/9s8H
 X1Tw==
X-Gm-Message-State: AOAM533UQEkKa0CkKMDeN96Ko5XLRrSrHW/MFcHOOUaDGTxQp554JopT
 kiNkND5REn9HwZdmJYb7JHSak6u7egxlnMKYCeIUEQ==
X-Google-Smtp-Source: ABdhPJyfOLma+tSziR959R91oFvqeShKsJB4qrbzLJKO8qda7Z+cHCj97I10QN4UxeseRUf06B+JRB2CCBZy0i+F2so=
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr19694991ejb.250.1622400933785; 
 Sun, 30 May 2021 11:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210527142340.1352791-1-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 May 2021 19:55:05 +0100
Message-ID: <CAFEAcA_z0MrVN-=AMwN3YAYWE7ErgpcHZJ2xtohnk9FBVUTxQA@mail.gmail.com>
Subject: Re: [PULL 00/23] Vga 20210527 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 May 2021 at 15:25, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 2ab2dad01f6dc3667c0d53d2b1ba46b511031207:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/input-20210526-pull-request' into staging (2021-05-26 15:27:20 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20210527-pull-request
>
> for you to fetch changes up to bdd53f739273e97b5e5617b699d1763c42a5ea7e:
>
>   virtio-gpu: Update cursor data using blob (2021-05-27 12:07:37 +0200)
>
> ----------------------------------------------------------------
> virtio-gpu: add blob resource support.
> vhost-user-gpu: security fixes.
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

