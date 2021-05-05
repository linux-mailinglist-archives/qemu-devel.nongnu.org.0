Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4E7373790
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:31:00 +0200 (CEST)
Received: from localhost ([::1]:45286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDrv-0006Zh-UJ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leDp7-0004ov-V2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:28:05 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:37434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leDp6-0008Lb-Ad
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:28:05 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id z1so878023qvo.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SX6KKDr2PRYSnuFV4JbE/SuIWiBDAGomkWXQfkvAvvg=;
 b=SAb4MbOCwXBSEhHVukP550s5cx4M2OzyQVlnrUGVExo4dftm/CxrnJ7KFYyy8wvZeC
 U1Rm2JFDAz1O1PV8ul6i0PkB4I8jW7rOmoYO3isdl2Dh++ukfWUW0QRUP6135urDV/mW
 YeahdVGrtJ5j1gfkKu3hKqDZ4aIQwd0fzNvQ8ZBcgRdrokPmSxySN7//n46ZlxvExYdl
 hMRG/DuH4YCeAUzsy7tkQCKGTv5aYVPxLXZhLHQ3ATaAkzTUJWbtwvEaXRhxrELm7X7e
 HSn1F2PIUxEOXlzw9TMuLfEilxuSG1SgHzKbo/cjXxAf9jc0JPM1w+HwDz6xwd7lD6YU
 g4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SX6KKDr2PRYSnuFV4JbE/SuIWiBDAGomkWXQfkvAvvg=;
 b=uCEjvKbynuxf/dk8h92ZHlavtCeB0Vtu3niTGjzhBskp2Xpi/58EN9LN7Cu+xe9cya
 eWnqjPqhQUPP9fFxDp70e4uRHrurlMrX9bNeCSPJ3WIpdRz6zq43LxG/XJx2lpNC7OWs
 tSuZbddDCSfeRIB0WEMYgSGdIt3gf3CjKk7Chem961XTsxP1MObhCCbKIMJuxt8YP55R
 pxmw1W4u4LZojjt/jM6rVywnSeGw7gKnRR1HINxegiddz0iVG86GzFUr83VHqSi7taX6
 ZW9C32gmInMpktbI90IcobPU1Gdih/0YpOGkNhCfM2aGIhNOCB22bTpw7sTF8XwfGHYY
 ecvg==
X-Gm-Message-State: AOAM530oYjgu+gg89dXVURKWlAC894mVT8POTsOf50SFxcmMCJk/WhBD
 qWfl6OWE9NSAFYwEcQj2G39j+nx5KAUOAcKoQDw=
X-Google-Smtp-Source: ABdhPJzqBjC3PnGbUEAwnkcf5hyL2Gz2CIZ7vOxnSph+rqobVu/e6Kq6gDNm9ymOGJOem5ZvIbMFMj3aMrIR0A/KyLg=
X-Received: by 2002:a0c:9bda:: with SMTP id g26mr29492206qvf.44.1620206883506; 
 Wed, 05 May 2021 02:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
 <CAJ+F1CLym=c1hBXeC9-_bVR5RBKhS8fVwbianjnJAUBVz+_foQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CLym=c1hBXeC9-_bVR5RBKhS8fVwbianjnJAUBVz+_foQ@mail.gmail.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 5 May 2021 17:27:28 +0800
Message-ID: <CAKXe6SLyzGUDG6Tex2QnCMk4CWbEWVZd66Q_=iBwDoqf5=R-Jw@mail.gmail.com>
Subject: Re: [PATCH 0/7] vhost-user-gpu: fix several security issues
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=liq3ea@gmail.com; helo=mail-qv1-xf2e.google.com
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
Cc: Li Qiang <liq3ea@163.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> =E4=BA=8E2021=E5=B9=B45=
=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:10=E5=86=99=E9=81=
=93=EF=BC=9A
>
> Hi
>
> On Wed, May 5, 2021 at 9:21 AM Li Qiang <liq3ea@163.com> wrote:
>>
>> These security issue is low severity and is similar with the
>> virtio-vga/virtio-gpu device. All of them can be triggered by
>> the guest user.
>>
>> Li Qiang (7):
>>   vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info
>>   vhost-user-gpu: fix resource leak in 'vg_resource_create_2d'
>>   vhost-user-gpu: fix memory leak in vg_resource_attach_backing
>>   vhost-user-gpu: fix memory link while calling 'vg_resource_unref'
>>   vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref'
>>   vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backing'
>>   vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
>>
>>  contrib/vhost-user-gpu/vhost-user-gpu.c |  7 +++++++
>>  contrib/vhost-user-gpu/virgl.c          | 17 ++++++++++++++++-
>>  2 files changed, 23 insertions(+), 1 deletion(-)
>>
>> --
>
>
> The whole series looks good to me, and applies fixes that were done earli=
er in virtio-gpu.

Do you mean you have merged this series?
Should I tweak something such as "adding the original fix in
virtio-gpu"/"better mapping iov cleanup"?

Thanks,
Li Qiang

>
> Thanks
>
>
> --
> Marc-Andr=C3=A9 Lureau

