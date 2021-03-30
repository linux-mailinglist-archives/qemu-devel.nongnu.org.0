Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894FF34ECB2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 17:37:04 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGQR-0001Wr-Dj
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 11:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRGOb-0000Sx-4z
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:35:09 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRGOZ-0006XX-Cc
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:35:08 -0400
Received: by mail-ej1-x62a.google.com with SMTP id kt15so25447316ejb.12
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SNE4lw2TleC/D6wyTUGeG0Yc2uCpf+dsZxnp+QfAjrA=;
 b=FupDSSNgN1/rKF+xzm2eRcO162L3lgMcSmUf3JyKaUcCi6M02V1Jju4OvJrCQ3pmVG
 FCFYpXQFxeFZHa3fSLQYgUWsKD1DH4VU1DC5/0+KkXmIXKNk8+gSVsHYI/4lYxiGjGMi
 AuikRDsRHYJzjESjKIDhRfdNSJelUq+cQg34EgOSAIE1CWj4peRqa4aZbTA3hXmukBpt
 SVMFYPume4ImYhiiZ7OSA6ZJKLQ6K0NZPj4hKHAfEZ0TcktT9oyWF8LAmSP4ZNtR76zh
 7rGmQbenWEZJ8uItVaXjjQGcS5eDUjmswKsLecjBTyMzwMF8Wx0iL2JeFxwpSzKK9/jG
 fAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SNE4lw2TleC/D6wyTUGeG0Yc2uCpf+dsZxnp+QfAjrA=;
 b=ay894affKd5nNGXhKyuQnk4+TLjd3gabhGX3k3Z1UK8efiGiuCzIGq072NoPfS87sp
 +chNZnoJ9crgWl4wSoXDE1j98OB50gEchdc57KayY8h+2x6gle9TSQJyOsUcJfymTqYt
 J2TdaLCUuTuRSMkmzAYnE512hkTUq9gqkbemush5faZoR/psjMaRykQ87OeO7hwOcoKY
 zfluDtiPiNwQtLwu+xhB5PcfoVuC9TYwBnj0/UuLjSxXYAL5qwyQeNlP7OmsMmvevbxM
 hSJmsV0C9kmZGV3e8NhAm1gvzzrKP+cRsaU/4khxVA0aYCibVYMrXmSW2TSz0vfEIyLY
 B+Kg==
X-Gm-Message-State: AOAM5315TFUuBNX/Kz3bRoh5MfU7tkm9dzG8K+f2lbNbC08Emm8wBC5T
 Cq2B16wsjNdLZDBm1nVqzNXCYBRTW7c76Grd0YWOBg==
X-Google-Smtp-Source: ABdhPJyFasMc0XQ/l58HS0ebvkDV4ueRJy7xA7i94JS32XrkgJBtnTIBDPGoOAVsLjLqxd6XzEdR5JIBIImoKGry1I0=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr33549029ejc.407.1617118505449; 
 Tue, 30 Mar 2021 08:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210330123957.826170-1-mreitz@redhat.com>
In-Reply-To: <20210330123957.826170-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Mar 2021 15:34:33 +0000
Message-ID: <CAFEAcA8sRo00Q991439wp-LBON32iZE1aQmw6R6n-9wwDbXqGA@mail.gmail.com>
Subject: Re: [PULL 0/9] Block patches for 6.0-rc1
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Mar 2021 at 13:40, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit ec2e6e016d24bd429792d08cf607e4c5350dcdaa:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-28 19:49:57 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2021-03-30
>
> for you to fetch changes up to 2ec7e8a94668efccf7f45634584cfa19a83fc553:
>
>   iotests/244: Test preallocation for data-file-raw (2021-03-30 13:02:11 +0200)
>
> ----------------------------------------------------------------
> Block patches for 6.0-rc1:
> - Mark the qcow2 cache clean timer as external to fix record/replay
> - Fix the mirror filter node's permissions so that an external process
>   cannot grab an image while it is used as the mirror source
> - Add documentation about FUSE exports to the storage daemon
> - When creating a qcow2 image with the data-file-raw option, all
>   metadata structures should be preallocated
> - iotest fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

