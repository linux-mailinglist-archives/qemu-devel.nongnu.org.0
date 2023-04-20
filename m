Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984EC6E8CD3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:33:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPj8-0005T6-C7; Thu, 20 Apr 2023 04:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1ppPj5-0005SG-NM
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:33:11 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1ppPj3-0001cu-Or
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:33:11 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso1826938e87.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681979588; x=1684571588;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilpmsBdRTNwFZpvyqW7BGQHY9wNDDoR0weBjjUMv9bc=;
 b=VMrWceJBRQXCnNbwDPsDvUd/wdF5rpTEHPSfn8Vg00cliNQZe/IWz3vu85uVayHZ21
 lIRki3py3JMFGyrGV1Ix07ITbjudxY8LUNqh4IA+s2RFqAGQ5EKmJG+gTpcGDg0mLkIp
 pbOmvoSJllJHYj/cPQ9dlBBBXUxDlvfIOxgfiGhOhNDC4LWJraHQUxYEUMVwyCXdlJQf
 mUhI03zo0tIJrPeiUjMYEK6EOpL3D1Z90va6BXDrgGCvMZmco5B1udOht3pxsShEzrJf
 5TnFzq/Dak8LDMYM+l/C38jy2nhWlsJtm9fARV7n1+CyUfYzIZgZ96sV4TTNWwjqqhPw
 TgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681979588; x=1684571588;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ilpmsBdRTNwFZpvyqW7BGQHY9wNDDoR0weBjjUMv9bc=;
 b=cc2gPhu9DmpF5LVhX83kzLdUGRn5C2gcSoCOjnn0vqGE37zzpJgSx9YKXXpgF6j8BW
 sPYhJ+wbJceGj9gt95sgFAZSHPzr074x1f7oT0/L2KcWuVxhemtS5EhlOD1CDNd+4Bv5
 Zo8+saCL2T3U65qm4mAcULhmStWJ3KJAaTQc+clQxkZ7Hl408yMDxqYhUYTfpaxIXnmq
 ut2RgkH3TiFL5+meJ39aNkanE3P2RInhNI2v4/LnvFdd4kHZc4m6jscVSSbpgkWU772r
 YIZ2w2lT2p22H3IRV/+1FCLD8EH5h6FbTgoLcKAyQ0/5MJ8BIRce4JR4qCTnPHKyos0z
 iAeg==
X-Gm-Message-State: AAQBX9cKZG4tDW6FrrXoboYvt1FiG05tHFRGgU+OIMFretQp5eJCcvwE
 MQ+8QdsQrVxzfR8RMBau2PSALbT/PNELWSo90/w=
X-Google-Smtp-Source: AKy350YA+42MUAt2RyibcS8rs7B6m4VgWfzY2SNMmXfgTPlnHrwLVTa4AMGRUcad1pqFb8b2/d7GQsVkYkgpj/JBPmU=
X-Received: by 2002:ac2:5446:0:b0:4ee:e0c7:435d with SMTP id
 d6-20020ac25446000000b004eee0c7435dmr13711lfn.0.1681979587194; Thu, 20 Apr
 2023 01:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681732982.git.yin31149@gmail.com>
 <CAJaqyWcmb=LuH4eaJkkGxcAnPrJ+er=Ysp7Yi6RneFGdTNycCA@mail.gmail.com>
In-Reply-To: <CAJaqyWcmb=LuH4eaJkkGxcAnPrJ+er=Ysp7Yi6RneFGdTNycCA@mail.gmail.com>
From: Hawkins Jiawei <yin31149@gmail.com>
Date: Thu, 20 Apr 2023 16:32:54 +0800
Message-ID: <CAKrof1NLQTozSiZXZESFP-bDwEnu++P_wA53QZTaCvy7r2WWXw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Send all the SVQ control commands in parallel
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: jasowang@redhat.com, 18801353760@163.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=yin31149@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 20 Apr 2023 at 01:17, Eugenio Perez Martin <eperezma@redhat.com> wr=
ote:
>
> On Wed, Apr 19, 2023 at 1:50=E2=80=AFPM Hawkins Jiawei <yin31149@gmail.co=
m> wrote:
> >
> > This patchset allows QEMU to poll and check the device used buffer
> > after sending all SVQ control commands, instead of polling and checking
> > immediately after sending each SVQ control command, so that QEMU can
> > send all the SVQ control commands in parallel, which have better
> > performance improvement.
> >
> > I use vdpa_sim_net to simulate vdpa device, refactor
> > vhost_vdpa_net_load() to call vhost_vdpa_net_load_mac() 30 times,
> > refactor `net_vhost_vdpa_cvq_info.load` to call vhost_vdpa_net_load()
> > 1000 times,
>
> Maybe a little bit too high for real scenarios but it gives us a hint
> for sure :). Maybe it is more realistic to send ~10 or ~100 commands?

Yes, it is absolutely too high for real scenarios to call vhost_vdpa_net_lo=
ad()
1000 times. But considering that the time to execute vhost_vdpa_net_load_ma=
c()
30 times is very short, the result time may be highly unstable and
fluctuate greatly,
 so I call vhost_vdpa_net_load() 1000 times, hoping to get a more stable re=
sult.

>
> >  to build a test environment for sending
> > multiple SVQ control commands. Time in monotonic to
> > finish `net_vhost_vdpa_cvq_info.load`:
> >
> >     QEMU                            monotonic time
> > --------------------------------------------------
> > not patched                              89202
> > --------------------------------------------------
> > patched                                  80455
> >
>
> Is time expressed in seconds or milliseconds? I'm going to assume ms.

I got this by calling g_get_monotonic_time(), it should be microseconds
according to [1].

[1]. https://docs.gtk.org/glib/func.get_monotonic_time.html

>
> So let's say all the time was spent in the context switch between qemu
> and kernel, this is a save of (89202 - 80455)/30000 =3D 0.3 ms per
> command?

Yes, I think it is a save of 0.3 microseconds per command.

Thanks!

>
> Thanks!
>
> > This patchset resolves the GitLab issue at
> > https://gitlab.com/qemu-project/qemu/-/issues/1578.
> >
> > Hawkins Jiawei (2):
> >   vdpa: rename vhost_vdpa_net_cvq_add()
> >   vdpa: send CVQ state load commands in parallel
> >
> >  net/vhost-vdpa.c | 150 +++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 112 insertions(+), 38 deletions(-)
> >
> > --
> > 2.25.1
> >
>

