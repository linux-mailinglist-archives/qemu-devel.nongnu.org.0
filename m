Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EC96D739A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 07:03:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjvIF-0008NK-09; Wed, 05 Apr 2023 01:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvI1-0008Ml-EG
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 01:02:37 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvHx-0000IC-6m
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 01:02:33 -0400
Received: by mail-vs1-xe33.google.com with SMTP id h27so30447610vsa.1
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 22:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680670946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LGwRoVP1Vl01VWEiEJ8t6A70sClpk4r6c0Clt0CKsYI=;
 b=bUyMAhIB6BjI+j+b1P8RHdLcZEUFfrhBLmgxdblZfW3WUslWu858zOajfXYusXNuGt
 yOMCnsksH8cWWLqubxyZsUrWwJDpjpcTe/XNN3/JiMkXf+EGk7HX9TdOsIMNgKVq6Lvg
 fKJEDu35SwdBbeDncLlMLotU0i7VkuqwCdxm9gyczPTPIknJoHAbtvnpRRU0T9ASEgRh
 cCC6JJWLIqsmV+w1YVI1o8GEC7OcBKDO4cFXBbVetKOcb2xUCdfFx2loPR/WKAt6yT8K
 eqluGVMr57Ntewl/YUmq/UIOyE6WHm7jwR4ttU0cw9SI7PRflvdtVjXaVoQIphlO8PBP
 yvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680670946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LGwRoVP1Vl01VWEiEJ8t6A70sClpk4r6c0Clt0CKsYI=;
 b=pbeOC76X8N4yPo7rkPxpc9Dk+dpCZeZjCOuw6DE9ma0FwUl8SAb9g0oms2VBj0LjoU
 sOk4i88HRKPPk9uLqnop8A+8KSOhsIWnuC4JUP7iqjFT0ylQO3nbUkEO7cRYEksUtyjv
 Ld6bSPWM4Rztn9hPr11TUiLUbxUklwRifUT6Rj7HcpuEknnERFFRy0tzWjgD9Lc7lXu8
 M+IwU4bZ/MVJCkQ3EAeDGo1z8WxK4TGkfi9YyNac1iUiOJt+rDBpvJy51AVueg8k49Tx
 b90w0wdK5+Y4sK4uDZ1OMqUfaamGzBhv2OBpcMr6a+oU8eNu4PjLK2GuKMkZarwjVoCp
 cbNg==
X-Gm-Message-State: AAQBX9cGsMftLHRf7wjbulVlXfh6bwnHmBLAXmLedqXKJxGNTBbKPnki
 UJAMO1ZvM+rvljy8A4xqenmZ0LDkiiruKSjYa7E=
X-Google-Smtp-Source: AKy350YddGSIxSXMtpX3wcfSKrDRO/xPfMhLRuMC2Cuhf7KXMJHVdqjRDZcLgBl3oYYMGLDP2qhcVr5K7z0YRRJNAVo=
X-Received: by 2002:a67:e106:0:b0:402:999f:51dd with SMTP id
 d6-20020a67e106000000b00402999f51ddmr4134825vsl.3.1680670946323; Tue, 04 Apr
 2023 22:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230206234220.8414-1-dongli.zhang@oracle.com>
In-Reply-To: <20230206234220.8414-1-dongli.zhang@oracle.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:02:00 +1000
Message-ID: <CAKmqyKNosXyarcem0USvbtFUk93Xw_CbKhZPNom88iJwRTgu4w@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/core/cpu: always print cpu index with cpu state
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, richard.henderson@linaro.org, 
 pbonzini@redhat.com, joe.jin@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Feb 7, 2023 at 9:46=E2=80=AFAM Dongli Zhang <dongli.zhang@oracle.co=
m> wrote:
>
> The cpu_dump_state() does not print the cpu index. When the
> cpu_dump_state() is invoked due to the KVM failure, we are not able to te=
ll
> from which CPU the state is. The below is an example.
>
> KVM internal error. Suberror: 764064
> RAX=3D0000000000000002 RBX=3Dffff8a9e57c38400 RCX=3D00000000ffffffff RDX=
=3Dffff8a9cc00ba8a0
> RSI=3D0000000000000003 RDI=3Dffff8a9e57c38400 RBP=3Dffffb6120c5b3c50 RSP=
=3Dffffb6120c5b3c40
> R8 =3D0000000000000000 R9 =3Dffff8a9cc00ba8a0 R10=3Dffffffff8e467350 R11=
=3D0000000000000007
> R12=3D000000000000000a R13=3Dffffffff8f987e25 R14=3Dffffffff8f988a01 R15=
=3D0000000000000000
> RIP=3Dffffffff8e51bb04 RFL=3D00010046 [---Z-P-] CPL=3D0 II=3D0 A20=3D1 SM=
M=3D0 HLT=3D0
> ES =3D0000 0000000000000000 ffffffff 00c00000
> CS =3D0010 0000000000000000 ffffffff 00a09b00 DPL=3D0 CS64 [-RA]
> SS =3D0000 0000000000000000 ffffffff 00c00000
> DS =3D0000 0000000000000000 ffffffff 00c00000
> FS =3D0000 0000000000000000 ffffffff 00c00000
> GS =3D0000 ffff8ac27fcc0000 ffffffff 00c00000
> LDT=3D0000 0000000000000000 ffffffff 00c00000
> TR =3D0040 fffffe0000096000 0000206f 00008b00 DPL=3D0 TSS64-busy
> GDT=3D     fffffe0000094000 0000007f
> IDT=3D     fffffe0000000000 00000fff
> CR0=3D80050033 CR2=3D0000000000000000 CR3=3D00000010ca40a001 CR4=3D003606=
e0
> DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=
=3D0000000000000000
> DR6=3D00000000fffe0ff0 DR7=3D0000000000000400
> EFER=3D0000000000000d01
> Code=3D0f 1f ... ...
>
> Print the cpu->cpu_index in cpu_dump_state() and remove it from the calle=
r.
>
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>

Any more comments or thoughts?

Alistair

