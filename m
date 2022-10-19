Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0354260507C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 21:34:25 +0200 (CEST)
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olEpa-0003er-Ne
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 15:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1olEnE-0000vI-Jz
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 15:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1olEn6-0001bJ-0j
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 15:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666207907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTuC70QwIiJqbyfcNoFLbJRpbK8ZRJv6jBkK1E3+XTo=;
 b=JheSnNfFc6sXXtHsNSfvP9aACc3CGotj+o0zhOL4eL8vLLckQN0eiGmcs0tVcKnnyVN14Q
 cMScJ3+10vDKaF1c0hRwqFWJpsPjql1k+dBWfp6LOPluS3Nq6Eu4k8C+yyWKT1xPq3hB+X
 Om8xKPGgZ2EF5JoPWh8jxstfmZCMehI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-2yj9QD_rOkmRjXTuQEjhqA-1; Wed, 19 Oct 2022 15:31:45 -0400
X-MC-Unique: 2yj9QD_rOkmRjXTuQEjhqA-1
Received: by mail-lf1-f71.google.com with SMTP id
 s5-20020a056512214500b004a24e8c79ebso6094034lfr.0
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 12:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oTuC70QwIiJqbyfcNoFLbJRpbK8ZRJv6jBkK1E3+XTo=;
 b=jgvKRMVZqGda/Mhd4zyGYtSE43CH9nV5v3cKrjLyhdZX6dykrbfbRXmyP6lDrmJF7G
 UaJ/uwLf7/tCGGljWBfDAqomP9mfCCUIXZjnZPDqyImbcThMTWT6mQE1mOY99DpIyhDQ
 jXgv+Aiq1185kmImrrcauUMuCiV0pGqxIj3R+2hyY1yiWFAg2ncdFDBftr3RfMf5Kgzl
 0o4NLxrQTwflP6ylSbR8Lt9WzVsla3j1SjECF7W06a8uLJAKM+O5A1iw5UO615wnJVac
 KGVXRQ9GditonbzST+ixYGUBs9bl4JTCsQiVMxG2LSBVlGPOfZvLgMw4eqdZKhw/Wt0s
 NCUw==
X-Gm-Message-State: ACrzQf17nTUZMpxyQ9NbsvmEIUDWR50t38iZq0D1pFmInQ8OidXiWoJ9
 K1lQqnlV41er+fdB1igw0VtAdlUMRkflHzUBGOgp2J4ABu93D+9tUpxynKzTFVAq97jukdIyG+O
 wYu6j+bS9kJyJY8jvav1G6fJ3gkV4lEM=
X-Received: by 2002:ac2:447c:0:b0:4a2:4fc6:4cbb with SMTP id
 y28-20020ac2447c000000b004a24fc64cbbmr3323332lfl.99.1666207904197; 
 Wed, 19 Oct 2022 12:31:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6uvC9sDjkr+bs6ccd8QVgRSIk+7XGLiNwCpOaKEy4SN40IoQWtXPxzUEcVrtgqzVhI/q1xIya3zI3LG7zXp+Y=
X-Received: by 2002:ac2:447c:0:b0:4a2:4fc6:4cbb with SMTP id
 y28-20020ac2447c000000b004a24fc64cbbmr3323318lfl.99.1666207903952; Wed, 19
 Oct 2022 12:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221018152524.137598-1-jusual@redhat.com>
 <4c2ee3bc-18e0-bdd1-79e0-ee9a2c818d10@linaro.org>
 <20221018124847-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221018124847-mutt-send-email-mst@kernel.org>
From: Julia Suvorova <jusual@redhat.com>
Date: Wed, 19 Oct 2022 21:31:32 +0200
Message-ID: <CAMDeoFWOEZnOePsgxWL3jhQWTNyrdeqL9sfjHj270prtokTXhQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 18, 2022 at 6:49 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Oct 18, 2022 at 06:17:55PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 18/10/22 17:25, Julia Suvorova wrote:
> > > In the ACPI specification [1], the 'unarmed' bit is set when a device
> > > cannot accept a persistent write. This means that when a memdev is
> > > read-only, the 'unarmed' flag must be turned on. The logic is correct=
,
> > > just changing the error message.
> > >
> > > [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bi=
t 3
> > >
> >
> > Fixes: dbd730e859 ("nvdimm: check -object memory-backend-file, readonly=
=3Don
> > option")
> >
> > The documentation in 'docs/nvdimm.txt' is correct :)
> >
> > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >   hw/mem/nvdimm.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> > > index 7c7d777781..bfb76818c1 100644
> > > --- a/hw/mem/nvdimm.c
> > > +++ b/hw/mem/nvdimm.c
> > > @@ -149,7 +149,7 @@ static void nvdimm_prepare_memory_region(NVDIMMDe=
vice *nvdimm, Error **errp)
> > >       if (!nvdimm->unarmed && memory_region_is_rom(mr)) {
> > >           HostMemoryBackend *hostmem =3D dimm->hostmem;
> > > -        error_setg(errp, "'unarmed' property must be off since memde=
v %s "
> > > +        error_setg(errp, "'unarmed' property must be on since memdev=
 %s "
> >
> > If you ever respin please quote 'on' for readability.
>
>
> Yes make sense. Julia could you change this pls?

Sure, will do.

> > >                      "is read-only",
> > >                      object_get_canonical_path_component(OBJECT(hostm=
em)));
> > >           return;
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>


