Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1531D5B909B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 00:50:22 +0200 (CEST)
Received: from localhost ([::1]:40712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYbD2-0002qJ-NJ
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 18:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oYb8K-00019K-F0
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 18:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oYb8H-000350-Mb
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 18:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663195524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SewpqZOEOBd/oAD1B/4HhpEt1sDnt1owdhNa2h39Suk=;
 b=iiUKQ0q496XbJOLbRZvasJAQyVTV77iVgAATiP3/Nrnwe4hPJDGMrrD77IXZhXTYE/W8I+
 qZCc1a7ysCBaobSg4r6zvVcMpq3VaSSjKM/BRxMU9E11t2uD+exgIAxQu9uQN0UNSTmZIy
 6PPuiYa0t6vGF1TNCb0QQ6geJR4CQEk=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-6_rTS-mnOmyt4wLbo7GBJg-1; Wed, 14 Sep 2022 18:45:23 -0400
X-MC-Unique: 6_rTS-mnOmyt4wLbo7GBJg-1
Received: by mail-lj1-f197.google.com with SMTP id
 bx10-20020a05651c198a00b0026c1cdb5b4cso2111829ljb.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 15:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SewpqZOEOBd/oAD1B/4HhpEt1sDnt1owdhNa2h39Suk=;
 b=h26egjbG+Y7WipYeZpd8yshVXiZcaotUQV4ku5zATVYr7e34Y/uswJlwBQaN0t8zZ0
 EJpvGBb46lwLYFg5Bru4kcIInVzWqbuVIzsRwVjtMkeAZzlP+LId6EcXd8A4sXBiSiuY
 j0nr7zzbInku5dNc6nhbWE1v8diETUyAIRYrpoeDte80eJluuL8q10TVCndFOdMbLKLL
 ZzJi82jd3BXNIcUSrlp1Rugq+w30aSNrFseJ5o7cSy0uOXFCw0R7fQ4MdyamtGUwvTHg
 eA08QrYuyLtkMcwXDEV97z0hf5633xe1ARaNmcJAviQEd7vcHlaR6snhLoQT+/TyDojh
 jD8A==
X-Gm-Message-State: ACgBeo3pnfCNon2Q8w9T7V3lxoQG3dvVEhHk2hbxGbvTxuRs2/1bBEF/
 B1vqZXuK+KLdgpQlT3DFuarrWWq7LwznANXnhxXj4+NIlqUeGJyKaiaCQEGWLjNrCKuC448jrSo
 8uEFQomn+JZKox8bXthWOdbXLEcO3di0=
X-Received: by 2002:ac2:5a46:0:b0:498:f53b:d19a with SMTP id
 r6-20020ac25a46000000b00498f53bd19amr10557141lfn.674.1663195522110; 
 Wed, 14 Sep 2022 15:45:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6a1bPWPQrJ+NeNVVrd+ygmnkN6ZiItmhM+XaOSeGTk3w2VP+8ofeYsR+LRtb0slPPT2ZXtQ0l6hMsR91up9LU=
X-Received: by 2002:ac2:5a46:0:b0:498:f53b:d19a with SMTP id
 r6-20020ac25a46000000b00498f53bd19amr10557135lfn.674.1663195521844; Wed, 14
 Sep 2022 15:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-31-pbonzini@redhat.com>
 <a877d694-e4c3-5875-a628-76f2328d3242@linaro.org>
In-Reply-To: <a877d694-e4c3-5875-a628-76f2328d3242@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 15 Sep 2022 00:45:10 +0200
Message-ID: <CABgObfb1KL2T7uvB7fZbagd5mZzdYoJYy8AEV3F_WY2yWYQppg@mail.gmail.com>
Subject: Re: [PATCH 30/37] target/i386: reimplement 0x0f 0x10-0x17, add AVX
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 13, 2022 at 12:14 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> > +static void gen_VMOVLPx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> > +{
> > +    int vec_len = sse_vec_len(s, decode);
> > +
> > +    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(0)));
> > +    tcg_gen_gvec_mov(MO_64, decode->op[0].offset, decode->op[1].offset, vec_len, vec_len);
> > +    tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
> > +}
>
> You've just been moving i64 pieces in the other functions, why is this one different using
> a gvec move in the middle?  I do wonder if a generic helper moving offset->offset, with
> the comparison wouldn't be helpful within these functions, even when you know off1 !=
> off2, due to Q(0) vs Q(1).

Because this one is the only one that has a VEX.256 version (the
operand is type "x"
rather than "dq" as in MOVHLPS, MOVLHPS, MOVHPx).

Paolo


Paolo


