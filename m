Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366255BFE18
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:39:59 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaz1C-00086K-7r
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaynL-0004Ra-Mx
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaynK-0001He-Bi
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663763137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4/hehNOo81jFiTjL8PYXlvc8cNMRcGkbs1CJDZWs2o=;
 b=QmZ2gciSh04ksq5fi35S82xOSTmvUpSJddZ1cmj6estGWDejQqxlE4s1xs7MUkALpkEH2O
 m8JGWL2nmFeMXt/JxbqacnurbzmgiE4m3qYcXz6lrPBSKhyTawKPoCZ8LDY7PvK+9FC9p4
 9cPJJSc2JflR3+UXhvc2r/2A84FkOKw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-VXZDK6bgNViz1TcguAdrsQ-1; Wed, 21 Sep 2022 08:25:36 -0400
X-MC-Unique: VXZDK6bgNViz1TcguAdrsQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 y7-20020ad45307000000b004ac7fd46495so4171966qvr.23
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=n4/hehNOo81jFiTjL8PYXlvc8cNMRcGkbs1CJDZWs2o=;
 b=HXwI2ET36upZkmWMNrqVStwwo9BTj7TLn9qf9aYJEHVvNJCSqP/J1czSczSLSNwsDE
 fOwp6Pn2bk+rnl/7ZYwkHwaWyizRQPsppYog5QRWKE3xMlRNuoMDJzAXHIKhLL4CWgXG
 L+5EHhjj0R6wlMnrk3YBVeVWZEdURMZj9AOPGu4lBC0O39bmU+OVYNkUNN77MDLIq4Fq
 MZZ5XhauDV++sfQzuXuN7XcOrF3vKivntCvPbhfuT6Erln/YdcDjhcjqBETFRsIZvaHC
 7mxJiByXqlMpyGv9PQ+kmtO9IgPISJnByWxUn6LSUx3VO9tRgG8XiX0dfFOlcnVNKuXK
 gEQw==
X-Gm-Message-State: ACrzQf2qwo3DrzaG5ZHTJ2gNeWEOFqEWpRaUIrSd25e6S/uKD5zvcCOb
 xtevf8xcs1a4EHZPyRaJKNkGxvUBcYJyStsNHqsA4ZIEDuvYz3XRxrxGZWGh5qnYQrLDCXZUUxy
 Rr9GcUKHK3j8DKkQITx01b5pOWHIdXMU=
X-Received: by 2002:a05:6214:20e2:b0:4ac:b9a6:17be with SMTP id
 2-20020a05621420e200b004acb9a617bemr22381948qvk.104.1663763135841; 
 Wed, 21 Sep 2022 05:25:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Xc5X7NFfYDaprjz4r263iewQQ6//Crbrp+1bKJ6f1hspDj57QYiRjGXHBZynewuVKXNjfh9nQgWj9HzTFgoQ=
X-Received: by 2002:a05:6214:20e2:b0:4ac:b9a6:17be with SMTP id
 2-20020a05621420e200b004acb9a617bemr22381938qvk.104.1663763135621; Wed, 21
 Sep 2022 05:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-12-richard.henderson@linaro.org>
 <4de080cd-4377-271f-165c-bbe66a2eb22b@amsat.org>
In-Reply-To: <4de080cd-4377-271f-165c-bbe66a2eb22b@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:25:24 +0200
Message-ID: <CABgObfYJW7bf2rp5DBWFUBtP8ijVfVBo1E5cK6xKmwvPHE8Nng@mail.gmail.com>
Subject: Re: [PATCH v2 11/23] target/i386: Create cur_insn_len,
 cur_insn_len_i32
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Tue, Sep 6, 2022 at 4:50 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 6/9/22 12:09, Richard Henderson wrote:
> > Create common routines for computing the length of the insn.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/i386/tcg/translate.c | 31 +++++++++++++++++++------------
> >   1 file changed, 19 insertions(+), 12 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


