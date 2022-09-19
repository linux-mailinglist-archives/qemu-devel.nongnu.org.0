Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD145BD485
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:08:47 +0200 (CEST)
Received: from localhost ([::1]:53844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLCI-00040z-Ek
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oaKhR-0005jO-9c
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:36:53 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:45953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oaKhP-0003KK-Hs
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:36:52 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id 125so22253618ybt.12
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ck4BMj+vvY5OflnBnyLJgGwLlOkDf6AU0R4r0DkS+6o=;
 b=DKB1zIcH2hIzAYwBRLGwDBO2MCcYOnB5iwOfRnqA+MJiHe9U+kryhBSwEIYWGekY2G
 q9yxcfBMbCV5Nvjqs20gZTfifCzhCIHiF+DVxtHEb79hJIKQ+zcs2g0dbfqJv6oiBt7W
 6nAlO6FwMpG7hQmQehWaMoMkYp3POvRxRUZxIu4R++sHwM0cuaRrvQeVanJsu5KR0Lxf
 poYgqqL/LSBU6hFp5EaNtSYUuHWxZ+KnB+ILpG6kq5Mg43kV+J8M4OG9FLiOZe3wJYpN
 fPVK1JI3d5Ew7aO0uAAhPMpZFJUieWeEjud5W/Zl3RuDvuy/BFhuLJo3Pao2FffTVD/R
 wfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ck4BMj+vvY5OflnBnyLJgGwLlOkDf6AU0R4r0DkS+6o=;
 b=GVQHBuqd2+2hio5Q1VO6yhQYpbxnDdjXW33gLiLXHrdvpZeyxOn90hK3wDctGyYDeL
 jcbZNQdQ6TbQ/faTlbytzOIiC4UA5l+NcE4Ur6Y1l5a4rqFRO1Fkbq5ATTTNOboMgrxw
 ZEbgXA+7dZNn1wcY+iYpo8HFQ1SBv2M3yOnRbQLvy/rSDoUN4Dclk6PgZSF8VvccqMH9
 H0dGMNfFbW+KgmuMLl2meOrkVgU0fRvlUCk9fRRgdpr0BENlRcA7dVZB/l5fcpsDAMTT
 wZO23nyVjmgHYdKOG/sZVcX/Yh7r4t+NYuLwQGwDbsAIFTDiw/cOpX5aSYXj8sa13EsC
 zQMw==
X-Gm-Message-State: ACrzQf39fUbVz5DZfApksrSHT5j7tnfDQfOPukeMSeg+g6cunainEU9c
 FDca7LI2z18ueiqG+Ar5U0f+gFet9v8ebly18xVL8+ysljI=
X-Google-Smtp-Source: AMsMyM4U201McPLAj52F9LhXfPz6GsbWtNm90YXWHpOJlUWV9MA4lX+lGM2V11A0F2sHSbzR2fGPGEZc6cNZMSelXkw=
X-Received: by 2002:a25:e0cd:0:b0:6a8:cd39:694a with SMTP id
 x196-20020a25e0cd000000b006a8cd39694amr15871176ybg.207.1663609010289; Mon, 19
 Sep 2022 10:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QUn5wianZaCu8Ka=eu2uuwtwTnTLD-P9pkb+PxFd=1Mzg@mail.gmail.com>
In-Reply-To: <CAJSP0QUn5wianZaCu8Ka=eu2uuwtwTnTLD-P9pkb+PxFd=1Mzg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 19 Sep 2022 13:36:38 -0400
Message-ID: <CAJSP0QWbN8Ee49HTYfc4sbgHJpB0bNTyCyRAZT2GgQYXBeG7YQ@mail.gmail.com>
Subject: Re: Call for Outreachy Dec-Mar internship project ideas
To: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Frank Chang <frank.chang@sifive.com>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Sept 2022 at 12:41, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> The Outreachy open source internship program
> (https://www.outreachy.org/) is running again from December-March. If
> you have a project idea you'd like to mentor and are a regular
> contributor to QEMU or KVM, please reply to this email by September
> 22nd.

Reminder: there are only a few days left for proposing Outreachy
Dec-Mar project ideas.

Stefan

