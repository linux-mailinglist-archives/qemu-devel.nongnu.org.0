Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2996B3277
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 01:00:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paQA3-00008f-CR; Thu, 09 Mar 2023 18:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paQA1-0008Tk-Hd
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 18:59:01 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paQ9y-0008VM-Pw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 18:59:00 -0500
Received: by mail-vs1-xe30.google.com with SMTP id a3so3248605vsi.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 15:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678406337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJt2WmWGFOdkvcLJkHvf5/xpm7dG9Ah0hk44x7rAvvk=;
 b=PQAQt5RmlPKwOuLlsiq5e2UONSTz8smAblQX9nzwcmwe2Or50Z17pNHas7g1v64ex9
 HsnGO/eGbmjecWEW374pRjVLAK/PgEUUTQMmgxj4QIHIx5Qb4yv2NvFs1jKC7GJB1cQ/
 BSCy9yjyB8deYLXn/HHHraAnjYAuIwdzWJDnibJrZdleK3/EVWIqvmAihDU2UF2Ju8lk
 f8YWIu3d0wCC+x7FkfyhimZ3kDEvNC3U+1h2DxYfKfirYe3gDvT1f3iU05BK7Fs22/sm
 U0Q2K8o7/xAxsmCDjDnHNfzi4wOvjYKrk30Uy5SbPuLkpsvnl+Dpbjc5bLY3bQKHDtjv
 jLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678406337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GJt2WmWGFOdkvcLJkHvf5/xpm7dG9Ah0hk44x7rAvvk=;
 b=LzC3Q+D/ebbEdWuQ3KYSDYN0UsLFmvfXC/zP9h703Up7UeRJO/8AFzUUEFtbVbzR2F
 S0Sa590eHSw211bnfBOxG89E2Uo98KSPUJ3w2kPnnJsw5xX97DSLnOZ6NzlTd9hwO+V2
 KaFsHFcgfWvoWkgJ6u8gIaVFTo7+A1fqsjrIdrtQUVz66RkZO1j+GWqZLxgJ/m8mJ1VS
 vD5k6ZZd0LH/F4m35piF73eTw1m3aeJRp/H4Q1GAgls8heP9qBqsKyhDbUIAIGQX6wII
 AsKHkBjj5DvaYgXjshhXqBEDvBF9EXTHf3sLPzursy1XYp0WW5y8fLpsEdCFFrq6kzad
 3oHg==
X-Gm-Message-State: AO0yUKWAkW1H64iMkUY5ZUS/vFieGqwb/YJ9V1jLfmkdJQCtKr4XCiFT
 cCnNzvFm99uJW5BWakDYZiUyX4q2/xR20EL8L2I=
X-Google-Smtp-Source: AK7set92vJHVYx+frbj4+3uP/YgEdrywqiTMFoiWAVvjM29nRNyPHBPA62wD2UM2R020dqLjZGD6u6KewFmW3BGWlKg=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr15563349vsk.3.1678406337258; Thu, 09
 Mar 2023 15:58:57 -0800 (PST)
MIME-Version: 1.0
References: <CGME20230307095900epcms2p1df2efea65eb017c23449b7a20effb5c0@epcms2p1>
 <20230307095900epcms2p1df2efea65eb017c23449b7a20effb5c0@epcms2p1>
In-Reply-To: <20230307095900epcms2p1df2efea65eb017c23449b7a20effb5c0@epcms2p1>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Mar 2023 09:58:31 +1000
Message-ID: <CAKmqyKOmgE0BHDiayv52bzCX7tGGeaqX=fY_1_+ULQjz77NGcw@mail.gmail.com>
Subject: Re: [Question] Support RISC-V Board on QEMU
To: jh0703.kim@samsung.com
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?B?7Jyk7ISd7JiB?= <seok0.yoon@samsung.com>, 
 =?UTF-8?B?7KGw7ISx642V?= <sungduk.cho@samsung.com>, 
 =?UTF-8?B?66WY64+Z7Jqx?= <du.ryu@samsung.com>, 
 =?UTF-8?B?6rmA66O7?= <ruthk.kim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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

On Wed, Mar 8, 2023 at 12:10=E2=80=AFAM =EA=B9=80=EC=A7=84=ED=99=8D <jh0703=
.kim@samsung.com> wrote:
>
> Dear Developer of QEMU.
>
>
>
> I have a question to run QEMU by RISC-V board.
>
>
>
> Currently, sifive has "HiFive Unleashed" and "HiFive Unmatched" boards.
>
>
>
> HiFive Unleashed board is set when executed with "-M sifive_u" option in =
QEMU (v7.2.0).
>
>
>
> And the official guide of QEMU is also the guide of "HiFive Unleashed". (=
https://www.qemu.org/docs/master/system/riscv/sifive_u.html)
>
>
>
> QEMU currently supports the HiFive Unmatched board? and if so, is there a=
 guide?

QEMU doesn't support the HiFive Unmatched. Most QEMU users end up
using the virt board, as it has the most extensions (more than any
physical board).

Alistair

>
>
>
> Thank you.
>
>
>
>

