Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFAE321D36
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:42:07 +0100 (CET)
Received: from localhost ([::1]:57328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEHe-0004oo-LN
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEEGN-0004CV-0k; Mon, 22 Feb 2021 11:40:47 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEEGL-0006tN-Am; Mon, 22 Feb 2021 11:40:46 -0500
Received: by mail-ej1-x633.google.com with SMTP id r17so4100228ejy.13;
 Mon, 22 Feb 2021 08:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wg8Vm/MfqymnrQbliZvdkMUIR0zVmKSsLr+jO7W9HOA=;
 b=HDBnt613d/J8h4JE8zdmBTdBKr8HrCKYZyaZzr0aa0947MMjXNbHJEgTNDerMxtAfT
 Or7M0Y0apI/l3Db24dUTHIku8TyhgZxh4C86iYEhT4aDbq1HXclcWmkaTuimR/pAfqaj
 8Z9L1/HW4NJ3zo6DLYT0UQw+HzazQDvGaIRM8B80YBJ1muzu2oMDZx2aPzrT4PkpVlcP
 FeARis4EFwAOifTMx+6sZzXf3ECx5Ly25SBSbmrO2eSUpgCssfiGqFWCVc+2UkH2Suzd
 Axb3/gR73yqc0yHsNda6M83f7/Ij0ZCKG9jp98uY6cF6gdjPhpZv6BFEuSzU3hsyWSgU
 G6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wg8Vm/MfqymnrQbliZvdkMUIR0zVmKSsLr+jO7W9HOA=;
 b=ArUAjXVXfxQCHO95dCNU65wysd2sTFl1TAPhVCSej8ovm1TYG7jUWG4ocbYNUm2O94
 7HRcqXrIMIr5oWDq5bpmqxcI15SG4iQEOBOE9t2yPHO/y+1H9uz12o/cHRCPdxENbsNj
 McRahlfT6XeAkQPaTT3Wx/UIchwMKBTn28ERwNaCxYH6Fqe17WZNl4JcMGvxTK0ef3mK
 Wnmn0lU160lH/21DdmjIkqqj1p+WkBHsP+jbnFwPpudwI/bum0qsvBY1zn7CHbCYRt/l
 9FAaPeG6o7QD2ebJ8D/KsFOdfloh7dif2BDZ3SkLMwQZjxc79Lcw9DRq1PP0Oqa6NrBQ
 3c5g==
X-Gm-Message-State: AOAM5339Ptoy6obI+YOajvb3ytqB9uAGxxwYsbwTNnpVwsfvWPNXj/Re
 NDrXoKU8hOgJFbNP3GC3Id8=
X-Google-Smtp-Source: ABdhPJwSE47imvqhGvubnugJymSoiXdPvpWmK6IsOJgWx6hmMyIxOpzIVFLzSorYT5zOMdjMTtB7Og==
X-Received: by 2002:a17:907:7893:: with SMTP id
 ku19mr14758410ejc.245.1614012043295; 
 Mon, 22 Feb 2021 08:40:43 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h12sm346406edb.70.2021.02.22.08.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 08:40:42 -0800 (PST)
Subject: Re: [PATCH v3 5/6] hw/pci-host: Add emulation of Marvell MV64361 PPC
 system controller
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1614007326.git.balaton@eik.bme.hu>
 <a18959c44349a5c5845e388a0e43a8bd04472b45.1614007326.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6881b4dd-d8dc-4b40-cd1b-5f3755add6d1@amsat.org>
Date: Mon, 22 Feb 2021 17:40:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a18959c44349a5c5845e388a0e43a8bd04472b45.1614007326.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 4:22 PM, BALATON Zoltan wrote:
> The Marvell Discovery II aka. MV64361 is a PowerPC system controller
> chip that is used on the pegasos2 PPC board. This adds emulation of it
> that models the device enough to boot guests on this board. The
> mv643xx.h header with register definitions is taken from Linux 4.15.10
> only fixing end of line white space errors and removing not needed
> parts, it's otherwise keeps Linux formatting.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/pci-host/Kconfig           |   3 +
>  hw/pci-host/meson.build       |   2 +
>  hw/pci-host/mv64361.c         | 966 ++++++++++++++++++++++++++++++++++
>  hw/pci-host/mv643xx.h         | 919 ++++++++++++++++++++++++++++++++
>  hw/pci-host/trace-events      |   6 +
>  include/hw/pci-host/mv64361.h |   8 +
>  include/hw/pci/pci_ids.h      |   1 +
>  7 files changed, 1905 insertions(+)
>  create mode 100644 hw/pci-host/mv64361.c
>  create mode 100644 hw/pci-host/mv643xx.h
>  create mode 100644 include/hw/pci-host/mv64361.h

Is this the datasheet for this controller?
ftp://ftp.freecalypso.org/PowerPC/support_ics/mv64360/datasheets/DS_64360_1_2.pdf.zip

It seems to have common parts with the GT64120.

