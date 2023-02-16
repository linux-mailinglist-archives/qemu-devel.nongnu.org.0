Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7956999A8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:17:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgw4-0003fy-Ib; Thu, 16 Feb 2023 11:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1pSgw1-0003fW-RM; Thu, 16 Feb 2023 11:16:38 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1pSgvz-0004aV-D1; Thu, 16 Feb 2023 11:16:37 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-53388269e84so26356957b3.9; 
 Thu, 16 Feb 2023 08:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MEF5uWW48BQ6rzQ3ED3lOov4MXeXVVMRq8jB1eCCXRk=;
 b=QPu6IPCpRbQq/Wwn8Hh20trkI35yJmU3TfoualeEUhyHW3BwIjF1dCKgXDIozIvwF5
 stpg1pc/1wKykzBCW3Z9SjXfsI//NR92Eof9ZxDZ105O2Colg8PJEb9hlSgufkfI5qgf
 7/i3m707oL3KuqG3z6YVoEbHmfT/qLH1eTkNtjhKskb5SwOcyt0xrQMz7cWYKC573ge7
 2Ca42oid5TO+RbxrewidKs7o6otbb0Vjs/2q6GONz+HU17stLShMpxJWYysSa6CRPmPt
 482I9JrnTISMV8yg/ltqCToAq5p1mUkPMog69ADjFDBb+DYObXNBhbkrmtJ/1WUUJpq8
 N+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MEF5uWW48BQ6rzQ3ED3lOov4MXeXVVMRq8jB1eCCXRk=;
 b=sXubStDRIuUPD7ZBaWYjklcdiKGBmwjxIwVf0mcrHegXplv1TJucYDwuVBt6ww2Ome
 V/Ws+6vnZ5KhRjXZzu2kWAgmqEAp/uH2MN01wl2bYvdpD60mIAL3X2Ey7r21+PefMBpg
 PCt5Mfc09I/nbH7XJNDxMfQIoaezQeAhC5pKAcUkaEV0Rr1SqlXAJJWNkWO7s48wnfSJ
 /0aTjkbRskzElC6EbUFWgff6STBkMdE95rTu4BDAbdx/adSjGsNVSiXvkV9ib42viacm
 r1lApw3ne7VonoSwnqc21WkvmnbP1fefk6hSMQPIL4y4lAf9+0OCZ7070msH43p9op41
 M1Jw==
X-Gm-Message-State: AO0yUKWZWtYrZgleyACYHiORdb/ZkJIMJHUNq/hV2MMsU9WymtebCLIL
 1sspF6tIz2GQAEoXWQpeltyQT4udA2eQod3P9BY=
X-Google-Smtp-Source: AK7set8JoimXGmyg5K96IQwGg8IBN2EvnoU2eZQULTjoKpw0SiCCZ0sZ+uid+hCEgUfmfC7W6m2UkYl8xBP5/ZDHGrs=
X-Received: by 2002:a81:a056:0:b0:533:8b60:f18d with SMTP id
 x83-20020a81a056000000b005338b60f18dmr198264ywg.185.1676564190243; Thu, 16
 Feb 2023 08:16:30 -0800 (PST)
MIME-Version: 1.0
References: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
 <CAFn=p-ahLoVd3W2GaFp5EUFq5EOudz+bUkEk5DV+Z07AjHaHtg@mail.gmail.com>
 <d07bdbc1-065e-f8ec-2a44-ab141ffedd41@proxmox.com>
 <CAL77WPAdDyKFWP_Dqsz_xr7OCzHLTkw6VbYDMGobi8kek4e_8A@mail.gmail.com>
 <edd04a3f-6ae7-fd28-81c9-25a2614076f6@proxmox.com>
In-Reply-To: <edd04a3f-6ae7-fd28-81c9-25a2614076f6@proxmox.com>
From: Mike Maslenkin <mike.maslenkin@gmail.com>
Date: Thu, 16 Feb 2023 19:15:54 +0300
Message-ID: <CAL77WPBxNr537p_GOez9D_ZgzxEjtrvpoLHjMLAtUA0VFSVG0A@mail.gmail.com>
Subject: Re: Lost partition tables on ide-hd + ahci drive
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, 
 Aaron Lauterer <a.lauterer@proxmox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=mike.maslenkin@gmail.com; helo=mail-yw1-x1135.google.com
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

Makes sense for disks without partition table.
But wouldn't Linux or any other OS write at least 4K bytes in that case?
Who may want to write 512 bytes for any purposes except for boot
sector nowadays..
In dump mentioned before only 512 bytes were not zeroed, so I guess it
was caused by IO from guest OS.
In other cases it can be caused by misconfigured IDE registers state
or broken FIS memory area.


On Thu, Feb 16, 2023 at 6:25 PM Fiona Ebner <f.ebner@proxmox.com> wrote:
>
> Am 16.02.23 um 15:17 schrieb Mike Maslenkin:
> > Does additional comparison make a sense here: check for LBA =3D=3D 0 an=
d
> > then check MBR signature bytes.
> > Additionally it=E2=80=99s easy to check buffer_is_zero() result or even=
 print
> > FIS contents under these conditions.
> > Data looks like a part of guest memory of 64bit Windows.
>
> Thank you for the suggestion! I'll think about adding such a check and
> dumping of FIS contents in a custom build for affected users. But in
> general it would be too much noise for non-MBR cases: e.g. on a disk
> formatted with ext4 (without any partitions), Linux will write to sector
> 0 on every startup and shutdown.
>
> Best Regards,
> Fiona
>

