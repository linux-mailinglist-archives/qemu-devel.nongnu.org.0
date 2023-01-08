Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A91C66138F
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 05:29:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pENJA-0000sI-V9; Sat, 07 Jan 2023 23:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pENJ9-0000rs-MV
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 23:29:19 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pENJ7-0000mx-Im
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 23:29:19 -0500
Received: by mail-ej1-x62d.google.com with SMTP id ss4so5079099ejb.11
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 20:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZqq2Rmqg0hhJFWCGJY00F+pIuxTdvMCF3EfLQtKJsg=;
 b=ffGky7Z1XDzJL0gZK5HT/6z8R+JkNeyPoFd/vWBhI4q/VC3o/GkH9w5qsiQody3LQi
 gmyHlhh8s3WE44j1GhQ2wHAR5Do5NI0Wv29D5QPL+k6RwPI8JUWsgaI3ZT08OjFoAH73
 ZQlPbgy29AXSCoDHrdJkUiLtiJqPyB9v++TACiTBsJvSV6zB6IuohUB0IMq1DltyxZ4t
 S33RaDM+WFjV4lQ/sSu8G+Nm9hYGJXQSkJin4J/6dL5jSml3f4nnG/qdDypHUxtt14E+
 JwD6vc/OzRLumDx20gQvCK5h1xZotW43jVIjBYvHli6iE7+1zRZbyOehxBTmeh+B24Yd
 //6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jZqq2Rmqg0hhJFWCGJY00F+pIuxTdvMCF3EfLQtKJsg=;
 b=r67VtOgdy/kXaqAmL1yjQbJShrAsw0YnesFtUK6H2F1Gkcy72iDOuI3NsRKfHW8t5k
 w+smI0BpQs4ZtsHxj1Nn0GcCqCB9KFT/rR29I7TJaDkZhLkLlc2jPSzAisoh5ppbo5FI
 LbkR/lMfnwz7hhU9J8fopIjQkzwjEwRoFjxRsDYHELy1y9dkAr75hM+UK/6+n0L6NtpM
 IG9dPK8NdMFrVX/oHe1OjYjCewGjal83QFeEmCaZHCX3DvSW2EYvm0c8/Yyy96+GdLoJ
 STfVVeIBs3tBeFLebGRUad1eBnA1RvfI9oT2ASUBRq+5eumHz5EK0xW/q3KJJIcXJSrH
 WkRA==
X-Gm-Message-State: AFqh2kp9fYWPvrCZwH5Jsq5j/OajFEVsdkE3kTCoSZyU5UGSFv1S7DGJ
 JcgeqGA6tkrzuAudL6V5FwFE0ppPXWXoJlG0gyrFdYbWzH8=
X-Google-Smtp-Source: AMrXdXsmaYhgr3+Q7a4SbNSGhjaHf09HeErt4gOEhPCQ6ANDrxv8v26o6SCe5KO+lAQ20b1LCdcdkvURrvB/VSlSdkk=
X-Received: by 2002:a17:906:1945:b0:7c0:bb4c:e792 with SMTP id
 b5-20020a170906194500b007c0bb4ce792mr4710885eje.618.1673152155096; Sat, 07
 Jan 2023 20:29:15 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-3-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-3-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 12:29:04 +0800
Message-ID: <CAEUhbmVoOvm7Yoh9EBa4EnR2Dkkpsst+bgXFKkO0Vs9hUp6cJg@mail.gmail.com>
Subject: Re: [PATCH 02/20] hw/block: Use pflash_cfi01_get_blk() in
 pflash_cfi01_legacy_drive()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 5, 2023 at 6:10 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> By using pflash_cfi01_get_blk(), pflash_cfi01_legacy_drive()
> doesn't require any knowledge of the PFlashCFI01 structure.
> Thus we can pass a generic DeviceState pointer.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/sbsa-ref.c        | 2 +-
>  hw/arm/virt.c            | 2 +-
>  hw/block/pflash_cfi01.c  | 6 +++---
>  hw/i386/pc_sysfw.c       | 2 +-
>  hw/riscv/virt.c          | 2 +-
>  include/hw/block/flash.h | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

