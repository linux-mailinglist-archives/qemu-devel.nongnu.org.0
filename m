Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF84866BE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:31:53 +0100 (CET)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Uk4-0003ET-8m
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:31:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5UgN-0000hM-Ok
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:28:03 -0500
Received: from [2a00:1450:4864:20::434] (port=39736
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5UgM-0007Tz-4p
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:28:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id s1so5479656wra.6
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 07:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l2W6TvkIBXYjzjMw0jKIb7sjXWrdc899GHWC7UX5GUI=;
 b=trES+DILDMWOfknTz264RJ0OW2UauTIbNoqOKGYiqPv01I72SFtpCQyyCF2Z3Y2IXQ
 ywA7l/bPUpfCwtcHyd8I9GAAIK1YUl6fAd10/n/jTpXTmmHPFmr5FV+z++NPAlOJoC1B
 ILJyG7ontTR42Ib5tyh9d/JYkmaVJMoqLzpoY5Oori0/bo+OJOls/GSU9D7xKfITIIqz
 EbWcPt/COgS+Y765oVx299b5N1of/bZYeRF1sPTVyExjqEOVOt/2quRqICMzvzOVXezN
 qx5adNZNSeunTjh76OQ6dE5G+87IP5m4huletmKqdtZ99XOaSTR37npW4LmXxbkkbeCa
 BXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l2W6TvkIBXYjzjMw0jKIb7sjXWrdc899GHWC7UX5GUI=;
 b=T2fzEVwLs7EIrMsNu9+96/nHaTLXQIHAUswBaR/Z30/JJOVefSlx50YqnaCy5sI2X5
 vDdqVLBuCHsK7bR7dLKbf+ty0mwWCm0HfXwExBA865JL3/WSgXtEIkACNvF/WWz3pxwy
 lbTWh5CDC/+QfIqtOk26g0udqMEMWOpERgudwlHX5XKiaxPziODCQvaaDFKLAzjbmfls
 SDynxYo/rVPc/25npc3R2ImwVJBnpWl86fWTuJ7a7fcV7lE6sqlU/hEgDZ+DJKM4A+Sy
 6dPCuNveehySALMWXehQLEiQPA6ChdrZJVvBulHhNovUSVQLkaSPDauJjE79TIkt0BzN
 AygA==
X-Gm-Message-State: AOAM531LOBIS59NcX5I4RWar9MNtjYfvqvrRmOGoVGl0kceSerf05ziA
 ziFRqi6pQ6R5zlbV9+YvkwhtHFaBCUiu1bRGhKDO4A==
X-Google-Smtp-Source: ABdhPJxLHvcPqBJ6VAM4cBYGaBowVNmM+OuQC0mT2sHk29TICQQ0uAa73lKEIctEe2PsTT+y1xeX66Tp3z9hcerHEok=
X-Received: by 2002:a5d:6986:: with SMTP id g6mr48842wru.172.1641482878790;
 Thu, 06 Jan 2022 07:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20211222022231.231575-1-troy_lee@aspeedtech.com>
 <8df385c9-b25c-80bb-fb27-88f774eb44c6@kaod.org>
 <CAJOFXWgEqYTAL59Z2CPzQTedYqN9pWuyiEt7jbG1ENZinNj=2w@mail.gmail.com>
 <CAN9Jwz3gv5V2jPvW0mp7f_XKW=d3UtE9ROMcg4wLBR7D67+KiQ@mail.gmail.com>
In-Reply-To: <CAN9Jwz3gv5V2jPvW0mp7f_XKW=d3UtE9ROMcg4wLBR7D67+KiQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 15:27:47 +0000
Message-ID: <CAFEAcA9b-JBPRt4oQkb-=ewcHY9TWJ46_xtRuW1qk6mnq-cBMw@mail.gmail.com>
Subject: Re: [PATCH] Supporting AST2600 HACE engine accumulative mode
To: Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 28 Dec 2021 at 03:34, Troy Lee <leetroy@gmail.com> wrote:
>
> Hi Klaus,
>
> On Thu, Dec 23, 2021 at 11:57 PM Klaus Heinrich Kiwi
> <klaus@klauskiwi.com> wrote:
> >
> > Em qui., 23 de dez. de 2021 =C3=A0s 09:54, C=C3=A9dric Le Goater <clg@k=
aod.org> escreveu:
> > >
> > > [ Adding Klaus ]
> >
> > Thanks Cedric. It's been a while since I've looked at this but I'll do =
my best..
> >
> > >
> > > On 12/22/21 03:22, Troy Lee wrote:


> > > > +                /*
> > > > +                 * Read the message length in bit from last 64/128=
 bits
> > > > +                 * and tear the padding bits from iov
> > > > +                 */
> > > > +                uint64_t stream_len;
> > > > +
> > > > +                memcpy(&stream_len, iov[i].iov_base + iov[i].iov_l=
en - 8, 8);
> > > > +                stream_len =3D __bswap_64(stream_len) / 8;
> > > > +
> >
> > I no longer have access to the aspeed workbook I guess, but what is
> > the actual specification here? is the message length 64 or 128 bits?
> > and bswap seems arch-dependent - you probably want to be explicit if
> > this is big or little-endian and use the appropriate conversion
> > function.
> The message length is described in RFC4634:
> - SHA224 or SHA256 should be 64-bit.
> - SHA384 or SHA512 should be 128-bit.
> And it should be in big-endian.

You can read a 64-bit BE value with
 uint64_t val =3D ldq_be_p(iov[i].iov_base + iov[i].iov_len - 8);
or similar. (We don't have a similar function for 128 bits because
there's no fully-portable native C data type for that.)

-- PMM

