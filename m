Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E422522F
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jul 2020 16:17:07 +0200 (CEST)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxA7m-0005Vo-IE
	for lists+qemu-devel@lfdr.de; Sun, 19 Jul 2020 10:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pr0f3ss0r1492@yahoo.com>)
 id 1jxA6v-00056p-LN
 for qemu-devel@nongnu.org; Sun, 19 Jul 2020 10:16:13 -0400
Received: from sonic307-9.consmr.mail.ne1.yahoo.com ([66.163.190.32]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pr0f3ss0r1492@yahoo.com>)
 id 1jxA6s-0002tu-9r
 for qemu-devel@nongnu.org; Sun, 19 Jul 2020 10:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1595168168; bh=WOt8dJchIfDquG/bNZO+cYESBv6KD7jFc2tinXm5uOU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From:Subject;
 b=f5dL6oYkQ7QLeqm8nLa7ZELO/Yp24NOqnENWjienrLfD59lWE59pJCxyTnkb224Ln5DLmDtb/kbM5HnDaA68p+iZ2SpWLB90YpP/TGHYM7PG6LcH12pdnGElZi84W4+Z7h/klXCsAMZ38b1xyKPFuxjDtE18gaYHhvQzT5RiutdVCDVzitu/zjHg+Mh5jeyJZGX5CGembOrEjDNC/w55h/Cn7apO0J0QINiKh4K/WmSCico4kjwRyyh+B4tU1A43XZlkYR63CifgBQvDr8sDT3HNaQ5UWnXWDzHFNkxtMpU1xuxQAyMDo17P2jitEwlXCafoY6otPj7Kyicj2VTJbw==
X-YMail-OSG: m9u0aQ8VM1kN2NqbSLh_EvRadA9O_zfU74aVfcpJm4STDaAbLDQDPSEzZjn2Hnl
 Cegm6AWmbxCpwigxz1B3CRuhyutFh4peahHhED3.ldNR9XCpM34SekTJk15US4IfZXya5hOIVj4o
 30pvFBzhtexxFWHB8hwf143IwcITX4YedvNpo_n7rPgABs37o3BdrSCMV8QAmFK08qXSVnxSBXtW
 .KaUhl4KnTOUGhcQ_XVYXQX.RaOy.rnO2RY5MeoOsPfXft5BXcn513yzPR4_1BjwWhl2DnevuGNX
 k0tlwkd6t58qJtZVgaUoprS_PoZLZ1wTZwi8ByWtxE0wnNzEyGUlzmE3ApVoBSLipGBoKlK4OVCb
 smcHXPYfah5t7YcoG_OExp4P.0pT3b1S0i2pC2GPbN5SzoycgAFniwGRRdfydP_1XU2VO0y.EZnB
 1aS5NmCvSqHPvBHJSVMR7oA9sP_zhYTcFLIzIaAqUTGv2falTpkf_MOFRQYTH0Mq.7a5N5SmGzMF
 9OWjT8b.GujfkEts29CZGlcZEZfojQakivwJ8oSjYid50RK0XJbE.XC2IviNnBWHTG8zdenmSkan
 XW80GbPBtl6Cb6jp7VS4oT2v7XTAzBGHOkUXixYoCgebyzm6qqiBcUM59.HP3QFWbDWPECN21c7e
 EbG.HxdeILeU7iLt3S.slyfJCMDY_5SmfORp8eLX9IwptxxDZD_E81GUhHeKdqk76zOLfKgGT1Wb
 ArhbHO9mzTp6UF6ZzX0_0imS68dMPP4eez7vxYBKeYtSkW.K7g5XkSIC5J2oL02vpmgkbg57Psfd
 IZBoAjBI0ZIlODPnvVBpK6Kjxfg0uH1EhAQ9fZgnpjxxsej3senqXLnfCkYSmQ8o4HAe2DupSy.i
 pE17pCituxL2.X3O07jpgvwRUEHIV55BgfmeK5HDsmwMx6rRj59FWxyA6Y30z7IoBX1j355wY1Tn
 JAISjHrBPN4vb9kVrkZ7TcdW8kxtY0PLZaMrWoYqwpSjJhkcaW3pPPrW72lM9ARx9HM9Smfu73HJ
 VIlEwsiUkQtvshQXkqEd_NDy62wRvWrJSqAKAIej3oogHlWHcBj1FWF3bWOAeTlDR6qU0OGh1gQ1
 gb9GwtNTcZ6s4kxCj6Kbe2iaglOaTs3jw4hAaPUuUiCFf3EtBmGi9f9DZTCNUYxHfMQjEaXYngrq
 YTXy4qY6v6_Mfz8qsc3LIx_77Fhi5gKrlBZDKBB5mtdvaQeB9SqYUFHsp_Lp5s2H7wT7bxZ0Gkys
 VTw299ALWQbqd08ix_npL03n6ndL.0Av9W0WDxjequ09K59lRF1uswQJSqJptK7qK5tRP.po7DT6
 XgsLGvfiTsdFLngML.rZThVByxaMZfHy_PJd59Zem2sUQk77inRD1le_nLbjW0j5WFRtg5kzmKVz
 d9yh2Oue_lW3ijjeri72y1uts0cT0ssXBiu858L4-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Sun, 19 Jul 2020 14:16:08 +0000
Received: by smtp417.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 7b1008d68f544c5613950e27c4582b76; 
 Sun, 19 Jul 2020 14:16:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id 72so7499837ple.0
 for <qemu-devel@nongnu.org>; Sun, 19 Jul 2020 07:16:07 -0700 (PDT)
X-Gm-Message-State: AOAM533OUTSwUu2ZrDw4ud0NOtgMadFh9gH3PUog/ZpFPwgeB0qQEFU3
 1+4XR7BjI7KQJwJwt6dz6WNRZMfYWyXD7QnkT0I=
X-Google-Smtp-Source: ABdhPJxO+fLTqnV6bFfWikJdNBb3u82fVCN+6nUsxtDmLVpj/uNRm8zkDKxwT+9Vu5rmyHWRCzibKDAr07bI4ND/PZg=
X-Received: by 2002:a17:902:a388:: with SMTP id
 x8mr14318624pla.48.1595168166736; 
 Sun, 19 Jul 2020 07:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAEJNuHy+CqveTjiCxpjiLX-D=NczSveUSDSAZyz=D5F0XvL5QQ@mail.gmail.com>
 <CAEJNuHze25wdA_Kjw8ryi+hmg0eLP8nhZMR50_2yqXPu_Jir9A@mail.gmail.com>
 <20200719025055.kkjjiegyn4t6x64v@function>
 <CAEJNuHyYR1Vj4VaDVPLUG1dkSdzHjzbiCqq=Q+2j1tjy7kYBCw@mail.gmail.com>
 <20200719111602.2xeu4ise6zlbvf4c@function>
In-Reply-To: <20200719111602.2xeu4ise6zlbvf4c@function>
From: Ottavio Caruso <ottavio2006-usenet2012@yahoo.com>
Date: Sun, 19 Jul 2020 15:15:50 +0100
X-Gmail-Original-Message-ID: <CAEJNuHy7s+GqUaZ_sVgr03J6ZGzK9PwZZBsu6t0Znf6p4x6+8Q@mail.gmail.com>
Message-ID: <CAEJNuHy7s+GqUaZ_sVgr03J6ZGzK9PwZZBsu6t0Znf6p4x6+8Q@mail.gmail.com>
Subject: Re: Is traceroute supposed to work in user mode networking (slirp) ?
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: WebService/1.1.16271 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.7)
Received-SPF: pass client-ip=66.163.190.32;
 envelope-from=pr0f3ss0r1492@yahoo.com;
 helo=sonic307-9.consmr.mail.ne1.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/19 10:16:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 19 Jul 2020 at 12:16, Samuel Thibault <samuel.thibault@gnu.org> wrote:
>
> Ottavio Caruso, le dim. 19 juil. 2020 12:07:21 +0100, a ecrit:
> > On Sun, 19 Jul 2020 at 03:50, Samuel Thibault <samuel.thibault@gnu.org> wrote:
> > > Ottavio Caruso, le mar. 14 juil. 2020 12:15:48 +0100, a ecrit:
> > > > I cannot get traceroute to work with standard udp from any of my
> > > > guests.
> > > >
> > > > $ traceroute 8.8.8.8
> > > > traceroute to 8.8.8.8 (8.8.8.8), 64 hops max, 40 byte packets
> > > >  1  * * *
> > >
> > > That was because
> > >
> > > - libslirp was not forwarding the ttl value, thus always set to 64 hops
> > > - libslirp was not reporting icmp errors.
> > >
> > > I had a try at both, and that indeed seems to be fixing the issue:
> > > https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/48
> > > https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/49
> > >
> > > > Any clues? Is this intended behaviour? Any workarounds that don't
> > > > involve tap/tun/bridges?
> > >
> > > Not without updating libslirp with the abovementioned patches.
> >
> > Thanks Samuel. I've added a comment on the portal, but for the benefit
> > of qemu-devel:
> >
> > Applying this patch on the latest qemu (5.0.90),
>
> Did you also apply
> https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/48 ?

No, because I thought that 49 would include 48. Let me give a try and
come back. Updates on Gitlab.



-- 
Ottavio Caruso

