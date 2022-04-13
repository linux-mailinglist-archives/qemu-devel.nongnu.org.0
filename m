Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F3D4FED71
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 05:20:49 +0200 (CEST)
Received: from localhost ([::1]:50314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neTYm-0006jd-7W
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 23:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1neTXO-00063I-TG
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 23:19:22 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:36843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1neTXN-0002f9-67
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 23:19:22 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2ebd70a4cf5so8687937b3.3
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 20:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LXbl4b0QTTr08Zs/dhwGUOIW7JNFWQdq5oGpICxZk0g=;
 b=CvD4I6E9bnkQSQCERE7q8WztZXFBpvK57VKOksPCeqmLaWrC2P2n+9EJUytUJyadVb
 xSZRwx2G1rCKxpYBsoHSfYbtP5bnhoqE3Dt+n/k5wv+v6GEBObhfQN7ar2gExKkfrKxI
 yhSz1PuhEUzM5OBixPjzNLJw91jGP9t0dmS2ahQ2YXnj/2cW5FEgnpnb4gbgUanP2fBQ
 t9UBsQ/qTHD+Smh4bK5ccoK27wHAJrcqVvFzAiFML+1IsOXF8hFX9loosAPXW2pnQTy7
 oUH+egJO25b3mKpeEY3Kyj043ujx2c9nT+bI46iWvRLplE6ctUr58yWdl9GEsiEDZeLI
 f3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LXbl4b0QTTr08Zs/dhwGUOIW7JNFWQdq5oGpICxZk0g=;
 b=mTl9uELCWf66sUDihOTfQPHj8yq5QQeRYl6tdj5eQeVYQcMUvQasIIQIUbT0lWAoJ6
 XnYPxPaMJiCrvN1tHgGQTuvlRfVxJwMPgeTiBEnMRnQ4m6eXxwSZXJcmj0HTzakTrGjt
 7Kfl8DHQL44KzaHFFk/GoMuL90nt0HpedZ2uRie17INHYRuSyUAzpL+3pygKcs2jAWVk
 EXub3l2+nOyHAY11rOCkuykKx2YENFN5MbVHS6qYaJK6n3T24/fRwDxFknLTPlAm/L4T
 6AIz4/g0/RecC69HoANbysTMeKBmhjShGagm+x0W0e30vbSl8RiW2BUOfY/97ZN3Q7IK
 RXOA==
X-Gm-Message-State: AOAM5307XFsnhJNPKo9ReOmuwXtN8jPYjHslNnxW+VP/WxLDV9Jh++N7
 W1p4gfgurWnN7oK3kcWbf23PrwhXxh/6xWP8FFCpmtDQekc=
X-Google-Smtp-Source: ABdhPJxxGreejJkpzI2Q1qo3UcmYVAUROUjte8+mTC6YVoW5DAHdPQU2X1jODyixgp+h5i6GlozA+vfAWLUQHnDNnHE=
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr33040545ywb.132.1649819959998; Tue, 12
 Apr 2022 20:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
 <1937840.tFbQv4iVWk@silver>
In-Reply-To: <1937840.tFbQv4iVWk@silver>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 13 Apr 2022 11:19:08 +0800
Message-ID: <CAEUhbmVVnz7iFZ6RpW7V45b6xAVv-YxXWv2Esxu4YBZf4yA0LA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Guohuai Shi <guohuai.shi@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Guohuai

On Tue, Apr 12, 2022 at 8:27 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Freitag, 8. April 2022 19:10:09 CEST Bin Meng wrote:
> > At present there is no Windows support for 9p file system.
> > This series adds initial Windows support for 9p file system.
>
> Nice!
>
> > Only 'local' file system driver backend is supported. security_model
> > should be 'none' due to limitations on Windows host.
>
> We have 3 fs drivers: local, synth, proxy. I don't mind about proxy, it is in
> bad shape and we will probably deprecate it in near future anyway. But it
> would be good to have support for the synth driver, because we are using it
> for running test cases and fuzzing tests (QA).
>
> What are the limitations against security_model=mapped on Windows? Keep in
> mind that with security_model=none you are very limited in what you can do
> with 9p.
>

Regards,
Bin

