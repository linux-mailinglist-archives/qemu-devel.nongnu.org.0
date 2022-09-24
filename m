Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217425E8D2D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 15:43:56 +0200 (CEST)
Received: from localhost ([::1]:35520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc5Rj-0007Ug-8r
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 09:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oc5Q3-0004sJ-4r
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 09:42:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oc5Pz-0003r0-6F
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 09:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664026926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gzK/M1NQFyyGxYJ3kMyIdXXdv+I0S914nhZVGzMt424=;
 b=c2XSiV5uppyGjxhz7S8JvcLPOexH0ahYUcfZy24KtihcQEcWZkY5FZMsqUkBkxBLsAEez5
 BcKvDbGL0rtGiF7ZgF4AFbbq4B+I5CTp5oR6dlfLBfT21DPnaNXxXcr48tabG83GkHYUUC
 vJRvzRFvNvWMzOMF/GN/4ZG4fzc+A8Y=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-CYJDnbSaNGKoBH4jmwwnig-1; Sat, 24 Sep 2022 09:42:05 -0400
X-MC-Unique: CYJDnbSaNGKoBH4jmwwnig-1
Received: by mail-ua1-f72.google.com with SMTP id
 y10-20020ab0560a000000b003af33bfa8c4so629335uaa.21
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 06:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gzK/M1NQFyyGxYJ3kMyIdXXdv+I0S914nhZVGzMt424=;
 b=ceMKF4+9E4vrUsm6BzfUffz6iYoiqkM6smfXFQCl3Yt9Sw1LuRuBBuf71GgO34sQIH
 /PUrqYaASpNS3gtj+KARds3JBQ324UbTuckgjMaZ4md5UoLI/tvgxmpZi+xFUgNA5q1q
 Y/7FQv3kNNhweeDD1cmpusVh0eZeXZcGKlqgqR1m7gRGPHlSjlVPSw3PDxH4OPMgfRKR
 MjWWHJpFGR439QfdDYaVtFvUHe4XHCiIRW6LvvGRyFcoW51dsGlARngaxMiFBne48l2Q
 OQvhkpVQT5eoYFuLW+fe/TommkyAkjDlhNWI1MPAqELybwT0vQvYOKNvoe0cAXFkpELK
 24Dg==
X-Gm-Message-State: ACrzQf0Wmx58gjVfksEFejRTsjAUlobwOGBwlpCfNDasmICdZI71Y12/
 pH6hFQ2rvPkLmElSZlu2wMQ5JyXpA79EHe01Bo0lLfigtZAoVzf8AVGtxmCkeyKGNI69Ug0mmJc
 AgO3dORCzEP3HEwvUrZGaNMx06f0JEIs=
X-Received: by 2002:a05:6102:22f8:b0:398:d463:cd0 with SMTP id
 b24-20020a05610222f800b00398d4630cd0mr5300579vsh.54.1664026924688; 
 Sat, 24 Sep 2022 06:42:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6a1vHzWgjEIFsHZr8S1RFZK7TfUS/RmMqtAzOKdYJjk0l6AHLLNMlCbDGoJxDfnEYCKHriBoT+/cJHnTQMQ7k=
X-Received: by 2002:a05:6102:22f8:b0:398:d463:cd0 with SMTP id
 b24-20020a05610222f800b00398d4630cd0mr5300568vsh.54.1664026924395; Sat, 24
 Sep 2022 06:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084924.201610-1-pbonzini@redhat.com>
 <20220922084924.201610-3-pbonzini@redhat.com>
 <CAELaAXwqcWz4uh0OroLOm7F1Jx7Z9MvQCh_+QjxEgKPf11Xp7g@mail.gmail.com>
In-Reply-To: <CAELaAXwqcWz4uh0OroLOm7F1Jx7Z9MvQCh_+QjxEgKPf11Xp7g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 24 Sep 2022 15:41:53 +0200
Message-ID: <CABgObfa-p-LNqRgG8PPago3-V+ygz3m8jjmq8Ub8egUD6O5LvA@mail.gmail.com>
Subject: Re: [PATCH 02/26] block: add missing coroutine_fn annotations
To: Alberto Campinho Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 5:12 PM Alberto Campinho Faria
<afaria@redhat.com> wrote:
>
> On Thu, Sep 22, 2022 at 9:49 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> > Callers of coroutine_fn must be coroutine_fn themselves, or the call
> > must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
> > functions where this holds.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  block.c               |  6 +++---
> >  block/block-backend.c | 10 +++++-----
> >  block/io.c            | 22 +++++++++++-----------
> >  3 files changed, 19 insertions(+), 19 deletions(-)
> >
> > diff --git a/block.c b/block.c
> > index bc85f46eed..5c34ada53f 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -631,9 +631,9 @@ static int64_t create_file_fallback_truncate(BlockBackend *blk,
> >   * Helper function for bdrv_create_file_fallback(): Zero the first
> >   * sector to remove any potentially pre-existing image header.
> >   */
> > -static int create_file_fallback_zero_first_sector(BlockBackend *blk,
> > -                                                  int64_t current_size,
> > -                                                  Error **errp)
> > +static int coroutine_fn create_file_fallback_zero_first_sector(BlockBackend *blk,
> > +                                                               int64_t current_size,
> > +                                                               Error **errp)
>
> Why mark this coroutine_fn? Maybe the intention was to also replace
> the call to blk_pwrite_zeroes() with blk_co_pwrite_zeroes()?

Because at the time I wrote the patch, blk_pwrite_zeroes() was a
coroutine_fn. :)

It is called from bdrv_co_create_opts_simple which is coroutine_fn and
performs I/O, so it should be a coroutine_fn. I have a few more patches
to not go through the generated_co_wrappers, but I was curious to see
if we could automate those changes through your tool.

Paolo

>
> Regardless:
>
> Reviewed-by: Alberto Faria <afaria@redhat.com>
>


