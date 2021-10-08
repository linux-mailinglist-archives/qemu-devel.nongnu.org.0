Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8A942670B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 11:42:22 +0200 (CEST)
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYmOT-0002cB-0R
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 05:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYmM7-00016X-Lv
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 05:39:55 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYmM6-0007fJ-1v
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 05:39:55 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v25so27791966wra.2
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pq2uTY2UsQZFlM38Oubsafd5rDgJBlBfbxHGvADF2DU=;
 b=kwHE1X1obJisdYfzJxDaAqLCnmhGQVHS45Awn5BmE/64cSvDoU8L/iORectRy3dhra
 PfJCtrQeSqLVCP/h1w8eJOX/Fnovb89ZPI1fCwIkO1/lxd8X9VQUH+cYRNgnyiwAuLTq
 hP947hQACd7VR/Ef/W05QmIUpNLrVX71ascq34SuCial8sGIeUvQE4DTNjj28gcVoChy
 eoyAYlrSAFLx2Z5MTejvMSJi2wWWYZbYeUCh3NTLLure9MHfT+6b3y7MKjbLbTB3c3jY
 TDb2o2YI9Uy8gjBL3oQv8YwHAfhIbL+QKbgiAQU8araDWPUcc7l4gYhJCgEmSwdkMH7I
 wkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pq2uTY2UsQZFlM38Oubsafd5rDgJBlBfbxHGvADF2DU=;
 b=0wfy3EpI1piNJJ3Qq+OZh1AcC9/MP8Pd6EtWeb8x5ngIf7yoeIDd4lPRfLaoE+QDAg
 ytCEvM3ANpfqNuvKSCH77/aFxo12wVt4gMKO8sEeBLKhgBTRyqrST4wtOJRJ2vOUgFrG
 zadYkQqv+dG0E33s6fswzdASwmJ7Fr00r6bWVblJpNdrBfSE11nv8KKwjPT0i8BGZOXs
 sjvTatnm71jYMBNkd3kr2L4tkrL9WFnzAzawF7Wzic5p1LZd4NTLcgmJUH/PR+e8ltA+
 +BdCeCseH+BAaS9r5u1Yh9UCUR2BPT5D/FzW50eKXniu/H8L8yMmd0scNX0XPSA0lmsP
 t7Bw==
X-Gm-Message-State: AOAM532XRV3GvNPKs/8CZtlLQasBDRR0DgzL0dNTr4x9JmsVq0AjN4nT
 ICiKeW19XZ0CHex03wF5FhmEbA==
X-Google-Smtp-Source: ABdhPJwE6NXfsU6npkbAxDpV54YH0VtjVF+6N4lN0Rpmqhlge+OF4D8Be8/V/mHlr0L8SYgI7oKkxg==
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr2712324wri.323.1633685992193; 
 Fri, 08 Oct 2021 02:39:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 189sm12527747wmz.27.2021.10.08.02.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 02:39:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92B1B1FF96;
 Fri,  8 Oct 2021 10:39:50 +0100 (BST)
References: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH] hw/arm/sbsa-ref: Fixed cpu type error message typo.
Date: Fri, 08 Oct 2021 10:39:34 +0100
In-reply-to: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
Message-ID: <87tuhrdfdl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, rad@semihalf.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shuuichirou Ishii <ishii.shuuichir@fujitsu.com> writes:

> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  hw/arm/sbsa-ref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 509c5f09b4..358714bd3e 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -670,7 +670,7 @@ static void sbsa_ref_init(MachineState *machine)
>      int n, sbsa_max_cpus;
>=20=20
>      if (!cpu_type_valid(machine->cpu_type)) {
> -        error_report("mach-virt: CPU type %s not supported", machine->cp=
u_type);
> +        error_report("sbsa-ref: CPU type %s not supported", machine->cpu=
_type);
>          exit(1);
>      }

copy and paste detected ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

