Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469236FB34A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:54:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2FM-0004dC-Af; Mon, 08 May 2023 10:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pw2FI-0004cl-OI
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:53:49 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pw2FH-0003em-Bf
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:53:48 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so25434368276.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683557626; x=1686149626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wDJ6m/taJbsTF8DTAITbw5l/jVMEeKGS8Pi/sFGatfw=;
 b=UioWCHQMrET1tQp5cHbbywcth/lPhKM3Wzf3MADQVime5ZUcrcqF+Zs3FNWZHIRYD4
 2e0g2zOxgZWXl/3Io4KmD8TbdUibirNLenD2fzERpOXNqViBme93nKkkvq3psPuBbmln
 IfsmPMy4nA21excXCjDXSFTkxaZ28/F4tlRXyVV+/ORlBXCaCdjAjGQAgkyWJcVpYhcR
 Q6oP6c/L/n05FrpNzH1jrnIv5TyfFsMuah0qb3LwOMOcNDqy4PlLwW+XuVf9yskZwk0b
 UM2Yo53wevEPQM6NmCkAoQ32LbV70af0CBW62a9ypqXAGrIHoxYMvufl0/wAChcG9Drr
 cmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683557626; x=1686149626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wDJ6m/taJbsTF8DTAITbw5l/jVMEeKGS8Pi/sFGatfw=;
 b=h9/51Q29nXoPqR4DqNZUD28Nc2LBFiB+ZKJFeN74d0MxpGMs3lyzT5xES5GraVAMGf
 0DBHZpbbzPOCBtwDv4cSxgM+ryyn6VtWJ+hkBSioa2Yqv7c14MU4WQCAV0Nt6JlNL8/F
 C7dIsvGeWrNRnMhPyqRkiqbJlukgrHpF7kKdJngv4bx8EBWhsfmPmBMrnWsrjaHC/ycU
 bMixWrxiEp9RM06RW79I2VRswacVkx1d+EUPwPcIbc2zlukunaAHDMQZgTkAg0d24JPi
 F2XYMa+dWMQaecf6ENNKtZfyXJK4vZkBQO6ShQEi1fPphYp8dFS7fEVlAt6cZZQTADwt
 LRew==
X-Gm-Message-State: AC+VfDyFlI4g+QVsdJZs7xI8djM2F6laH/gXC59TykYEnSjs4AX5ugxJ
 UjlolXjYBQj942naPBDsotE2nWEcWkHeHTrQ4Q8=
X-Google-Smtp-Source: ACHHUZ6tDkLJPPpdtMDqFi6TT0DW8dz0EtwdmNvJDEZ1OHcuADwApDmMNcDRAMkc1PajDyH9+UbYZ1TL45NnpI8dR+c=
X-Received: by 2002:a25:1f05:0:b0:b9a:affd:64d3 with SMTP id
 f5-20020a251f05000000b00b9aaffd64d3mr12883686ybf.15.1683557625866; Mon, 08
 May 2023 07:53:45 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 8 May 2023 10:53:34 -0400
Message-ID: <CAJSP0QUccstoX1EBBB=snA+g7xTc4Wr4Hf+-x-k9dbbd2iahnA@mail.gmail.com>
Subject: Your clang TSA patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Marc-Andr=C3=A9,
clang's Thread Safety Analysis is being used more in the QEMU block
layer and a few limitations have been hit:
1. Mutexes that are struct fields are not supported (only global mutexes wo=
rk).
2. Analysis does not extend across function pointers. See
GRAPH_RDLOCK_PTR for a workaround that is currently used.

(There was a third limitation that I don't remember. Maybe Kevin remembers.=
)

I heard you had clang or LLVM patches in that past that improve TSA.
Did your patches address these things? Any idea how hard it is to fix
these limitations?

Thanks,
Stefan

