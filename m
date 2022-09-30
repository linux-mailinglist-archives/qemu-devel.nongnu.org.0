Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106E5F06D3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 10:48:31 +0200 (CEST)
Received: from localhost ([::1]:42424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeBh8-000875-KL
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 04:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeBdY-00060A-I1
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:44:49 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:35673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeBdV-0007rw-P7
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:44:47 -0400
Received: by mail-qt1-x82a.google.com with SMTP id g23so2268852qtu.2
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZcfyBnp6eLtnqT1wuvXOy165uUnxn33swpD/TqHimfI=;
 b=f9tSAatxoLRwsvLXBE0itxjtiitnqT7zPsCVb9cpCbcQtV7i6kc4EtW2P4KgCx8rhF
 a2k9qblyuIVmrjAiDMHrPqWsFMc0PPl39P3ISqwain1AM7Yy48F+bQU9+oPSvFv2c6A9
 q8DxyayeVZav0RsEg3kGg5asvtaTxCNwEdvubq/x1nJiz/aV96OgWd+2DUc/hZtOQpXP
 eVMGte/z8oOmWTRAca10RZVhrz3iTdD5+4XAa7E/W7KuYmTiXX8k4jUkOIz5XoJsgegl
 fK08VKlAW9B1FTsCua+j9zbUEusfgMQsyjJJK4zYEB8LtLZKtyJd04Bt7mSYLTj2DuOG
 7O6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZcfyBnp6eLtnqT1wuvXOy165uUnxn33swpD/TqHimfI=;
 b=wHvqJfrFTEJVbkqrgZb2x5cunSj/fbFloch7sIH125TgV2dSIDJdB/0chdb4aNoEnH
 SfjSYQhuZk+RIDrjNvlhDA3lWytbouGGBGvYHShwybqJIj3Bi1jXEcwvtytRAGfsSQke
 tUAm+J8L2tVCCiZjvWEk0jjWpaeFaJcMRc5wnjHT19i/Xmtjj3H8fxA52uIqnZQ27i2p
 C092BjMu85l056lbyn2yVADzj2TnHec9Z5AeCZvUV9wtX+TWCKWjm7unMBjiKLn7lI1G
 9fjff4i4hgPKbB3rJFu5KVd9zHJKEx9Kz+bjdkthPdKBnuzqYOkxwOk//WRQZqwxYkvN
 dkNg==
X-Gm-Message-State: ACrzQf0PmX7Diz5Hi0ndNaQQo3kW74403VAQznuvc/gvmMe4NuPCgygd
 akcpPGtAR02DTMJGF0xXpBvVE8WdjD/Nr0qYSzq3fYRCSTM=
X-Google-Smtp-Source: AMsMyM4E+zDmpK6vZ8AQdBIXgaAw/14huKuBZMGziueRiDNcMLEFoLKfoM2TEv2LXftIOrNVmh69rggXKehIFDsj5EM=
X-Received: by 2002:a05:622a:92:b0:35d:58bc:4a4a with SMTP id
 o18-20020a05622a009200b0035d58bc4a4amr5877354qtw.391.1664527484464; Fri, 30
 Sep 2022 01:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
In-Reply-To: <20220929232339.372813-1-Jason@zx2c4.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Sep 2022 16:44:33 +0800
Message-ID: <CAEUhbmU6vEeJ335x+EKToeWmmFx4eXNv_51XRtQvWf8LQNjaCA@mail.gmail.com>
Subject: Re: [PATCH 1/6] device-tree: add re-randomization helper function
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 7:24 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Several
> architectures require this functionality, so export a function for
> injecting a new seed into the given FDT.
>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  include/sysemu/device_tree.h |  9 +++++++++
>  softmmu/device_tree.c        | 21 +++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

