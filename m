Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D031CC02
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:35:02 +0100 (CET)
Received: from localhost ([::1]:38410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1RN-00021s-Mu
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1Pk-0000m1-2e
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:33:20 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1Pc-0002j0-Mc
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:33:19 -0500
Received: by mail-ed1-x52c.google.com with SMTP id r17so5825712edy.10
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rCtlas9S5tZJybDXLJFNv32Kg8+xEWOKSarfTFDVFY8=;
 b=P0S+LjetSsH8ujGe2x2nqlPGal69cTLCdvdp1lCINjfMfWJu0Fy21pyCQbIrpiIlNz
 0G3bFL3GBGsUN233lT2E/feRkFtJFeJ6Y89KP9HnQT+LXyXVQlH6eOdBmR2r3I5dOgT4
 +QONWd/6w+/p/s6BZ58wCV/l0E1Ob/MeAxVgNHOuLAuy2bpUx/hozSkz6SEEWPKAGzG1
 K2uLaYO5kALtSnHBpIttkU2BtE7je35zF+LjH12Noj8C0DPNqZVP8TyqsF6qfZy8fbBQ
 xzPukRPTWuH8c57PZT7nfjUEOk6Dw5nZdV7xfDUXbXw/V7Bqg4GFlxK8bsgaxfe0hXH2
 FWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rCtlas9S5tZJybDXLJFNv32Kg8+xEWOKSarfTFDVFY8=;
 b=iRMvgwxhKl1L7wzKPup/1qoqGvtJE/bFSY9Eg+ZpdEobw2f+iUG60srnR4gbWYDcHE
 5IsK3jPsGQP9W31j2VWXbly8NZBz3w/yxBdVEaDPVbXmYmFfY60nM3EPkfumNiK26eN1
 8AXv1/4AwY+3MzbWWhIFqZq7u0+XWUJKe0D2zAdcu2BE9ctbLOuY8XPM5C4kP1kj25Fr
 vOeB3+PIv24Wo69DbzLyQu47Av87voUjBUCvSgDypkFXx4UdX4BWfiVc4jsxAAtG3tVk
 7M5UyDAbc2mN4mgu6UNcbxDrOnCFahskuPXX4ZdUM3WJtMIr4RzJ956fO0NqvIMyITOp
 77PQ==
X-Gm-Message-State: AOAM531Ox8EiI+qAODIRtHgkeKSxt53Cbkk9N5Wh75soaNEzOgu+9Uer
 65HfBnqrJDBuXiFRUYevGeawLcko0771BKTu17uXAg==
X-Google-Smtp-Source: ABdhPJy2Z8+5O6XedSWwGKnIcyzG7TPmXLakFRemzlsQA8XXca2GBOT1nc4nBhIiGvsgR++nz/WafSntj6+tZnSUBIw=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr21040803ede.44.1613485990813; 
 Tue, 16 Feb 2021 06:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216124757.4eb664e9.cohuck@redhat.com>
 <a561530e-d800-67e0-ee2b-fea6efb4638c@redhat.com>
 <20210216153003.16b05725.cohuck@redhat.com>
In-Reply-To: <20210216153003.16b05725.cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:32:59 +0000
Message-ID: <CAFEAcA-B1pXNs8X+mha3x9Ynt83dkmC9sL_XGtextCD3qDXeAQ@mail.gmail.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 14:30, Cornelia Huck <cohuck@redhat.com> wrote:
> Step 4 in "2.7.13 Supplying Buffers to The Device":
>
> "The driver performs a suitable memory barrier to ensure the device
> sees the updated descriptor table and available ring before the next
> step."

I thought that my first time through the spec as well, but
I think the whole of section 2.7 is dealing with "packed virtqueues",
which have to be explicitly negotiated and which I don't think
the s390-ccw code is doing.

thnaks
-- PMM

