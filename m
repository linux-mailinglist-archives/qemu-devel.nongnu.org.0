Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52825BD2BE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 18:58:10 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaK5x-0008Eh-3i
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 12:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oaK38-0005Mt-Gn
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 12:55:15 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:44753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oaK35-0003nT-Ib
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 12:55:13 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-345528ceb87so346402357b3.11
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=e0bnb79yR6q9btSuZTnmpRTnIR8zQf+PljdYJbigoFs=;
 b=V+pmizWgcMuUqxYTSdq6+LIy0fd9WAyElsKZtorplJ7icfkJMUvNw70rN2ndrfz81K
 fqWhMbmOHOIcmVtM0d568jANyULS7+s+n+s0LG+uxb2vkyZOflTR4oyhZyB0Cdx/fNhQ
 39gMHBCnVFiO+lq3bgDJKq0NVDCQF1WP+yGAO0I/H9vQDheytv/jgOa7jQX9/wZovKdu
 jl2LCvj26TiHjFHwY2iZ/ayd/uKHtx682IhxU5KOXK8vFrdAMrFDCqpyiA+ArlwLk6nn
 bKjFKcug6qKY9d29Tqc628w75dglqFybySlJoBRHuvjnWfmf4PcJn75svEF6wntAk80c
 IcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=e0bnb79yR6q9btSuZTnmpRTnIR8zQf+PljdYJbigoFs=;
 b=CTdd3hCz4xMS7d1GYGTfYlrPENUcgSJ6Yag4aKRxzOBW9jojUBdGpA5cbHg3N84tpX
 kGbysBOdVUm9w1x1hybAKX4zqNtp+g0V2FqyVjpokwk2D0+ilc44O4hw7WrVSWc6r9pR
 /k6YUWeT+g9SimCnA99YnRCJy6PghmWXx1/V/iSMbLi28a9IsPKe6CtcMPDVNino4KMW
 Kn4MUF/4Bs6pFvEJufj8yP55HldB7StBx59UndNisnrE21vtvD+gGNrF0nOliJxAFgA4
 WmHB55Y/ueZHYQr4lVkzwLQ5Lid5C2VuxyaWQfGmrO3qXXJHV0JruSJBpJLNMh/zLOIB
 ldAw==
X-Gm-Message-State: ACrzQf2ImRHr+8KNrIXGxjRw4nH2PG1b/jrPFLFiLGphAQD49wPwfmzG
 mIyLVnJ65QTd/fOmwPk/R+L/O7u5xz4FKNmlPyQ=
X-Google-Smtp-Source: AMsMyM7fKivI6IrSiR/Iux8WZ7Ef3ThF3Fjxtpn27SPZJyNc5j+9Fk1qQ1tlSQUofuvr4BiAMlYFWW/zkdkn95tGFXQ=
X-Received: by 2002:a81:6a54:0:b0:345:4292:4dfe with SMTP id
 f81-20020a816a54000000b0034542924dfemr15433784ywc.62.1663606510134; Mon, 19
 Sep 2022 09:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220919124901.2653396-1-gaosong@loongson.cn>
In-Reply-To: <20220919124901.2653396-1-gaosong@loongson.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 19 Sep 2022 12:54:58 -0400
Message-ID: <CAJSP0QVh2LL8yUhjL-i844TmC1ivsEUF=Qi2ftStg=XWxXGDog@mail.gmail.com>
Subject: Re: [PULL 0/9] loongarch-to-apply queue
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
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

Hi Song Gao,
Please push your GPG public key to a key server using "gpg --send-keys
0x40A2FFF239263EDF". That way others can search for and download your
public key.

Thanks,
Stefan

