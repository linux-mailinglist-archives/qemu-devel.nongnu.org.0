Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B59C6EE1AA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:12:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prHWT-0004DK-LD; Tue, 25 Apr 2023 08:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1prHWR-0004Cx-BH
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:11:51 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1prHWP-0002Kp-Ky
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:11:51 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so42589549a12.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 05:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682424706; x=1685016706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/MGd1hg+r8NTF4tigrqq/9p2wpAxCdlJfUq9I+/V4U=;
 b=TdWhHmQSB60iR/kcf/uZ4jrTF/sDMSW3tDyfwe7nRsPHdgRn//Y/GY4Y1qm0q/cxkI
 eUJLT4NQkYFXCXDp+NDerfM+cM+FN9Ky+XhErJnS3S5TRMdIQjU0yhyIcphnB9zEEaNV
 cUVJCLjTpst0ntoVnKiIjG50SKryorgpSsl+e+VPnRuirqEPqHutrlpcdq0jN9gl5guJ
 T8RSQtLIfgbrsAxia+Ii5VSoh5H1ed36+vXzMff8KgXJ+/+/sG8irFraAF0f4U6LIheJ
 7TJNwUiiG48+W6MHYBhr4AQ9ZMRrkSiZ5w6ObRHTubYHYUp2Sh9TelkBc3gd7QWRx9n9
 OQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682424706; x=1685016706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/MGd1hg+r8NTF4tigrqq/9p2wpAxCdlJfUq9I+/V4U=;
 b=Mp2mGR89N3D+MwA66xg+QpMCnb0bCqxvp5roxJgDfulrEbrJGNJEF8KMOY7IcQGfaq
 aPsc6NmIsz55Hoecit3PysJpoSjtkq9UDAhdMxKVc8BBTy/KXV+NStrUJD2Fn/nl2HO3
 /4fNk23SSJvObQbybCszo/o3UUjqnqrp4KgMArHENpIu9uDAyvEMaUYF58qI4jCcOKZH
 JtgY5VLmBUWwtaExrdEeKMeZYc0snDa+p+SPM7qgVNuYNXywh2Vh0Xk8r9Ejk3ki3w9k
 c7IaikKFDFYAqWYLMJjqm/XYakkdMHCswBGz7dUA3R1UFcHMHqz6/HOIFKofbDHwMsiA
 5Wdw==
X-Gm-Message-State: AAQBX9e8CE+xygytqPzoNMqpOhby1gTPYt8QkiiIQTNe8ixSfzq3Xx8V
 rOgVJJPJFvSHKkn7eqZXnK3yS3i8HejRZAaXulr12g==
X-Google-Smtp-Source: AKy350axKUCY35ZigAbbA+32Edq2amXkWJgpYDRSeXAaXJO0ytqZFZfSP96h+/OJC6Uubr1tKCeAUunqUsMEilQBKYs=
X-Received: by 2002:a05:6402:2812:b0:506:974d:e7dd with SMTP id
 h18-20020a056402281200b00506974de7ddmr20514971ede.12.1682424706512; Tue, 25
 Apr 2023 05:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <87mt2wgpn4.fsf@secure.mitica>
In-Reply-To: <87mt2wgpn4.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Apr 2023 13:11:35 +0100
Message-ID: <CAFEAcA9jj8jOqky0dmkin80BW85JH8dUkHuoe_0ORO97LhJHgQ@mail.gmail.com>
Subject: Re: Warning on Fedora 38
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 25 Apr 2023 at 12:37, Juan Quintela <quintela@redhat.com> wrote:
>
>
> Hi
>
> I got this warning/error when switching to F38:
>
> In file included from /mnt/code/qemu/full/include/block/aio.h:21,
>                  from ../../../../mnt/code/qemu/full/util/async.c:28:
> ../../../../mnt/code/qemu/full/util/async.c: In function =E2=80=98aio_bh_=
poll=E2=80=99:
> /mnt/code/qemu/full/include/qemu/queue.h:303:22: error: storing the addre=
ss of local variable =E2=80=98slice=E2=80=99 in =E2=80=98*ctx.bh_slice_list=
.sqh_last=E2=80=99 [-Werror=3Ddangling-pointer=3D]

Patch already on list:
https://lore.kernel.org/qemu-devel/20230420202939.1982044-1-clg@kaod.org/

-- PMM

