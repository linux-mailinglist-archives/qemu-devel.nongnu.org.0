Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7990330C74
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:33:23 +0100 (CET)
Received: from localhost ([::1]:34646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJE8X-0008Iu-Lv
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJE70-0007IX-RF
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:31:46 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJE6z-0000Pa-9L
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:31:46 -0500
Received: by mail-ej1-x62f.google.com with SMTP id bm21so19608891ejb.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=58k385pK5IC0yTZLYi+IspvWyv8DoS+LrDDDsimFBz0=;
 b=hxEOQtWYvd5mHg0jnZGlYx852cxzBlhJv4YF+ceFc8HUaazPLrqXzBAiBcGrUleVWP
 kBkjqe1NHep1udXsGQmXy4udldqNmeHAcIntY7oY0hJmiFJurwwCxHMJyL9KwVTgJSa3
 6ReL8vfjAL8HOQZJjLaGyJx36EQMUCt/PU87bboad/SrS1wOY/mePpk3nicP+usddfzn
 Nzm72f7I7nq1eM9DU6hQjJY85tBhc8nKdyHV/UDKLKzchm7dfH21Ox/QuTg1YD88ycAy
 cdIhbEMOh2ZSReHtAM3OVMwQcGkp7B1mRB1YvoghaWtKv6wCwayba1SDWDrdO+s1ueKU
 Kpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=58k385pK5IC0yTZLYi+IspvWyv8DoS+LrDDDsimFBz0=;
 b=nGeCCk6TZ04TiMwVXjCff7gNN86pdQAtF+iU9xWyT/fE7yNCalFdmh9B23vMHtLvJg
 32RYpZaMXU/EvKhJDJ4u6cyckJfEpydDfyIIeUpxZCnWv24ksKUJ0PJgRqQbu1WzC4ft
 SofpKQAIAhwonnGbaRIUhoues4pdybC/eR6KpJ5GP8TsUDJw4Pj8kkD2/kaGLs6YH9yp
 SOMH1NgGtYuH2W/GUPDC9yD5i33rgFUFHRLm6hc0GZLeznu5K7juiIORIjUzHfZnHgY5
 w/vPstg+qssZmScYpil4hME9Um1aARof3pvrUiB1ZizVpgYDT4wOZc/Me+bgug4p/fCL
 4MKw==
X-Gm-Message-State: AOAM531MGdrPDK2S1Q/KDN9bcDEjScR1/Gg3ZIc6ADH1AL06LV1IxAiB
 8HWTnCILG67/KP9HtVSV7DPRbt8UGknoqXqROyUFUKX6wDnjAQ==
X-Google-Smtp-Source: ABdhPJwUqzbUaSRUqYiGnblKspJBLW/y8dr55fXbp9gokDufLkHcIRIiFY/hK2KneG3NZIJygsb3zPcwf/jrGXkISik=
X-Received: by 2002:a17:906:fa0e:: with SMTP id
 lo14mr14372483ejb.263.1615203103784; 
 Mon, 08 Mar 2021 03:31:43 -0800 (PST)
MIME-Version: 1.0
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com>
 <CAMVc7JVh9zzPs6zxjNFuxZSZzqzYu13H=9NBH6__X+h-eQivfg@mail.gmail.com>
 <2891210.4AG6acVJ2Y@silver>
In-Reply-To: <2891210.4AG6acVJ2Y@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 8 Mar 2021 20:31:33 +0900
Message-ID: <CAMVc7JXb=eK2FgEx0SV7N-DL65EaMPKHM9rZnHCfu5KTPin48g@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 19:39 Christian Schoenebeck <q=
emu_oss@crudebyte.com>:
>
> This was just about silencing the mentioned automated Coverity defects re=
port.
> If you have a better solution, then just ignore this patch.
>
> Best regards,
> Christian Schoenebeck
>
>

I do not have an access to Coverity defects report. I'd appreciate the
details if you provide one. I suspect I made a mistake somewhere else
ui/gtk.c in c821a58ee7 ("ui/console: Pass placeholder surface to
display").

Thanks,
Akihiko Odaki

