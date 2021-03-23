Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DC2346D4A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:39:26 +0100 (CET)
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpgL-0008TW-OA
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOpW7-0002NI-Cd
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:28:52 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOpW2-0008UQ-MC
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:28:51 -0400
Received: by mail-ej1-x62d.google.com with SMTP id hq27so29687966ejc.9
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 15:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=72dsLOFmNS9jPZElrSp5rz4XX7CBzdQuuw+rka/9u5E=;
 b=kqCDhgCFw0WGc+O4X3RSS5uXh9CrW2nkSGSpmgNN5ZaArsJD0ybYYShVzdXQP1J+u6
 xqb7OoUKIcHjgrJBo8GYwcWrigRSo4cuJ7HIVYeD6GsO5Q0QYPgqlO7H74/Jpi+G+g6P
 eJOA5G5XWQcD2TQgUWCo3vRJN1GmYvOZM10Oy+ZiU1zrZojYiFu7W4mYJ1L6dyMur7kR
 gwyi5Hh8YRkd/kakCW/8BuCAqpDmpcqI8rpyidyYsBqSKPv9ObA9Vf2BMPiKwdp3nsAK
 f7xujBt+5CN8hpDUn+dLTR3aiQ3XUtjbu3ULAjNMttJE7IRmQR7G3EGmdikVqiHQFqeD
 sokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=72dsLOFmNS9jPZElrSp5rz4XX7CBzdQuuw+rka/9u5E=;
 b=FTB15f4bIJ1Cltow4M2zCUh/NkuHIAoT1cRP2js6F1X5xM+5UNKw9ShGvyFd7Fe4mx
 Wu/mH6lYVj/v9NAfRmMzXA+CqCqRJ1KJOqeNjMsdVJfIz9tD8Zzem6h1HrYtdkv+4zNq
 AfvtuweAOER+vz9T7nQktYVmTnASA10KG8j1knWYxtGTKxI3MRgYrKvx8iERPd/QOeB0
 eGt4gW1a5ZQfM3JojqoQkRgmJhrbdZbZ4U/UFxFL9AvTCrzOV9Grp3Z3ZCRf4hPiF3jy
 OK9JjejDQxNbJpB/H2nNyOvTEZAkOUlDZ5x88BvPVk/I0nnb2CPoL2seRkim+qHWwnZM
 hqKQ==
X-Gm-Message-State: AOAM532lE1HWEBMiBAnh29oIZQJv6qDSDqVjqSiPO/kFGwgeXBETnxeG
 QnTYlqV2YYA6OE5MwjsmKdvzLMdNIP442IH4QqKhTrMaeLNi3A==
X-Google-Smtp-Source: ABdhPJyG3eRpb/3GwVTKDB2vukxz/JlA1i2ct4NgkUMaZdVlwO9KOyowHulnw1i8HIDzJzQs0Z1+ejftpipMuiOI/Hc=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr425168ejg.482.1616538524579; 
 Tue, 23 Mar 2021 15:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210323142653.3538-1-peter.maydell@linaro.org>
In-Reply-To: <20210323142653.3538-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 22:28:15 +0000
Message-ID: <CAFEAcA_n5aKD5-7k3RwZYJqp1=Sj1fWzAP_3r3qPOZiVJ85TNg@mail.gmail.com>
Subject: Re: [PULL 0/7] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 at 14:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Small pullreq with some bug fixes to go into rc1.
>
> -- PMM
>
> The following changes since commit 5ca634afcf83215a9a54ca6e66032325b5ffb5f6:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210322' into staging (2021-03-22 18:50:25 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210323
>
> for you to fetch changes up to dad90de78e9e9d47cefcbcd30115706b98e6ec87:
>
>   target/arm: Set ARMMMUFaultInfo.level in user-only arm_cpu_tlb_fill (2021-03-23 14:07:55 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/arm/virt: Disable pl011 clock migration if needed
>  * target/arm: Make M-profile VTOR loads on reset handle memory aliasing
>  * target/arm: Set ARMMMUFaultInfo.level in user-only arm_cpu_tlb_fill
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

