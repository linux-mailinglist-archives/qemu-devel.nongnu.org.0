Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596656A6C1B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:08:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLFA-0003FZ-Fh; Wed, 01 Mar 2023 07:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <znscnchen@gmail.com>)
 id 1pXLF1-00038q-Ql
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:07:28 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <znscnchen@gmail.com>)
 id 1pXLEz-0003ZA-3Y
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:07:27 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 o4-20020a9d6d04000000b00694127788f4so3499841otp.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677672443;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pVUKXlgJ8yBdaNLHc/GQXnFRWMut4ljlfRNIjTbAhR0=;
 b=bj4n9SuiSXlPx/BRdcs0XUotS2o6Nr9Fb2IfYijEjt55t6jjSQ70kFOrLqCTQhDvMd
 ZJnNhf1lr6v1fUSG9RWmlsee5QVZOvhXUTy1cNvgYYK22E+1pFkrpgSNvbadgQvwxG8l
 ZL5H0GEsZcZmDfVDgQSPPvK5k2Fbeyh0Y6GWawuRdvHU2um0B3B0pWBwaA91nLu79RCq
 r9V5uASYwC/8/Nea4JjVS8j0TUvgXfLp99q4lGF83OLtMFXdTG257jLTNiI3gUdoFCHb
 0aqhUwGG+VozU5EqYXwSgJsViLPYFbMF8QOEAoSB0zK+GUHsw+nmErlKwwdC2FVI/hGr
 dWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677672443;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVUKXlgJ8yBdaNLHc/GQXnFRWMut4ljlfRNIjTbAhR0=;
 b=dFQo1dJGn+W6x98XN5FPIGcYyzZ3aprmxehs8u4qlyzakqbZLOtA4s/xl7/k25zan2
 DsBRbjnB81+nRTN8DwhWxRIcLUgMvhpsYW1DV79Wlsg2e1sPjy5DBzZ3LPdtlGTseaJU
 eosK9Dmb6zADy3f2u4Lm6t51WnjUqI1xKL+5FnntnKPkEc634cMDm0RvuYYPSfe+LbSS
 LMENc5KaAhKQ7zjaA58lBeITmY2SeV9VtOHS6QK9SlM8EMJzkVs8DQKnnndDe/u8Rcof
 C7//oRiDChPNofZGc+3XzzV6NdQO/7R+stqOq/BgMB5ECkYgOyHZd+iw5HEsRNNbssXb
 f77w==
X-Gm-Message-State: AO0yUKUTSOumNRHeGX9PbLvPOPS4X/fPvpB4cH/xxonOnG76YIoNpPmO
 Wbt6BKYOYyf7XHBpcA4MwQ==
X-Google-Smtp-Source: AK7set9jwBZSTyyv7cu3Jf2ZC6qd9ewn45QRdgo+VwQaSDvcDF4iemRu0KjtvWeMU33iM0B6Pyofow==
X-Received: by 2002:a9d:806:0:b0:690:f896:758b with SMTP id
 6-20020a9d0806000000b00690f896758bmr2923530oty.38.1677672442829; 
 Wed, 01 Mar 2023 04:07:22 -0800 (PST)
Received: from ted-dallas ([2001:19f0:6401:18f2:5400:4ff:fe20:62f])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a056830237200b00693d998f713sm4765463oth.35.2023.03.01.04.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 04:07:22 -0800 (PST)
Date: Wed, 1 Mar 2023 20:07:20 +0800
From: Ted Chen <znscnchen@gmail.com>
To: pbonzini@redhat.com
Cc: peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] memory: dump HPA and access type of ramblocks
Message-ID: <Y/8/+D5TYZQ3XVQH@ted-dallas>
References: <20221205120712.269013-1-znscnchen@gmail.com>
 <Y7hh37KTO5BcPs7z@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7hh37KTO5BcPs7z@x1n>
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=znscnchen@gmail.com; helo=mail-ot1-x329.google.com
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

Thanks, Peter.

hi Paolo,
A gentle ping:)
May I know what's your opinion to this patch? Any concern or further improvement required?

Thanks
Ted

On Fri, Jan 06, 2023 at 01:01:03PM -0500, Peter Xu wrote:
> Since I applied this twice already to my local trees, let me ping for Ted
> to make sure it's not lost..
> 
> On Mon, Dec 05, 2022 at 08:07:12PM +0800, Ted Chen wrote:
> > It's convenient to dump HVA and RW/RO status of a ramblock in "info ramblock"
> > for debug purpose.
> > 
> > Before:
> >             Offset               Used              Total
> > 0x0000000000000000 0x0000000400000000 0x0000000400000000
> > 
> > After:
> >             Offset               Used              Total                HVA  RO
> > 0x0000000000000000 0x0000000400000000 0x0000000400000000 0x00007f12ebe00000  rw
> > 
> > Signed-off-by: Ted Chen <znscnchen@gmail.com>
> > ---
> >  softmmu/physmem.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> > index 1b606a3002..fed4dfb72c 100644
> > --- a/softmmu/physmem.c
> > +++ b/softmmu/physmem.c
> > @@ -1316,15 +1316,21 @@ GString *ram_block_format(void)
> >      GString *buf = g_string_new("");
> >  
> >      RCU_READ_LOCK_GUARD();
> > -    g_string_append_printf(buf, "%24s %8s  %18s %18s %18s\n",
> > -                           "Block Name", "PSize", "Offset", "Used", "Total");
> > +    g_string_append_printf(buf, "%24s %8s  %18s %18s %18s %18s %3s\n",
> > +                           "Block Name", "PSize", "Offset", "Used", "Total",
> > +                           "HVA", "RO");
> > +
> >      RAMBLOCK_FOREACH(block) {
> >          psize = size_to_str(block->page_size);
> >          g_string_append_printf(buf, "%24s %8s  0x%016" PRIx64 " 0x%016" PRIx64
> > -                               " 0x%016" PRIx64 "\n", block->idstr, psize,
> > +                               " 0x%016" PRIx64 " 0x%016" PRIx64 " %3s\n",
> > +                               block->idstr, psize,
> >                                 (uint64_t)block->offset,
> >                                 (uint64_t)block->used_length,
> > -                               (uint64_t)block->max_length);
> > +                               (uint64_t)block->max_length,
> > +                               (uint64_t)block->host,
> > +                               block->mr->readonly ? "ro" : "rw");
> > +
> >          g_free(psize);
> >      }
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Peter Xu
> 

