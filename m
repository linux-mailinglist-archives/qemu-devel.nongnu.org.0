Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC5264FE6F
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 11:24:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6qoG-0001Ff-Bt; Sun, 18 Dec 2022 05:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6qo5-0001FF-G1; Sun, 18 Dec 2022 05:22:10 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6qny-0003lW-8i; Sun, 18 Dec 2022 05:22:05 -0500
Received: by mail-ed1-x52b.google.com with SMTP id i9so9252598edj.4;
 Sun, 18 Dec 2022 02:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRIgTunkPTqz97m/Nb0ZmYGgrc/fvMmGRQDhlBOz37Q=;
 b=kek1GDR5WA8vjUM5c8jyhYEp7KPBraT20BcJPBiCGWOpeZ6YuK96LQzS4ZPIcOdkPS
 obE/J9F4hEfKfJDgKCwWrhNlCWAVxXoZPxvbpLHBcTwpNamWg5whwB4R6n58VFRrjfzu
 60EfhM+RnMzvWLggPVnvtq2aW07wND1ebgcxQZNM18+ZsA74zq1+OaWWaa17r3j/GgnI
 0SNQddD8hr4q1AZrIMF8FQMlxTnj4i2cZzezrfmuurTHYOMQnE8VXRpyTXMfOu0cCrFn
 SF5PUqpHE2al7IehxtfFqdKmvmoGH1op6UAads2NR3Fi+5+NJo/8ZEFzV0zPsxFNbqR8
 7jsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vRIgTunkPTqz97m/Nb0ZmYGgrc/fvMmGRQDhlBOz37Q=;
 b=RyYuAeLHQ8gic7Oqkrum3yD4Qj9fEkWhJbbalKl8ua9CFGfsmte8b9mJ1/peWiawLl
 mNq6YcX6ABQy6jCcyNeeYfGT7LTOYqosmLVI1L/Cgld8L4ysdbN3X3M0mxG2p1cblszM
 g4md7Bv8NNPJZCkqbTiOu7Evszbv76weoFKh+SPDNBsYbL7/2aT75GZ6Mpm291eFFWpx
 sGcW5ili8W2YNR/oTe6PZYf70r2OapjUNX23La7OaeUVud1AI4z3LKyVBzzIxg/7uM69
 +5SKKc/pT6q6cwMTVwkJY89PSHzTLpz6WsZ9p13R69NOAIjaZaCJEb7SifA0CSJcYfkk
 ZDog==
X-Gm-Message-State: AFqh2kpr3cogP9ent4JJMzlnUGu/0wFR7urdh58bXoRVCQWlZD91FIs7
 ylDvsNyMOYnWN4pPXtoa5I0=
X-Google-Smtp-Source: AMrXdXuUI/H084yWkT02N53Q2s13E4z5U7yGJQrSztzvV2QBtzpVtijwg0wIvNYNNchKK7+zof3Lxg==
X-Received: by 2002:a05:6402:4011:b0:46c:b2a7:1e03 with SMTP id
 d17-20020a056402401100b0046cb2a71e03mr392220eda.36.1671358919595; 
 Sun, 18 Dec 2022 02:21:59 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-166-058.77.183.pool.telefonica.de.
 [77.183.166.58]) by smtp.gmail.com with ESMTPSA id
 n19-20020aa7d053000000b00463c5c32c6esm2950037edo.89.2022.12.18.02.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 02:21:59 -0800 (PST)
Date: Sun, 18 Dec 2022 10:21:49 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges
In-Reply-To: <17a7d714-8a1e-8a17-f657-2172060d02e5@linaro.org>
References: <20221120150550.63059-1-shentey@gmail.com>
 <17a7d714-8a1e-8a17-f657-2172060d02e5@linaro.org>
Message-ID: <3F5A5F52-5815-4CB2-9DE8-894D59B0EB8C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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



Am 9=2E Dezember 2022 15:23:59 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>On 20/11/22 16:05, Bernhard Beschow wrote:
>> v1:
>> =3D=3D=3D
>>=20
>> During my PIIX consolidation work [1] I've noticed that both PIIX model=
s have
>> quite different pci_slot_get_pirq() implementations=2E These functions =
seem to
>> map PCI INTx pins to input pins of a programmable interrupt router whic=
h is
>> AFAIU board-specific=2E IOW, board-specific assumptions are baked into =
the device
>> models which prevent e=2Eg=2E the whole PIIX4 south bridge to be reusab=
le in the PC
>> machine=2E
>>=20
>> This series first factors out pci_bus_map_irqs() from pci_bus_irqs() wh=
ich
>> then allowes for moving the two board-specific PIIX pci_slot_get_pirq()
>> funtions into their respective boards=2E With these changes, the PIIX4 =
south
>> bridge could eventually become an alternative to the PIIX3-Frankenstein
>> solution in the PC machine=2E
>
>Series:
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Ping

Who will pull this?

