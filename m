Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0914C5F46C9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:34:57 +0200 (CEST)
Received: from localhost ([::1]:54310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjwd-0002Db-Lb
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofjJW-0003id-V5
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:54:31 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofjJV-0000ju-83
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:54:30 -0400
Received: by mail-ed1-x533.google.com with SMTP id e18so19173480edj.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=PvRw1uEKzW+hccL8Bu2I88yXvjma7BxLIhKaP0JnCP8=;
 b=NnjGX3HcUiU7eqtxQqtmaqUEdcSd/hsXFwd1LF6ca3j4MsIL7TEoWE0ydoBUQvZfjD
 LaJNmwN3YuwUikam2REeCyZUlUQTmH54P/v3OrkzJ2YuZ+s9xO0ApB0oCUttT/PajgqU
 AfpqxiTNiwHd4i1Oed9DHNGFovVUFRVZPiqiMM47OhmD3RTkQ7qv8Jucea3xR5f3PjiY
 F4cyG+rBPbznaIhAdD0l8PqG01FbgXdex8++VLkmiPeiRJwCNm0HU2FMoqpfyXxpuKW+
 B0yH2alDTFUT1rGJgxXZv8p3tqLbC+MC1JOUfSa7fPCtNRpuj/u/heYpo3mFlLy+yAfw
 E3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PvRw1uEKzW+hccL8Bu2I88yXvjma7BxLIhKaP0JnCP8=;
 b=Wqz/KuIl7CWBioDd+1bYNkxhnHhCRkbd1rN+h47veZOwZA2ZQ4ILR1oowcyhVT2H72
 ZJP2ep4e8LNCOnvqVNKaU6HH2MuTh+KF55I/Qn4qPUUYOtXvn3m+p0U93JDIR29DfmxG
 77ifEmyHWPDJSCv90P8fKK68cmiclWlLK16cEILa5H8I0wdIpsVq/I0oUDhU1Tjppobr
 sjqBJbm9KdmhFthVMgaYTOOmLfi2fqOfoA5pdf02Lf9+ibczgW8rYoNr9x3QG2EP9TIT
 L5KNDA4r5Ty2z/VCagG/4hvQkKFoGlsFvvqNpgqDzbZbQZglpfQ4hSLHn/2PcTXsbdTL
 WFaw==
X-Gm-Message-State: ACrzQf1HOX/CTOO7TGzwQsuWoKrTHYlPeKU5p+gHwiIU0BLDZm9YF2/s
 aNPF8XmPFpOuP14lZT8UUFzApEkojvWOxuM3O+69sQ==
X-Google-Smtp-Source: AMsMyM75lPZIh47sNXjC86mYolyWNSeZNpLjvnJLodseFvFyarrBsQfMSp+GGW7+DQpw/61EPSj49I0n/OStLg3fUrU=
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id
 b7-20020a056402084700b00453943b0bf4mr24084352edz.301.1664895267612; Tue, 04
 Oct 2022 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
 <87r0znlnmm.fsf@linaro.org>
In-Reply-To: <87r0znlnmm.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 15:54:16 +0100
Message-ID: <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, 4 Oct 2022 at 14:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > The MSC is in the address map like most other stuff, and thus there is
> > no restriction on whether it can be accessed by other things than CPUs
> > (DMAing to it would be silly but is perfectly possible).
> >
> > The intent of the code is "pass this transaction through, but force
> > it to be Secure/NonSecure regardless of what it was before". That
> > should not involve a change of the requester type.
>
> Should we assert (or warn) when the requester_type is unspecified?

Not in the design of MemTxAttrs that's currently in git, no:
in that design it's perfectly fine for something generating
memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
to meaning a bunch of things including "not secure").

thanks
-- PMM

