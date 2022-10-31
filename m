Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065F6138DB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 15:19:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opVc9-0004oU-O7; Mon, 31 Oct 2022 10:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opVby-0004he-Ja
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 10:18:03 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opVbw-0000Zs-Ua
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 10:17:58 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id 63so13859638ybq.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 07:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tnygsqo/zo0Z1A6MEP0e0zwomV2N/X2OEO5k1E3a/HM=;
 b=bx55y7dmu0s82XUuOUEHW8DY5EFRrBhQhZghRY8RT0L+6508UQpf+8RthErbLWpEtZ
 rY1Fz5C7QqZJ6nZ+rtsu37lOfhYlcbY9J0uT9htTsSHPL8Y3oSZH9SDqQr8HZf3E0Ng+
 +QGG3efKPv0pKwXwgQWMjQL1Ax5ktuPKLE001SQXn0mDpTjE4eLvLFP+TFQpDNe50LP+
 wp9iM6zqULiRMXwmYQ+QCB81KTsp4wb7/vGxLHyJ2TYQQol6XiL7pacMp1Z0hlg6wh5e
 08U2vdNkNQN6FwnNsPZ/YUE9O5bry6YwZfYYMlM+/JwkEAKPE+d/y2rrCPE5aX9jhh1F
 tnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tnygsqo/zo0Z1A6MEP0e0zwomV2N/X2OEO5k1E3a/HM=;
 b=MR9Ff3lvUUCmxHFqRMxL+qPRV0D51Z8XaZ2vicw30gcm7Vlu2zrB/gAvHipIu1WmXr
 Krgb4tC00ywd5ofb+JRUPF4608CAwO2L90EqbzAviB4ksZyGV/nxCxmpbU1AIOS86Tig
 sPHWB353YcbkHUnsXUlb0eI/1F21SjmNkXt7LB0tIBTECMA9HZwEwTYTlzUyuQaDvgrn
 mV/jw6NMOo7/7c5trqwKLPoDHrgMnmXJaGKrJoTzO7SWu3IQIxQGrOHdpZ1t6DfqsGmd
 nI95TvaZMrEdyETFmmGE6k5fGD6gEVWBYd0V/EVMKw/Rw3Z1JCgAkcw8AsIP9Xkkj7EK
 7OMA==
X-Gm-Message-State: ACrzQf2qUnpyUPyR/R0+dod+jcBMZQ0hpwJCMfOR3H5aELJkc4oiFwsT
 K/Wo41FQdPnNkfMqp17+svSnWhPCBP87G47aygs=
X-Google-Smtp-Source: AMsMyM4LMO5hatxHDKxdKZnq57tqm1fgwtBcDR350dw1m2eU5T/t79z0yv0C974+DvNo5hgQ3aOFQJZDKWMc1rek+Xs=
X-Received: by 2002:a25:8d0b:0:b0:6cc:d066:9e75 with SMTP id
 n11-20020a258d0b000000b006ccd0669e75mr1242834ybl.366.1667225875752; Mon, 31
 Oct 2022 07:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221028174546.88683-1-imp@bsdimp.com>
 <CAJSP0QUbek3kWrWbWMoqKcQspL94vK9Xy7jFqmihGD86_pV-tw@mail.gmail.com>
 <CANCZdfr_gPtznH+5HfWoz-01K-2mOzKsUiGdVPBFDMry01xWFQ@mail.gmail.com>
In-Reply-To: <CANCZdfr_gPtznH+5HfWoz-01K-2mOzKsUiGdVPBFDMry01xWFQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 10:17:43 -0400
Message-ID: <CAJSP0QXT2NqVJFhpAS2g9Eq_vLd+h27wGZ-BnR3jddagAmdANQ@mail.gmail.com>
Subject: Re: [PULL 0/1] Imp 202210 patches
To: Warner Losh <imp@bsdimp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 John Baldwin <jhb@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2f.google.com
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

On Mon, 31 Oct 2022 at 09:19, Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Mon, Oct 31, 2022, 4:34 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> On Fri, 28 Oct 2022 at 13:46, Warner Losh <imp@bsdimp.com> wrote:
>> >
>> > The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:
>> >
>> >   Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)
>> >
>> > are available in the Git repository at:
>> >
>> >   ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git tags/imp-202210-pull-request
>>
>> Hi Warner,
>> Please use https://github.com/qemu-bsd-user/qemu-bsd-user.git instead
>> of an ssh URL. That way anonymous fetching works for people without
>> GitHub accounts. Thanks!
>
>
>
> Will do in the future. It's trivial to convert. Do I need to resubmit this pull request for something so trivial?

No, that's not necessary. I have already merged it into the staging
branch. Thanks!

Stefan

