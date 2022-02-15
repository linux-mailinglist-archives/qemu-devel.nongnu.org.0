Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79374B7A7F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:35:12 +0100 (CET)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6Pf-0004Hg-S3
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:35:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK66J-0006gc-6g
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:15:11 -0500
Received: from [2a00:1450:4864:20::42a] (port=35715
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK66H-0007dO-Ng
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:15:10 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v12so384800wrv.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 14:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=73ERh/2jSItukooRHfcvS8fwW4uA/1jedT0jBkNKpRE=;
 b=Dp1YyQO5c0ggZ5qWeROx+zTzauce6AHnPgkVBfrNvp5kGBcYC48xUHP4mKNIoIBtIl
 IL3QR3vRmjjxgR3XbIBFSwI/+r12dKgxRpHhAe/ekw7CVtcUTGDXBWhIJw+/31NDb2tP
 oQHTsl5pPAtr+hrg1/2TWZdttwBz833L47HzInzmNE5Z+tdXIwFNA1k4NZzLJdRQRX3g
 TS+QIRtJGjSXf/39vsnRYjWBHSIlX7MbqkfHiy3+dnr0/O4DIT6qP3S01GIB3Iwwc1mO
 AcAmgvE+HDTQ3Nqy++/65GEyw35fBzmOIi0fxNLESMNUFvjJKbYrKM1cVrQvYLErm5Hq
 4qeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=73ERh/2jSItukooRHfcvS8fwW4uA/1jedT0jBkNKpRE=;
 b=FbVpQn0HPSj4qtmQFPp2xluVXHzGNMy4cr5Xgr3kXjDDbp77TY4p2onbzQCu1wk3Wo
 AXB7YJlStRTnMCtlfTS3tDKzZZcOBH/AADFxXA1V7w0LBRW/E7zQ4mT0i90rwUsbZx2N
 plNpjsbpt9vn2k1ME2CbComZ+elMon3WA6kHLePA7qisPgni+lKroFYpm3pg5Al28xxw
 5GQ0m5W0sYr4w4QUdf7CYO/3TW1A5JAqnEc/l9hJw/Ws6ILGtxPbPDIGgWlDDgLZ2P2w
 Uv0atlhBkPOislxqUttTQYOR+1NQeVo9x689LQC1IWM01rqhhU4MrZLC/pOeXYIX3rgT
 WMmw==
X-Gm-Message-State: AOAM533VlIoYSOoK7HUf2zXMl+1fOhB6u42JtdLfzAhKSHrqqrbXA1Vc
 Zz262TkSENVew7xXsXKCb72bg8xPa1qneC2Fz1L2lQ==
X-Google-Smtp-Source: ABdhPJyEHaisn6WBC8O3QHG+LMgvQTyt1bj+nv3dDBKkWzkWGfzoroZ5MkwyHac9/p3RmHh0N6VNUydbGyHSjGzEQaE=
X-Received: by 2002:adf:d20e:0:b0:1e4:a0a0:9da2 with SMTP id
 j14-20020adfd20e000000b001e4a0a09da2mr30584wrh.319.1644963308365; Tue, 15 Feb
 2022 14:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-13-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:14:57 +0000
Message-ID: <CAFEAcA_Cuyq-Rtkf46a3z2Y_Jwd_qW_7zcZ0ybG-8sFf+X1qqQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] target/arm: Introduce tlbi_aa64_get_range
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Merge tlbi_aa64_range_get_length and tlbi_aa64_range_get_base,
> returning a structure containing both results.  Pass in the
> ARMMMUIdx, rather than the digested two_ranges boolean.
>
> This is in preparation for FEAT_LPA2, where the interpretation
> of 'value' depends on the effective value of DS for the regime.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

