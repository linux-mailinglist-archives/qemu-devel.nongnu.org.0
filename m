Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D6F24E94E
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Aug 2020 20:58:28 +0200 (CEST)
Received: from localhost ([::1]:58844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9Yig-0006mH-JJ
	for lists+qemu-devel@lfdr.de; Sat, 22 Aug 2020 14:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9Yhb-000676-JW
 for qemu-devel@nongnu.org; Sat, 22 Aug 2020 14:57:19 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9YhY-0004Gc-OZ
 for qemu-devel@nongnu.org; Sat, 22 Aug 2020 14:57:19 -0400
Received: by mail-ej1-x62b.google.com with SMTP id si26so6746744ejb.12
 for <qemu-devel@nongnu.org>; Sat, 22 Aug 2020 11:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S6bN9SOOP41St22mnwX3zHKrUpSPUchk0IYPJ8vxJio=;
 b=ATsl1nFk/zG9tIkJ8byLZiNkFx/SjDMnOM9camh+RWp8J0Jqo0pBX4GD8cWbQ/RQUl
 QB+jmOzcO5HiflMXgmY/kLc5zYp5FQ0xd5XKi+6+k1dXQe5bDoUs79ksnv1S47uWUT/h
 o76vYzasIsczlYtQe6gKrsMSxraqQDZduFCy8CYT6528IcSC4ZSeWRu81e/Z76fz/Rpi
 saNrk9Z6kCFXNT7fX7kIFjVq0AVf9Jz25iLFMb+U0KLZ5PHThFg1sY1go/UPgwF7fKZK
 icH1FMRib794o/lVUXT+NRssvp9q6u998KXTmseMvw6rTe1ELQKou/WaqZ/FnW3ejmhd
 s2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S6bN9SOOP41St22mnwX3zHKrUpSPUchk0IYPJ8vxJio=;
 b=ZVBtyr0cSVAIo1lBgxMf0SOsECBGWjyjewuZ/SN7OnRr7Kgukjb8H3RTlOy301mnc+
 uKL7zWWwju7fKBYGPxSG84hA0FiX8u0axXkwIGOfA2n7xmpz4tfU6VcftraLR4S2bpU/
 kVmwfLEg9RAnq1er/hgBuCYH9nGPjjWHy5u8HJX6OsxsngFBOUDMt8BpNJuc/ihPGATl
 PEGWOlre5+XFDch1B/Ybe0PypDOYELISCUFt7AurYj70Jpjqx1t//XuPDSR3H3DzYosI
 u0+yAvT76mbHWedWi7LD0dRMaziYQC4AuYLgAH9f33LZGFNxU5rG6hZoeiXoGvzB49yi
 wDwg==
X-Gm-Message-State: AOAM533+4WBv9OrSPnQotu1CHCF1cyNV9NbvYwjqVPVqdh9DDJ1GUQIP
 bQ8HGTWNpkaBfL444s+M6Yd/AN+5apgcjAuQ/UcFew==
X-Google-Smtp-Source: ABdhPJxxJ6nBoaVorHdlqKl9Dnn/VB5m41Elxn8ShY0r51konOdttSgjwm5ozUWqYk9Su10lRn2+6jD/JAptgIhfrgA=
X-Received: by 2002:a17:906:68da:: with SMTP id
 y26mr8195213ejr.250.1598122634866; 
 Sat, 22 Aug 2020 11:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200819152258.703874-1-ehabkost@redhat.com>
In-Reply-To: <20200819152258.703874-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Aug 2020 19:57:03 +0100
Message-ID: <CAFEAcA-YyaH8iGAvA5bni_ioMpycv6x3A57LCKX-6CsL0O+dqg@mail.gmail.com>
Subject: Re: [PULL 0/3] Machine queue 2020-08-19
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Aug 2020 at 16:23, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit 672b2f2695891b6d818bddc3ce0df964c76279=
69:
>
>   Open 5.2 development tree (2020-08-18 13:44:04 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to 3ff3c5d31740484b0e19007843094483fb393e80:
>
>   hw: add compat machines for 5.2 (2020-08-19 10:45:48 -0400)
>
> ----------------------------------------------------------------
> Machine queue 2020-08-19
>
> Regular post-release changes:
> * hw: add compat machines for 5.2 (Cornelia Huck)
>
> Features:
> * qmp: Expose MachineClass::default_ram_id
>   (Michal Privoznik)
>
> Cleanups:
> * qdev: Document qdev_prop_set_drive_err() return value
>   (Philippe Mathieu-Daud=C3=A9)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

