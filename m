Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9643463CD57
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Cmk-0007Wt-Q5; Tue, 29 Nov 2022 21:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p0Cmg-0007Va-VH; Tue, 29 Nov 2022 21:25:15 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p0Cmf-0001qD-Cs; Tue, 29 Nov 2022 21:25:14 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id j19so7715691vke.12;
 Tue, 29 Nov 2022 18:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u50SdkNG+26UFdSOmRlMGObRxPXr4xEJKHrzSwckZ5I=;
 b=ZU4uMe1nziaGyvPMlGb2svnu0WipRwsaCUS3RICN698UYdj/AhH133d/9iiSyTXqdf
 38t1SIkgpxdaBpNMibLpQNQDtki/dP+v4VGun8yAdgTcFrTH5CUftLD7Ua53PezstzJc
 hKj1ZE85Qd89WTY6ahZCqmcqLZCxyW2nlW0RMwI73ibvm1pU+zrs5dpliuFz2/rKY6kP
 Pvi2lwz+cyjvd4kwc78CRKEWhoB/RM2Sdvx0oKzOVU1NSWSa1hz+BS59WL+5RF5Y66A/
 n7FGicanGsLpxcD9kE3/37KZqq427sjbN9uJ13B/JiUps/ZjUXxtOQFxCEPZ6XitaPUW
 sc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u50SdkNG+26UFdSOmRlMGObRxPXr4xEJKHrzSwckZ5I=;
 b=Fmn1NCBrii5nlLULOy54vw15Tkrk4KQb3lPA9oxYwc6B9Igt0G1kDyOpo4fsV37Km+
 kMIzGiT5/SS1whTMyGxDM44YSzTwztnH/6LjyertPyChytxLkaFCjEM+WOncoiVDEIet
 ErZEs4bByjPjNPjVlGK9VOMEzOvhrxQSlVkZ+jZNp6KkkeB3Gs7iLg/mSdzj/YVIlCBu
 DOEkMBBL9aHss1pgkDOJAakX457ugP5I120GHQtnIYGKriaGhDMrLsk4W95qQZhoLE/J
 007wM6QOnXilqKQegFBiD1YV+tIssd389vXhxCUeXdPv9U4Tdm9AQsSAciBs+EVGh2uF
 yBIQ==
X-Gm-Message-State: ANoB5pkzBYLw3rqMJqFlOqOhKS/rUkivD+JUa4a12S/xr/mDpIovhhkQ
 fJjOpDtT6DDMEKO+IbljTqhqHd2+eftKvzx+h2o=
X-Google-Smtp-Source: AA0mqf6TdVP0bn1DV3F1nPXbQtDU0TpLOdNRs7YyJcfaoipE8nOC4em1cB8nOxjBMLELwfMAoN+drs/y3aStQtSlcWM=
X-Received: by 2002:a1f:a00e:0:b0:380:5dbd:1076 with SMTP id
 j14-20020a1fa00e000000b003805dbd1076mr24836693vke.22.1669775110537; Tue, 29
 Nov 2022 18:25:10 -0800 (PST)
MIME-Version: 1.0
References: <20221027154504.20684-1-faithilikerun@gmail.com>
 <CAJSP0QU65WyUFCP4kc9u3kcDAysneLFSGTFCJP=jRixBOS9FWQ@mail.gmail.com>
In-Reply-To: <CAJSP0QU65WyUFCP4kc9u3kcDAysneLFSGTFCJP=jRixBOS9FWQ@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 30 Nov 2022 10:25:25 +0800
Message-ID: <CAAAx-8LWQXxk4nv1btnS0bqbH5QwsFS7VDCesMFzhTd7DDajCQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/8] Add support for zoned device
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, 
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org, stefanha@redhat.com, 
 Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, 
 dmitry.fomichev@wdc.com, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa2d.google.com
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

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=8830=E6=
=97=A5=E5=91=A8=E4=B8=89 10:04=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 27 Oct 2022 at 11:46, Sam Li <faithilikerun@gmail.com> wrote:
> > v13:
> > - add some tracing points for new zone APIs [Dmitry]
> > - change error handling in zone_mgmt [Damien, Stefan]
>
> Hi Sam,
> This looks very close! I sent comments.

That's great! I'll fix them.

Sam

