Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B63B5B729C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 17:02:25 +0200 (CEST)
Received: from localhost ([::1]:41858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY7Qe-0004tM-Fr
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 11:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oY7I2-0001l8-EM
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:53:34 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oY7I0-0002sM-Ae
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:53:29 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id d189so18105541ybh.12
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=+kqjJnIRqWRRX7Ng5EMjGxupOF3XlCrGCEBGdZX5We0=;
 b=V5cBQSNKqABJk+1QP9hhcUDNHHm38JD7p9otY4TTjHRCzEHAI6LkWL3SIWEkWmXLwL
 eh6Sw4IZoxEOSoiSd9vQjlythQ2yETi4QUu7MxlNEOZdlP65iAWuiWIwnnZzI5ezysEB
 q20IRKBWEtaR5dO064D+nTa8rZHmSbxODS/zaJL9Kci6VVyYGt0hhnI7/hIEA2uaW+0g
 rFrgtSibWW2suF+lgP4XSmZBq7A8hEQOTQB/lVWzck4vk++w87nXccgfoV7IwFESK0Jt
 mz64Qy0GNU5htrcDqpVHgxQO+/++b/LYdQkDds5WhG2y0Ppg+yvDrCs6QZTBMW1BA7FY
 gSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+kqjJnIRqWRRX7Ng5EMjGxupOF3XlCrGCEBGdZX5We0=;
 b=fQvvnhoXY2pqZHQWsi4l3w/D7rOqOmuZD8B10ilQC1BwtrTd2urI1Wdc1JCIDU8pmP
 fGhA+F3CAGSnr05wEgkE9DiLeKAVWt0um8gaaYTcayz6MsL5EUuSuOE3R/BQpZUYbi7B
 UyQYJviqa/9yd/jwpxGt8KQm51aJPrFlKB4y4wWdhvzxJBgO5c9fZ22SrdRRpZvGmomj
 DpqQ+EUDTmSwRrsQygPxvfaYZgz5zM4D4NbM9Tm04zI7dFF3obgRG5DjDUZSH2fPk+QW
 qsHEcFK1XEnRzUyO8Ko0YNN39rLHyW85VkOChH2sDXzR/c11jVJUbCbgTQuk55EkWeCg
 a5mw==
X-Gm-Message-State: ACgBeo3Lf5AWIN1WEiLRJQziVWQ4PE5XLc3RHjPhmy2z5oDJvT19o73J
 s9OGmrUHoxsmkAqkknbiDseju3V8sOYN7CutzrLoAw==
X-Google-Smtp-Source: AA6agR79DDLEwBim0DTHqlIE07a7VIUjdIQnG/B8i+GSqsEUuo+hBoB81+/oZWYo5oq29asZtjUeZ2aEHaZqdqZD34Q=
X-Received: by 2002:a25:d506:0:b0:6ae:cdd4:8149 with SMTP id
 r6-20020a25d506000000b006aecdd48149mr12027730ybe.306.1663080807152; Tue, 13
 Sep 2022 07:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ307Ej5stZr6fPsLROFBkmtg=uzkG50yVVY6=Ru6LTLQzae5A@mail.gmail.com>
 <87o7vjz6da.fsf@linaro.org>
In-Reply-To: <87o7vjz6da.fsf@linaro.org>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Tue, 13 Sep 2022 16:53:16 +0200
Message-ID: <CAJ307Ei=yXX_3jwhitUk7cEf=b70E2SuJEUDQTDRzszR=9wTHQ@mail.gmail.com>
Subject: Re: Question about loading bare metal firmware
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=chigot@adacore.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

> > Hi all,
> >
> > I'm wondering if there is an official way to load bare metal software
> > within qemu emulations.
> > I've seen a lot of people (including us) using -kernel. However, the
> > doc seems to imply that the generic loader would be a better approach
> > (cf [1]). I know that the compatibility with older Qemus is one of the
> > reasons why -kernel is still highly used. I've also seen that the
> > reset vector can be initialized automatically by -kernel unlike with
> > the generic loader (this is the case with RiscV AFAICT).
> > But is there any kind of official recommendation on that topic ?
>
> The recommendation is in the document you linked. For bare metal use the
> generic loader and make sure you put the blob in the right place so the
> architectural reset vector will jump to it.

Alright. I should have missed something when I tried with the generic loade=
r.
Thanks for the inputs and the confirmation that we were doing something wro=
ng !

Thanks,
Cl=C3=A9ment

