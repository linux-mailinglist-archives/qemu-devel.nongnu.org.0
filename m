Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4BD3088EC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:13:12 +0100 (CET)
Received: from localhost ([::1]:38872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SeF-0005ca-PN
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5Sc0-0004DI-5r
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:10:52 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:32819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5Sby-0002rt-KR
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:10:51 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c6so10317868ede.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 04:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=idH8gpK02t9AG1JbvCiu6bc4nrzaKrJy0qZc6GYuKvE=;
 b=eGP8weCm+ugzeN2nIlfeNeuhzCZIS4fwKPTUnBTspXKdADZBS6AEdnQaA2n3vE1Zp/
 +oVF7I30ibq0z3SrLAxutS5AgMdom3OXs2RbDrr0eXk2drg1on9ah2S0o+j2ja20H1DS
 UU9uoc/AM+gzJZg6LvdCaGFpDHYPG2I6IA6LBL+LNtdACtZ7LmwQGIYje5SE32AOHzjO
 V+36irMvNLy7RvgtNmLXIs3KGuk7waA90SeO+lfRQ46l5nwbaQmAoIT0SlNpfyHx8CQl
 5sLwNbOgDx1bndj6dn4Iii+3cmjYUNkZ6LDCjrEr1BAWZPW9Lbr6jbJvXwQNqjfTvbh1
 YLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=idH8gpK02t9AG1JbvCiu6bc4nrzaKrJy0qZc6GYuKvE=;
 b=NK7B30v5OWC9sBgXaPmOYKTvcPc+ON+b+olbJ9uoS6ciCYmmqch7z+dA85LxNttmRJ
 /IuWWm8AxT4Y3gzf+6l2Mh4nKx5n21/tHd3uh88E2cNqDTWZpq6PMJEy99Lk9AsU+6lx
 q9kL2HVcjPFHuyDvZF9nN9KvTK7vZe7YMIH0yx+RdOAQNdBCe04c9V8xJm/L87AZwpDI
 ncRTbSD8xNcmUIEraigdtwvsFeAncl4oWhWQOshMTg1JYQ9eQNrGE508XFUkg2NVjKfC
 nFlJsGXSoxXEl/RqG7PncVou9aLkkeo5ggZp5IAv2xPk1HBfjAuLzQp60mEQXkiDx1F1
 x1eg==
X-Gm-Message-State: AOAM532CvCiA9rH2HsUDY+Xm1ZVr/vClbtmUEM6obOpUmsD/vw8ppGm4
 iTK9oEjutMNmvNBHNWbfpGtlFjp/QRCca7L5tZI=
X-Google-Smtp-Source: ABdhPJwbfxIBuPPYrrro9LUwx3UIfSYlziodHzux7GFxCSzs4ovl9IG+FVN2ieWV/SvZSkR8kNiVVOIxuTQ/T/ZNZ80=
X-Received: by 2002:a05:6402:11d3:: with SMTP id
 j19mr4698214edw.314.1611922249233; 
 Fri, 29 Jan 2021 04:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
 <20210129120253.36dz6ewxsc7dy43q@sirius.home.kraxel.org>
In-Reply-To: <20210129120253.36dz6ewxsc7dy43q@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 29 Jan 2021 16:10:36 +0400
Message-ID: <CAJ+F1CJc_bfi-m92pYAJoPZh6R_GamfhkRn6RWmEPXKG8Tctzw@mail.gmail.com>
Subject: Re: vnc clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Jan 29, 2021 at 4:03 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > - the spice protocol had a number of iterations to fix some races. It w=
ould
> > be great not to repeat the same mistakes, and I don't know if VNC have =
the
> > same flaws or not.
>
> # grep CAP.*CLIPBOARD.*, /usr/include/spice-1/spice/vd_agent.h
>     VD_AGENT_CAP_CLIPBOARD,
>     VD_AGENT_CAP_CLIPBOARD_BY_DEMAND,
>     VD_AGENT_CAP_CLIPBOARD_SELECTION,
>     VD_AGENT_CAP_MAX_CLIPBOARD,
>     VD_AGENT_CAP_CLIPBOARD_NO_RELEASE_ON_REGRAB,
>     VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL,
>
> Oh yea, I see.  Is that (and the rest of the protocol) documented
> somewhere, other than vd_agent.h?

Yes, the git log/blame is probably the best reference: I don't know of
any up to date documentation of the protocol, only some ancient
documents.


--=20
Marc-Andr=C3=A9 Lureau

