Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD9262EB23
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 02:41:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqMJ-0007x7-9q; Thu, 17 Nov 2022 20:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ovqMG-0007wr-DC
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 20:39:56 -0500
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ovqMD-0004Kr-1d
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 20:39:56 -0500
Received: by mail-vk1-xa33.google.com with SMTP id s204so1761424vkb.3
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 17:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPxR39zNlvWhRDKY1EODozgRZg/N70gjT7sBstrhO8A=;
 b=QFO336SIcRmrX/m4I6r6ZY6sVUP48RfKIXqY2/Kyl1sWTMVeVJMsKMZECpYY2z+wEJ
 rLEaSrTGr3yk3XkOTzGEHl40UEw0/UVgQ1qbDqFpgdaaVhexL4GRqrzPjKcFGsZT6zLh
 /VIfO+xFuiCSlSa3gcLH+DsJDHGOv11BBPQbj5mwW5vJ1NAjZehMyBR0FzVkHGq/XDKh
 upN/yl4SbZUg206m2YhhhfiJrnKvOOvH23t2CvjNR+QpkMj2LibABlU0q6YCZ3KIGJJJ
 FEjDC0XBQb34TX6nc+Jk3EkdKnWSoAaYi25OYNs3ezxARRR7MH5eN1igr/tJF2SJWLA3
 E/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPxR39zNlvWhRDKY1EODozgRZg/N70gjT7sBstrhO8A=;
 b=rTlMG4AM98ZwPq28swpt6w4ZX170zfmSzX5gtY5OqxIW1AF4S4UvRh9mVXb2MN5hqk
 REkk9zt8dUovWMkRA+Eoqm1DQLjj5RN1T/M45GWFgt1xMmq9p7G/mf4Ssq1XNY/mIBua
 IL9SjEHzz06xC9t4kCqt5Ct58t0ipSHXvMR+gOJVo6r8uyHKztuvy2vALf41R1ut4c5e
 3CKqKfkV0+5tvmOC+wKC2BgqazUJEtCnqQDEP/RGc3JazYrOFlYhwKGhbt00I6cPNaUZ
 7TykY1RGInuIETfEn2VWMwBvMh6CUkzw5j9CVZtEa+vIcTe5aJaKZEhTe5bbclMwqHWU
 5mcA==
X-Gm-Message-State: ANoB5pmyD6Bdno4b62xL7RUEGG6Va8dDQOe/sWOFm9zDBG34HcZg0mnP
 xnyy8DR+bdoP7HWVM5llDq7EQRr55dfnt4DXyWU=
X-Google-Smtp-Source: AA0mqf5ZYvsMkuQ25EaHIjvTa6vpbRUT7giFfxT1lYoyVOYRF4WvUd1ffpFEyLW8wG7K/yri9+IIMr7JohhetYrCLbQ=
X-Received: by 2002:a05:6122:50f:b0:3ab:820:316f with SMTP id
 x15-20020a056122050f00b003ab0820316fmr3206321vko.15.1668735587913; Thu, 17
 Nov 2022 17:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20221117064444.20648-1-faithilikerun@gmail.com>
 <CAAAx-8JHmxe=9GuoZ+T1yqtLrrzk+-6_HL5EJ6LBJ+twOKp8sA@mail.gmail.com>
 <CAJSP0QX3j9SbKW7tL6_vc9Ru518qWEG=288gkd+ArkHF05Vgsg@mail.gmail.com>
 <CAAAx-8+bTxcWEbP2Q+pGOpxNAZFera31Js3wYUZt=nwqpJbG2w@mail.gmail.com>
In-Reply-To: <CAAAx-8+bTxcWEbP2Q+pGOpxNAZFera31Js3wYUZt=nwqpJbG2w@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Fri, 18 Nov 2022 09:39:58 +0800
Message-ID: <CAAAx-8+sEi5ETw7bXjP24thE8X2NJrUii2cj8M1TyA7uJhu01A@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Add a blog post about zoned storage emulation
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, dmitry.fomichev@wdc.com, 
 damien.lemoal@opensource.wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa33.google.com
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

Sam Li <faithilikerun@gmail.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=8818=E6=97=
=A5=E5=91=A8=E4=BA=94 08:33=E5=86=99=E9=81=93=EF=BC=9A
>
> Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=8818=
=E6=97=A5=E5=91=A8=E4=BA=94 03:12=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi Sam,
> > Please send a git repo URL so Thomas can fetch the commit without
> > email/file size limitations.
>
> I'll push it to the zbd branch after fixing the bellowing.
> https://github.com/sgzerolc/qemu-web/zbd

Sorry, I've pushed the latest commit and the link to it should be:
https://github.com/sgzerolc/qemu-web/tree/zbd

Thanks,
Sam

