Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC57527ADC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 01:22:39 +0200 (CEST)
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqNZO-0003oG-0X
	for lists+qemu-devel@lfdr.de; Sun, 15 May 2022 19:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nqNY8-00037b-2l
 for qemu-devel@nongnu.org; Sun, 15 May 2022 19:21:20 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nqNY6-0006Wf-Fo
 for qemu-devel@nongnu.org; Sun, 15 May 2022 19:21:19 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n10so25619813ejk.5
 for <qemu-devel@nongnu.org>; Sun, 15 May 2022 16:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=LE4t2XuO8kpNKFkJmN1z0ZPXkubVtrDi1+ldP43Wfv0=;
 b=KA2b3HigJFrbzJd2Fmwps8llBDYSRQ87bDGaO6yorfNwMRUEs9OxqPPA6wImzU4diW
 vrKYPui4xWxlRRqbJ7AaRBYteU7uOn0sgw6bNuzz74dDKKS/xFicL26tFkDiKJcbJV23
 1Bf8J6AR19Pjha1oGX4RvEDc3pqWnAGlPX9OuWiZuguhDDB/DnQYRXh8x34IW8zw6t60
 MXkq6AteOga7QbMChIyUsmluJSdALhiBHkyUSwbbC/7SmwYxMwT5ytg1h62KsX5i1QcR
 0SFjHWzA2OonCPz+P4uJ3FjtHGy+4ckE23Vu4hQJ+UyWYE0iZi87oEZPcSl+nJyaUt2C
 b7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LE4t2XuO8kpNKFkJmN1z0ZPXkubVtrDi1+ldP43Wfv0=;
 b=i2XzmKMI9ti9aVomLkiB/cQb9wm7x/cE2j2wl5MqHFLQR5pI/jRRYjXo9/mRNybwsc
 u+qR/WZIc2ax1O0vvx27gIr3ylBjIwedNhuXN9SQbq957zjOn48ugFxVGRDfos0qK0eI
 kmz7bFTvHIv56mZQjuVkG2NjHSBtni4E5RGIn0ULUhD2T8qYvPXq0Y3n5upd43LJgQuW
 DbH0kaMUVoBl5yEMOfeoj5k1Rg4uiRfUMrNMYbbstNc9NbQie4sK8aK1Zbdfq3MxULYx
 J2XSokk/AgwAoV9Wjb6AUl3du7kkVXFrxk9HAjDRfvUCl/DMrBLOmVQGEUfZIbwyEUEA
 mdxQ==
X-Gm-Message-State: AOAM531ecEEBLwUPBSkNfPrN93M0b3LqkghRaMLWRl9f1Acs57VG2dKI
 5+YRESj7V/ggXKdHhomZlUUNxzhrf/llw3MbNJP/eCyB
X-Google-Smtp-Source: ABdhPJw3U9gAo7DxrWoG04yPBSqzPRAd0kTt9KiNJdVj/PqFKyWvf7KmQf/mZNKv4tnJgikngK2znu4k5dcf19u5HGE=
X-Received: by 2002:a17:906:a188:b0:6f4:f5cd:27bd with SMTP id
 s8-20020a170906a18800b006f4f5cd27bdmr13307343ejy.406.1652656875311; Sun, 15
 May 2022 16:21:15 -0700 (PDT)
MIME-Version: 1.0
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Mon, 16 May 2022 08:21:03 +0900
Message-ID: <CANW9uyss4-NC3SH7xzofpMbu-cn4aDVT9Vvwjk6_JUzBwX4ioQ@mail.gmail.com>
Subject: CPUs supported by the sbsa-ref board
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leif,

I've so far only booted sbsa-ref with cortex-a57, is this only CPU
type supported by the board? I'm using TF-A's latest branch, but the
PLAT=qemu_sbsa is at this moment, kind of outdated.

Itaru.

