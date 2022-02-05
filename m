Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303F4AA832
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 11:52:05 +0100 (CET)
Received: from localhost ([::1]:33750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGIfk-0007SU-Kd
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 05:52:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGIdb-0006JD-8o
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 05:49:51 -0500
Received: from [2a00:1450:4864:20::32b] (port=46709
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGIdY-0005kl-NZ
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 05:49:50 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so4729577wml.5
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q3fB87e8ptoMGCHMMhkF/FpCfggnOF2P0vTU3MsPp9M=;
 b=BWrZV6JuJq68EHiCt3QVrNvnKjsRTE4UHFRtpEMlu4RHteqOt49ncBa97l5W5bVhNy
 vm86UVEsKGeHHdVavuJN3ycslO96TEJV5iYB6g8RhoDBlt7UsZ8VwldDNKn+hyr+bJZd
 LAzLQ8uIRGNW0a+WTOQbwqdNXlskvdLBcr1razrnmjD/uV3cYki0V/Kl5hQJzM4tivab
 KeFMOQp2LmTpRjNrkKwfTKlafipDBA2VvM/TZaLy0AC7o68LRgfgF2w6+vfBQRA2p6Ia
 5W2brsGA3xfM9j4GwhtQPZEvEYusu61e1+3+IOeijDjdZ/b7n+vqjD1bTOP7jdcBLE7U
 Cx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q3fB87e8ptoMGCHMMhkF/FpCfggnOF2P0vTU3MsPp9M=;
 b=v5hBH5qDdgatZJLC/h1+lUCX8A7W4aKIHLQl4ztLpkRFfv1kJ9lT470d8GZX9cThCR
 eijJYlqe/V2tlSI8za/mHMkUE4quoIWvlhfbAZ+cPM+TwkbfIwZfP27GC3dLP81iq4Af
 yZ4Zxe6Taz3kv/7qRse67o0qtNW4i87VcfZMMoifyCSjxvDP3EpIoQ+zTP5mLZBLZ4se
 v18mp8M+JwbBZHuE6JGAoxIPd+iy/VmMHllNpk4xUuCU4Twt2UwYkqIY4NS3GwSdAA4a
 5nUeFOHngebVQO2Ft+Vb/iq7/dfOX3vuD951aOusw8dz/TxYtWLnXeCwPxTrJ6oWcPe9
 rtFA==
X-Gm-Message-State: AOAM530VFYV9wr5LjDNl0fWUl+rhwYQJZAaWpvhEVZW5g1GfFH9lm4Co
 OFT7flzWbBW3kZa3olVnvmyoMoo1o9SiQd+Cya2NXA==
X-Google-Smtp-Source: ABdhPJywPIvhFkTifjqfEFlvXHMYFxHhLC6j/oCFPa9GYfAs7AeD6Jw4JoiTuE1EiTBFfAQKa3w2GOEQOOwBoG8/g+8=
X-Received: by 2002:a05:600c:2d05:: with SMTP id
 x5mr823576wmf.133.1644058186953; 
 Sat, 05 Feb 2022 02:49:46 -0800 (PST)
MIME-Version: 1.0
References: <164392758602.1683127.4327439310436541025.stgit@omen>
In-Reply-To: <164392758602.1683127.4327439310436541025.stgit@omen>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Feb 2022 10:49:35 +0000
Message-ID: <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
Subject: Re: [PULL 0/2] VFIO fixes 2022-02-03
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eric Auger <eric.auger@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 22:38, Alex Williamson <alex.williamson@redhat.com> w=
rote:
>
> The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b35=
9f:
>
>   Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-re=
quest' into staging (2022-02-02 19:54:30 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20220203.0
>
> for you to fetch changes up to 36fe5d5836c8d5d928ef6d34e999d6991a2f732e:
>
>   hw/vfio/common: Silence ram device offset alignment error traces (2022-=
02-03 15:05:05 -0700)
>
> ----------------------------------------------------------------
> VFIO fixes 2022-02-03
>
>  * Fix alignment warnings when using TPM CRB with vfio-pci devices
>    (Eric Auger & Philippe Mathieu-Daud=C3=A9)

Hi; this has a format-string issue that means it doesn't build
on 32-bit systems:

https://gitlab.com/qemu-project/qemu/-/jobs/2057116569

../hw/vfio/common.c: In function 'vfio_listener_region_add':
../hw/vfio/common.c:893:26: error: format '%llx' expects argument of
type 'long long unsigned int', but argument 6 has type 'intptr_t' {aka
'int'} [-Werror=3Dformat=3D]
error_report("%s received unaligned region %s iova=3D0x%"PRIx64
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../hw/vfio/common.c:899:26:
qemu_real_host_page_mask);
~~~~~~~~~~~~~~~~~~~~~~~~

For intptr_t you want PRIxPTR.

thanks
-- PMM

