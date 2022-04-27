Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22FA5113EF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:56:07 +0200 (CEST)
Received: from localhost ([::1]:36416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdSw-0001Hv-IP
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clabbe@baylibre.com>)
 id 1njd89-00072m-Rn
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:34:43 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clabbe@baylibre.com>)
 id 1njd82-0006F5-9R
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:34:33 -0400
Received: by mail-wr1-x432.google.com with SMTP id e2so1421092wrh.7
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RxCFzww6bYdXYDc3pwzE+Abs9JuJNWj96VKdAejKV9w=;
 b=7slJHXMNPC5yxhgxO6H7hKsoC57L4Nb9s0maIdVVAjmFAtZw5K7AE0SuCBFTceTugh
 HxnxvnFr27cjkCG6ZS23r79jIGb5eXaaFPU9CEdPCOOP1Rl/xN/1PZ8dqGgcQbGbLScd
 dtnSj6ed8baJymOJf7MFaHN6gFydDjEYk6ymyPdvDNZ7HhcOi2yi/5csYOW8HRIVpLoq
 7HqImcBpM7aPvwKSnQaJcXz90oBkQoFauEnN6d1VCZncC3/145vzLINcd9oFoMpeZnUj
 IuHdHLQGEP3FQN8ekPJBuUMbIL3GcebvIWBBXSBEOkAy+kTeq3D8Fl+jFcGy7hZKLqyg
 ln+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RxCFzww6bYdXYDc3pwzE+Abs9JuJNWj96VKdAejKV9w=;
 b=WBthBdVk7sqs1M58WxHduLImQOHQdcxavqhfLG+Er9FZzmCvwGBq6nWH4COL/b/8kr
 jjm9EIbz6ILSElGPz7Sn5TgaNYHwTvm5EeZEWVMkUyDnZ6ZqZ1ulw9eglaRNELX+OI9F
 b6YH6gWSST3GmiNdtn/jsxSeEkExpHyBkGbB84MarXb56WfmVBSMLTUffGVAmLK0KjDX
 9uqh2jMSQFY96OZmLEiFgxHAgTObwl15kp6ZC9tKHfwa/KA50Vt5vELPrYVtn6cIJkQd
 ozzz8ALC7np0mC9sEet0e67Jz1soNOBL0t1ByjY+557TydOJRysw+Jnpi9zB8WC28Ztq
 eLuw==
X-Gm-Message-State: AOAM533Lij6uVN1MxmWHjRwJLsqmayo4iRnePUKHiItNfm0nGZLJKwr1
 eljIQh/v5xisDxZh5w1vWnFZNw==
X-Google-Smtp-Source: ABdhPJzZprcwdZ3VhMmvHRhF7WdaYYQtbTCZ00RGfq4Jzd/9uNPpp4iG7QRQ43wnsNgvGoNA2cS0kA==
X-Received: by 2002:adf:f809:0:b0:20a:c40d:ae9a with SMTP id
 s9-20020adff809000000b0020ac40dae9amr21436055wrp.609.1651048467312; 
 Wed, 27 Apr 2022 01:34:27 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 u4-20020a5d6da4000000b0020a8c8d3e00sm13881269wrs.73.2022.04.27.01.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 01:34:26 -0700 (PDT)
Date: Wed, 27 Apr 2022 10:34:24 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
Message-ID: <YmkAEEEuquXOpqzJ@Red>
References: <20220410191238.760733-1-clabbe@baylibre.com>
 <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
 <YmWgn2OGoZ9Uyirh@Red> <YmZ1pCU+0bP/LFPU@redhat.com>
 <YmacD3eroYTnjUdx@Red> <YmawTE9AfYxyaZoo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmawTE9AfYxyaZoo@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=clabbe@baylibre.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: b.galvani@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le Mon, Apr 25, 2022 at 03:29:32PM +0100, Daniel P. Berrangé a écrit :
> On Mon, Apr 25, 2022 at 03:03:11PM +0200, LABBE Corentin wrote:
> > diff --git a/crypto/hash-nettle.c b/crypto/hash-nettle.c
> > index 1ca1a41062..b9342b4fe1 100644
> > --- a/crypto/hash-nettle.c
> > +++ b/crypto/hash-nettle.c
> > @@ -26,10 +26,22 @@
> >  #include <nettle/sha.h>
> >  #include <nettle/ripemd160.h>
> >  
> > +#ifndef nettle_sha256_compress
> > +#define nettle_sha256_compress _nettle_sha256_compress
> > +void _nettle_sha256_compress(uint32_t *state, const uint8_t *input, const uint32_t *k);
> > +#endif
> > +
> > +#ifndef nettle_sha512_compress
> > +#define nettle_sha512_compress _nettle_sha512_compress
> > +void _nettle_sha512_compress(uint32_t *state, const uint8_t *input, const uint32_t *k);
> > +#endif
> 
> The 'nettle_sha256_compress' function doesn't exist in any header file
> from nettle that I've looked at.
> 
> The '_nettle_sha256_compress' function exists as a symbol in the .so
> library, but it is clearly not intended for public usage:
> 
> $ nm -a -D /usr/lib64/libnettle.so | grep sha256_compress
> 0000000000027730 T _nettle_sha256_compress@@NETTLE_INTERNAL_8_4
> 
> So this #define magic is definitely not something we can do.
> 
> IOW, unless I'm missing something, I don't think we can even
> use nettle for your desired goal, which leaves us no impl at
> all.

sha256 is only necessary for the upcomming sun8i-ce, so it do not block sun4i-ss.
I try to contact nettle to add necessary headers.

So for sun4i-ss, what do you think about my qcrypto_nettle_compress implementation ?

