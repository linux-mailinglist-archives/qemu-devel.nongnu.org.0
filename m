Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3906613F1C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:41:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbak-0004np-Bh; Mon, 31 Oct 2022 16:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opbaf-0004gS-VT
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:41:02 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opbad-00023U-5e
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:41:01 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id f205so15108340yba.2
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 13:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I8nBGd1WeWILQ32BhDC+FfHtdB5B9+fqD2EY1tA46Nk=;
 b=eaKYHpUGUQXotc2lQTfiCX4gCJGVmyQR8I8PM3Hkc/LpNgbzKxetgYx1FfBJ2QgIhn
 cgQz954Mpy4UiJ+EZ9WbxS5BInNafPFSOVNK4ntktNofuiCRVwSrBuz3IR4K39FyxcX8
 aOBZd4N/iNUsck5C1J7LPaiEb308SDGsqE8xhPAxq+gkE+uFxjTmJghIcXogP5ufwYvb
 rhTZsSp9GB1xO9pMTirllM9NWJCHO5fYjNPMmt91GxWm2XBrqTRZCyeXsduyvk6nskho
 evnxU6TXY8aUOpTmy5vA+EJ+tVtN7KWQtq7dSNcmyyDEA2WjUGaHzd584vKhKRdsx0Bw
 BW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I8nBGd1WeWILQ32BhDC+FfHtdB5B9+fqD2EY1tA46Nk=;
 b=AmHGRu0N+7p9ORvpTX4Yg8lx2Fl3qZXs9Hys4sMtZnRYrcKyxNhFzBg3+SAs8hCucs
 J4t8zKgzIaBaozQhUnK4Mt2eAASBioNGZZ6EqcM5jn9Mt32k4VMErS/H/jICRDyuxXoP
 UTGokG2bFs6MPv8bfS0So9YHkb7H43R2DQxe+UlPHr/hYTmAJ/VDdNOXR7r/CJFRvKgt
 EINoeXzpyb7zwCp23D5EgQZJ9dM7rmTuLunEl9Rpqf5xMBUuwcUdESDZ3x+jtD2Cg/UF
 9BrKbOF5vtYkxN4XKnZG4QCwFUjYK/vvrOU6UlNsv2jVG6qQOVvKntZ03diYF/NBx+90
 JsJg==
X-Gm-Message-State: ACrzQf2IT+EECKIbqSzedFL3ngvPbE8OgJnxozC8vyK4FKkK/h94AerO
 jz7/3SZo5S8pViL5wIbSxoipEw+epUn/ij/lWm0=
X-Google-Smtp-Source: AMsMyM6g32ENXvjfEuWav5mMcbdOTO6qa75tbFKyVDJIQMxkvbkbmQRL2kJ8P+GMhupKjspwKsbiiiRWgILxHxz5ZXw=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr14970297ybe.642.1667248857904; Mon, 31
 Oct 2022 13:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221031124928.128475-1-mst@redhat.com>
 <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
 <CAJSP0QUPg2pMZ1Waxwz-gQM+ObmudiuPvPGbY2anzVf6GBLWZg@mail.gmail.com>
 <20221031163608-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221031163608-mutt-send-email-mst@kernel.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 16:40:46 -0400
Message-ID: <CAJSP0QV=afgvy2+6ptvJ7xkgiHureb6H0JuHG1Et5t3ExBda_A@mail.gmail.com>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 at 16:37, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 31, 2022 at 04:12:24PM -0400, Stefan Hajnoczi wrote:
> > Another CI failure:
> > https://gitlab.com/qemu-project/qemu/-/jobs/3253817492
> >
> > Stefan
>
> Thanks!
> Freeze rules only require pull request on list so I think it's ok if I
> handle the failout and resubmit day after tomorrow, right?

Yes, exactly. That's fine!
https://wiki.qemu.org/Planning/SoftFeatureFreeze

Happy Election Day :)

Stefan

