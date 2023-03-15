Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1846BA66E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 06:01:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcJFm-0003Pg-Fu; Wed, 15 Mar 2023 01:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pcJFR-0003Oi-Rw
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 01:00:33 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pcJFQ-0004GP-Ds
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 01:00:25 -0400
Received: by mail-vs1-xe36.google.com with SMTP id x14so15965057vso.9
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 22:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678856423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V8qde8LjeaeypmYOsNjzHp7YT4kcc8BP0kPGpeX11Zg=;
 b=qwX7KOf9tz006vYhJt3uvQt2HyiZALZWP780Z71ZCDs3Mq78VFZkWNWqj0upG9XsGd
 SvDbq+IVrXcFTFnVUEgZ5eMT2iYb7XlAt8wkiN97YgRcsZcW8It99p4DDBaueRoBimhk
 lCg9BnEWT51xzZcsa38pDYtV7nG3H3fcs1tKhzN/isYw1BHGt71tqOKBM4xSoFJQjZER
 SvzskagG42jYYRH/lchsn+hBJsms60GXj886HkJo82d+He0bvZlEeWjXx/z0CHSAP7x/
 WRd0z/9qm9rfEy/W3GIkoB8BO64/rsujJoyV1Q2u1wmT/0tpasESq9vNF9grYdWsb4oc
 iHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678856423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8qde8LjeaeypmYOsNjzHp7YT4kcc8BP0kPGpeX11Zg=;
 b=UiH4ERGsvp/i4gJr/lFe2bKx0aWUrteT+vp9QiuXp/CdAdVhIwvVcExqvFtUESXnSS
 O3gWfYt3ip/MNhSv0rG3in253BysxGTeCYPqlEFaGYWdh2VrTatk8feGvF3baf7t2lRG
 RR2CMxhgt1qD4jTUhrdwRLMFGfO30Zp8q99HEqgBsgu2BvkYzcowryqhztBU2P1jjmPE
 Zwhx3SmrfFRAsviQ03F2Y19Fs9gt2PujcePbaB+Sq8VbbqYFIP79+qh1MauW6fDTqMS3
 OHd+2H69HNyeeiV4gNJ27bWjfFWZHqTM1cJHgCfniX6ZLkjMWGy1VhBIucnyEcYFJL8d
 onkg==
X-Gm-Message-State: AO0yUKXptxsF7UdAb8yOIxWRPLozoBiA4XSaD8E95AEhxMYjvHyxMU0K
 7xcCIlPJZQIF00+BHG487HzKOUXz/FIurXn6X+c=
X-Google-Smtp-Source: AK7set/DCuparK2BXhiGs1MuwsISvtx8Tw2jALUh3vYMqfWklrm3A4E7akhW0M0w/WfBuVhPyotxDmT7tKPh4tPlPHo=
X-Received: by 2002:a67:e2d2:0:b0:423:e869:adbe with SMTP id
 i18-20020a67e2d2000000b00423e869adbemr7070162vsm.3.1678856423280; Tue, 14 Mar
 2023 22:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230307180708.302867-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20230307180708.302867-1-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Mar 2023 14:59:57 +1000
Message-ID: <CAKmqyKOOduh=D2dmNvP3BMqNqEnd_210Jo6=MaXfQ0mp165gYQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] target/riscv: refactor Zicond and reuse in
 XVentanaCondOps
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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

On Wed, Mar 8, 2023 at 4:09=E2=80=AFAM Philipp Tomsich <philipp.tomsich@vru=
ll.eu> wrote:
>
>
> After the original Zicond support was stuck/fell through the cracks on
> the mailing list at v3 (and a different implementation was merged in
> the meanwhile), we now refactor Zicond and then reuse it in
> XVentanaCondOps.
>
>
> Philipp Tomsich (2):
>   target/riscv: refactor Zicond support
>   target/riscv: redirect XVentanaCondOps to use the Zicond functions

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  MAINTAINERS                                   |  2 +-
>  target/riscv/insn_trans/trans_rvzicond.c.inc  | 36 +++++++++++--------
>  .../insn_trans/trans_xventanacondops.c.inc    | 18 ++--------
>  3 files changed, 25 insertions(+), 31 deletions(-)
>
> --
> 2.34.1
>
>

