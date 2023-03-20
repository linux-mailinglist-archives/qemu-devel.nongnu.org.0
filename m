Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C706C24DE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 23:47:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peOGO-00048d-Ap; Mon, 20 Mar 2023 18:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1peOGL-000485-2s
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:45:57 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1peOGI-0007JO-AQ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:45:56 -0400
Received: by mail-ed1-x531.google.com with SMTP id eg48so52786199edb.13
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 15:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679352350;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CUcdlRLcnAC1hWsEHdyUa8FyszmpMUHUsOAlPDAG7SA=;
 b=QhQgWHYq9rqaykeFLLr1VhtDpLDQnZtI8FNpc25bkbYvJ2K2vVDx5pnaQb0dhDA7l7
 hA1DxP3uHl9HW7gaTdunJaurVLRaLZRp/7W3ZU2pT4+OfVwNK3iATmCmK5fCEfD7Amwy
 hMsqiBPfPfTaPhkk7NjXj2PqIf67gT6axT7vCcpJ2pzRIx5+P3EzNixxcDDUaz8qXtd1
 MMq9MOn/xBmXC9jblADVKUsp+sNjBPAtYp5RhK13/ShLS4maR7wg3h1KxksbABnk63iy
 xb1Z4nJN8nkef75Tti/KuzS5SnZWePt7asxGGZm91pCQ9mQGilB2gPzgEcSVS/P+aRPX
 9d4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679352350;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CUcdlRLcnAC1hWsEHdyUa8FyszmpMUHUsOAlPDAG7SA=;
 b=sWROz6iTzQTAst4idAadcm9RroGEqDOo8AcTCPkzHQGwWPSm3P62vO/hKyv3z2lj83
 1ByyDAOWh71sdqHD6zGMRVaWtihbbl5SSVoIj8Cksct+HDh7zXI6FqPnuuy8WcmFFTcb
 IETyIYybeTOhbwX548+peQJ6O2zxlToyqUVIGVsnmGgL8P3WVRA6lwwkIy/yENQEJneB
 DNKT5dbRJvi1YTNpTOjzlJPhJOS5yTVym3GqahqJ3xtVCWw/IyfTecNXEWfBusDPaZYC
 umJD0Gcty1AkE3StgDzWfVc9XfdIYLbOCyzCQhgZuIuAKJcMxmW5hVGqNgLlFouTYdxW
 rx0Q==
X-Gm-Message-State: AO0yUKU/E2ESTV1f01x+4nH9jjvgec3itHgqX6m1ffgIHz7ZtO/tvhN+
 5LQs0IG0ykeJMjc6UwPy+f0=
X-Google-Smtp-Source: AK7set90yPsNWg0OB08xY+4fPA9WsifE84m7yQ0fGkHblafK7/Kqar0VJdz9qAjntUmmycMPpeKvRg==
X-Received: by 2002:a05:6402:55a:b0:4fd:298a:62cb with SMTP id
 i26-20020a056402055a00b004fd298a62cbmr1080973edx.21.1679352349891; 
 Mon, 20 Mar 2023 15:45:49 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-139-095.77.11.pool.telefonica.de.
 [77.11.139.95]) by smtp.gmail.com with ESMTPSA id
 x2-20020a50ba82000000b004fb30fc1dabsm5385560ede.96.2023.03.20.15.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 15:45:49 -0700 (PDT)
Date: Mon, 20 Mar 2023 22:45:42 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 quintela@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 kvm-devel <kvm@vger.kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: KVM call for agenda for 2023-03-21
In-Reply-To: <393c8070-e126-70de-4e85-11ac41d6f6be@linaro.org>
References: <87zg8aj5z3.fsf@secure.mitica>
 <393c8070-e126-70de-4e85-11ac41d6f6be@linaro.org>
Message-ID: <69825A96-1A36-42B8-B9C9-6E6E34D680BF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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



Am 20=2E M=C3=A4rz 2023 15:47:33 UTC schrieb "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro=2Eorg>:
>Hi Juan,
>
>On 18/3/23 18:59, Juan Quintela wrote:
>>=20
>> Hi
>>=20
>> NOTE, NOTE, NOTE
>>=20
>> Remember that we are back in that crazy part of the year when daylight
>> saving applies=2E  Call is done on US timezone=2E  If you are anything =
else,
>> just doublecheck that it is working for you properly=2E
>>=20
>> NOTE, NOTE, NOTE
>>=20
>> Topics in the backburner:
>> - single qemu binary
>>    Philippe?
>
>Well we wanted a slot to discuss a bit the design problems we have
>around some PCI-to-ISA bridges like the PIIX and VIA south bridges=2E
>
>One of the main problem is figure how to instantiate circular IRQs
>with QOM=2E Ex:
>
>  devA exposes irqAo output
>       wires to irqAi input
>
>  devB exposes irqBo output
>       wires to irqBi input
>
>How to wire irqAo -> irqBi *AND* irqBo -> irqAi?
>
>However personally I was busy with debugging issues opened for the
>8=2E0 release, and it is probably very late to schedule with Mark and
>Bernhard for tomorrow=2E=2E=2E

Hmm, yeah, a few days notice in advance would help me to allocate the slot=
 for QEMU rather than work=2E=2E=2E I'm very interested in the topic though=
=2E

Best regards,
Bernhard
>
>> - The future of icount=2E
>>    Alex?  My understanding is that you are interested in
>>    qemu 8=2E1 to open=2E
>>=20
>> Anything else?
>>=20
>>=20
>> Please, send any topic that you are interested in covering=2E
>>=20
>> At the end of Monday I will send an email with the agenda or the
>> cancellation of the call, so hurry up=2E

