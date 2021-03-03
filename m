Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3619832B7FC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:25:04 +0100 (CET)
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRUt-0008Oj-88
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lHRQc-000695-QP
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:20:38 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lHRQY-0000VG-EU
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:20:38 -0500
Received: by mail-ej1-x62d.google.com with SMTP id ci14so23113296ejc.7
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 05:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BVo5NQpbgLLyiv1TVIUsYBXPnP+8BwdM1vw6PspDFeU=;
 b=gbdyRS9K6gKjKEfrQSR6/IL7zHmPz876HoaQOnne3Q/FJCRQ4Lp0dBVGHWKxjAVhhb
 dNCmma8m0q0kwyBDWvhND88egohtKGb8YJVTOFi00hMnD7o4na483A2/nWIE4MtidI6q
 J9BizQ0FN5hAgXsLHSJ/Hk8oEMAeJXHkRjB35aia2WB+7hZO10ofeEw+YdbRsd0maE3T
 uKOGLZGX/5KVY6s0ZjDOuU89zSHyH04+59LTpYFUI9sxPJmBkLu5iUDpjTTf+JlEhoCH
 AeT/qbuwEVIofRMNfcYbFn+nCnMxO8aqTLorlNmobaKRqE3cKOd30vogxjclGWe37F3c
 FdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BVo5NQpbgLLyiv1TVIUsYBXPnP+8BwdM1vw6PspDFeU=;
 b=Xgve94VaNJ14a9uqEofrvrxSEV5jiuC8O8lLEnqE8w4kxaSXuPK0bU2mflGQn9R+ac
 26y39dTKrf8d8P5uoc6CKSMddP0ixE69zy/cSGEtifImmPHKQZNZiiZItDmum2j5LQnT
 p2IC+NV11HYmDqhAVm64wE0bsy7TrapQPTL6lPWSyQ6WEbakemvSB3kkhzgOFcnShD/R
 jFLizsqOgL3Op3WDYGGCh4ixbQULJUdZIuCyvmB0H/h+w2OglsInqQTJEWSZeRAdcP4G
 5oR/s+cLIgz1jk4lSki6BfSxaEv5ASaq0dlR0nKg9erZ9kFtrnzLsO2FbQ8Z4zI57Pdv
 n+YQ==
X-Gm-Message-State: AOAM533G31oSsMnILDLzMcHjPyeNttE5NR+e2y0/Bmjd/V4J456fk8i0
 bmGIPjsvb0yZT9rYqyKb+6pHL3bWYybb4ANclA4=
X-Google-Smtp-Source: ABdhPJwind4FiO3o7sFzYjNH0woc+ALpbqKubyiHV8mNfWCmEEKH3pnqfVvpTu35BqQvrof1+ZgkaGe479lZAzsoFgw=
X-Received: by 2002:a17:906:1386:: with SMTP id
 f6mr14784468ejc.45.1614777630974; 
 Wed, 03 Mar 2021 05:20:30 -0800 (PST)
MIME-Version: 1.0
References: <20210301114554.9430-1-akihiko.odaki@gmail.com>
 <20210301114554.9430-2-akihiko.odaki@gmail.com>
 <20210303092700.xnvsdzn7ykpzkvvu@sirius.home.kraxel.org>
In-Reply-To: <20210303092700.xnvsdzn7ykpzkvvu@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 3 Mar 2021 22:20:20 +0900
Message-ID: <CAMVc7JXtmowah7f8DyW3_hgze6622_zF5dVeAE8mXu4sGMenoQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] coreaudio: Handle output device change
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=883=E6=97=A5(=E6=B0=B4) 18:27 Gerd Hoffmann <kraxel@re=
dhat.com>:
>
>   Hi,
>
> >      status =3D coreaudio_get_voice(&core->outputDeviceID);
> >      if (status !=3D kAudioHardwareNoError) {
> > -        coreaudio_logerr2 (status, typ,
> > -                           "Could not get default output Device\n");
> > -        return -1;
> > +        coreaudio_playback_logerr (status,
> > +                                   "Could not get default output Devic=
e\n");
> > +        return status;
>
> This "pass status code to caller" change can and should be splitted to a
> separate patch.
>
> Likewise with the logging changes.
>
> That makes the patch with the actual functional change to deal with the
> device changes smaller and easier to review.
>
> thanks,
>   Gerd
>

Actually the code was extracted from coreaudio_init_out to
init_out_device in this patch. init_out_device "passes status code to
caller", but coreaudio_init_out still doesn't. A new executor of the
procedure, handle_voice_change only uses the status code returned by
init_out_device.

Logging changes are alike; Now "playback" type logs are recorded by
both of coreaudio_init_out and handle_voice_change.
handle_voice_change is a function required only for device change.

Regards,
Akihiko Odaki

