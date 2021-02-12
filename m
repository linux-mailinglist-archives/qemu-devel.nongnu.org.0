Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9BB31A769
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 23:19:27 +0100 (CET)
Received: from localhost ([::1]:53408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgmc-00077w-Ie
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 17:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAggG-0001TA-Cc; Fri, 12 Feb 2021 17:12:52 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAggA-0002U5-U5; Fri, 12 Feb 2021 17:12:52 -0500
Received: by mail-il1-x12c.google.com with SMTP id d20so604075ilo.4;
 Fri, 12 Feb 2021 14:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OYq2dKIIGHJHBfONeQl5GutEL21gDVd0aTuVC4UnrbE=;
 b=aCgXo3PoiaV3mJKwOlcB4AbF36HzpDyVQ4a+vkwzw4Nm6SU2GbfcBeUvQdCviyNR+a
 1S9GerutOZsR9bpFaOMETN8O+Qt5Nyep3TdNZppNyRZJJGnifyTxbqE/4fs4RybAOPpY
 KYIXjdOtnxuZLQjqC44tpBvk7UETEqyHVBcEzT/IDv7NJUn2DdUG8N1WjK8of2EglQWx
 IXClSF/X+6Z3arlb09Ca6v4kQzyqjrcLS5GKUdEMmMPfqGUITareV4V6t39ulCBbR9Va
 ZAfg8drHosuool/dF6N3SLYPcnNctlQwMbMDBb7QssCD2KpwXMKSEKqY3IqLBgvaESCD
 7jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OYq2dKIIGHJHBfONeQl5GutEL21gDVd0aTuVC4UnrbE=;
 b=rYHRG8LlRVJEmVKaBBsm7QF45y25u49zlxS5gwynU7U9q0g86rKpu4q1Jr8FjQEYYN
 H5JuoRPIkm+Zf3804JDk0w4W3U3KXqZ0u+KX/knZVbNmzj+lXFS2kuB/nr/bPdDE/rM5
 9cy4FD1FPzHEUhKyLsI9+NOVEXUYSzyOY39upKUfTyKFTPT80+mwyJh/jvJRkySyXqoJ
 TiYP0fFm2fzC/yPS5sCf194Lm/k8tvNNsOS0TJLaFX5Sao+v/XGvcyTVxKy7p9czCadM
 UZ/lJMvQsmBCxHnwo1Eu4u0HoX85sL639gO1qr3ATt5faxQk17z9WDI9ZstCYk6416ab
 tqIg==
X-Gm-Message-State: AOAM531GsJgWp5lWPtMjnNWBCPdWXF6yu1ReW564BeIL9p42nCF06tWS
 J+WnFtpu82470bT0SE9kNXuFMivIzEIqDRrQZiA=
X-Google-Smtp-Source: ABdhPJzaLvfpcDuMZWuLHz2oFau1jlds9+Spr6sLqDpUYzKZJiNJHBJUQweU8L7mrKLZtHiOESkp1h044p1hxZfdbwg=
X-Received: by 2002:a05:6e02:218f:: with SMTP id
 j15mr4013252ila.40.1613167965692; 
 Fri, 12 Feb 2021 14:12:45 -0800 (PST)
MIME-Version: 1.0
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-15-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1613031446-22154-15-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 14:12:05 -0800
Message-ID: <CAKmqyKMOc5tzO+wEJvmjNXz92oOHVPk00OCM7FHCvEBaAf7rpQ@mail.gmail.com>
Subject: Re: [RFC PATCH 14/15] sd: sdhci: Support eMMC devices
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Luc Michel <luc.michel@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:34 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Embedded device slots should be allowed as support of eMMC is available.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/sd/sdhci.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 8ffa539..771212a 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -99,10 +99,6 @@ static void sdhci_check_capareg(SDHCIState *s, Error **errp)
>          msk = FIELD_DP64(msk, SDHC_CAPAB, ASYNC_INT, 0);
>
>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, SLOT_TYPE);
> -        if (val) {
> -            error_setg(errp, "slot-type not supported");
> -            return;
> -        }
>          trace_sdhci_capareg("slot type", val);
>          msk = FIELD_DP64(msk, SDHC_CAPAB, SLOT_TYPE, 0);
>
> --
> 2.7.4
>
>

