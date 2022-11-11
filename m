Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABF4624EBF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 01:13:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otHe9-00074e-K9; Thu, 10 Nov 2022 19:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1otHe7-00074U-W5
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 19:11:48 -0500
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1otHe6-00043o-EN
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 19:11:47 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id n18so2535911qvt.11
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 16:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VS2akhlJb7QmIJqu1zylx0IRp3hzIvl3bPg+uOgY5bA=;
 b=g8XdEwqtn28mo0GidIpkHi6farHUax3wXIIEvwJE5EhAHi84IxB5Ma07ZAqj97teST
 M4s1tDQyuJ/xbBLE2nebqZeO5bXv8HjVtLWhhzQnwTlRAGdAnOd5FIcXsNbcgMqkbkZ0
 9FewDrv5fpuLB3q8a+Crz6s+2p1yk3yG5yGKAjxcwOKjhHApgY0lFWa9hp/ArROctrot
 vJbWdCcd8N2bs1SoNqAemowH++FO7Zko2Es0/9tw1A+uZfKUSuC7ho9ZL+SlhWG87nLN
 1V2RSzgmD8+g1ls02KgfllGeBhcXx5Qu3gEzERfsY5yUgSNXaP/Z7nnS1Rt/Dsm4Ri1l
 gRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VS2akhlJb7QmIJqu1zylx0IRp3hzIvl3bPg+uOgY5bA=;
 b=wERtSLai9Xpzu57vN9Oi9+ojOoh5YP1BVGXeDtFSUn5EI3gXQMfP1+siK/opqjEEfX
 nfJaJNfRMoobt7Y/8UnVpuUNWuL2HJOq04bL3pqnP3i1GP4KQNF38yZeFf8davoM5bUd
 KvFg3moPICHrkndzUyZ33DKb6N1qYxFrDPCqU+XaH2kieNyo6pA3eJaAv510SSNFfihD
 Ljddnj6Qoe7owYOHAIQYZM00Q6QA925nukmQD11ibY4rAY29baff4O7u1f9pRhZ7BHEa
 KbHnKou1bSAgFWpHOIz76Cfe+dU8XCw3rj7sM2xBGJ6WaDqGfqBWk0HC2o1VM3V8OQWy
 Ic/w==
X-Gm-Message-State: ANoB5pkdiCh9kyNQJcPnnuyilPmMwiyEYsPKEPNvxfMRmGgo976a0d9S
 uOUb70wx+FGZH5gl33o7S/m/ld+1MKRjWNGL+3k=
X-Google-Smtp-Source: AA0mqf6483ByU2nUnw2tq3Fw+t5z7Ai3yaAINIJb39S6tJ7BhoFTLWEW5R5rgQfvj9LoWfMy/N+NDBUpbXWGFcRWBek=
X-Received: by 2002:a05:6214:5d8d:b0:4bb:6ef4:d024 with SMTP id
 mf13-20020a0562145d8d00b004bb6ef4d024mr99735qvb.85.1668125504444; Thu, 10 Nov
 2022 16:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20221025141015.612291-1-bin.meng@windriver.com>
 <CAJ+F1CKueW5uhTe8CCdnthJmmaLO7vvHtANqZ4N6wUjGc9qpGQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CKueW5uhTe8CCdnthJmmaLO7vvHtANqZ4N6wUjGc9qpGQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 11 Nov 2022 08:11:33 +0800
Message-ID: <CAEUhbmWhWhhXJeCuWGLS6JCHg-LoRiWKFCq7KRjGNA1cENYA8Q@mail.gmail.com>
Subject: Re: [PATCH] chardev/char-win-stdio: Pass Ctrl+C to guest with a
 multiplexed monitor
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 26, 2022 at 3:39 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> On Tue, Oct 25, 2022 at 6:15 PM Bin Meng <bin.meng@windriver.com> wrote:
> >
> > At present when pressing Ctrl+C from a guest running on QEMU Windows
> > with a multiplexed monitor, e.g.: -serial mon:stdio, QEMU executable
> > just exits. This behavior is inconsistent with the Linux version.
> >
> > Such behavior is caused by unconditionally setting the input mode
> > ENABLE_PROCESSED_INPUT for a console's input buffer. Fix this by
> > testing whether the chardev is allowed to do so.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

Ping?

Who is going to pick up this patch for 7.2?

Regards,
Bin

