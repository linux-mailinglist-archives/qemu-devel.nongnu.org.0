Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80258475A45
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:04:27 +0100 (CET)
Received: from localhost ([::1]:39196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxUtO-0000LE-6K
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:04:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxUVK-00052T-9S
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:39:35 -0500
Received: from [2a00:1450:4864:20::42b] (port=34750
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxUVE-0008TL-Kn
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:39:33 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s1so4122488wrg.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 05:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imsgSlFH7plHN3hosELpebgg8CqHePC66xR+okRI0zw=;
 b=nzJwXFcpmb0TvKvOTzrfkqWwS74EqMVvjGmhGWAXhcsCZ7UPYAJ99BHU6rbVoDgl9/
 8QwQBW2e+zPRCL6JbxGSJxwOBqFXj0Ii8ljOjNPgbVLfi4iauJU1beI8LATiw/63xFUv
 izFhWHY75z9jXsS6vZj8pbsJObvTYjb0m/jmGTKUxAOXuSZCEWTojV18h8acMMEAGbB4
 s3JZHKyeERh1mge/VcP7/WzFle90MQRYyZe+27Yf4QQdpX2iy9+wmT7Ai38JwcM2ctOR
 nWYo6eo2Mlqw1ALun8VhrcU0sL3WA0KRkVzsfsrhUcEh1MkYnQnPlKrkhQDAcDuE4aVQ
 1TyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imsgSlFH7plHN3hosELpebgg8CqHePC66xR+okRI0zw=;
 b=agaf8o6YhqRa0AiHY+UesBwPqScl9ovyA7qJOqJ6rDdzabvJbHfvoQffDNwnMMEHpR
 hUZhBuHJVwuXPhOd4VVikVJMmVYZGQgFO6OZJYDRV85Z8UXN/T2fqol1bdjD4PmKxqLK
 /TxwnIaIsQKtd0e9Y2S8TPb/Xv6nBt/dbKlB4wvCaO9EVDi51vf2NzVu554nxFpGRYNb
 7Ayc7VmpDmzDOanceBjzYaxVhxc9cpE4HDjpLuvGKwiP8aQBs1UcwQIUgiIsLht/IfHO
 qsvVMa2Fj4f88rGZFvEtods05kUpARvIZUdUaVb1IvlUf+jBXul3fGk3lFjj3h5ltBcT
 S8LA==
X-Gm-Message-State: AOAM530DD6ABo7ppzQ+4mZ5VHHtn/ayKNeCMWxcXvLer/WpNbjBZlgjv
 tI9EaJADTTm8dJxmkgqoO/3H+H7U3Oec6ao0CXD9mJ08oQU=
X-Google-Smtp-Source: ABdhPJx2cf6cQJt2g+7IimQR6I7AEw1NLL9CuXJSvCCT2t8xjEfmygsL15qEc3oHcJIiA8BqXblhDlR9a6CzlmuYJAA=
X-Received: by 2002:a5d:4250:: with SMTP id s16mr4448639wrr.319.1639575566644; 
 Wed, 15 Dec 2021 05:39:26 -0800 (PST)
MIME-Version: 1.0
References: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
 <Ybm5VNnZDtPzku3m@stefanha-x1.localdomain>
 <PA4PR09MB48800B35FDFF21C49D45E895EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
 <YbnsWycETnVfDjJ4@stefanha-x1.localdomain>
In-Reply-To: <YbnsWycETnVfDjJ4@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Dec 2021 13:39:15 +0000
Message-ID: <CAFEAcA8A=Qiz-aFd7g=vsPDW=NpoXKSJq=iwkvjMV1uU7tRpiw@mail.gmail.com>
Subject: Re: Building QEMU as a shared library
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Dec 2021 at 13:23, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, Dec 15, 2021 at 12:18:16PM +0000, Amir Gonnen wrote:
> > Easier/faster synchronization is just one side of the issue.
> > It's much easier to debug a single process or profile it, for example. It's also easier to deploy and maintain a single process.
> >
> > For now, the only "global state" problem I had to fix was Glib global context.
> > I didn't see an issue with posix signals. Any other global state you think I should take care of?
>
> Signal handlers are interesting because they are per-process, not
> per-thread. Luckily QEMU doesn't use signals that much. Accelerators
> like KVM use SIGUSR1 while TCG doesn't rely on signals.

I think TCG also uses SIGUSR1 for SIG_IPI.

-- PMM

