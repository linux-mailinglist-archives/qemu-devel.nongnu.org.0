Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC45C6E5DCD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 11:45:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pohtj-0000Id-B1; Tue, 18 Apr 2023 05:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pohth-0000Hz-1g
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:45:13 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pohta-0004Rc-Hv
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:45:07 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5051abd03a7so4022723a12.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 02:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681811105; x=1684403105;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eqWOPMCPtsSKuGhNXBr1LrLqRLc3xZy090dmB+kEUvg=;
 b=P7VxUd0plnsw4TWA4Zzf+3iNgRO2MUGpFsBfd8TqT2axT+HGWnkuzIjCh0z/ewn889
 pFokazCF4p4iLT3ja6RYepobQeQuiRpL5RtrEkRz1WoKvV9WQNWeOQdehSpZQ3DV/pXI
 DqPkRUIR/SieC7CeEymh7AcF7GSZ0QG7+r6iakrjG79w2y4zI2Gog9F7TszE+qOdhCJV
 qUxaZzK6QlAVITXH2+DxmwMGrUnjS92M1hMFPnswgCs5FtFYElur5Vzto2A3ga8W6Y54
 wwPXEccEQcdpFqfGd4aevBZHi2RSBHdb7LBOHo1NsfZFADPeihZs9Nd7aRI4rod3/VGQ
 b2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681811105; x=1684403105;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqWOPMCPtsSKuGhNXBr1LrLqRLc3xZy090dmB+kEUvg=;
 b=Glly38oJ8MFtCxQGxZsdhpXjs3ikGtex/RzuRHIqssr46mZAFmIyv8lM5mO3YW2Meh
 GXQCwllPYRATsJ8+Td/HzxO7d4Wuk3Raq+/ARTojQ2z0pzlPP3u23FqRRrAMMSixehU6
 87rajg8Il/FNujViqrL9y9pG3esybp5pNBTjSUr4j6mG51NMqWjaeldoxxMZSoUfaTAQ
 UBjuJMsANJQn+++NqKcp9iN/2WoxXKWDMpfMxPuxgr3QevIcGhg8fOq4NzwD35VxY+m2
 qKnSWpMzkVUX3t/Ty4p0Y63Zamzm20WjO9aCarX98ZaN6qcVvx3ueGUCoZlHUdcjIKK4
 7cGw==
X-Gm-Message-State: AAQBX9e7U0msesOse3wEu0n6Olo5fZoE1/3s+vovtsqgtR8fhkU/7Sqi
 W2YhxwIUEZp/elfJTwhg+ctYdy8vk4vw537JFtFo8g==
X-Google-Smtp-Source: AKy350bBLhxGtu9OJokGU98o5IJzswnmIrZSXMmbaCYxzNUklLaT1+Dw6GjxScT0eSE7P+fFma2JxWENlEQavvlK47Y=
X-Received: by 2002:a50:8e19:0:b0:506:6ca5:3128 with SMTP id
 25-20020a508e19000000b005066ca53128mr914936edw.6.1681811104703; Tue, 18 Apr
 2023 02:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-4-peter.maydell@linaro.org>
 <add60763-a53a-e037-1690-d9c2da375dcd@linaro.org>
In-Reply-To: <add60763-a53a-e037-1690-d9c2da375dcd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 10:44:53 +0100
Message-ID: <CAFEAcA_3SEsPDfmsmPiGQ9X9u_5MGebDs9KZvFp4vSPNPcQn-Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] accel/tcg: Use one_insn_per_tb global instead of
 old singlestep global
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, 
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 18 Apr 2023 at 09:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/17/23 18:40, Peter Maydell wrote:
> > @@ -219,8 +221,8 @@ static void tcg_set_one_insn_per_tb(Object *obj, bool value, Error **errp)
> >   {
> >       TCGState *s = TCG_STATE(obj);
> >       s->one_insn_per_tb = value;
> > -    /* For the moment, set the global also: this changes the behaviour */
> > -    singlestep = value;
> > +    /* Set the global also: this changes the behaviour */
> > +    qatomic_set(&one_insn_per_tb, value);
> >   }
>
> Oh, one question: is it worth having the TCGState member at all?
> Seems like these accessors could work just fine with only the global.

True at the moment, but if we do ever want to do that refactoring
to use a tcg_global_cflags, then we will need the TCGState field,
because you can't go from a tcg_global_cflags value back to
"what are the one_insn_per_tb and nochain settings currently?".

thanks
-- PMM

