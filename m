Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA0B613E9E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 20:58:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opavH-0007UY-H1; Mon, 31 Oct 2022 15:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opavF-0007Ph-FL
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:58:13 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opavD-0002mr-Qj
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:58:13 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-369426664f9so117681777b3.12
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 12:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jgppCKROLP1ocNJmblJQSCmqlgaUSH2tA/zKs59Rg6E=;
 b=XEB9R5bmCk7Vc6p4ScxKrUB7PrkeeG+5Z/D6MY4ZcPAHzGex/mI3hDRrmivGZCayQQ
 qTVJ0VH5lasMJilIqNdpEDDr5LfD2ECNNsq1goCMr+xJiyDYCIUa2PZ1F8aoGRUXc1fS
 ISYRcfHJEfKHugcgbIkmT9PuxAVAW/dyHINUdjGK/Zgwb1c2BePvOBr18mP6s5WutvFz
 A5SywX8hD+EhMmcWQOqcpHdVdaWacFIDOvk1sNZeE89AR6AiMstyG59DxJKX6gR0eCtm
 09ucrz/fAy+XpB9e0iDf98D49hcumCHPb8utSW5Kto4D/XCdPNr0Q68smedoaAiuMB2E
 MULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jgppCKROLP1ocNJmblJQSCmqlgaUSH2tA/zKs59Rg6E=;
 b=Dxsox1YUxssIR5b6kP+yAvUh8OMixQ0aCi5ySMDAek5qAdwF6wLSiuTSir7G51Pt+8
 KtdAKj8aVGUWDkywabuD2CEr9Jkl4xKgkvoAW2CpXmsqzVQrC+pO21IOf17YyWRpo87u
 FZKUqwLY6Jpnahcyut5pGdAvowU9U3HBeasOTmVFJkGq4t4Z8aOrEB5eqLVer/IOhTRK
 U5+dlb9qkmaUMEZLhb36Wng2rPil/uVZxeCIEyOPmzO3gKrqDC55mRLc4yjfSL/MTjH5
 kfMHXSg8bI4+7W0rfHD6G6hDHNGY8vBlEe7FFfPGNtPkJ3k5lBkwpfyWahaL3SdL/edP
 St9w==
X-Gm-Message-State: ACrzQf0HLZrK7SZQ99t3oOazn6z/EylV/mVMgHE19pAU9DLLhHDUvQWW
 tdHX7f7ZOaooQh3nL2eMnPLdGx0gzfAi8GF+QMU=
X-Google-Smtp-Source: AMsMyM5l7v3dXSZauRa1p+Q2XFhT/3CIAJsXLUTMdQG0qbbDRE6zt0nCyidzOTv6rpc61QdjoFHV+GF0Oct5nkh9ke8=
X-Received: by 2002:a81:8445:0:b0:36c:c302:8926 with SMTP id
 u66-20020a818445000000b0036cc3028926mr15372641ywf.296.1667246290662; Mon, 31
 Oct 2022 12:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221031124928.128475-1-mst@redhat.com>
 <CAJSP0QXafXM0CJDe5G=--3Xa4O5ifqz=yvO=ubWLaS-KNBVkwQ@mail.gmail.com>
 <CAJSP0QXndDKsc2wy4uTPtT7uN5yV4ZMn+Nn7uV190JmhnfSROA@mail.gmail.com>
 <20221031152525-mutt-send-email-mst@kernel.org>
 <20221031153513-mutt-send-email-mst@kernel.org>
 <20221031154133-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221031154133-mutt-send-email-mst@kernel.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 15:57:59 -0400
Message-ID: <CAJSP0QXG4X3V_z2tqxvU6nLxR_dzQOB6Df8zj5Lh6nbn=RboRw@mail.gmail.com>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Lei He <helei.sig11@bytedance.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Hi Michael,
I removed the local variable in virtio_crypto_req_complete() since it's unused:

 -    g_autofree struct iovec *in_iov_copy = req->in_iov;

Stefan

