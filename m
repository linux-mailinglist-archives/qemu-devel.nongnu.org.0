Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E184164B720
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:19:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p566b-0007TR-I8; Tue, 13 Dec 2022 09:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p566V-0007Rw-Pu
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:17:55 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p566T-0002CE-Uo
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:17:55 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3f15a6f72d0so193317247b3.1
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 06:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyIcWKimQRoiILHSeWTXxmva6rPPGIznXNGujBbj7MI=;
 b=o67D+smxhsLSEQ1LULBdQryW9iTwlDKqVCj4+PyDAOg6C7Fm2kr4Jrf6wtMO24Muac
 LjcKa5f1/8BAgsraKUJeaF+g3w2el2HIkEhQQlUHjulZf5snN9ZJ9RMbJQ3FgrOR/qgF
 Y496zL4HF7r/fm5AOC3TMMFoStk8OdpWmrU8qi0ZQXTjmVYJkAPIXIOqXgDzAI/LemE4
 0tdRTF93EDrGjK4kmocEVE6FHmCo+PxucyJZTtkyATmEWuz9JP4c6xE4uNQnxNPcRRIi
 iFksR1vG/CgSkda8UDMAUwWO3WW4OttdeapHoSkrxrqt2GJz9PbqttccOXew8gxl8t9B
 c3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KyIcWKimQRoiILHSeWTXxmva6rPPGIznXNGujBbj7MI=;
 b=MpxWJ8qJHog36YcHEKJhfv81s49B/m7KfiSdteWpyXV0plBVBXZU7IslgPS98ajesi
 h8FeFQGGKBGW1T6LcdIiDTGITvnsc/7M7LQYfU3nZYW8exZd66QdCqyHe8h1KlHxTW0v
 /TPWkmaL8/fIp1yzXjYio3qqHC3p4EzV5i8qO9nP92wjE+aca0SE4lq8hIM9QqgMUt/D
 5PQt+DunroXdpcOKu+lCzVo8yjLwJWB4aweMVc4edKJelojv3uQkfCmAnBYTcXM0NcWd
 yLfewaMokFzqaXWdy0pCVndQgXDr1AzoFv0Catc1giO48HwGNXvB6rS8QlZcnj3piv1b
 JIrg==
X-Gm-Message-State: ANoB5pl8+jfraQ2YcktHAz0bDb2RsGLvLmpiXYf0EG8jWdhadO9Yys26
 ynISAPjuufJ5bsveW+T1Y+Nedr/IT1eOlYyu4cQ=
X-Google-Smtp-Source: AA0mqf7/cFsLsUQRno7NpggMAIgSi4tHsWkW3ZInoSp3kRmDvO8SOMUTaSoHiI+kdOYodkaNMeF6Vf5LLqsLZ8DRHeM=
X-Received: by 2002:a0d:f101:0:b0:3ef:23fb:124b with SMTP id
 a1-20020a0df101000000b003ef23fb124bmr18107795ywf.111.1670941072723; Tue, 13
 Dec 2022 06:17:52 -0800 (PST)
MIME-Version: 1.0
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
In-Reply-To: <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 13 Dec 2022 09:17:40 -0500
Message-ID: <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Mark Burton <mburton@qti.qualcomm.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Brian Cain <bcain@quicinc.com>, 
 Warner Losh <imp@bsdimp.com>, Luc Michel <luc@lmichel.fr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Alessandro Di Federico <ale@rev.ng>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Anton Johansson <anjo@rev.ng>, Michal Privoznik <mprivozn@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, "Denis V. Lunev" <den@virtuozzo.com>,
 Cleber Rosa <cleber@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Dominik Csapak <d.csapak@proxmox.com>,
 Christophe de Dinechin <dinechin@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, 
 Dongli Zhang <dongli.zhang@oracle.com>, afaerber@suse.de,
 andrea.arcangeli@redhat.com, 
 bazulay@redhat.com, bbauman@redhat.com, cjia@nvidia.com, cw@f00f.org, 
 digitaleric@google.com, dustin.kirkland@canonical.com, 
 Eric Blake <eblake@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 felipe@nutanix.com, iggy@theiggy.com, Jan Kiszka <jan.kiszka@web.de>,
 Jason Gunthorpe <jgg@nvidia.com>, 
 jidong.xiao@gmail.com, jjherne@linux.vnet.ibm.com, 
 Joao Martins <joao.m.martins@oracle.com>, mburton@qti.qualcom.com,
 mdean@redhat.com, 
 mimu@linux.vnet.ibm.com, z.huo@139.com, zwu.kernel@gmail.com, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
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

On Tue, 13 Dec 2022 at 09:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 12/12/22 00:41, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi,
> >
> > In the last years we had few discussions on "simplifying" QEMU (system
> > emulation / virtualization), in particular for the "management layer".
> >
> > Some of us are interested in having QEMU able to dynamically create
> > machine models. Mark Burton's current approach is via a Python script
> > which generates QMP commands. This is just another case of "management
> > layer".
> >
> > Various problems have been raised regarding the current limitations of
> > QEMU's APIs. We'd like to remember / get a broader idea on these limits
> > and look at some ideas / proposals which have been discussed / posted
> > on this list.
> >
> > Feel free to complete your thoughts on this public etherpad:
> > https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
> >
> > Topic I remember which can be good starters:
> >
> > - Current limitations of QAPI (& QMP) model (Markus Armbruster)
> >
> > - Adding a new qemu-runtime-$TARGET / QMP-only binary without today's
> >    limitations (Daniel P. Berrang=C3=A9 & Paolo Bonzini)
> >
> > - Problem with x-exit-preconfig, reworking MachinePhaseInit state
> >    machine (Paolo Bonzini)
> >
> > Markus / Daniel / Paolo expressed their ideas on the list (the
> > historical threads are referenced in the etherpad) so reading the
> > relevant threads before the call will help to get in the topic.
> > These people don't have to be in the call, but if they can attend
> > that would be very nice :)
> >
> > The call will be Tuesday, December 13 at 3pm CET on this Bluejeans link=
:
> > http://bluejeans.com/quintela
> We moved the call here:
>
> https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOG=
Y5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2

Please use a video conferencing system that allows people to join
without logging in and works across browsers. I gave up on Teams.

Stefan

