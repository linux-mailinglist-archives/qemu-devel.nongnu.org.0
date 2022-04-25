Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB33350E20A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:40:17 +0200 (CEST)
Received: from localhost ([::1]:54684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niywq-0006mu-Tm
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <starardev@gmail.com>)
 id 1niwA2-0003RY-Qw
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:41:43 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <starardev@gmail.com>)
 id 1niwA1-0007OV-6h
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:41:42 -0400
Received: by mail-pl1-x635.google.com with SMTP id s14so26037330plk.8
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=js31OMzb7jdYM85Yec4dFyLwxZWPhKTZZVXJwyVB/FE=;
 b=SEes3X8d0DCMegbXGAJlfFqr6wMEjzX2BxSqidIVxSZwSTJT2Nu/IXFtOshkOLBjd1
 dqJSm+7hLg5euR1RjYI8npUjdplJUmYBJRy4Od1b0HpPv769XcM1kZqfPv6/8hPEmhPa
 3UxRxekE17d2zGmouMRKqhm8iMm9QYziqMaH6vT2O6RvRKpCuyiBBwUQiZ89PIakHZA/
 AXA8fow29qUydNHVhzBudVsu/pJG0UyJHuaLLtBy7vshTqPwgs6f/h4/TmAwYltLEPiA
 9ga8EgHSCKpRTQc3lOsIDQxDoX6kn0YmATORFVAsdHBOgsWJZCC79szata/Js6FDEmp1
 6NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=js31OMzb7jdYM85Yec4dFyLwxZWPhKTZZVXJwyVB/FE=;
 b=5s/QBD9NryKtOiJ0tzFZpAoONLVYWLaeYHtXVFlHnYGMpM+ooklew1B2N6iZvLS0oi
 n7CsO+tzjg/s/8mnBdRXqf6kuyzzJQ+P3yQOkxpil1+BPuZcNHrF8sRET6hESHuk8nDS
 mvR1inA569Id/S7/Aepx7Ue6DHjhRc7HmQH9rHNb4ZP/pKSYWDPJJbTDBQDmM71h1Ino
 A9TiOimrPP/AWyMCJCqMkagdwmpRpM9xnP7NbtyRb4cUfAOlSb71qWbFbwI5DZs1uJf7
 p3C6U47miv5mmP1O8Qv5nvYJd/f1LEwIkmnGDStpp1xicB51PAuMg8i/dg5qyJF3VYfA
 tqoA==
X-Gm-Message-State: AOAM530XawEU4AOcPV2genkZXO/aBwDsxWgage1LmbuFJ9u1r82GLIye
 LdijSbqfK22kcXFyjgTK4YGqjAcTpbHfEen2SzZLFjjTaUSuawZ6
X-Google-Smtp-Source: ABdhPJyqwOAKP8BAfSrNzmR/Oja+hiHb/xlVKihqfDSR97zm9x2TOIi2CMvlkWVRgpMfhhe8hJhJEbdHYNQzSJrRWYE=
X-Received: by 2002:a17:902:e393:b0:15c:f1c1:c527 with SMTP id
 g19-20020a170902e39300b0015cf1c1c527mr9633894ple.22.1650883298081; Mon, 25
 Apr 2022 03:41:38 -0700 (PDT)
MIME-Version: 1.0
From: Artyom <starardev@gmail.com>
Date: Mon, 25 Apr 2022 13:41:27 +0300
Message-ID: <CA+inuZ85ktnAuvmmMcxJFX0EVZC6A_g2fR5BSQRTshDoxdv8=Q@mail.gmail.com>
Subject: Live Migration ToDo
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008c3e4305dd7838d0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=starardev@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 25 Apr 2022 09:31:24 -0400
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
Cc: leobras@redhat.com, dgilbert@redhat.com, peterx@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008c3e4305dd7838d0
Content-Type: text/plain; charset="UTF-8"

Hello! I would like to see a list of suggestions/ideas/tickets for
improving live migration (especially performance and algorithms). There is
a page https://wiki.qemu.org/ToDo/LiveMigration, but it has not been
updated for a long time. Thanks

--0000000000008c3e4305dd7838d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello! I would like to see a list of suggestions/ideas/tic=
kets for improving live migration (especially performance and algorithms). =
There is a page <a href=3D"https://wiki.qemu.org/ToDo/LiveMigration" target=
=3D"_blank">https://wiki.qemu.org/ToDo/LiveMigration</a>, but it has not be=
en updated for a long time. Thanks</div>

--0000000000008c3e4305dd7838d0--

