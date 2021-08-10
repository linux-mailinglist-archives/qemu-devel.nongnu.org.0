Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704F93E7CA7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:44:13 +0200 (CEST)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTvI-0001AV-9T
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDTuV-0000TM-F9
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:43:23 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDTuT-0002WZ-U8
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:43:23 -0400
Received: by mail-ej1-x631.google.com with SMTP id h9so15444942ejs.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NoVJEjgWw4qAV8i90T6alM+c9h27dvYKxlKyZEzmMI0=;
 b=DBfmKR33iAmDPAmZVeMnQLx492TvC2W6+QkcnAWWPodPj37k/m67UuJCrsZOyvr8jV
 5iDJ/was1olnXl4qEfap8m2BgCxu121CQDQoth0aiJSN0CbO3YLs1WVq/aKjTixQnHAP
 /jPISC/r46VFrBAiv6vULMFVp61VkAoRFeq3+kVHWwux0k/wBARdPgnMyutbsysEzmdN
 27PhzGY09rRoOMZDqllql0EZezLwBKBoLF0kryjEwPRN3ve1wiK7O0sZPRSutlNw0/6Y
 1i5LVQimu/jL+bNEJKW3+3mkWt9DAWn1NcL4rY9QKo2AYYBk2JCtYL4kMHA/hbeN3Ysh
 KhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NoVJEjgWw4qAV8i90T6alM+c9h27dvYKxlKyZEzmMI0=;
 b=TA8F+3l58O5MsFYM8UIHmIO9cSNiDX9zxGQW+vpg0lZSgm0W0JbJ83WjLTisSf/ClY
 IZefwgSLCp3UERQpETqYj7BrkxBZqQnDRQ4Qd8n//G7NxNcNL3pyb9mOEdfti8iHhCVj
 AKMi/YvMAFYfnfgiOmcs2aYAMoTJr1UF0ud8bYb0eccW0Tu8ch94HROduyqK/Hc+Qlq4
 Jt49aN/wV3qJyhD1iU0+XDE4QLvpMR9+hnE3KrYahkxhEu8374jZ1YsKyJDTQoEiz21r
 97AJyL+G2ockPSl+HSyFVnmpeUQEGPO4qXRoRsG/8g3z0ASbpSLYw3NzaEUyatqdN9mZ
 XU8A==
X-Gm-Message-State: AOAM530wLzt7ze1pAD5QTUBY310SEvL6RkkGsVmwTAJsqUZOE4BVYT7K
 MWvWU4HnaFue/i2pRsOmTLihXLUlWUqD7iHvAJg8Rw==
X-Google-Smtp-Source: ABdhPJxH0HjlvBe7OMp0vWEELSRGBdVz0Zr4diUti8f8TQUQqU7yc7qzoKmQRdX4mg6Rq51U+cP7tR7NxtWBkm2lk48=
X-Received: by 2002:a17:906:4808:: with SMTP id
 w8mr9639526ejq.56.1628610200354; 
 Tue, 10 Aug 2021 08:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210810140411.173369-1-hreitz@redhat.com>
In-Reply-To: <20210810140411.173369-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Aug 2021 16:42:35 +0100
Message-ID: <CAFEAcA8+b5Yy_ou4EMCi6ba0c-Q-pDgpfw3UKrbezSidMCy9dA@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Name and email address change
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 15:06, Hanna Reitz <hreitz@redhat.com> wrote:
>
> I have changed my name and email address.  Update the MAINTAINERS file
> to match, and .mailmap in case anyone wants to send me an email because
> of some past commit I authored.  (As suggested by Philippe, I put the
> .mailmap line into the "preferred name forms" section, considering it
> counts as a git author config change.)
>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> v2: .mailmap update
> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied to master, thanks.

-- PMM

