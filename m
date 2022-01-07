Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A920B486FF2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 02:53:36 +0100 (CET)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5eRj-0004Zh-9A
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 20:53:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n5eQH-0003bS-MV; Thu, 06 Jan 2022 20:52:10 -0500
Received: from [2607:f8b0:4864:20::32f] (port=35531
 helo=mail-ot1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n5eQF-0002g6-CI; Thu, 06 Jan 2022 20:52:04 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 g79-20020a9d12d5000000b0058f08f31338so5122757otg.2; 
 Thu, 06 Jan 2022 17:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dVuV6toNMvIlJy4N1RyIyfWYrIjckL0H3MK4xtydwgM=;
 b=GQsNxo8pxK9Q5fDVeeuHkZ9+CGa6rqENtyLIoS6OzvH/EZ/nVfZ2z78OXbNTO2842j
 viIHiqcAFspmtiYCLYuB8Ufpzium8LmrAB3AR4gAvQ1BbgF3QVcisl2ZjEAiN16DMgxG
 ZAw807SmXouhwq69CUqb8gq9DHKP8lSaaH8at6FAtxT7sz0NhYuc4Vl8OE1sClpjxErd
 ZU/XC5cXiDl7B0bMiI/llH204HxDp2BrO9GaxNWfVvP/ICnDgl8a1NEywoMhqGmN1Mv8
 eHCC50NbHXF7DDwKprt8UMjsQqSZZHFHpZU9GarpY93lR3k4M9gyfw1niKt+7gZuPp6K
 BxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dVuV6toNMvIlJy4N1RyIyfWYrIjckL0H3MK4xtydwgM=;
 b=rP5OTxjXbzgd0mNKmWibWuDPf3eWTjdww9AMIr7gBQdVfy+kuzLuBb9raD9hvg2aoe
 J6My0by7T/ZTBFzV5HIYDv8uRRHMLapJyttICe9454pH77p20cMIf29OMPuc2WgnBffG
 HLv88RcgJuJNb7ZWBdzq34MNVmScR43j9h5Il2PaUYDUxIIScu3LeUWwdRwjJ0Rt6JMg
 xOKFZAbKWmRJoa/ZFXdgQPzfij7Fz+ENFNgRBCUOTdJGWnz8TTp+3Fz2MCmFQDyJdWbO
 kHdylklj8vJqgKw0JACBVOfv3a3X2XBOdU1dg8uIBC3sboOx19gEu3yr/JFj07gltmTv
 npbA==
X-Gm-Message-State: AOAM532arC+VI9x6eDDqX8Tacxqn57/B2Q/NrE71jopjdgoyLpf0B/xG
 uM1DDy1B3Qj3q+6tXsx5BxHyz3UlbKDiCr8RpSVlQLY3zTs=
X-Google-Smtp-Source: ABdhPJwQDh1ncciESrBxjvcu19KTdo0YjI/xmSoJ/F3GyB3Z+psUWOGamHeH8YE6rMQjYTmRZiFNgApmyMq8GMwjbfk=
X-Received: by 2002:a4a:dcd6:: with SMTP id h22mr3980808oou.42.1641520009595; 
 Thu, 06 Jan 2022 17:46:49 -0800 (PST)
MIME-Version: 1.0
References: <20211222022231.231575-1-troy_lee@aspeedtech.com>
 <8df385c9-b25c-80bb-fb27-88f774eb44c6@kaod.org>
 <CAJOFXWgEqYTAL59Z2CPzQTedYqN9pWuyiEt7jbG1ENZinNj=2w@mail.gmail.com>
 <CAN9Jwz3gv5V2jPvW0mp7f_XKW=d3UtE9ROMcg4wLBR7D67+KiQ@mail.gmail.com>
 <CAFEAcA9b-JBPRt4oQkb-=ewcHY9TWJ46_xtRuW1qk6mnq-cBMw@mail.gmail.com>
In-Reply-To: <CAFEAcA9b-JBPRt4oQkb-=ewcHY9TWJ46_xtRuW1qk6mnq-cBMw@mail.gmail.com>
From: Troy Lee <leetroy@gmail.com>
Date: Fri, 7 Jan 2022 09:46:41 +0800
Message-ID: <CAN9Jwz32qQQDWi4jYYzwJ0JDQ6kp3Ph-wENUtPn7c6E0LxkmSg@mail.gmail.com>
Subject: Re: [PATCH] Supporting AST2600 HACE engine accumulative mode
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=leetroy@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 qemu-devel@nongnu.org, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Klaus Heinrich Kiwi <klaus@klauskiwi.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 6, 2022 at 11:27 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 28 Dec 2021 at 03:34, Troy Lee <leetroy@gmail.com> wrote:
> >
> > Hi Klaus,
> >
> > On Thu, Dec 23, 2021 at 11:57 PM Klaus Heinrich Kiwi
> > <klaus@klauskiwi.com> wrote:
> > >
> > > Em qui., 23 de dez. de 2021 =C3=A0s 09:54, C=C3=A9dric Le Goater <clg=
@kaod.org> escreveu:
> > > >
> > > > [ Adding Klaus ]
> > >
> > > Thanks Cedric. It's been a while since I've looked at this but I'll d=
o my best..
> > >
> > > >
> > > > On 12/22/21 03:22, Troy Lee wrote:
>
>
> > > > > +                /*
> > > > > +                 * Read the message length in bit from last 64/1=
28 bits
> > > > > +                 * and tear the padding bits from iov
> > > > > +                 */
> > > > > +                uint64_t stream_len;
> > > > > +
> > > > > +                memcpy(&stream_len, iov[i].iov_base + iov[i].iov=
_len - 8, 8);
> > > > > +                stream_len =3D __bswap_64(stream_len) / 8;
> > > > > +
> > >
> > > I no longer have access to the aspeed workbook I guess, but what is
> > > the actual specification here? is the message length 64 or 128 bits?
> > > and bswap seems arch-dependent - you probably want to be explicit if
> > > this is big or little-endian and use the appropriate conversion
> > > function.
> > The message length is described in RFC4634:
> > - SHA224 or SHA256 should be 64-bit.
> > - SHA384 or SHA512 should be 128-bit.
> > And it should be in big-endian.
>
> You can read a 64-bit BE value with
>  uint64_t val =3D ldq_be_p(iov[i].iov_base + iov[i].iov_len - 8);
> or similar. (We don't have a similar function for 128 bits because
> there's no fully-portable native C data type for that.)
>
> -- PMM

Thanks for the suggestion!
Troy Lee

