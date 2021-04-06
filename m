Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C53555FC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:04:45 +0200 (CEST)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmJw-0007SI-8D
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lTmHV-0005kp-Ky
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:02:13 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:38625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lTmHO-0004CC-45
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:02:13 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so14699592otk.5
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WmwSMhHfR5G0aFIKrjWe4NH6wMebup7jfqgCAlpNYdc=;
 b=ob94e6AABPtkTQaqqKMCnUNOxAPpL4ZcNS6DV8p/EtCpmSYregSuzASyD217XrGy7z
 2Fe6yb+MAe/8W3GsmyQrFd0yj+3+D8PFefVFwzoMdyuQmCExQkNN8eWgfbtyDK00OypV
 ONidvraX3LN2UZ8QAMI6p0QHTUjD2ybnmwVIBl5yox2caOGN6A38AlWAJdMIH5SDxIZW
 0cBFEUCQmblMjSLPe+0wMHZdt4Eg3oJg/t7N3FSOmLSFcPcdMfFplnfcUW1viWE1kJVi
 I9ZRGbZcvkqUaPYxSGzTagU0oXXVYZSshhL5DOrMXuP2ajTCvBMmha+LE+bS3WVRi7Gz
 3dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WmwSMhHfR5G0aFIKrjWe4NH6wMebup7jfqgCAlpNYdc=;
 b=gNJ7KM6oa8O9uZ4+ZcZz8X365MmddYgrTfsC1HDEP4/nNngjeJLfvixyVV31n1GCbC
 FSG8ICjTDOyTC8sGnVSrljWbr9czBY46CBvEhF3OLvtt4JFqs6Rv73wWardrJfwI3QS+
 8V0Z2b8KTDrO7PXfeGErHdkf2YkRrUkDM/0XAk37ymwwjjbCcfJtjxpVWHpZYE6wWZnf
 4FwJCjxmXgi/3lBT+9MiCO/wguBzkyO23kOutn9fE0iXFxzh1xKFk55PYOLjVXAzlZiB
 PuUkuguHriGPdcBBW84iV5CExpT6ayPlWFKzDKB+DyrkB3TwAZAmv+sh9MGlGvtIXZd4
 p83Q==
X-Gm-Message-State: AOAM533cMxPMG1B/rozwsFJsqO4wXG08FsIE6GLqKNRbnBKeyG2CMeo7
 frHqPC4KVbLpdV7OqaYY0ztVa6hRkMYi5tDWyk4=
X-Google-Smtp-Source: ABdhPJwIptVJOIS8AeR746qn7t8hTTKA0WupuafdMtJPlW4YlxOb/MG8REK+0XfEYd3w+dceah/v0NAKPoGHMCOSlFA=
X-Received: by 2002:a9d:5508:: with SMTP id l8mr27126189oth.233.1617717724189; 
 Tue, 06 Apr 2021 07:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
In-Reply-To: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 6 Apr 2021 16:01:52 +0200
Message-ID: <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
Subject: Re: Mac OS real USB device support issue
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: QEMU devel list <qemu-devel@nongnu.org>, gerd@kraxel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 6, 2021 at 3:44 PM Programmingkid <programmingkidx@gmail.com> w=
rote:
>
> Hi Gerd,
>
> I was wondering if you had access to a Mac OS 10 or Mac OS 11 machine to =
test USB support. I am on Mac OS 11.1 and cannot make USB devices work with=
 any of my guests. So far these are the guests I have tested with:
>
> - Windows 7
> - Mac OS 9.2
> - Windows 2000
>
> I have tried using USB flash drives, USB sound cards, and an USB headset.=
 They all show up under 'info usb', but cannot be used in the guest. My set=
up does use a USB-C hub so I'm not sure if this is a bug with QEMU or an is=
sue with the hub. Would you have any information on this issue?

Hi John,

As far as the Mac OS 9.2 guest is concerned on a mac OS host, it does
not support USB 2.0. I was successful only in passing through a USB
flash drive that was forced into USB 1.1 mode by connecting it to a
real USB 1.1 hub and unloading the kext it used.

Best,
Howard

