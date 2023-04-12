Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A126DFE0F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 20:54:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmfbo-00052j-FQ; Wed, 12 Apr 2023 14:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmfbm-00052a-L3
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:54:18 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmfbk-0003tg-4v
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:54:18 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5055141a8fdso375839a12.3
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 11:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681325649; x=1683917649;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OCBM1eYOuCRMs+HWvFuj5wOCzBihsmjaSCKE5mxqFgI=;
 b=VXQdX4vyMY3Ts0kkSN2W7HmWqpWcjPqeqmESwkSYw/q+25N8hvpY4U6FCHolp/aSvK
 MNKlEndf4lQRDiitq6UIN/+34xz3Q7//qS6jjPrgY6j8IHZHoZJ3fOwKmuVDRlkTQ0jA
 xE7LoPfyFE5cmWTELrHJ5NIQ/1Q5ioX4YcfBW3IbzyXXMmLqaMDaQjndFk7+sXFoSz+A
 Mbusyjbo6iE+llpLR9OFKLxabubeD369SAwLc2bQfq8kh8o3gk/AhTStNyTVDXZ0THrE
 4bGnZhRjZYE+yVpugd4VoPmQYiuTZGQlS6Gm1GePZxuvuniS954uRoeLQ0SOjiZpCHym
 HIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681325649; x=1683917649;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OCBM1eYOuCRMs+HWvFuj5wOCzBihsmjaSCKE5mxqFgI=;
 b=mIK/s4wf5Di4DyuAivFBu/JSjvyyY0MGra+fdvn9H6JWtAZYKYkSuVLpbkhnIMTTzG
 9Lq3n4iKnErZVG3CNXNVn7FC2q7NKah2NtocvVpySIdI/Da+Enl41VpElW6V9ln8w0gJ
 MncbKk84p088XPMCZrQSS5gObb8xk12Fzx+1QGlPy6Z1nMY45FGQpAJcIcup+r0DfFL4
 r0meCK8mRruSRBjpSbIb+ydkfV7/ta7qdBrY+SfYAq60DgLhZtoSlA2aiewySBZMPDl1
 t1HxhAqJ6sYrKsuV17jvpOyAZTSnOZXb+K0HEySiREaKDkr1WUGp8SOSl7fUdfCiGXXD
 Hcxw==
X-Gm-Message-State: AAQBX9cnSmD6xdgBdVgv8TCjlYwO7NFhz+1PsiBdmc1BrDyjeuL1yDT0
 9B/BOJ0QgRbV18gWQ2CsmotuLo+2qxj0Ebh4WxpMyw==
X-Google-Smtp-Source: AKy350YpkBKagCiorTlciXGC1XIYvr/Cp6SiNr9+jL2am6FQOLrXgpQ/KR800WHaG6IAXmEJFIDhvRUdZb691xauqlI=
X-Received: by 2002:a50:9f65:0:b0:505:521:7880 with SMTP id
 b92-20020a509f65000000b0050505217880mr1382745edf.6.1681325649641; Wed, 12 Apr
 2023 11:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-23-dwmw2@infradead.org>
 <CAFEAcA-vCihVupZsLBdh6+-xjdNX2-K1Ceo+tgsjA=KCdWTjpg@mail.gmail.com>
 <92e10c45117dce9c07304a567fd412434ea0ddd3.camel@infradead.org>
In-Reply-To: <92e10c45117dce9c07304a567fd412434ea0ddd3.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 19:53:58 +0100
Message-ID: <CAFEAcA8W49n-O3jokxQjYD-u0ScC+giGdryai4bKy_Lk-nrseA@mail.gmail.com>
Subject: Re: [PULL 22/27] hw/xen: Add emulated implementation of XenStore
 operations
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Wed, 12 Apr 2023 at 19:22, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Tue, 2023-04-11 at 19:07 +0100, Peter Maydell wrote:
> >
> >
> > > +static void xs_be_unwatch(struct qemu_xs_handle *h, struct
> > > qemu_xs_watch *w)
> > > +{
> > > +    xs_impl_unwatch(h->impl, DOMID_QEMU, w->path, NULL,
> > > xs_be_watch_cb, w);
> >
> > Coverity points out that this is the only call to xs_impl_unwatch()
> > where we don't check the return value. Is there some useful way
> > we can report the error, or is it a "we're closing everything down
> > anyway, no way to report anything" situation? (This particular
> > Coverity heuristic is quite prone to false positives, so if that's
> > the way it is I'll just mark it as a f-p in the coverity UI.)
>
> This is because the Xen libxenstore API doesn't return an error, and
> this is the ops function which emulates that same API. I suppose we
> could explicitly cast to void with a comment to that effect, to avoid
> having it linger in Coverity? I think that's sufficient to make
> Coverity shut up, isn't it?

I've just marked it a false-positive in the UI. Coverity's generally
good at not resurfacing old false-positives, so don't bother
changing the code unless you think it would improve clarity for
a human reader.

thanks
-- PMM

