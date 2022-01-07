Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB5487A25
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 17:11:12 +0100 (CET)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rpf-0000om-7E
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 11:11:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5rgV-0008M9-F5
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:01:43 -0500
Received: from [2a00:1450:4864:20::42d] (port=43651
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5rgG-00005n-U2
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:01:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o3so11864486wrh.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 08:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YNZqSV7L8mwkpOxrKpsXfbTaQM6MC67Npt1FKUxdoCk=;
 b=A9Muwutoeey8MdBe1YkfOhvLLrzoh43tPqSnhVz1uUb6bH8qfjLgl2wsahgHIkeOYV
 DeFvXhI+2z0QGWZahJ4iDubiuo8RWZRdZ2oKJlpnLBFBkEE7WOfKpnrRl1hz+6XO0hak
 ZXx2t9R3DXXHzolSJOIfA3wah9pNJozypMhAzCvOG3FGJ1TzKC+ANremT2qHcmObURW+
 IJkypnxFOM09f+kK/Ozx8bbsyEwIgN1XZ2jhI3QNH7OgvPxpSOjkMPStqsuvLm7KpOSm
 +q0/qWKJA9V1yKr3U8daUZ4VltO3gRtzQLsA2Z/DAreoH+Xn8BkPzX4qCFET7pmaSh1P
 bJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YNZqSV7L8mwkpOxrKpsXfbTaQM6MC67Npt1FKUxdoCk=;
 b=iZuUWHylYssLdjSOrwkV+ciTyu5gC37y22SBLNdusVKEw/+zJ1Y69ZEh6ttpq7Olh3
 9Tr9yGOLYCUxW86mKR3YtoZM4lQnY/9BNSP52HFpPTSkotnzmu9y2sQ6XwEuGlckB2Pd
 TQR5rkwg4c7FwK37Q6FtT4Danwxpqd1gkr7OFzcffONdehdDjKS9cFmmNOdFl0zLfavA
 A3MTe3RyhlnkTBDgDLj55ue7tZ4pb5v+XKxTI0r30ng3+/GjP8qMfVDhe/4DIOb1naZJ
 0OhdDONHbl0QxHQ/IIJJ3/+BMZGzeXRoYE5YSTph1HSLuqc4d085R6pKA/Kj7zQJV2w5
 GSxA==
X-Gm-Message-State: AOAM532ProvDcagpK+MFscXL4Sbszom0ySI7qvOo3BPo5+5JSEqm3Tml
 n/UmhgL9+ga85duI5xPVpFfyEkmIEaHYGTJKDhpHrA==
X-Google-Smtp-Source: ABdhPJzT6CS71JtZq97ClXbqjZCxNJFyMRjKG9ohR5DSikCnC0uADOb6EeZ3QRkJ+CCEzNbzC7vQZK7+OGVHnVs51G4=
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr56948034wrx.2.1641571280231; 
 Fri, 07 Jan 2022 08:01:20 -0800 (PST)
MIME-Version: 1.0
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
 <20211214110354.21816-8-francisco.iglesias@xilinx.com>
In-Reply-To: <20211214110354.21816-8-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 16:01:09 +0000
Message-ID: <CAFEAcA-XVR9aXvYyN4qNREyW1mKVN7q8fv2WXjCo-B=RgWKhTg@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] hw/ssi: Add a model of Xilinx Versal's OSPI
 flash memory controller
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Dec 2021 at 11:04, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Add a model of Xilinx Versal's OSPI flash memory controller.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

