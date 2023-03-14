Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221B96B909C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 11:51:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc2E3-0008GX-8M; Tue, 14 Mar 2023 06:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pc2E1-0008G6-Cc
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:49:49 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pc2Dz-0002Tq-To
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:49:49 -0400
Received: by mail-ed1-x52c.google.com with SMTP id ek18so28984990edb.6
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 03:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678790986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PRBbBOWk1CpW4YavqPLU53k3pPPWV1hrJi5FHoOOsSU=;
 b=MMgFbNGFIboxqbqujbMKbgh+IljKo1zGnHEcSjeF7Z8pgVYoFNBjzB2W5zM0/GW7jn
 dNNU2+LENsrwTZg4W6CZMi0AtEfgpAIblOyTxhw1WnXgtSRYv7i0ugGabcOSkrDU2n1a
 KTUP/Pe28lcapAul3atW+yTDpU6tKF4LorVipm8weCUorpM1JpWm6mnx7yPWotxHgoda
 n99k48lrHwEXK8cIJ5+EhvWhNLfc47ePAzxf7Nisgs/MxibA94AylxCsRh8kjvcyyIZc
 vd8e3ky8u7HsMKVdIAX76TmbMUruza0L3VAPZ7xWXGhsxykn0leIatlPn3J0xfFSzC2v
 OKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678790986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PRBbBOWk1CpW4YavqPLU53k3pPPWV1hrJi5FHoOOsSU=;
 b=cTWN1OOKZYfyugaN7q7TDDbnHgQFteOb15sCv6ZKP2QQu26myCS8cy972ulF698oMD
 ftiZNjuF0F1RWPWr0tJNs/bRYBaG/ftB74Cd50VSlbCYkEDuZDz07TAoagIzBl3yto+I
 uuy8eNGC42dO3c3WC66RFuy4YX58eRWI1rpy7l/TbSElkk4z2mMfA3OOOiLyRE/DiO5J
 FgBWCtVi9uIWXvWgypPTfKg1vXbtxxD8/VoTxcbBZN2CtOe9SQiTJrRHVc7Ex9MFkwYd
 ZGFj1z3J55053kiM4K5lV+iDNBvP9iAJZ8RXAghzcjHFVHVUlpRufdfEg/y9FNeUkDm/
 qSKg==
X-Gm-Message-State: AO0yUKVdBcDwsoycQVAU+OrEILl4x9bG4Iqubc4Wv3GYSt13HGwOwUIM
 Cn8CWny6FH4qVYWshGAYID0g0AiMFo984mnuktM=
X-Google-Smtp-Source: AK7set+3pnDt7nYNxNIUIPOVZamzW/NGW2HTLgooCb4fJACiQ6quFcl4j2TJEuzwttUnQjPgo0wQZsoPSCV06uzUPzM=
X-Received: by 2002:a17:906:8552:b0:8ae:9f1e:a1c5 with SMTP id
 h18-20020a170906855200b008ae9f1ea1c5mr909195ejy.3.1678790986189; Tue, 14 Mar
 2023 03:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-14-dwmw2@infradead.org>
 <CAKf6xpuH2E=16s1jFvgL9J723wv0dhBD5aYWP2NBNj5rZio2jg@mail.gmail.com>
 <5062bef5b5cfd3e2d7f313de9af306f5e4f841f5.camel@infradead.org>
 <CAKf6xptRmeVmH3xmF8QffQA=aYeXxCWUw9ta2HaYx1xQngzjTA@mail.gmail.com>
 <1f141995bb61af32c2867ef5559e253f39b0949c.camel@infradead.org>
In-Reply-To: <1f141995bb61af32c2867ef5559e253f39b0949c.camel@infradead.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 Mar 2023 06:49:34 -0400
Message-ID: <CAKf6xptFp=g1yxD4vt3bpbcsLLjpLSc14u8DOHAmahjo25vuOA@mail.gmail.com>
Subject: Re: [PATCH] accel/xen: Fix DM state change notification in
 dm_restrict mode
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=jandryuk@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 14, 2023 at 4:35=E2=80=AFAM David Woodhouse <dwmw2@infradead.or=
g> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> When dm_restrict is set, QEMU isn't permitted to update the XenStore node
> to indicate its running status. Previously, the xs_write() call would fai=
l
> but the failure was ignored.
>
> However, in refactoring to allow for emulated XenStore operations, a new
> call to xs_open() was added. That one didn't fail gracefully, causing a
> fatal error when running in dm_restrict mode.
>
> Partially revert the offending patch, removing the additional call to
> xs_open() because the global 'xenstore' variable is still available; it
> just needs to be used with qemu_xen_xs_write() now instead of directly
> with the xs_write() libxenstore function.
>
> Also make the whole thing conditional on !xen_domid_restrict. There's no
> point even registering the state change handler to attempt to update the
> XenStore node when we know it's destined to fail.
>
> Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirectio=
n to internal emulation")
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Co-developed-by: Jason Andryuk <jandryuk@gmail.com>
> Not-Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Will-be-Tested-by: Jason Andryuk <jandryuk@gmail.com>

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>

Thanks, David.

-Jason

