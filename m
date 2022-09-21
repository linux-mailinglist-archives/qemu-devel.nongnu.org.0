Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0034D5BFD82
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:08:25 +0200 (CEST)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oayWf-00061c-2h
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayGv-00072A-Oj
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 07:52:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayGt-0002Sm-Vo
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 07:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663761127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tU6kBEuq4wCNXIwXpeHKB41YIzqLk5NsQ9O9tPgFQpg=;
 b=hwZqBbUSsrNxVjFQJJCva2FEW0/wfDCtecUH/vGxBDuQauyF946BF5sr3eMALai9oeNpRp
 ZKHL/1hnMkMZR04eQbTBABDMUII2A6iAABPeBL/lQyg2hZGgVDXGd4hdND+/jkwS9Sv2Ol
 Xp9ZP12EKf1D3kjPZCE9KcWoXkoOKPM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-srW1ad-tNdWlSFn0g16Zhw-1; Wed, 21 Sep 2022 07:52:05 -0400
X-MC-Unique: srW1ad-tNdWlSFn0g16Zhw-1
Received: by mail-qk1-f199.google.com with SMTP id
 h8-20020a05620a284800b006b5c98f09fbso4092958qkp.21
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 04:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tU6kBEuq4wCNXIwXpeHKB41YIzqLk5NsQ9O9tPgFQpg=;
 b=U0O7k07BkaN3WrLAFg9wQuqm7T0F+GVwaEhGoprAdmqUGWYLWsYDQ91LFy1b1e7PpS
 ctOGwbIua58/CyDcUCrSRP7jpLXlXMDOLCLMjkGheS6Ytz773LFUO0XijjV4yDRB8ZIr
 71D6Btcrilofw9APaXvqzGB1nKMIYA+xgmPI4n8mnhHnMlzj7Im1BZq/VPRxqWyvKb+1
 JX+sjs+NAngOqNjGh13UfDJN5WH3tPziAtzckjyBsKQEk2tFoRyOXzREJUti0AQ98c+E
 nNB+FCM0/tfdtuov0JkKnfFT5bY8QUCY6rrT4qBztkI9BzOuw3P8/ra9t8n8DthQ6Q4e
 zJKw==
X-Gm-Message-State: ACrzQf2biIoSiuwMym0npLJwDXrFG+/G8VHFP14zIF1zaSODud8MPr83
 Icu/dE3Mk7W8MagRQs6DZ/K6wHCvXPGCpYYqQZqPn9+2z4aZDZ2XTIho8XXALA4QQ3yIRqp/ZG3
 25Du5GGEhtGX/9WAGFoGfEd7O0wUB5/E=
X-Received: by 2002:a05:620a:3725:b0:6ce:e7b3:d8e4 with SMTP id
 de37-20020a05620a372500b006cee7b3d8e4mr13275987qkb.144.1663761125164; 
 Wed, 21 Sep 2022 04:52:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6IyzQS0FfcKsP4of8FPTmRlTsBuN8Dr6RU7BLGSE9n7nGw0jbXvl9EH0wbLq0A6PhQqoPLrqhYvNInig7tGTE=
X-Received: by 2002:a05:620a:3725:b0:6ce:e7b3:d8e4 with SMTP id
 de37-20020a05620a372500b006cee7b3d8e4mr13275976qkb.144.1663761124914; Wed, 21
 Sep 2022 04:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-5-richard.henderson@linaro.org>
 <f8985dc3-1c96-32c9-c450-2eec6ebd07b1@amsat.org>
In-Reply-To: <f8985dc3-1c96-32c9-c450-2eec6ebd07b1@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 13:51:54 +0200
Message-ID: <CABgObfYeBdFqTMgQk+f7-DGr_eZR7kVTrxz2PvJcMj=2Qg5OhQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] target/i386: Remove cur_eip, next_eip arguments
 to gen_interrupt
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On Tue, Sep 6, 2022 at 4:46 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 6/9/22 12:09, Richard Henderson wrote:
> > All callers pass s->base.pc_next and s->pc, which we can just
> > as well compute within the function.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/i386/tcg/translate.c | 13 ++++++-------
> >   1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> > index 58e74c3162..0210382f77 100644
> > --- a/target/i386/tcg/translate.c
> > +++ b/target/i386/tcg/translate.c
> > @@ -2602,13 +2602,12 @@ static void gen_unknown_opcode(CPUX86State *env=
, DisasContext *s)
> >
> >   /* an interrupt is different from an exception because of the
> >      privilege checks */
> > -static void gen_interrupt(DisasContext *s, int intno,
> > -                          target_ulong cur_eip, target_ulong next_eip)
> > +static void gen_interrupt(DisasContext *s, int intno)
> >   {
> >       gen_update_cc_op(s);
> > -    gen_jmp_im(s, cur_eip);
> > -    gen_helper_raise_interrupt(cpu_env, tcg_const_i32(intno),
> > -                               tcg_const_i32(next_eip - cur_eip));
> > +    gen_jmp_im(s, s->base.pc_next - s->cs_base);
> > +    gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
> > +                               tcg_constant_i32(s->pc - s->base.pc_nex=
t));

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


