Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A9A416042
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 15:48:39 +0200 (CEST)
Received: from localhost ([::1]:55208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTP5Z-0005JG-MO
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 09:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTP42-0004U0-0f
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:47:02 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTP40-0006Rn-75
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:47:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id u27so23430879edi.9
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 06:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X6tPYj9oUhcOZ+uoKP+nG8NnVQLmoHX/d9g9BCvLsR4=;
 b=hhQ6niECsnZzrG0mdkN3l2WljsCA50VtPKnZq/g/2/G/ZURvGbApaDR4yM3Qu7Nedr
 yCbU2ae+DEh22mAwEsYAFVeHCmi2bWr7WdChJM2pKepbtPDure7P44nCJZ2ISY4/vdNs
 bq8yhJ5dTW5mGd3AfNM1D7FzOCp7GGd6zmvX2Sac656+re+366zG2dB+NClxqXqRq0xh
 htyslKOh7ULkt6Pot837zj5o9iN+TyPQOYd2F9w9eoRyHdRezVHYpRhoZ3Njl2piiKKY
 XjR+oCA6huAJMYDWQDZUBthnwD5zHMYYY3ylJSOJ4a0uQ9yJ3GvdPxnjKj4UhEWK172g
 MV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X6tPYj9oUhcOZ+uoKP+nG8NnVQLmoHX/d9g9BCvLsR4=;
 b=H4YPU6gT3RfSKeK6l/ztHh9Nk6thcMO38vxb/duKiwzwN7hEbhaWWte+BFfiP6PCQ4
 qHThAP0pj7Hg416aS/49CwtLoqcQrQdcMDMoqArADQwyGwUYkAr0MWAaV9UUdUDvuyv3
 pQ1aIA+4Sr3JN/8doFn/fC+BWcLCoiOyeLS5B2HKwnYB6g5Qn3EWLGpHom/fGbJ6JEZb
 IXt0LsJllLAoJgv7Tm9A/3eBqeRROYyv1fHuWn2mc2SOXvqb/BoXfdFOAcJt18tNHhM7
 7nmHp9XV8vf9TWxgLwXSbiTSN/aQSdSpZ4cOgr28cWp8Lij5TdBfDvUq7cJ3Og5vHDUR
 UyUA==
X-Gm-Message-State: AOAM532MMZYxQLry1veX25AyiFw3dJ9yBIZe7R8hRr2JiDQ5US4S2Lx5
 PAotcSNm/h8KMawsvbilwdDhIoO0DKZpM2KhrKGF9g==
X-Google-Smtp-Source: ABdhPJwICFJ0kqduDlOdG2Bm7hRT1CYmYq3zG89jCtiaURODn4W0xVzTn8I3igE6k1ZKJtFQaXUt4Jr9El0Yfcd7sdE=
X-Received: by 2002:a05:6402:3128:: with SMTP id
 dd8mr5448390edb.383.1632404816373; 
 Thu, 23 Sep 2021 06:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-3-damien.hedde@greensocs.com>
 <d27c5829-e28f-4d17-966e-6cb86ebe00e6@redhat.com>
 <e3ab341b-3e7a-1485-90ed-dbd9d2e3588d@greensocs.com>
In-Reply-To: <e3ab341b-3e7a-1485-90ed-dbd9d2e3588d@greensocs.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 23 Sep 2021 19:16:45 +0530
Message-ID: <CAARzgww_dxXLhJTm1jeWzbQxVGzT6YNxZi+uTrRDnBZ9Z1v+QA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP
 command
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 6:13 PM Damien Hedde <damien.hedde@greensocs.com> w=
rote:
>
>
>
> On 9/22/21 19:37, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 9/22/21 18:13, Damien Hedde wrote:
> >> From: Mirela Grujic <mirela.grujic@greensocs.com>
> >>
> >> The command returns current machine initialization phase.
> >>  From now on, the MachineInitPhase enum is generated from the
> >> QAPI schema.
> >>
> >> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> >
> > Missing your S-o-b, otherwise:
>
> Sorry. I did not realize I had to add it since it was already done by
> Mirela. I'll add it for this patch and patches 1, 6 and 8.

https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_S=
igned-off-by:_line
btw, it's strictly not mandatory if you are both from the same company
and you did not write the patch or contribute in anyway to it.

>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com >
> >> ---
> >>   qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++=
++
> >>   include/hw/qdev-core.h     | 30 ++------------------
> >>   hw/core/machine-qmp-cmds.c |  9 ++++++
> >>   hw/core/qdev.c             |  5 ++++
> >>   4 files changed, 72 insertions(+), 28 deletions(-)
> >

