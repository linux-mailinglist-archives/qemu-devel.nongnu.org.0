Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C0613E9C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 20:57:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opatT-0005EL-6s; Mon, 31 Oct 2022 15:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opatR-0005E9-24
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:56:21 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opatP-00024t-Cl
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:56:20 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id o70so14941688yba.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 12:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OfPEejpAgtSf1atGTR8VM0SNw5qRPro6GyPZFG8C99o=;
 b=nGDT3RDkdA+1LnzCE/BAnsdnajsgCsAALbM31xvuscY6xFgfojq68X8cn10PW8+n7Z
 XHtI+vpuRtRGjslqipZfPQ70EzjPzfljykgGyuEPjvo59u2mjCjlaxt5igUUtZkFzB8T
 WosQVLY9Bk3b9CFn8D6Ubtr1QgUcMETykFpiAgap9JWGyGNyAtICD3/KohYDFlZ1etqD
 qjTAiG3ZQUPC69th4VeKzFXbGTq3sSx7RQVUjgPM0BZvusr2kOGvwIS/0IBvzp9zrtUm
 LL78mcuaggUegOaeUTX16sieoW5XMZcY/VbRNFBQmZhgl59/lS1XDPkUDzAyN2hZ8rTi
 sysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OfPEejpAgtSf1atGTR8VM0SNw5qRPro6GyPZFG8C99o=;
 b=X7o5X9fYyG+UHehOig9xVVx/7YJ4bY9LjCuGW/BcFhagN8gycA9CjIOrP3/QhRh7av
 iJXFsBsfKF85zHjUWXBu7+Z6NUHnRBOd+9W9uJ0mZRwCKKVgvDmw2jhr/5qNEDgjqvdF
 pDfRViHBFqJmLMAhIGDs6ifdNxC1f6sL5Y5Ike8CTiEeOYoXHYsCpfepEKZKpX7CMVxq
 YrJBXCQBz5sdyDYGRnbLvJg9HZR1bjjMIP4Fi1syQnpc959YPreTJ3foMsBwgcFzeg6F
 Nnl93v/OvdOPh589xGZcNunY5ufqO7Za3HoaSpZZ3wdWp8EtoB5NJWifItgJlGeQZDiL
 UuYg==
X-Gm-Message-State: ACrzQf1QvD/Ql9tKGdQPX99VkxbYdKFJsUrJj67hri3QamrpMCLOsnVN
 fPC1Jf3ghwAMFv5bflDxuixNeByR007LiewvYBA=
X-Google-Smtp-Source: AMsMyM4+R1yHG32Ic7bGoVmBugOdbxUlEMUlKPkiGz+4yt3P6f+LGV/Mg0ebWossH5evVHucj6FepXfryM/3OTzc35Q=
X-Received: by 2002:a5b:54c:0:b0:6cb:dd09:eea0 with SMTP id
 r12-20020a5b054c000000b006cbdd09eea0mr14250103ybp.209.1667246177620; Mon, 31
 Oct 2022 12:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221031124928.128475-1-mst@redhat.com>
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 15:56:05 -0400
Message-ID: <CAJSP0QWa36LeYs-Vyhps5KdX=F7LfjpTfX1ymPqGpbJnzdVdUg@mail.gmail.com>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
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
The fuzzer is not happy with qpci_device_enable():
https://gitlab.com/qemu-project/qemu/-/jobs/3253817499

Stefan

