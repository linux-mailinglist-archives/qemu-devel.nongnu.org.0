Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726B613EC2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:13:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opb9K-0006f5-2N; Mon, 31 Oct 2022 16:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opb9G-0006ee-KS
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:12:42 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opb9B-0007qm-Rq
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:12:42 -0400
Received: by mail-yb1-xb34.google.com with SMTP id y72so14972591yby.13
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2BUGGMEWW+Y3VViuPatLEpwnw/KepFTVMce49B8UH5U=;
 b=UhTxWeBGlexC7z6J1Tbt0BNC7nAAPLV6f8F+MjP4X4y+iTsR49PMeQLsaH5Mh8oBxV
 JUcG1W2iB8UXGme8JHGrdj1+lwN+na/I3gM2S+1iyuWD5NA8ae1ENyTxio9i8QfCR4FV
 hGXGHHPoZLTiWbF6fwUb6Zwan46vWWxkvFiYE2ov5boQiKEzegmwighAaIWeKgH8NM4/
 mkWUfDtJb2iNhvuASyHZ+oryhckQkJlTEQGRhMeQNB7aIBs/zVit8OfHGRC5PldY2o0B
 FgLtoA4ffRzZx7MKaGacxcDa2alK78FBSNmAGQioza8ogPTyBM29hu64iht9B2jZCn1L
 Txig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2BUGGMEWW+Y3VViuPatLEpwnw/KepFTVMce49B8UH5U=;
 b=RNrlPiXzFMrpyKmm406la7qg57ohLfmo1AGP46xhIzEIIx5jnr8hs3Wb1+9uc6Juar
 yEkr8VxrRDam4bCGHapA3prOUl1INKMwVkhbwCTr3iPdTUM1NCjv7kMM5tOEHq0BtZn9
 q4rtvKHJ00no+zaSmLvGbL1CRDoACzMVi3h9kyx4toqUAhHq58R9MaK7ryKJBRtILblF
 xB0axZlBHG3kBVF6zSjQp5xBLwhD8McIPqNay2FvEjVnoX8Qyo7CGEhzm7z6hOXuMl/A
 FLRAzKbAvy1vjoxVMqt96gQL4dByNe9P3Xsohbdacms78BALXGbR1CY01ShQrY6/Gw2A
 MiHA==
X-Gm-Message-State: ACrzQf0a1IizZnr+fcXkMrB8IyWqaYDQ2SFlgkHbiFyiV9uomSSMr8Pb
 +yz/UTx/cFvM6Ed50qWdK4WhHPiwwDJiw0EayPU=
X-Google-Smtp-Source: AMsMyM5UBhCC1qhbsGCiys8RVEhmyxtNRKZ8dq8jprBf9r6YJm61Y7Q+xEVJGnSP3VXSN6vnUY4rQJbGQuaIa+pfAH4=
X-Received: by 2002:a05:6902:191:b0:6cd:3a43:cda3 with SMTP id
 t17-20020a056902019100b006cd3a43cda3mr1619073ybh.207.1667247156648; Mon, 31
 Oct 2022 13:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221031124928.128475-1-mst@redhat.com>
 <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
In-Reply-To: <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 16:12:24 -0400
Message-ID: <CAJSP0QUPg2pMZ1Waxwz-gQM+ObmudiuPvPGbY2anzVf6GBLWZg@mail.gmail.com>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
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

Another CI failure:
https://gitlab.com/qemu-project/qemu/-/jobs/3253817492

Stefan

