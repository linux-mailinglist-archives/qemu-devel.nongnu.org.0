Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F353EBA28
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 18:33:52 +0200 (CEST)
Received: from localhost ([::1]:57280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEa7z-0003fi-Mc
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 12:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEa6d-00025o-I7
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 12:32:27 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEa6c-0004K1-8w
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 12:32:27 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bq25so9273714ejb.11
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 09:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lAOzEvgxu71w7bvf0wXMlSQ8ipIFzgsGY7BgMhR+FJI=;
 b=KpRiK2QlK3bKv9Ejwo63nN5E9EbS0AxpNgQPj57Nazkc24RsPmckTdJUwaL/vnPjtL
 A7qaAbtlvE/qr9jBn1F3eXlmAbTYHnG2DnKMWf2N0YiV1jj0AO5Iu8R6uNzPqSgr4V4Q
 TzidoJ15QS8pimD9nzhDzynxTsCOMVRTQZfTUER58cosOw4zu3D4RGA7uCBGkVtPWDJy
 yGo06jJ2qArRwQLEG5NM0YST30Tx4UQ+IwC6uQoLHpOsqfIJ/yhuaTteFb2DMsvunsft
 u+mGvzksiv2m9Z5kNIYZueqeI2OVFEMJ8Qe7nyJ2e/fzMsD15qA0ct9h1wV41MsDj/W8
 GVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lAOzEvgxu71w7bvf0wXMlSQ8ipIFzgsGY7BgMhR+FJI=;
 b=SRAxT6kt+RLe0oIN16WYp147uSkkv//TBC1IhUubcjGPc5obd/3naTLtE6N8cUM4FO
 /RiJ2WPcrGsQKKbIDIP+Dwx3RI4z4pov8Wu57H5h5Fk2G4FEUEHeOViYGdY/R8FL+Ow8
 JCXL+CWiRy9Ov8dS/JKLPAwDUVaa/eHxi5mEtqMlV9sIBi3pp0cWBS0A3C/VzN7C7WRE
 I1XVF4hZCVLhu7KviLFkWiEvO+owa6/qO7mM7Y6UiweKIwshx7ALfgM0zXvfmHdYRBqG
 6aVMthKGpzUDeW0LjsW8ogi3DKg/yweL+ZrL+67l+F/b39J6UeMzo699nL4semk62Mei
 ksTw==
X-Gm-Message-State: AOAM533owEib0qnfzTyZZSGRoNcixUpKmGv8bVOdEYOHgzNGWJcWbnEU
 68SIGwaWePVHtlsLhJtrHo8QnPoOvu4SFDk8yq1b0Z78/TA=
X-Google-Smtp-Source: ABdhPJz+9SlBqihBI3AvDFVJZs1TA4n7Sd/hphwcAbYz5K8KNe/r+PyLcF5qctuaszFwyO3RuXbtHsE4duPUmENFnO4=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr3311531ejf.482.1628872344432; 
 Fri, 13 Aug 2021 09:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210810160318.87376-1-linux@roeck-us.net>
In-Reply-To: <20210810160318.87376-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 17:31:39 +0100
Message-ID: <CAFEAcA82g0w37F9tK7HY8Xq=aLzWkqXErZDk7mu1bSmVncv3Sw@mail.gmail.com>
Subject: Re: [PATCH v2] fsl-imx6ul: Instantiate SAI1/2/3 and ASRC as
 unimplemented devices
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 17:03, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Instantiate SAI1/2/3 and ASRC as unimplemented devices to avoid random
> Linux kernel crashes, such as



Applied to target-arm.next for 6.2 with the ^Ms cleaned up, thanks.

-- PMM

