Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5F268DE47
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:54:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRDR-0007zy-Tc; Tue, 07 Feb 2023 11:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRDM-0007yz-5L
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:53:04 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRDJ-00039G-Dc
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:53:02 -0500
Received: by mail-pl1-x636.google.com with SMTP id m2so16279621plg.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bX8JXCdprYKqnse/b3uxBI0XRoMhkp8yJyzSC9QdOEA=;
 b=IkrXjJYMUR17ptun2nAdobEycQDvX7coWUyx2JolWeG8K/8G+2bKCxrGFSWRw2Mj75
 E1yeerZ+A1lHhZLijO0n0swCzQ2zn5ZMISTu6bSTxKw8QyrpSpE+vrMjnVu1V+mDQoDR
 ZFVUii+gGRQ+GPUxIAqtpU1L6UFLP8SonTlth70AVZlb9qBIAiBOD5o8Mbj+hEYkdCbO
 xVIfhJoS8PLrJMNT0GQUEIoNJxKrC4oTCDzWWI9zE4fZp7j+L2Em/WOVRl9pufspMXtJ
 Kjm0BJDiHVIYoA8Q/W4Bb2DDfBYNfArcSG4X/6lUYqENX95CFhUCJJTIWRMTlSDB79kb
 V8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bX8JXCdprYKqnse/b3uxBI0XRoMhkp8yJyzSC9QdOEA=;
 b=rR2LihGaEtMpcgR9OwkqHfCNfJs/ccMa9Xi0C296yuksJGTptvNAc9vRdW6meuPKfw
 YZPT72u1Kk8fIPCJVLZ8on6dZvgHkKg1YdVX66uxz6TqwxwsuneZ66Qi2AZh/bg0zM2c
 IRzYX+SNG/EqiQVztHZ5683t0AP5/Hpn2LZbPady8kg+y7AJA2rPu1OoPw1YyyZI1awA
 EzaEuWsz461gEZatT4lC0WeU/dBD0shLlG9Dp+U+DPWrNEFqL0ex4i3z6DbDnSzg0x2/
 /MdcEGGWmwiJXhhnAEOusUrMbhfTcFYFi7zKxAoBdvIwjwu16IzggGqBKWtTF5otKbf/
 PmYw==
X-Gm-Message-State: AO0yUKWsMbSeYn05egQkne9SoB6oQmFAv0yF6/11lFJs5sXovt7u1Cks
 TBS8WQZeHOtKo++XBLISu9RAlnYGl6P0bHe72NdcgQ==
X-Google-Smtp-Source: AK7set8+PaF+R1qC7sAls/3cXnuInZBhxDBhbbZCzheka8Zn6Vmo0LJzK9+JQH4SPCVW6sZR9CDCXty5Ci9FFdTtcd8=
X-Received: by 2002:a17:90a:1141:b0:230:c24b:f22c with SMTP id
 d1-20020a17090a114100b00230c24bf22cmr1109233pje.53.1675788779837; Tue, 07 Feb
 2023 08:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20230207005650.1810-1-quintela@redhat.com>
In-Reply-To: <20230207005650.1810-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 16:52:48 +0000
Message-ID: <CAFEAcA_Bchx+EkGm6tWJEEudzD31iYA0b52POh7Mn7+czJU0xw@mail.gmail.com>
Subject: Re: [PULL 00/30] Migration 20230206 patches
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, John Snow <jsnow@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Coiby Xu <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 7 Feb 2023 at 00:57, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b:
>
>   Merge tag 'pull-ppc-20230205' of https://gitlab.com/danielhb/qemu into staging (2023-02-05 16:49:09 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20230206-pull-request
>
> for you to fetch changes up to 1b1f4ab69c41279a45ccd0d3178e83471e6e4ec1:
>
>   migration: save/delete migration thread info (2023-02-06 19:22:57 +0100)
>
> ----------------------------------------------------------------
> Migration Pull request
>
> In this try
> - rebase to latest upstream
> - same than previous patch
> - fix compilation on non linux (userfaultfd.h) (me)
> - query-migrationthreads (jiang)
> - fix race on reading MultiFDPages_t.block (zhenzhong)
> - fix flush of zero copy page send reuest  (zhenzhong)
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

