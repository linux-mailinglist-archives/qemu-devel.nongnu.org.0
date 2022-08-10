Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C238E58E4F4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 04:43:39 +0200 (CEST)
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLbh4-0005bh-3A
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 22:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1oLbbl-0001R1-VA
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 22:38:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1oLbbb-0002Qc-FD
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 22:38:09 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z16so16154649wrh.12
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 19:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Q+2ovGCnXj3cvw0MRNQj1uME/A57p9Aoq03WzLOQW+w=;
 b=VldeJ7u5xNdQ/ZHHCQJyoFMg//h7AKgaT5W7HB3ga7tRR9DStKXrqf4MDiNTTk5zV4
 QUQKXYPHq3A6h8y4pblp64Uxltt98aX/B9E9uxqgtFYYSvL2QxOFfJBHE68DsfTOASxf
 0BuZs+uTVbtWAkEtCvq2680/iIzL603Y1ZIaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Q+2ovGCnXj3cvw0MRNQj1uME/A57p9Aoq03WzLOQW+w=;
 b=AJDqK7q4LWz3zir7dMjMiDhs0RpakDBHiVnDqR5Nm1KrgElJa3Is3c/DqZT+Mnpte8
 5zn742rwIcqGaQiEof8LFpgfDObGrX0jjvOM7oghSYF8DOLahczT7UfC16ywY5+F3946
 ydfrL8Rvv6UYUpUrbzYr5SGYHpRlae/px/4nilYv8/CBmpiUUGO5uGYONyRPaSaV2jLN
 heOy2d1G90Y3ZikQhqL2jzIeVrGHtFBGRTXqV6rgB6NcOMExQl5OuKUFnCouxNrn04pt
 SXIgccRxIloAaLHd7hP5sVeK5/tvmd3zIV4RYg6E3ZRgrPsfignmnsmjwQcvRO5P6eiV
 LXEg==
X-Gm-Message-State: ACgBeo19NYmM50S1lArRxn4WSMDuVE43wdpdFO44GAeUjEfFU+no9Zp8
 KQ7xQyNl8AbxVmbLon13kU4vQsezx1paE5S/sWA=
X-Google-Smtp-Source: AA6agR50xemMK+XNvWbqixFeimvxNTCQ1v358V9z/p/2eAhk/pgAQWmyP/wAnjT0/4KlLfwfVa+fRv0sQvzderw4tB0=
X-Received: by 2002:a5d:4e8a:0:b0:21f:610:6866 with SMTP id
 e10-20020a5d4e8a000000b0021f06106866mr14875646wru.606.1660099076096; Tue, 09
 Aug 2022 19:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR12MB38917595B0306085EEBB1921B4629@BY5PR12MB3891.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB38917595B0306085EEBB1921B4629@BY5PR12MB3891.namprd12.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Aug 2022 02:37:43 +0000
Message-ID: <CACPK8XfjXq6RW=M++UebfiGeij=GDSk5f6ZftNaL+2oeyCGnHw@mail.gmail.com>
Subject: Re: AST2600 support in QEMU
To: Shivi Fotedar <sfotedar@nvidia.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Delevoryas <peter@pjd.dev>, Jeremy Kerr <jk@ozlabs.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrew Jeffery <andrew@aj.id.au>, 
 "Amit Kumar (Engrg-SW)" <asinghal@nvidia.com>,
 Prasanna Karmalkar <pkarmalkar@nvidia.com>, 
 "Tim Chen (SW-GPU)" <timch@nvidia.com>, Newton Liu <newtonl@nvidia.com>, 
 Deepak Kodihalli <dkodihalli@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Shivi,

I've added others to cc who may have some input.

On Tue, 9 Aug 2022 at 21:38, Shivi Fotedar <sfotedar@nvidia.com> wrote:
>
> Hello, we are looking for support for few features for AST2600 in QEMU, specifically
>
> PCIe RC support so BMC can talk to downstream devices for management functions.

I haven't seen any PCIe work done yet.

> MCTP controller to run MCTP protocol on top of PCIe or I2C.

What work would be required to do this on top of i2c?

> I2C slave so BMC can talk to host CPU QEMU for IPMI

Some support for slave mode was merged in v7.1.

Cheers,

Joel

