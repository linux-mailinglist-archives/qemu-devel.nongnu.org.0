Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCAA5B6EAF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 15:58:28 +0200 (CEST)
Received: from localhost ([::1]:32880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY6Qk-00073H-W7
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 09:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oY6M3-0002KQ-51
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 09:53:35 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oY6Lz-0000hu-DB
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 09:53:33 -0400
Received: by mail-qt1-x82d.google.com with SMTP id z18so8644554qts.7
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=G6+btAUJRWhyKP9ZkEd7iYPF63+3H/GDwUkKj23+2X0=;
 b=Zf0b4mV475i6ANXA5Sj98Cg+kkU8KbUIwpZGCDbFbQp3rHzbICT+92MJgHtmU7UDuz
 97jrGLK/X6xcJnFMQJWN4cDNlxfXNT2weOFwmecWUIclk8SlbE0ZnnlZEHivzhwFsdzU
 SumNY1U6QdNA6B/NyH75T5oFo9an+45alE9O31g3thgqUh5qqs1osq9qgLseOkcosxs9
 mKGrOruwag9cymVc3/AbH0v/fPK7TWjZ9R+u2b4XbgSrRebbcFpAPbGT/0catQ3YKyNC
 WhX65hu4Rn9JHgI9QO0/IvvGj2u6nFifxJxzuvFuWbw5xUe4SArKngKT83LFgoJMHOrM
 wArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=G6+btAUJRWhyKP9ZkEd7iYPF63+3H/GDwUkKj23+2X0=;
 b=uSG2qXkhh6SjhItKel+Qt/Hyz5o7RGj+b5du8nh0nFOljKIOoZV7P5iinIAlFGUI6D
 S9vvRuYJlsI9pkahvIVBCeYjiC43kkVBp3OX1odXq10tnUcgEuSkqCoS5NId6cejyFIw
 /l8fQO4yabTE74h8Sv/71drahQcbJC0PiCnj7vH46/oeJWK9QYNsfKLBH6W2IAffoMTX
 ckuVSIqGrWvD0QSXIuhL/CCutc6kySqz5XjHkp4vaLyinGdEMsO8qNLa062UJjiMu86B
 hP4He2w+kfC+GSLb1rApdFez+DAKhGWJMtb6sfpk3fX5WS7Gr6lQNknf2tvnJAsRCkal
 lYbA==
X-Gm-Message-State: ACgBeo2yRXKq/FAqbLbomkB9NR339pWRCR1e+wTqHEs0lcNwk+ROKRxf
 QD334t7/MdxJK0hIji8BUyZ3TDnPk/6WlBlOCB/GFw/v
X-Google-Smtp-Source: AA6agR5h2bsF8kW/RRdj+5k7mk19xNRZyn/JhKgoIW23C3efbzr4lcVmdJaDnR6Txa33LONybchN/hLdQh0YJaPqQJ4=
X-Received: by 2002:ac8:5f4a:0:b0:344:5dd9:27d8 with SMTP id
 y10-20020ac85f4a000000b003445dd927d8mr27924574qta.543.1663077210109; Tue, 13
 Sep 2022 06:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ307Ej5stZr6fPsLROFBkmtg=uzkG50yVVY6=Ru6LTLQzae5A@mail.gmail.com>
In-Reply-To: <CAJ307Ej5stZr6fPsLROFBkmtg=uzkG50yVVY6=Ru6LTLQzae5A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 13 Sep 2022 21:53:19 +0800
Message-ID: <CAEUhbmX7uduj90Na3U=hfM1ViWviPsUHVF_Rg5sbPz+Hh8dV-w@mail.gmail.com>
Subject: Re: Question about loading bare metal firmware
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 13, 2022 at 5:39 PM Cl=C3=A9ment Chigot <chigot@adacore.com> wr=
ote:
>
> Hi all,
>
> I'm wondering if there is an official way to load bare metal software
> within qemu emulations.
> I've seen a lot of people (including us) using -kernel. However, the
> doc seems to imply that the generic loader would be a better approach
> (cf [1]). I know that the compatibility with older Qemus is one of the
> reasons why -kernel is still highly used. I've also seen that the
> reset vector can be initialized automatically by -kernel unlike with
> the generic loader (this is the case with RiscV AFAICT).
> But is there any kind of official recommendation on that topic ?
>
> I'm asking that because a recent change in RiscV Polarfire Soc is
> forcing -dtb to be passed along -kernel. But in case of bare board
> software, -dtb isn't needed (at least in our use case).
> I've a patch that allows "-dtb" to be missing with "-kernel" only if
> "-bios none" is provided. But I'm not sure if this is the right way to
> say "it's a bare board software".
>
> @Bin Meng you're the one that added this -kernel support in PolarFire
> Soc. Thus, is my approach looking good for you or do you have a better
> one in mind ?
>

As Peter said, you probably need to use the generic loader for your
use case. The "-kernel" is mainly for the Linux kernel, or a kernel
with Linux kernel compatible boot protocol. In this case, Linux kernel
won't boot without a proper DTB provided, as QEMU PolarFire machine
does not generate a DTB like other RISC-V machines.

> [1] https://www.qemu.org/docs/master/system/qemu-manpage.html#hxtool-8

Regards,
Bin

