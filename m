Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8ED538B93
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 08:51:07 +0200 (CEST)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvvib-0002To-Jw
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 02:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nvvTT-00040x-Jn
 for qemu-devel@nongnu.org; Tue, 31 May 2022 02:35:27 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:46064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nvvTS-0006Oh-1i
 for qemu-devel@nongnu.org; Tue, 31 May 2022 02:35:27 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so17060826fac.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 23:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oSebReabZUuja+pN5PvkYRBbHD3aO1L3EGRxSt3bA78=;
 b=J2owXcYC/4c5LWrdUBf42xExqdkrpddKb5sL3W5/GoB/O0JqBstXo/ensKAlOMlbMF
 u4UX9zRBWvL4QWCCY20FuDIE++utVKRlOeAGe8SEv+puw9hWdYj6C0o4g4q248o3PPOi
 p4fVMKnxZZC93IF5OShSbyD3Gx+gEWrL10Iq4muTVwkPbtWwxYNIHy7B4NTBAp95u0jC
 rlAWH4oKGCY5p3fJDC7xsWoVWHUIW9VLd+GUsrqYGAZKKruvofcBoxTQuViK2e1ASDKD
 PW64FFpKqFBkM1Ek+2y7gEUtWRA1SKE09w4uCKxHIR0fUIp3EwMl7HHIm7lVyPnGomk7
 IWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oSebReabZUuja+pN5PvkYRBbHD3aO1L3EGRxSt3bA78=;
 b=z2kNx8nAglGoV+CkFxSiaXawUhchRJJRzx0ZuSGp+3ng86XcjIWJItGB5SqTjNOCfF
 0uO8Gn8IMtdFOnN4G1FaXTJqk0FBXJsZHt8zbM3gsasCcjDDzBp6rVE2/+oKMbDP642t
 KvAR4gEYuICOksR8QlfBLjgB9btGS7rehry2E9DpOlm3Fxb0/q/5x2vqqviKBTxbAZK+
 G8VmD5w25TrqvA94LanozH69B4V08XqOX/EKb1FLwFPiPKDb7Z0L6OiXujKn7qakh976
 Pmbpp9AyX1nK14jMsku6t7uIKju5Ak3FsjUtADiGcCbT2PpCjpeAP/9GCXbK+RC32QOp
 HOdw==
X-Gm-Message-State: AOAM530pfu8+wXeeWd5cAu0FnmWxK4eyqo2/ns3C0D+52N7fP//uYRLy
 ihk2y4oyRMfZ199awkMZaJmMa9X2wkSsjNuzRnY=
X-Google-Smtp-Source: ABdhPJzv/fwrGJ14ZGN+67EjajUxQHnnHG6fGHKW19cnsgoqUUmZM9Yq2c/iP/4J+hsVdTHynSSaUlUIfOd2a6I5VCw=
X-Received: by 2002:a05:6870:e30e:b0:de:ab76:eed7 with SMTP id
 z14-20020a056870e30e00b000deab76eed7mr12437765oad.101.1653978924855; Mon, 30
 May 2022 23:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220421163648.4205-1-faithilikerun@gmail.com>
 <YmLFSJwvToxgdlr7@stefanha-x1.localdomain>
 <CAAAx-8+wQGhpU_uNrSQqPAmgxYtPzZ5DrbnfheiUGVKP=w_zpQ@mail.gmail.com>
In-Reply-To: <CAAAx-8+wQGhpU_uNrSQqPAmgxYtPzZ5DrbnfheiUGVKP=w_zpQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 31 May 2022 07:35:13 +0100
Message-ID: <CAJSP0QVwdisJUZX92n30Lzb8ZFbTqpLwt8E614pUL_nUFf_kUA@mail.gmail.com>
Subject: Re: [PATCH v4] Use io_uring_register_ring_fd() to skip fd operations
To: olc <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>,
 Fam Zheng <fam@euphon.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=stefanha@gmail.com; helo=mail-oa1-x2e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 16:40, olc <faithilikerun@gmail.com> wrote:
>
> Hi Stefan,
> I've tested the code and it behaves as you expected. Should I add this to a new patch version or leave it as is?

Hi Sam,
Sorry I missed this email. Please send a new version of the patch with
CONFIG_LIBURING_REGISTER_RING_FD.

Thanks,
Stefan

