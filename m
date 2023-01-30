Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF7680A79
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 11:08:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMR52-0007Sg-6D; Mon, 30 Jan 2023 05:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pMR4z-0007SX-SU
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:08:01 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pMR4x-0004RN-S1
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:08:01 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p26so18922278ejx.13
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 02:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hKgjk454OLqf9QCzJFz/v39Fz1cRGFDrO17O6MwpGj8=;
 b=lcsjci45nLCfvdpFlTs5+as+TqlJWxfy+MTvm0PhQi3YObqXlaq85nIf4+YrPKQfJ7
 iCJCHEbHvfUCaJoHxvFr3n7Nwt1lJEQBSU4eWr2XljcHBxbzVhPEGzobLzFpQL1Qg7lr
 EiM5BkLgsfCuyXCHiameI7ws7NxYCNWTOmAiT106uGl6BMOqU1nc2ml+ahIhd2ypKEe0
 Tc0iF7NMcNhYM6V6drlslNbrDQE2API5osvLm1qEp20Qz+ImoT3cpey9t/tEZU0TQ+bz
 zbQMIad0/BIofAZHhIDr8yGL2HFfjlQL2BRbRLUQ/mPGHdPOzwzl774+UyCENfkGG3Ug
 VJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hKgjk454OLqf9QCzJFz/v39Fz1cRGFDrO17O6MwpGj8=;
 b=vZdhVEfhMKMIAIdJvlH2rknTJiEzsjwP+Paq6MztxCkVkfiPj1CzSs8o3mxwZ3JJHr
 zoK2XrOWLtR7AO4L/Zu5ERLNDe2lGlrP5DBlL4ag5RC49/PxV+ZVZ2KyGfvsT/z4qtWE
 mpSkdvgk+PY4sm0WVDEAT3LCEuZDNaGF9Hp5bAaWEgxxRqy6Zr8c5Fncr3mKic3+wsr2
 FxrlfYMFtsw0ZgipODxKmi6fuw7/ybdtb3mxlvK4ycSEI1I2C0t0qgJYcICRCMDocGzY
 9I1/ruJLa4Mmz132cp7/ndogEM9YaMuQS3HpJv5RvfIAfs2JxaokCrTaGb0bZs/LoFPe
 lUFQ==
X-Gm-Message-State: AO0yUKUjypccQ2Eq00K2jeVeNTLLm+lVrT74zzJIm3SOmIK8JhwwnElQ
 LXC01Zjgsht/cKZCdJ/w8FoDi0J2ugfTaANejbo=
X-Google-Smtp-Source: AK7set87fBLb6uzx8v37AEHQXhnKxQUwrOSkW1rmzbutABKZbQZmCfKDVZu34fSLqT+NXBKs5hTGRoB/K4llR6H1I7I=
X-Received: by 2002:a17:906:7087:b0:878:4d11:2694 with SMTP id
 b7-20020a170906708700b008784d112694mr3637131ejk.26.1675073277880; Mon, 30 Jan
 2023 02:07:57 -0800 (PST)
MIME-Version: 1.0
References: <1614627941.1033038.1675072872015.ref@mail.yahoo.com>
 <1614627941.1033038.1675072872015@mail.yahoo.com>
In-Reply-To: <1614627941.1033038.1675072872015@mail.yahoo.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 30 Jan 2023 18:07:46 +0800
Message-ID: <CAEUhbmWrHrqZdUDwm-OMRQHh8fBsQ3NPdDWdYRDgowmcXu_1gA@mail.gmail.com>
Subject: Re: unable to use "-net user" argument after building from master
 branch
To: Neal Elliott <nealelliott@netscape.net>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
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

On Mon, Jan 30, 2023 at 6:01 PM Neal Elliott <nealelliott@netscape.net> wrote:
>
> hello,
>             I'm unable to use the "-net user" argument with the compiled "qemu-system-x86_64" binary. I get an error: "qemu-system-x86_64: -net user: network backend 'user' is not compiled into this binary"
>
> I don't know what I'm missing when I used the configure script with the following arguments:
>
>  ../configure --enable-linux-user --enable-user --enable-curses --enable-vhost-net --enable-vhost-user --enable-png
>
> what am I doing wrong? what other arguments do I need to add to allow the "-net user" option to work?
>

Please install libslirp dev package for your host distribution.

Regards,
Bin

