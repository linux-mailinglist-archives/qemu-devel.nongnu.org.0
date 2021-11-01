Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DE6441A9F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 12:23:51 +0100 (CET)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhVPr-0002zx-0b
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 07:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhVOt-00028U-VL
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 07:22:51 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhVOs-0005A1-Dl
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 07:22:51 -0400
Received: by mail-wr1-x431.google.com with SMTP id o14so27549097wra.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SqdbSJaf7zs7O2VprUdgSGlMoh2U0zGtsbN19EkXrmc=;
 b=e5RKuZkXByiJzgaL34rnu1JOWPsygcZWPiEfTjWzvYBTbVijD/62zRZy0rYyEW+92v
 CegggPdrATFx+wlm084nuW7w9VXKde6Fo02TJmwiMpZzaCjXG7/SMp13iaAdhWxVm5LD
 /83+AQn9fiJim5Cr29UlI89Ak6Iw1Xi0qGD1BRJ3MKvOleEtI5b5FjsBcXmDROCl9MRj
 HEQ8Z7IEfqUr7KkYkF+6WohPA9S1mjUlR9MZBXSAdrI3Ir5wDbuZi7ZOjI0u68QlHHnk
 ft21XYv9LYPwWdDgNNTgfnZ/UhOnz0tW9B5rj/2YskxlPSacBlu/r1St0qWIa0Zt5hKh
 eiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqdbSJaf7zs7O2VprUdgSGlMoh2U0zGtsbN19EkXrmc=;
 b=ku7tqqOMysYRrAdXBwlG26tlEPCodGNy3/ZPDKg/ONDOPtI0z4S1TCSRdAjf2I/ldj
 kIiquQ5TpdGAiGPXui5/8ffIRDFc2CCypggSoqAJPZzziuHfDrf478IrM+AJq1xj7HQv
 niaOoG+LC2y1L4M4llAs5X2fOg2Tq6l55MDDyfnVRICVmU2t+VfuF6d0rUqRpI6HKWiN
 zp8YegQkawMe0NVBBrG/6PowtqKMvdJXv7+RIPbshnkgDH0VDD2CmckeleJeD2fpUqVB
 cGEeGQSzic+v5WMg9Ls3FqFYLMV4xqQ3P4Wg+YnVWJoWn/qm9f88xhMwAi8bUUKdf+xO
 9uSA==
X-Gm-Message-State: AOAM530gyhncxGN68MyExjTee4NqOv7+abNyZYoR+vwC0Q1OCKbv1gdZ
 iK5eqcqGVLZqhOFgaASn3GfF2OmzWB/cbfXg9fmHZw==
X-Google-Smtp-Source: ABdhPJy0gU9xsWCjZV4ZLVuG/UELiBFbBfkiXJp2OiVDZoDBiPpZS8Wnm+Te1miQrDnTPG2mvsbrpvHSWDPN+HnzuC0=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr37209491wri.376.1635765768793; 
 Mon, 01 Nov 2021 04:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
 <CAFEAcA9_nVnW3DnvomvytX8xH53KM24xfn5rCSywa3WWCwEZ4g@mail.gmail.com>
 <BYAPR02MB40381A62103A15406DB2132BCDAE9@BYAPR02MB4038.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB40381A62103A15406DB2132BCDAE9@BYAPR02MB4038.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 11:22:37 +0000
Message-ID: <CAFEAcA8CYB_rd9BotA3jE3bxSi-Nv_fL8uDz8PxsgxNsa4KR1g@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
To: Tong Ho <tongh@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Oct 2021 at 16:54, Tong Ho <tongh@xilinx.com> wrote:
>
> Hi Peter,
>
> I will follow up with patches to fix the memory leaks.
>
> Where can I get a copy of the Coverity reports that have the 10 issues you indicated?

They're on https://scan.coverity.com/projects/qemu?tab=overview
You'll need to create an account and request access there.

-- PMM

