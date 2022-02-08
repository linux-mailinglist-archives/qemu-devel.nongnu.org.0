Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF064AD82B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:10:34 +0100 (CET)
Received: from localhost ([::1]:50772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPKL-0005k6-81
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:10:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOkm-0001aj-Is
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:33:49 -0500
Received: from [2a00:1450:4864:20::433] (port=33314
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOkl-0001Do-6f
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:33:48 -0500
Received: by mail-wr1-x433.google.com with SMTP id e3so16196827wra.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CIO8F7X9JmFtorrLT2WemfQDZFyFq2yBaAYv+ab87g4=;
 b=f+vO04MKLTkIst694HB/5XneV+siJ3m6JtNsS4Ao3dYcc6/GRkzQEHrLO++iulkH+m
 mpq7vOZN4tm/ZldyHoWj23YQqfeeNsyDttqO6R6vzGM8BHYrnUIoeEm8duIgQ1qweaSP
 rYhgUerf0M9NAa2dRoq8Z6qYv2RO3FXXWu9TJa8wAJ7Y6sGUX6unieA4lY9QhRhnC7Vm
 uyDxJ0OQRbiwv1nC8pd7YKIBweNSIebzy3TAvaqYpDCHBKVFagJV8f201pJrd2s7GZ3z
 2KcXYfGRMcwESCSofJ/oeNXwMtR7UB0sd3SKT/Mh050DypuBAlgbv7nqwLBepqh3l770
 jlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CIO8F7X9JmFtorrLT2WemfQDZFyFq2yBaAYv+ab87g4=;
 b=TRaPnGZXqo1om4nXrxvw5MX3Wn9nifM9wzdkg11lO4Q+jHB4rXwp/deGjnpIFdfULo
 0SiGajUhbMpNNyjtlrj4TiEuIbliKDyLcB41y9J9sEdt43c0LE2AC4qchYsSVn+Eb4JM
 YPbDd+uCUl26A51CYLmayurctxdsiDnY3wCxf2nscL4+kj7gKeBvzrwPhZZEL31ubVWC
 /vPeHfg1T88Nj8JOSeb7+4Tg3wbyoF6XEvQ/sSsOVHzO6/M0hTw2zw+KxUfx9EMqAbiV
 yK43mQuHJPePEDtMxI5Lgmz/2CrfPa8K4QH+g8QMcAksYYzMHsU/WGhLsrBAPRZZzIHV
 Z/oA==
X-Gm-Message-State: AOAM530lPT8ZM5nBETATSbv+ovkLa8W4tXWr5fNDYiv9FbFL7DG9hD7f
 qXqGUeP0LTk7+R68XF6SOdle30WXl68RwfMC2uzgag==
X-Google-Smtp-Source: ABdhPJwSzipvLZsXtHLz2qNFMAmU8ymBnebH6F63zSXQ8ONWN36kIFF+eFmHLoATK7T7GBSlwGfxED4uRzX0GYbfAgU=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr3104864wrs.295.1644320025779; 
 Tue, 08 Feb 2022 03:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-6-thuth@redhat.com>
 <CAFEAcA_xMXYyMvaC8B=x1N7wX-=8y1XMTJouJvetqFYX87z1dQ@mail.gmail.com>
 <63b891db-ce52-6c57-5c24-723be29df770@redhat.com>
In-Reply-To: <63b891db-ce52-6c57-5c24-723be29df770@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 11:33:34 +0000
Message-ID: <CAFEAcA_VRR9xEtR9Ox6m=d1sbPAgoNok47WxLWf=W1SqhYPAUA@mail.gmail.com>
Subject: Re: [PATCH 5/6] tests: Do not treat the iotests as separate meson
 test target anymore
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 11:16, Thomas Huth <thuth@redhat.com> wrote:
>
> On 08/02/2022 11.26, Peter Maydell wrote:
> > What is the mechanism for this in the new meson setup ?
>
> cat meson-logs/testlog.txt
>
> ... I guess we should either dump that to stdout

Yes, it needs to actually appear in the stdout for CI jobs,
otherwise it is inaccessible and might as well not exist.
V=1 is the switch we have for "be verbose", and meson's
test facility should honour it.

thanks
-- PMM

