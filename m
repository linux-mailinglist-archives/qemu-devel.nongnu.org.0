Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA82238E0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 12:03:28 +0200 (CEST)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwNDD-0002Jh-M5
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 06:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jwNCS-0001kg-DT
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 06:02:40 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:34431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jwNCQ-0002x4-Lw
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 06:02:40 -0400
Received: by mail-oi1-x234.google.com with SMTP id e4so7579019oib.1
 for <qemu-devel@nongnu.org>; Fri, 17 Jul 2020 03:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fvtL2cEZfTwYxwxU6O/wodby8Mkm2bnZO2ToV9MOAFI=;
 b=na4sV8gtphwHQBgPZtig7YoDehfkhH5icpro8yMlU6A/zvqCuiutwKfN2Pol+PitoZ
 Lr2O3HkuCT11VPlRizvjibkspI6fT7/KMkS+2mdLQPZk+81cI92D6Z+vyRfkqDms8kkT
 v2JWAizKN458jNwa94iNrBE6xOAKPpJEj5b5jvIHSsh9poG4biL5bpFitxoGxvV/l/sL
 SCKi/kF9Je+bD0jmhp/0YNP3d/TpoXiKorpbfeJefl4Hy0BPsI5hyg3j+lfIu7LMUrCf
 VB5GbYx1BUFYogJtmvh2kw0tE5c+LQYNaEC+E6FN/JSiGvS2WoWd6EnZxtJWycgS9bP5
 yNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fvtL2cEZfTwYxwxU6O/wodby8Mkm2bnZO2ToV9MOAFI=;
 b=mR36dfj6qJFFlZU22nSA7Chk3EiM0nNwUtiBhiwxfQ4hwVZN2Ywp40FsdBa95MsuOh
 9bEguyE8enP/Qk9/ZEv9BSdxHS86e/hqnSP6L9TcPBULsa2e8z6UfVu4aCCLx5n19tpf
 nKdc32M18WED//lgWHNgBzXo1+hBf98CP+j5diaslFOW3oUXPKRapjEby6onATOgO5GG
 1ot/wF3xu47ZDWzKOQltjnmUW4dlqvXscIoE6srbSNXqPL0Sr+xTPuJGwAmgx4ozSoBW
 exYY/ijNsLKK0r9SigB+Xczmha0rF1a2MSesk4jAOdtBS/U238oOYGTa5DYV+1m1viuq
 Ryxw==
X-Gm-Message-State: AOAM531UUlAS9R5tCpxh097+H17H21B3AqAHjCqeURXH/qBW+glGu0Tk
 vNQS9TJq5q3ogARVUvoDN1edYDAbTLwZ7fTPDxU=
X-Google-Smtp-Source: ABdhPJwg2ykmR9Ov8MW2FBItIaSuiXIJeNrUyJssUoem0GncDpbff8RtvOL3MwXBGT43ZuTcFQTzO0mQBJrOIPfC5x0=
X-Received: by 2002:aca:524c:: with SMTP id g73mr6769044oib.150.1594980157118; 
 Fri, 17 Jul 2020 03:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200716192335.1212638-1-ppandit@redhat.com>
 <CAKXe6SKL3aNiOKKLEMof6GGNjYLcX9fvfSf-0PBSX48rh4--FQ@mail.gmail.com>
 <20200717012151.tlfmc6hsfia22f4e@mozz.bu.edu>
 <4e4909ae-db2f-4a32-ae5c-d52149e80a8c@redhat.com>
 <nycvar.YSQ.7.78.906.2007171016480.950384@xnncv>
 <3620abab-a464-8e3c-d5b9-0bd80b35e2f1@redhat.com>
 <nycvar.YSQ.7.78.906.2007171326100.4380@xnncv>
In-Reply-To: <nycvar.YSQ.7.78.906.2007171326100.4380@xnncv>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 17 Jul 2020 18:02:00 +0800
Message-ID: <CAKXe6SJbJaEepRVFtNy=5fhJrw8+Gax=mcwFuhfXrHTgo+wmog@mail.gmail.com>
Subject: Re: [PATCH] net: check payload length limit for all frames
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x234.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

P J P <ppandit@redhat.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=8817=E6=97=A5=E5=
=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=885:09=E5=86=99=E9=81=93=EF=BC=9A
>
> +-- On Fri, 17 Jul 2020, Jason Wang wrote --+
> | Thanks but I don't see a direct relation between 64K limit and this
> | calltrace. Maybe you can elaborate more on this?
>
> The use-after-free is not function of the size per say; The reproducer gi=
ven
> sends large(>64k) packets via loopback interface with gso_type=3Dnone(0).=
 The
> proposed patch helps to fix it. The large size & payload_len may result i=
n
> other oob kind of access issues too I think.
>
> @Alex, would it be possible to share the reproduces on the upstream bug
> LP#1886362?

The reproducer of LP#1886362 is here:
--> https://bugs.launchpad.net/qemu/+bug/1886362

Maybe you mean the reproducer of your patch?
If you or Alex could share it, I'm glad to analysis this issue.

Thanks,
Li Qiang

>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
>

