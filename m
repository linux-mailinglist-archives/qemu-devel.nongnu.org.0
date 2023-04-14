Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451446E1BE4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:48:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCHV-0005SV-TU; Fri, 14 Apr 2023 01:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCHQ-0005Rk-Fs
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:47:28 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCHO-00078V-Du
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:47:28 -0400
Received: by mail-qt1-x82e.google.com with SMTP id a23so13474875qtj.8
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681451244; x=1684043244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gp4IEfmtgOUZmewdFeuGXbSFVBcCBbDalI9UfnJAhRQ=;
 b=k1VaFeiiBehvt0b4fiGRD/b1QvYDyv3ujiM1zR3Y4a+/N2RTTh2Wvuz5dBJLmZZqtG
 /s9vmBI5oew/hjsf+LWJuz9rCl9ShsTx2MZ5HjzaUChsdBcgZ1IOkFv/qdMwCfcTn8DG
 qZsvTyBgwSYZ4Pr9+qTeOVEzayO3eMg+Lj+R42uh0ep1X1Gj6iqD5Rl8cm9TCYjgRft5
 DA15DhBvu8G4rnoqS7QbrztWVc5Qyt0tFpI9fLP7U8oZq+bS2vRqgktn7x+J354S2hBE
 KGWlWQeYTETw4nxQxzxsr/BPkrSmZTlYDk4gy8IHRTC1AJ0BOl9kXz+nnHpkpEJGvKZP
 FJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681451244; x=1684043244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gp4IEfmtgOUZmewdFeuGXbSFVBcCBbDalI9UfnJAhRQ=;
 b=TUCcyYfYrmclArjoPu8SE76kwU5pkWLybUFQ2Hi1V/7h0BPcIdNxBuxZk87XYdsT3i
 Zgz3gVblxyTnTL+MoxMhmB8dB2laseai/CNPnba4QRz4f8PkxXBi9ohk7uhLorDCxGhC
 kaBj2Dl+znDgLewe2CHU04RQ/seVe2oeh386s2BoVXWn/7JAcHkjs2hEM4dgE7X3sVVi
 uRqc6fkUPN+uuO9wAmplsA3/EHDcGbVfon4bOmU3hwkHo0CmN75mfie8z7kAfHf7m1Ym
 Y9yQiUyNzJyg9N4YghHrd72+4dCB9yecJ7nDNco79E5mGNeEkDbh5iiEKYwCRK5y8OXc
 LzgA==
X-Gm-Message-State: AAQBX9dAaElH0xMP2yGCfwtLr7gLQOXp0eQAiuR0dtvSBNehD+ja3dUJ
 L/I7zzfI63OovahC+E8GeekhicUV95G8IaferGco8g==
X-Google-Smtp-Source: AKy350biwafv/sIatgignLGelmelwU/Fo7w2f4Mr6xkvXMURRDIpBMklbnekOQiKe9nzrszVtLPQwRg1WrM0taarH6c=
X-Received: by 2002:a05:622a:1055:b0:3e3:8172:ff23 with SMTP id
 f21-20020a05622a105500b003e38172ff23mr1374971qte.13.1681451244659; Thu, 13
 Apr 2023 22:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
 <20230410141316.3317474-3-mchitale@ventanamicro.com>
 <58021b23-dc58-bf3f-b83e-ddaa5be90e14@linaro.org>
In-Reply-To: <58021b23-dc58-bf3f-b83e-ddaa5be90e14@linaro.org>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 14 Apr 2023 11:16:48 +0530
Message-ID: <CAN37VV4QqDJjMjaDt9GjeZweXTXQHGcTLG6VhkfWtoWkfV7h6g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] target/riscv: Add fcsr field in tb->flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Apr 11, 2023 at 7:17=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/10/23 07:13, Mayuresh Chitale wrote:
> > The state of smstateen0.FCSR bit impacts the execution of floating poin=
t
> > instructions when misa.F=3D=3D0. Add a field in the tb->flags which sto=
res
> > the current state of smstateen0.fcsr and will be used by floating point
> > translation routines.
>
> Are you certain that you require a new bit?
>
> Could the same effect be achieved by forcing one or more of the existing
> TB_FLAGS.{FS,HS_FS} fields to 0 within cpu_get_tb_cpu_state?  I.e. for th=
e purposes of
> translation, pretend the FS state is DISABLED?
Yes, that is correct.
>
> These bits are scarce, are we are nearly out.
>
>
> r~
>

