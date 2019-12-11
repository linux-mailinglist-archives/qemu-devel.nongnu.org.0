Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159811AB8D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 14:07:48 +0100 (CET)
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if1iU-0004o9-Nc
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 08:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55146)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1if1gy-0003hF-5h
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:06:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1if1gw-00035O-Ve
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:06:12 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34273)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1if1gv-00030x-Lw
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:06:09 -0500
Received: by mail-wr1-x441.google.com with SMTP id t2so23986753wrr.1
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 05:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j6HHlT6J093i0KH+E444P6RkaJOr2gNObY68xIKCC6E=;
 b=eFuLAcZ64Z2gNuuG0jca2vRZnFaZjwtmbpwpLeKbmkPPPQ8epGgTa7D2ONI5KCLFpl
 fkCNsPK+oRsD5eOH+ItmES4+4fgxcHmRNrI03RPBBBX7eGamnVcUxSznWCMbHZUxRBJF
 llzhXGZfmq4eUOEhVBNGIeEvdR9NEH3k4Ky0qYevyb35lEIQfonNcYPBgd+cFjEXykeY
 ZzSZNbyxJ3nTyxr8Q9wHEast4FfcKzPuRbExuARzdI0k5kQR/iiodWbJLux15hGk3gNG
 VJYqWndeo7sabBwh2nZH0+/qCWpK4Ff/bnXn7U5B984a2xaw+PwSDrXOggiVexvCN7vJ
 O0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j6HHlT6J093i0KH+E444P6RkaJOr2gNObY68xIKCC6E=;
 b=NKNa6SGG2X7fyZ4/rGucQP+CbUofEDDtu9YvpbVP1ZhO/mcMNdpWhoh+FTd72Wnhfa
 lhUd73BvF4bdDuADV7QduIiHikFWW/doejmIR0LlWAp6U8Qy0kHjyoDQ23y3174V8W79
 Por8H7pN5uEJWRonNcpQTuYSI1eMRUR2WUFci8fdtUbLzIc9lrUVtZJ8vMeCnGJUJcgO
 vxEG1W5NrHeNTyvlDCUbpc7lrn/1X/ftyHhOCTcV2w8K1JwU0+CyED4I96QVXk+vtC/a
 /SDM5E8peCYsgXDZm9iuN1s5dg6n1Q6TXZkK2H+9VeglllJ2+ynwQVkWIqEppottsfeI
 6Fsg==
X-Gm-Message-State: APjAAAV/qt+Xz9y3dXRJI4kOV9DAeNIzL5UOvEkTmCV0nINWBLj2qmCj
 R5fibIoaEIqO0Bgbrja2Zk/dWrFdOvfh3bG5H+5wRmGm
X-Google-Smtp-Source: APXvYqwwUAs4ktg6UlK6hVu6sriWd0q7Y655nYb4oO5aVFE/x9FE8fSzqQ1ADv+D5I2hyorOuDnG+ojwQYBpokLaPYQ=
X-Received: by 2002:adf:f10a:: with SMTP id r10mr3430373wro.202.1576065697198; 
 Wed, 11 Dec 2019 04:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
 <CAJ+F1CLV_JRhXX=tB7ZXYxa1En4LzYgJr+7egKzVRNBOLY2nSA@mail.gmail.com>
In-Reply-To: <CAJ+F1CLV_JRhXX=tB7ZXYxa1En4LzYgJr+7egKzVRNBOLY2nSA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 11 Dec 2019 16:01:25 +0400
Message-ID: <CAJ+F1CLS4HV-SckggfYNRKXxPa0R2BxSQrpPv8CRVkfvRB3E4w@mail.gmail.com>
Subject: Re: [PATCH v4 00/37] Clean-ups: qom-ify serial and remove
 QDEV_PROP_PTR
To: QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Sun, Dec 1, 2019 at 2:19 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
>
> - "chardev: generate an internal id when none given"
>
> As explained, this is necessary for qdev_prop_set_chr()

ping

>
> - "serial: register vmsd with DeviceClass"
>
> This is standard qdev-ification, however it breaks backward migration,
> but that's just how qdev_set_legacy_instance_id() works.

See thread, someone could review or nack (if backward migration is a proble=
m).

>
> - "sm501: make SerialMM a child, export chardev property"
>
> review?

ping

>
> - "qdev/qom: remove some TODO limitations now that PROP_PTR is gone"
>
> This should be straightforward.

ping

thanks

--=20
Marc-Andr=C3=A9 Lureau

