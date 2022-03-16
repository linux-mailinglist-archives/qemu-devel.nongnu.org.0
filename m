Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9C4DAFE2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:40:15 +0100 (CET)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSwn-0006oo-Sz
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:40:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUScj-0004oD-Qq
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:19:30 -0400
Received: from [2607:f8b0:4864:20::b2e] (port=41951
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUScg-0008IZ-5T
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:19:27 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id l2so4035347ybe.8
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fB/wCIIlPhELd5fSOlCt3F/awcKxWp+VguF4uxywYBE=;
 b=hxmYo9IjOeZAtdhjvf/ebr6g8ZOVIh8fnxgdS2o13v6682v2p6meSei/AstR8W6Zwd
 uL/d71qLV8+suentfpCkDX1lYjoQubp8D2ieHjY4XBt9IMd3UjMZ6HFiLHA2mfZjApUg
 6LUrwO6+QZRAd/QJroKtOyRFRNloWIfJ5NxSg169cteFu9R7I/W7Z2j9Gd1DLqSVakL2
 abrTYETQA3FZp1xsRWGJV4PXyyLql6iuUThIKHtarSZwDww3BZJv2OjnhApBPuV+2Saa
 c+dVIE6nE/XwEIGxQsXyCV33iShjF3YrfWqtDL28R02YF4Unc4LP5Uje8ySez9bNTJ7I
 RZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fB/wCIIlPhELd5fSOlCt3F/awcKxWp+VguF4uxywYBE=;
 b=iHlhPKOMNNP3mG9tQ9YI0lmMWwjPFn8ZFL2B3hlGhex67YrSyY/0Dun1XLmGtST6kg
 kY/uWiXU1/NPeQnhtCIU+usWZvSjx8JUKWl0bi/qTyO564H0Vc9CB+k11/EWi0WHIlxY
 eNfi6urDxjCGhC4qiT81BAuqYxUH1XH9Vti5Q8szi8b2FQWQkEMd+SpR5vEYOHEnH57b
 D3hC1X5NGF+nFQyAbZ6Fhaj/aPQyjqX3e37QEUj4LpJtJ71ZCGyuswJweZ4YT0Ihuqj2
 VQClZJyE+oQexd7z/bc87qNE+HsYEQotcuqUdQzi3IVm8pcGNPnRQylvJUGmR3+Zlgdx
 /MfQ==
X-Gm-Message-State: AOAM533vSvn9g/oT8fqoBC0XExBQYzuUb2bUdNgDiRsqvqGORuNWBHee
 ZPMiTQe9EBF0mm9l0bWUl2iuEG9VfinW2epjbRCYYw==
X-Google-Smtp-Source: ABdhPJwRFYZZjLR29cEoMpkm3yC5gDtlpOYI1QRuNRQaP64wibcckGBIpH4InNVvTvnHFey1zKdbQBD4uBrVJVkn+uI=
X-Received: by 2002:a25:bf8b:0:b0:633:8a66:c4cd with SMTP id
 l11-20020a25bf8b000000b006338a66c4cdmr3525605ybk.85.1647433162222; Wed, 16
 Mar 2022 05:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220316081418.1090247-1-thuth@redhat.com>
In-Reply-To: <20220316081418.1090247-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2022 12:19:10 +0000
Message-ID: <CAFEAcA8yOf99mBOCjbbRRyES9vjice=jM=XddzyRyuZkaG_Vfg@mail.gmail.com>
Subject: Re: [PULL v2 0/7] s390x and misc fixes
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 at 08:14, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit d6f229f9a0592c4d5beb0a5c4e024231c27680d3:
>
>   Update version for v7.0.0-rc0 release (2022-03-15 23:07:40 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-15v2
>
> for you to fetch changes up to 377bf6f37da11d14641a0e973c4ed272259cca9c:
>
>   softmmu: List CPU types again (2022-03-16 08:43:10 +0100)
>
> ----------------------------------------------------------------
> * Fixes for s390x branch instruction emulation
> * Fixes for the tests/avocado/boot_linux.py:BootLinuxS390X test
> * Re-enable the "-cpu help" output
>
> v2: Dropped the update to meson 0.61.3
>
> Note: The "Test BRASL ..." patch triggers a warning from checkpatch,
>       but this can be ignored (I think the "extern"s are fine in this case)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

