Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D16D6AE2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 19:47:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjkjv-0004Br-Qj; Tue, 04 Apr 2023 13:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjkjN-00047l-KW
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 13:46:05 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjkjG-0003g8-09
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 13:46:05 -0400
Received: by mail-ed1-x52d.google.com with SMTP id i5so134044300eda.0
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680630351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zM6C51SzsToixyfPpduAVipa4SnNg5IMo4YirkkilTI=;
 b=m79o95DJlnvNJ4KH0Md0JB/qcLndytfefpLDAV0P5BOEkg/Vua/5v5yhxJiEAvb7w5
 zX4nTiEhJCuiD5E98BTa7eiGfw2OqM2TpwCvm1TcLI6Hk2miGK5+V4kheAWEibmMUm3R
 txiTr0hc/XRHsz4NUYkN/ovZ+XzpI7r9BRvI0kulU38aQadsOpX6GPzfUPpyJlXcZabB
 84rq8WrNEjrkLZ0VGXADyKLyZT0AVrpSg1AHZWPisb5dFOkkIAV3isD22l9nLcJ0JZJA
 mp4WPZrOD0ZIlWi0yX0/5QNNpEwJEB7WKHjVk6zXuk9UI4SAqf9oZJg3HYcHG/MKsiKz
 j7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680630351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zM6C51SzsToixyfPpduAVipa4SnNg5IMo4YirkkilTI=;
 b=KmCAvBBfrzatn/1nfCiHcPYdJKBB6hRrtsHzl5OiOj9MBPsQ63luhCsPO7ocvbSnz2
 EX3FhdDNG7I5kCWs6yzMbuGF0bU8wLAglyN2FEY3nxSsaSohlSffIDXuAb4oQfb84+cx
 L7TeTwIkM0I6u4r1jk/wHBuykW/wa1D9e5H/ynqLb6e8uaBHb6DlLr///Q+ILhapQYCY
 W2q70i2qa8JAlruZJX/JoksBgR1Nbafc6dLjvbo1moNQgrj2Imt7t7z03JTcKzLnt+ol
 pfWe6WcjfiIGsmwVaRUNAWwmFHKmJWQ6ViTSP6rOo+FzxeHSgoS39VEMVmHnPsvtx5dH
 2hwA==
X-Gm-Message-State: AAQBX9dUbetQ6tUscZWwijGsJS4N+pLS/67bJCoGT3v47b+tpiv/bj+U
 vIUkEIg3w7psvZeYrn0Z+GELmZxKz+3hX83lfnP3rw==
X-Google-Smtp-Source: AKy350aUoDCSACn1ctQt94298XZZELptJd4vlQvIrHKhZ59SL3gN/lMGnaDhhMIf4vhQdc2A1ymiyiiUf29jIj2J2NY=
X-Received: by 2002:a17:907:118d:b0:932:4577:6705 with SMTP id
 uz13-20020a170907118d00b0093245776705mr203873ejb.6.1680630351647; Tue, 04 Apr
 2023 10:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-14-dwmw2@infradead.org>
 <CAFEAcA_SS8xRjGKZoSyGc0nh_-C2Wh8hauGzR82Aj8S1g8xBOQ@mail.gmail.com>
 <d079d8c1f455c96203dc44906d37c2ac8963a6ae.camel@infradead.org>
In-Reply-To: <d079d8c1f455c96203dc44906d37c2ac8963a6ae.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 18:45:41 +0100
Message-ID: <CAFEAcA-DT-990Y81mh0rgBp-P0fdLTYCD=DN7m1qued7VFVrVg@mail.gmail.com>
Subject: Re: [PULL 13/27] hw/xen: Add xenstore operations to allow redirection
 to internal emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 4 Apr 2023 at 18:45, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Tue, 2023-04-04 at 18:35 +0100, Peter Maydell wrote:
> > On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org>
> > wrote:
> > >
> > > From: Paul Durrant <pdurrant@amazon.com>
> > >
> > > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > Reviewed-by: Paul Durrant <paul@xen.org>
> > > ---
> >
> > Hi; Coverity points out a memory leak in this code (CID 1508098):
> >
> > > +static struct qemu_xs_handle *libxenstore_open(void)
> > > +{
> > > +    struct xs_handle *xsh = xs_open(0);
> > > +    struct qemu_xs_handle *h = g_new0(struct qemu_xs_handle, 1);
> >
> > Here we allocate memory...
> >
> > > +
> > > +    if (!xsh) {
> > > +        return NULL;
> >
> > ...but here we can return without freeing it...
> >
> > > +    }
> > > +
> > > +    h = g_new0(struct qemu_xs_handle, 1);
> >
> > ...and here we allocate a second time and overwrite the
> > pointer to the first allocation.
> >
> > Deleting the first call to g_new0() would fix both of these.
>
> Indeed, thanks. Do you want a
>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
>
> or would you prefer me to submit the actual patch as described?

If you could submit the patch that would be easiest -- you're in
a better position to test it.

thanks
-- PMM

