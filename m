Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC03661390
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 05:29:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pENIM-0000b2-PF; Sat, 07 Jan 2023 23:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pENIK-0000ac-DP
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 23:28:28 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pENII-0006iB-Gx
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 23:28:28 -0500
Received: by mail-ej1-x62c.google.com with SMTP id u9so12429144ejo.0
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 20:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vtv1ZKjpv/f/DBQNgNP1S3d8B7GnT+qaQoJDLF+RyW0=;
 b=McHvCnf7B6cd3MCvNe3IRfNJVgmiGXj7+ZQw+SKJcic5+3yb0b6hpzQ+ymcmWgU+Dv
 SE1iAoeYBx1QU9TueB2hxNU5jeJLZ1S+ZuCOdi6+YAtVQH6BLs1dTUdLzFNA6jKcTvur
 NoYVZWCOcM/2mD/H2/XXgYTfIuqT9+qRUjJNFMyb6Mgrg+V249leaTFQjIE/wRuzZxHf
 RhvzAaDa8GwN2Ev5ACQW66MsX1JU5C/hJkUkvdDQMox8Fj26Upgtp1dXLCIcEQspou0G
 /HKnAVrFAGxXYFtAaJ9S1Lt1TGB2m35+ryrw9rl04MJMKryYpEutSZTc83Ih/EtSi1va
 ZbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vtv1ZKjpv/f/DBQNgNP1S3d8B7GnT+qaQoJDLF+RyW0=;
 b=pdLDsMN9+z+p8eZtjzX3TFnNjBYRGcIAXDNKe0kiE/TecGP8TkGCpA82WnltNQOBiT
 NaiUJYkswKZUP8M0lCh1YQB9IHQBHHs0XoPEqgRJcQf7waH4l1FCWVLpbGMdrPrZVYdM
 2wJVbNR6AvE+u7LiPKewEQjiLCNPp95n4U5pyb843uNAo7BeNuK8VqSk90GtgyOgsr2I
 5aJdUSGu7Alp9hWqe4O7Km5vlEQryRyHm5zlcJg5z8nWbUTw1CFX4Pa4PJE0nrXzAXuX
 dEMjXLcpq3HSXkdZ58msfyc4Ry1yfsbR0Gk3KvBvTu3Dvc9bJchKxrjpZw6Lu6JSxTYv
 WPyQ==
X-Gm-Message-State: AFqh2kqJesF7RoTdFJzCixm0KB0Pyd0Ij0CN65Z3KGGZXIT9yEKP8xF0
 Up8jMKBSh35Gygs/d1jUJcZdNH1n8KHsaFsxBJY=
X-Google-Smtp-Source: AMrXdXvg6DErEqg8WMX2KGHoDSHTo6MjiuI5kZ93P1/FMkNj9/jEF0Ox07KWPeEmTo3OVbutRL50OgBFZIuEkSpDMec=
X-Received: by 2002:a17:906:824a:b0:7c1:6f0a:a2d6 with SMTP id
 f10-20020a170906824a00b007c16f0aa2d6mr6893632ejx.337.1673152104279; Sat, 07
 Jan 2023 20:28:24 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-2-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-2-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 12:28:14 +0800
Message-ID: <CAEUhbmVf+V46b9fM7DuztDsUpcfujQE0PDW=he2SAMZbnst58A@mail.gmail.com>
Subject: Re: [PATCH 01/20] hw/block: Pass DeviceState to pflash_cfi01_get_blk()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62c.google.com
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

On Thu, Jan 5, 2023 at 6:40 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> The point of a getter() function is to not expose the structure
> internal fields. Otherwise callers could simply access the
> PFlashCFI01::blk field.
>
> Have the callers pass a DeviceState* argument. The QOM
> type check is done in the callee.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/sbsa-ref.c        | 2 +-
>  hw/arm/virt.c            | 2 +-
>  hw/block/pflash_cfi01.c  | 4 +++-
>  hw/i386/pc_sysfw.c       | 4 ++--
>  include/hw/block/flash.h | 2 +-
>  5 files changed, 8 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

