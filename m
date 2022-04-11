Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7676D4FB45B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 09:04:35 +0200 (CEST)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndo6E-0001iq-Gz
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 03:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ndnzU-00077B-IA; Mon, 11 Apr 2022 02:57:36 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:45749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ndnzO-0006zC-W1; Mon, 11 Apr 2022 02:57:36 -0400
Received: by mail-yb1-xb30.google.com with SMTP id v77so7667356ybi.12;
 Sun, 10 Apr 2022 23:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OAWhZgqetAGWrqupnlo8856SNUZTJM0lRYD8OaMgqGI=;
 b=BEVFUW1JhF6HLwj6SESkUGYXpJSa8n0uafDebAOQc+KpV1Y1HKq83niJYmzlmBpsTC
 kv3SQwvvDQS6yB2qwueRRD1DupCg4CZ35KF9M8CDorVBXB9ALW6/bkrTIJBXzI1ShZrm
 q+CS5b+u4jFgLrcH4ouwwYu8ENEHQ9pd4p+VF7znfqnKBjF7/ujtp97zu5R7ySx/ie5W
 YbpdBB644Ker37iD3iBptPmIPe7GmtBA0D8kgrmDdlOlrLt5A4MhwJVYXrBAp/gL9jYd
 Hh3bZKEfjS2L3o1+lc2UR5EE1LMg8W7F8HhnX3wypWoNQDaq84ehNRwegd92E8GUhsQw
 uA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OAWhZgqetAGWrqupnlo8856SNUZTJM0lRYD8OaMgqGI=;
 b=7itX7tCUqhJA+81TaifzTlwQg4G+V87NkamfY1D/7doQ5cLvRaxWYDUyFByPqMC5+9
 JhEs8i+qhxC52MwjOvs4uEk8w5qbuLOKN45P1yMUlv/kBTTvRicE8Nn7ctVsDZcMWlvS
 4LS4mhvzrburH4oQKmU860qVpn86v0r6fZHtTtI9h1RBXEeloT061UXfyljBFtmfJ/hM
 BmrENdL+MsHxHG0gNaHncBAPgwYkWNaEuq6cnlnVBe3h57MIqiad+TXcRasHu20zLkCg
 WMFDkDnjAtZuq6G50ce91kCkUfZ6Q6W7kDsthG5Hhif+wtucfByZJUq8k5mMEnWwPJwp
 ntpA==
X-Gm-Message-State: AOAM532jNFgat+favVlStZUJ3nZj3j6L6RcSV/EyM6Rx/jYyrznzz3BS
 O9hNVGXp/obrVZNvZI3y1cIJKQwbWoM03ge8N48=
X-Google-Smtp-Source: ABdhPJyRpK/GQX+qAjQraLTh+B2GuiTj9gVfd+fATPAcnu4WiNbK7ena1jwOnVqEWGid09QXNOn8veGP/wC3IIKloi0=
X-Received: by 2002:a05:6902:708:b0:63d:dcb0:c73e with SMTP id
 k8-20020a056902070800b0063ddcb0c73emr24391846ybt.231.1649660244088; Sun, 10
 Apr 2022 23:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220405121950.3528296-1-qtxuning1999@sjtu.edu.cn>
 <CAEUhbmXBxU8-5qnVSbfcSqq0RJHdH+CtKUnhRiXXJB+cmmX3kA@mail.gmail.com>
 <ff00d8f2-be00-ac9d-0b43-4a73ae8b3b5b@gmail.com>
 <f4312553-1605-625e-5a33-7bf09ebbd566@redhat.com>
In-Reply-To: <f4312553-1605-625e-5a33-7bf09ebbd566@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 11 Apr 2022 14:57:15 +0800
Message-ID: <CAEUhbmWK99RFerHCzBB3bq8_6be+Ykvi+Nb20Q=m137xda69Bw@mail.gmail.com>
Subject: Re: [PATCH v1] hw/ppc: change indentation to spaces from TABs
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Guo Zhi <qtxuning1999@sjtu.edu.cn>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 11, 2022 at 2:45 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 08/04/2022 21.19, Daniel Henrique Barboza wrote:
> >
> >
> > On 4/6/22 07:08, Bin Meng wrote:
> >> On Tue, Apr 5, 2022 at 10:36 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
> >>>
> >>> There are still some files in the QEMU PPC code base that use TABs for
> >>> indentation instead of using  spaces.
> >>> The TABs should be replaced so that we have a consistent coding style.
> >>>
> >>> If this patch is applied, issue:
> >>>
> >>> https://gitlab.com/qemu-project/qemu/-/issues/374
> >>>
> >>> can be closed.
> >
> > Please add the following tag in the commit:
> >
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374
> >
> >
> > This will make Gitlab automatically close the issue when the patch is accepted.
> >
> >>>
> >>> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> >>> ---
> >>>   hw/core/uboot_image.h  | 185 ++++++++++++++++++++---------------------
> >>>   hw/ppc/ppc440_bamboo.c |   6 +-
> >>>   hw/ppc/spapr_rtas.c    |  18 ++--
> >>>   include/hw/ppc/ppc.h   |  10 +--
> >>>   4 files changed, 109 insertions(+), 110 deletions(-)
> >>>
> >>> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
> >>
> >> uboot_image.h was taken from the U-Boot source, I believe it should be
> >> kept as it is.
> >
> >
> > (CCing Thomas since het explictly listed hw/core/uboot_image.h in the bug)
> >
> >
> > I am not sure about keeping this file as is.
>
> Seems like uboot_image.h has originally been taken from U-Boot's
> include/image.h file ... but the two files are completely out of sync
> nowadays, e.g. U-Boot switched to enums instead of #defines at one point in
> time. So I think it does not make much sense to keep the TABs in here, and
> I'd rather like to see them replaced with spaces indeed.

This file has been sync'ed recently.

See http://patchwork.ozlabs.org/project/qemu-devel/patch/20220324134812.541274-1-bmeng.cn@gmail.com/

Regards,
Bin

