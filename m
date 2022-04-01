Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2483A4EEAA3
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:44:41 +0200 (CEST)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDpg-0002ME-8c
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:44:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naDcr-0005Qg-8N
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:31:25 -0400
Received: from [2607:f8b0:4864:20::b2c] (port=42823
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naDcp-0000Qf-NF
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:31:24 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id u103so3945796ybi.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7cMzgF/6VY1AaUNdGw5W4kIx23KK9AypHqdt+bVocP4=;
 b=DEO0gCQ/UPBSPpz5UjekmyZuPbccY6I8klQsp8QbCz45cF7+Yt6yFSa0ekauskvXeu
 EVbqLE0SgdXiEoDFtHzOkQHSOsrHn1gXR1sbgBW2AXRyxMBzp63KOyqqUh6/XGNGtDEh
 0H7oJ74sGj162ypmt6yiYIh41pREkYoQ8GD0FN2fnz7MSHiavxZHrqp7gtz+uciDx5fN
 xaB4qwvVqq6z02wxPhOo9xlEIi6LfW/3Z7ESTqmQsdeY3rV0Xc+8TQSuDW2sy9YQFa3h
 RDdFB739gEOCpQHfby9NMeGIkhi27E0hbJ+3NNpUZ29eEOusN1wSkJG8lLwdNO78q9Al
 CT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7cMzgF/6VY1AaUNdGw5W4kIx23KK9AypHqdt+bVocP4=;
 b=U1NvftZlXun5mJ03DvDhOlCbHMKD2sEZJxP7aE2+kUItXjNsycUzpzmw5KdmEWB5vy
 ml3tulVvh81P57i3ljuxN4f75Mxh37+K1kGhyV2WVGb62uez7yndHA4sDqpIpgmmbBDg
 ZspMtL/1UAogFpxaK2EpnuhOunDH5KUvQLntUBAEK6D3TALNJI62FAx17wSC75kufnpc
 a7KsjCHdDE81Y/hJc3ib1bwrBZp7mzLj3z6+uGM8xm3kqDqAPFspq7wzkzhAdAFLvDoJ
 JAdVi4AsUKTbQ+JB6hetU98Hvv58R+lkPRDJrlUmtQ13xC08prtdzD+cQfnDr6NUsaI5
 NL0A==
X-Gm-Message-State: AOAM53156aYLaAPfDHOJkvOK1bQCaVPPIfPewzNuC0n6WFkOPsDYZzKX
 TYPmkS3Bxm+z/AU9bSTJeAXjzOjxBSzW/xvgSw+ccw==
X-Google-Smtp-Source: ABdhPJxoH+URLL5H1TDU+YjapoQ/vxExJKyOh011ftAWMTag88CQ7Nuu9cVVo2tLWQDth939zQOYj4OyIEPc2EE5gJA=
X-Received: by 2002:a05:6902:1147:b0:634:6e83:70b4 with SMTP id
 p7-20020a056902114700b006346e8370b4mr8164777ybu.85.1648805482589; Fri, 01 Apr
 2022 02:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-2-zongyuan.li@smartx.com>
In-Reply-To: <20220324181557.203805-2-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 10:31:11 +0100
Message-ID: <CAFEAcA-t5kzTRYYKqL9G0y3YkGQnFEQcs_euWhLkzND3chKUAQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: "open list:Real View" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 18:16, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/realview.c | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

