Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B31492E72
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:27:24 +0100 (CET)
Received: from localhost ([::1]:51970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9u8Z-0002PH-3f
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:27:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1n9u0M-0006vi-OL
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:18:55 -0500
Received: from [2607:f8b0:4864:20::32e] (port=47024
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1n9u06-0007cW-LS
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:18:40 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 t4-20020a05683022e400b00591aaf48277so25615094otc.13
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 11:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=NAHZp2tSYMvvcpbj0tV8LbJoGJFiYIVd3jlDKndTR8Y=;
 b=WfJD+Ct3wVZndu0aCHVW+urLvEkhWg/u7ggDBk+OiCQItmrk8ksjja95RmJFXt+lni
 Xa2DWv7+3D/9d2nyQX4J1jpKj7lFkSvcd3ak9M1/8+JxfCiXAk4Y4NVR6G4ILWdHkD9J
 vTctykVurQ75gozlk0k25imt695RnnHgZ+kJKGyhcAX3HvGhQ5hfFgUZv2eimbM1RGsS
 pM28Rs6OigCKc5H7UBNGJT6NpZecaF0iRcVx5EhOCAAT4FqM/uenzlP5mgTe98scH891
 MsLfgSkvDE7jBuUWb8rnLjkx52uLosUeSQHTQK9S0nvdW4kmCtlGV9Z4Q3de1d9gKf9S
 c8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NAHZp2tSYMvvcpbj0tV8LbJoGJFiYIVd3jlDKndTR8Y=;
 b=nTD1lRyiYtMUBPf4gNYklnVuzIgAM0uaZCWxMivHrZhtBuaAkF/hy6pv5lyA0gxGgx
 Rv/Avw7tIqWkwFlM7vC9CPB1+KamClrAq7xpPypexdyQNWLGFpkXjrmCRvYAbdyHmUnS
 dmhNrnKzklR5sxphDBSC2ngfV6W/nFnend5vF8VKZch++sl0cltLGD3J/75mVZzeyzg2
 6DURYHrDYHlyGnXbsad0XRSP2MGfYZD2Q+3hTbP1+aE0fIQpHYMx9mnHub5Y4HpLjGsM
 6KoPRmDoACacFEicT40vRTxNnH0JspH083I1kKA1dpt7bEyNb/oLyOq71JbiDfC5316c
 HebA==
X-Gm-Message-State: AOAM531sEDXLL3kVPzfAfRO0q2LYVLWjLTI/JeLfBbQF9MmYYN3rUUss
 FtvZ17stKR43jdZUD99ulRlaoazVk9wa+Z4JZg5CGDdYF/U+WA==
X-Google-Smtp-Source: ABdhPJx16SICPwXSFKNQZIAyLTee73fk2QbgWRXRwpp9sz/1JcLk9TPuISnnzxs+uyJCnRoqw3E2MX7Qz8VaXgym2/8=
X-Received: by 2002:a9d:7dc9:: with SMTP id k9mr19166666otn.302.1642533508184; 
 Tue, 18 Jan 2022 11:18:28 -0800 (PST)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Tue, 18 Jan 2022 14:18:17 -0500
Message-ID: <CAK7rcp9rnggAvaDxRV4m_KcR1afmquJsR+=khKw4B1UG1+V7yw@mail.gmail.com>
Subject: Cross Architecture Kernel Modules?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000049808305d5e022fc"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--00000000000049808305d5e022fc
Content-Type: text/plain; charset="UTF-8"

Hello all,

I just want to pose the following problem:

There is a kernel module for a non-native architecture, say, arch 1. For
performance reasons, the rest of all of the software needs to run natively
on a different arch, arch 2. Is there any way to perhaps run multiple QEMU
instances for the different architectures in such a way to minimize the
cross architecture performance penalty? For example, I would like the
kernel module in one (non-native) QEMU instance to be made available,
literally equivalently, in the second (native) QEMU instance. Would there
be any API or way to map across the QEMU instances so that the non native
arch kernel module could be mapped to the native QEMU instance?

--00000000000049808305d5e022fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<br><br>I just want to pose the following proble=
m:=C2=A0<br><br>There is a kernel module for a non-native architecture, say=
, arch 1. For performance reasons, the rest of all of the software needs to=
 run natively on a different arch, arch 2. Is there any way to perhaps run =
multiple QEMU instances for the different architectures in such a way to mi=
nimize the cross architecture performance penalty? For example, I would lik=
e the kernel module in one (non-native) QEMU instance to be made available,=
 literally equivalently, in the second (native) QEMU instance. Would there =
be any API or way to map across the QEMU instances so that the non native a=
rch kernel module could be mapped to the native QEMU instance?</div>

--00000000000049808305d5e022fc--

