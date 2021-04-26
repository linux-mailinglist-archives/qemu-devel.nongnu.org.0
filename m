Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B5E36B6C7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:28:12 +0200 (CEST)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb45j-0002io-AE
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minyihh@uci.edu>) id 1lb44q-00027c-EG
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:27:16 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minyihh@uci.edu>) id 1lb44n-0004pb-Ml
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:27:16 -0400
Received: by mail-pl1-x632.google.com with SMTP id v13so15621964ple.9
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uci-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=oQHV1M88gn4CERoKoBSV+sQWJDrMBR3CHxgzdAEaahc=;
 b=zJVdI7oX+QUduBdW0w6weXowtD/fObc/+ZSPQ75wurbgQRCA2JxSUcMpFoIWR+oGSM
 xCl+7FcrJYJ5Uujk/j+g58MVDH59loHowS6vY8KzagCsE4qPI4Q2MkPxTcqrVGDPa99O
 qonMXMS/g/ZmZvf8Oxrv+F8PwyeMDCMPlQBWUV5f52b8I5AdOK1e0I6/JS9l8mwSpex4
 TceG4hBxhmDDRGRXk/0a/kDAsqX+xHDQDzakQxrV8vJ59yTCcXLPPfEjKvFfzwaSCXrs
 h3hKjS+ulfD/PN40j6h0tfVWbX/YOxe+Mda39LDO82YtZMLNOXRAge6kM/8nFbSyxcPy
 QR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=oQHV1M88gn4CERoKoBSV+sQWJDrMBR3CHxgzdAEaahc=;
 b=fZGal8/X05N/v7cDaBySZL5/yCC4VSqpd/UGTIgQOqQqgROUx/tWh37iPImc/eLf6G
 SWH8FoBWiYovuuKfQpAk2/x1H9YbopfxVY2Wt8EeU5m/TabvRgElo+anzsCQMSq4p440
 tZu5qdRUkUF/aAzo8LdR53FBQLfOEtdgbz4DfSo7ZmZAKq1kr4ClywHAV+JL0DrHtH83
 eII9WUDK+os8JUwkprfxNvjLLAmEAZ9dGgKWD6Gd7akttz6bysYSs6/uHm5GpKx4Hlye
 z80I33vqzoKBv8SgAxc1eG6QQ18d22sSNFlqpFVRHd5bOzeFjumlawb06rQFFtjVybiN
 HOhQ==
X-Gm-Message-State: AOAM530cRaIU8DcZO5iSJ4iJfzuqAt3VA8r/SqZjXB5slRTsqRfLHrbt
 zMnxPKIxbfB4yPoFrMjCc85ICg==
X-Google-Smtp-Source: ABdhPJy5Bqp04u+T1cd+ZLI7ys3iMQcNzHtmm87OHP1KVxESUI3cnSZ9CrqFs/3pryLon36PCmzk5Q==
X-Received: by 2002:a17:902:e051:b029:eb:4411:db58 with SMTP id
 x17-20020a170902e051b02900eb4411db58mr19347480plx.11.1619454430094; 
 Mon, 26 Apr 2021 09:27:10 -0700 (PDT)
Received: from [192.168.0.235] (dhcp-v228-165.pv.reshsg.uci.edu.
 [169.234.228.165])
 by smtp.gmail.com with ESMTPSA id z188sm11476784pgb.89.2021.04.26.09.27.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Apr 2021 09:27:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [RFC] tcg plugin: Additional plugin interface
From: Min-Yih Hsu <minyihh@uci.edu>
In-Reply-To: <87a6pp6lit.fsf@linaro.org>
Date: Mon, 26 Apr 2021 09:27:08 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E8FB56E-AA11-46A1-8072-C43E8A5A854E@uci.edu>
References: <CAJyG1bOR659y=6oP5-XFyVv-xLq-C-m4cdsdRP2D+ZVQqyJnqg@mail.gmail.com>
 <87a6pp6lit.fsf@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=minyihh@uci.edu; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

> On Apr 23, 2021, at 8:44 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>=20
>=20
> Min-Yih Hsu <minyihh@uci.edu> writes:
>=20
>> Hi Alex and QEMU developers,
>>=20
>> Recently I was working with the TCG plugin. I found that =
`qemu_plugin_cb_flags` seems to reserve the functionality to
>> read / write CPU register state, I'm wondering if you can share some
>> roadmap or thoughts on this feature?
>=20
> I think reading the CPU register state is certainly on the roadmap,
> writing registers presents a more philosophical question of if it =
opens
> the way to people attempting a GPL bypass via plugins. However reading
> registers would certainly be a worthwhile addition to the API.

Interesting=E2=80=A6I=E2=80=99ve never thought about this problem =
before.

>=20
>> Personally I see reading the CPU register state as (kind of) =
low-hanging fruit. The most straightforward way to implement
>> it will be adding another function that can be called by insn_exec =
callbacks to read (v)CPU register values. What do you
>> think about this?
>=20
> It depends on your definition of low hanging fruit ;-)
>=20
> Yes the implementation would be a simple helper which could be called
> from a callback - I don't think we need to limit it to just insn_exec. =
I
> think the challenge is proving a non-ugly API that works cleanly =
across
> all the architectures. I'm not keen on exposing arbitrary gdb register
> IDs to the plugins.
>=20
> There has been some discussion previously on the list which is =
probably
> worth reviewing:
>=20
>  Date: Mon, 7 Dec 2020 16:03:24 -0500
>  From: Aaron Lindsay <aaron@os.amperecomputing.com>
>  Subject: Plugin Register Accesses
>  Message-ID: <X86YnHhHMpQBr2/G@strawberry.localdomain>
>=20
> But in short I think we need a new subsystem in QEMU where frontends =
can
> register registers (sic) and then provide a common API for various
> users. This common subsystem would then be the source of data for:
>=20
>  - plugins
>  - gdbstub
>  - monitor (info registers)
>  - -d LOG_CPU logging
>=20
> If you are interested in tackling such a project I'm certainly happy =
to
> provide pointers and review.

Thank you! Yeah I=E2=80=99m definitely going to scratch a prototype for =
this register reading plugin interface. I=E2=80=99ll take a look at =
related email discussions.

Best,
-Min

>=20
>>=20
>> Thank you
>> -Min
>=20
>=20
> --=20
> Alex Benn=C3=A9e


