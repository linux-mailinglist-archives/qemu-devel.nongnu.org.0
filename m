Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21224BC8D3
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 15:17:16 +0100 (CET)
Received: from localhost ([::1]:36394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLQXz-0000MK-I4
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 09:17:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nLQUf-0007Fu-Ht; Sat, 19 Feb 2022 09:13:50 -0500
Received: from [2607:f8b0:4864:20::62e] (port=45593
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nLQTx-00088H-Bb; Sat, 19 Feb 2022 09:13:48 -0500
Received: by mail-pl1-x62e.google.com with SMTP id w20so9322638plq.12;
 Sat, 19 Feb 2022 06:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j91bczqL16SOpaJcqgbI/cPH4KVqFMQWF3awfLJXrgs=;
 b=JOY6YNUKSGb/BYHd7n+0DsytNWFDoC6N7LrxGQnTJhk+4GFM7BOrK7P5vp5hcKI3Kz
 OwpjBsuZd6z2cOcZQY/d9TqsbIe+pPyNXbRvvXhqilmJW91qCk13Sgd5cObU2U4TvIps
 VyE+bLzkdETXQhTFUA4DEqd/NTBoKtsSUuADVUUIrgm8dkLKtHKZoOrcqx2oKh00eGD6
 qnMv/MSu1jTt6ou1S2XlrQnJA8Xajo7n1BgZAi/SBS4SKRmgYmN+7YLkaGw+rmifxz4I
 TjRpVvOaXnb/2NRRciu1NGE+H44fuOFTvyihK9uRhIr3VBE4MPSiMOi1pEzv9IZOrcD3
 FlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j91bczqL16SOpaJcqgbI/cPH4KVqFMQWF3awfLJXrgs=;
 b=jnL+KQovF8PANjO7hhA1eUXWZC4mhJAeRuZhVN8nvksgS6aoBZyiVzPkFZimyDNitH
 OL/f277mc5NTxLRoN/L1mJZN3HKEoGGEsQUEv5dCcO6oMVOF94Hf6RKxl3iFdvNbaLQt
 yqlMcAFaNDAJg2z6ILxsBDfO7ZCDeRyJzOKjnx1Irol0QlDOkJL6S0aZWDQF2T6+2e4U
 /RvQYbxsM3+sCRIRpf/vkm8PQPufj+S9slETXrJmE0etwYich1Fr/jInB7yoeHu/HqBB
 BEfpzI3rL2SSwrTFNf0kzj1v2oM8P08FquQWFgoEPSYilXmTby5Rdc4lAUv9XiK30hlc
 vSXg==
X-Gm-Message-State: AOAM533HCX8MFJWcQn3jXfIvXJdjora2oSpo7EO/Lnp4T6e2zxXhhp17
 7DWh6mDk6OOKTvMctzasDQ3DP+How6ZOms6nA4k=
X-Google-Smtp-Source: ABdhPJx4OD2bnvajDZVpDNiZpFKMmLoZqVdgjpRBnsqxlGepSRkp7zBvwDL4bikfiVLY/h/mNAUrlYlui8IhVg7ONro=
X-Received: by 2002:a17:902:bc82:b0:14f:2b9c:4aa with SMTP id
 bb2-20020a170902bc8200b0014f2b9c04aamr11545820plb.145.1645279982742; Sat, 19
 Feb 2022 06:13:02 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <09b8f0ae-c47a-eb55-9f66-65568ac47ff9@redhat.com>
In-Reply-To: <09b8f0ae-c47a-eb55-9f66-65568ac47ff9@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 19 Feb 2022 14:12:51 +0000
Message-ID: <CAJSP0QXP4zb18EXunWHGVhW9DZh6=J2Pb2Ri0rXFv4jXfTczmA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=stefanha@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 18:24, Thomas Huth <thuth@redhat.com> wrote:
>
> On 28/01/2022 16.47, Stefan Hajnoczi wrote:
> > Dear QEMU, KVM, and rust-vmm communities,
> > QEMU will apply for Google Summer of Code 2022
> > (https://summerofcode.withgoogle.com/) and has been accepted into
> > Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> > submit internship project ideas for QEMU, KVM, and rust-vmm!
> >
> > If you have experience contributing to QEMU, KVM, or rust-vmm you can
> > be a mentor. It's a great way to give back and you get to work with
> > people who are just starting out in open source.
> >
> > Please reply to this email by February 21st with your project ideas.
>
> I'd like to suggest an idea (shamelessly "inspired" by Philippe's suggest=
ion
> last year):
>
> =3D=3D=3D Improve s390x (IBM Z) emulation with RISU =3D=3D=3D
>
> Summary: Adapt RISU to s390x and fix CPU emulation along the way.
>
> RISU (Random Instruction Sequence generator for Userspace testing) is a t=
ool
> for testing CPU instructions with randomly generated opcodes. The goal of
> this project is to adapt the RISU framework for the IBM Z architecture
> (a.k.a. s390x), so that it could be used to test the s390x emulation of Q=
EMU
> for correctness. This will certainly help to spot some instruction emulat=
ion
> deficiencies in QEMU which should be addressed during this internship, to=
o.
>
> '''Links:'''
> * [https://git.linaro.org/people/peter.maydell/risu.git/tree/
>     Peter Maydell's RISU repository]
> * [https://www.linux-kvm.org/images/6/63/01x03-ValidatingTCG.pdf
>     KVM Forum 2014 presentation by Alex Benn=C3=A9e]
> * [http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
>     z/Architecture Principles of Operation] (the description
>     of the CPU instructions)
>
> '''Details:'''
> * Skill level: intermediate (a good basic understanding of CPU
>    instructions is required)
> * Language: C, Perl
> * Mentor: Thomas Huth (thuth@redhat.com) (+1 TBD)
>
>
> What do you think about that idea?

That is a great project idea. I have added it to the wiki and expanded
the description a little to explain how RISU works:
https://wiki.qemu.org/Google_Summer_of_Code_2022#Improve_s390x_.28IBM_Z.29_=
emulation_with_RISU

Please add proposed tasks to the description so applicants have a
starting point for breaking down the project into sub-tasks and coming
up with a schedule.

Thanks,
Stefan

