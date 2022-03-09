Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754FE4D34F9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 17:59:29 +0100 (CET)
Received: from localhost ([::1]:44140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRzep-0004EO-UZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 11:59:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRzc3-0002mw-K0
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:56:35 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=38477
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRzc2-0008UO-12
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:56:35 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id u3so5670846ybh.5
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kv/5XZDrhSDhi0FFJyw8PTLlrNcr1ENp1KzLzfGOHNE=;
 b=CtPIsnJ0TBzzU19vqbRC5SzskkYg7c73irPhE8Ln8PC+7IffkzdmON7dK5P6t9+1AK
 YUqZHfT22N2bQR2Q5JNQCxJxTpvsPPu0naiVzSJI6dFPSEkER2VDuBjSwyJnwV7l0vYS
 QaAcnKDc5XXE6zaAgzaRHKx7FKaaqVz6nB5oC83DiIDQkkIq0+Rn4pJzasokVcbKD0BZ
 em0JE5AKMKvJsjGSKNbVZ3wKqsEpxADum0ceoNfjh/nF3QRmYQnXLpq3TvCyOGhNHzYM
 gtLFmnnuNQN8SZwoDO385gH9mo2HRmdPQpEd4FRPzd335qwEq7MqjsLPd/ZxRw1d+uYn
 m/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kv/5XZDrhSDhi0FFJyw8PTLlrNcr1ENp1KzLzfGOHNE=;
 b=hVY9iX8pz1vz39hrtCj6hdV53eHvxzZpgewlJ1Km2ga2hISe/vV3n25ZF53x9/bPKD
 gAKHu3WsbKpeljxL0x0hvbSIrP2iWat0WniKzNbbqICCyPPZnqeC4+/aYOFC3uNLMezw
 PdtfBvC5HPzdxdUQRhZAP7RzzD0MZf2fZ+/Zmt5ka7T/xyCEAz/jSFhXdyqy/t0GIHVH
 6wtEWqH5SlxToRfam7wwV5m/St6q84gqxZQ5oux2mfv47Ve7wMCsoKivftbKyVoYuZDE
 RC02njMBkjCND7Ftp4t0rRWYE+KM1L42gzLOIeaBV+xmal9/+4GL3EW28RlFrhERIL5I
 lCGA==
X-Gm-Message-State: AOAM533ek8rG1d54gcEtJE9ulyWg+346wqxFnSphgCl0Q7pJzVWYzNVi
 k92ZObEJx/cIvUq39cKdP18HBxGtT9zQilYsdlJEeA==
X-Google-Smtp-Source: ABdhPJyBp+Y8QwQOsgqrFvJ90yEWqEKPhG49AdO/12Nor9/LKgdAR/f6gYSPoBGAkGpBbkmPMBpUCz/+5740/Mqt6Rs=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr547046ybs.140.1646844993012; Wed, 09 Mar
 2022 08:56:33 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
 <4eb4bb05-814b-c28c-c2f4-0f5f5582301b@redhat.com>
 <CAFEAcA-Wg5LKVRQ4dKX6Hsyb=1VVxfGBDB_=Q6iCxycJzLPRhg@mail.gmail.com>
In-Reply-To: <CAFEAcA-Wg5LKVRQ4dKX6Hsyb=1VVxfGBDB_=Q6iCxycJzLPRhg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 16:56:21 +0000
Message-ID: <CAFEAcA8ytELEkGfwCV3WEZYCCtYdyG9_2uANk8UXGV-=iOnfqw@mail.gmail.com>
Subject: Re: QEMU device refcounting when device creates a container MR
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Mar 2022 at 16:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 9 Mar 2022 at 16:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 3/9/22 11:33, Peter Maydell wrote:
> > > Hi; does anybody know how device reference counting is supposed
> > > to work when the device creates a "container" MemoryRegion which
> > > it then puts some of its own subregions in to?
> > >
> > > As far as I can see when you do memory_region_add_subregion it
> > > increases the refcount on the owner of the subregion. So if a
> > > device creates a container MR in its own init or realize method
> > > and adds sub-MRs that it owns to that container, this increases
> > > the refcount on the device permanently, and so the device won't
> > > ever be deinited.
> >
> > The unparent method is supposed to break reference cycles.
> >
> > In the case of QOM, unparent calls unrealize, so unrealize should remove
> > the subregions it created.
>
> It seems asymmetric for unrealize to undo something that was
> done in instance_init, though. I would expect unrealize to
> undo the effects of realize, and instance_finalize to undo
> the effects of instance_init.

...also, in the device-introspect-test where I see this problem,
unrealize is never going to be called anyway, because the device
is only put through "instance_init" and then dereffed (which
does not result in instance_finalize being called, because the
refcount is still non-zero).

-- PMM

