Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E858D63636F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:26:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrdL-0007lv-0N; Wed, 23 Nov 2022 10:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oxrdJ-0007le-Gc
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:25:53 -0500
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oxrdH-0007I5-OU
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:25:53 -0500
Received: by mail-vk1-xa31.google.com with SMTP id g26so8886001vkm.12
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 07:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnWkwXG3Vi5DMXV0pPhqmGZ/Ci3Wa5x/75T1/rlQ07k=;
 b=Gcm3YBBUtUFJgRWCh9ZV7wjjpOCwZSiFgBlIrpaYWIaDNc0PMJB6HSfiPOCEqTfuZ6
 YiesspsX6TNp98BuCwIhOhW+s4lvAjShWm6pV77XhoXV2y6Mp1I0UMh6bZ5Q9MxTWQYu
 hhsdvsEayuWOAmzd0Em6YRgaM9A/cqPgiGnrRWMR9AuuQhQ6UohiF2nV0Pg6UF9b7CMv
 yisegdU13rnj4P34ti8dEFH2EnxA/bHTa64Ynb7PSrkid3OTMTQZdoywLyixOquclTrj
 BH7Q6p5+ZhK/MFwIQKgcXg3JZP9C7386FDsS29rDd3b+z8nYNp1z0pFkz3tz23B5QJZ6
 +p1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jnWkwXG3Vi5DMXV0pPhqmGZ/Ci3Wa5x/75T1/rlQ07k=;
 b=XfpKM6zr7VBv87sBQS398e0VOfPPRolRaWfXqm3RKe1mhZIctOVytTKIbKXIUSpX51
 zcipBrp0BBLiUNfjpdNQgRIhjz6lg72Z+tjFDVN0Qm1FjRSv0T3iBZ7+CYcn1XNe+4M/
 WuspsYZlZwj6TCN79gVXXVDRCNlJVJtpi4tC62JfcH7UM/tmG0jqfXrkD7AhQP+H0wen
 buWSzTiqoJt4MHfmLFSS2RVw44bKWDtIeDoCJ32v6++u4QgrmCKM540A0lORKEtCP0d1
 m6RfC9hR2RHR2gl9ka8FEMlM2tFmWpvXI4VhtQq5kJBgx2AWlu+z8urs19VJZqIDMT7v
 kQIQ==
X-Gm-Message-State: ANoB5pk3v05XidN6i+4ZKCZyPjb67SvDSZi3UQw+MGVvEGCdxYrdPD0F
 +8R4YtUImFSoOc9Xwnqmgbni2t9lCorDLR7HBlQ=
X-Google-Smtp-Source: AA0mqf6wm2bFXd0087wk5A6DV40bygsPMfcJSnnPXp2sVlgll76xXDLIRDsKFIoxhgKl1XXrUjOkL76WP5kD/UlB88Y=
X-Received: by 2002:a1f:a00e:0:b0:380:5dbd:1076 with SMTP id
 j14-20020a1fa00e000000b003805dbd1076mr6209266vke.22.1669217149869; Wed, 23
 Nov 2022 07:25:49 -0800 (PST)
MIME-Version: 1.0
References: <20221117064444.20648-1-faithilikerun@gmail.com>
 <CAAAx-8JHmxe=9GuoZ+T1yqtLrrzk+-6_HL5EJ6LBJ+twOKp8sA@mail.gmail.com>
 <CAJSP0QX3j9SbKW7tL6_vc9Ru518qWEG=288gkd+ArkHF05Vgsg@mail.gmail.com>
 <ea14c43b-a740-3ac0-622c-1b6360565946@redhat.com>
In-Reply-To: <ea14c43b-a740-3ac0-622c-1b6360565946@redhat.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 23 Nov 2022 23:26:02 +0800
Message-ID: <CAAAx-8+m17O076MPzpQAp9Q-O+_pD9PwUNmXkRHxaSY2EedTvg@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Add a blog post about zoned storage emulation
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org, hare@suse.de, 
 Paolo Bonzini <pbonzini@redhat.com>, dmitry.fomichev@wdc.com, 
 damien.lemoal@opensource.wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa31.google.com
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

Thomas Huth <thuth@redhat.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=8823=E6=97=A5=
=E5=91=A8=E4=B8=89 20:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On 17/11/2022 20.12, Stefan Hajnoczi wrote:
> > Hi Sam,
> > Please send a git repo URL so Thomas can fetch the commit without
> > email/file size limitations.
>
> The size obviously comes from the PNG image ... since this seems to be a
> photo, I think JPG would be a better file type, so please convert it to J=
PG
> with an appropriate compression level. I assume this will help to shrink =
it
> to a reasonable size.
>
> >> +<img src=3D"/screenshots/zbd.png" alt=3D"zbd" style=3D"zoom:50%;" />
>
> Another question : Where does the picture come from? Does it have a licen=
se
> that allows it to be used on websites like the QEMU blog?

It comes from slide P12 in this sharing and it doesn't have such a
license. I'll remove this image instead.
https://kvmforum2022.sched.com/event/15jL3/whats-in-virtio-12-and-what-isnt=
-there-michael-s-tsirkin-red-hat?

Here is a link to the fixed version:
https://github.com/sgzerolc/qemu-web/tree/zbd


Thanks,
Sam

