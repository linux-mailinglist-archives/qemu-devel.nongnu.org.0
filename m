Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1A241504C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:59:54 +0200 (CEST)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7TF-0001Mw-2I
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT6uS-0000k6-85
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:23:56 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT6uO-0001uL-6L
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:23:54 -0400
Received: by mail-ot1-f54.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso4899299otu.0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZGuo6/JWr2KOnG9/z+ZiXe9m8Rpju3Hw45gJUm8T/0Q=;
 b=ZC6wPbt6IlMSTIRU5jgzels2eS7oKdnV4Fw2QNF332V5gqD1hjLXkJfL3qEDeg3MyC
 7fEu2RexODW41ULVRG1IMUw1RoHkGGCi5Jo+7m7eSGD2/kZ20J1RmoFLsH1LM80ghg+F
 1CUXYwwyhRBcvPyGzD0adauXA96UGL7ff79/ZEVtoWTRN/d6QMsW6lJ+BbG3H7Z28UKT
 b39nFIYonditdKlCuLuqsKdSkLtPOcDKr84T1fvEQzS8eOeDBozXbSBRpgylyhPq60fk
 Aub2jjnftVvoYnJjAq2Wq7aLA10bpiXAQgFxrM61o4RUhHgU+3vVkGfsbDeedm4pjgIg
 on5g==
X-Gm-Message-State: AOAM532eVu4lpYwdQNa50eXYXh9JgJpfgS8mO3MC8RvA8W69ygVcjvPr
 iM4LW1iRRLk5Wf/Xcyp196ZthGLKdD/BDyJYhfE=
X-Google-Smtp-Source: ABdhPJxovHgPzqhrxumbL2ftzUlkJeOe+qzCfNOHQxvGk76qa+1FHMl4W2PyXsFsyQXmtGIU55fUrT5Zw2crFoiedWU=
X-Received: by 2002:a9d:7156:: with SMTP id y22mr466176otj.75.1632335030205;
 Wed, 22 Sep 2021 11:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-2-git@xen0n.name>
In-Reply-To: <20210922180927.666273-2-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 22 Sep 2021 20:23:38 +0200
Message-ID: <CAAdtpL7caRfNxz8Ayky2hxZK5jyq5dkG+xWNdDqVzXq143P3LA@mail.gmail.com>
Subject: Re: [PATCH v3 01/30] elf: Add machine type value for LoongArch
To: WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.54;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f54.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 8:09 PM WANG Xuerui <git@xen0n.name> wrote:
>
> This is already officially allocated as recorded in GNU binutils
> repo [1], and the description is updated in [2]. Add to enable further
> work.
>
> [1]: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D4cf2=
ad720078a9f490dd5b5bc8893a926479196e
> [2]: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D01a8=
c731aacbdbed0eb5682d13cc074dc7e25fb3
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  include/elf.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

