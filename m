Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2BF388263
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:47:56 +0200 (CEST)
Received: from localhost ([::1]:52516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7ZC-0005CC-Kg
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1lj7VU-00030L-UI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:44:05 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1lj7VT-0003qT-1p
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:44:04 -0400
Received: by mail-ej1-x62e.google.com with SMTP id c20so16893712ejm.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++hAhtO4LPF1o2LlzQdmUXQLn2+1OzzrGNr+AYgwRSs=;
 b=cl6H+eCy7mQGyVJQCOOzCvzmaiTsKpFqt+tDhaZIQHlTegTDhm/5QUr9YtoRejJ+oe
 pXGzSoe86ZSnIAKtGFwUDvx8V9DPu2GsdkpOP3SdzCi0maU40tWiv9GIQtuRvXraNag/
 fsP7KhJI4OCEkGHdBxK97xEv2oz/2Hksmf7AAz4l004SKHQkZhYToPuxyPxOasL/Liu7
 JDvxuDYSMnhvFamacoKPXIQBysePPltY+TKSxBWmiVEonzPS8gZLfA/dUlXx6cJrQl3o
 IW2SFfTl4JM5/2RmDIH0qcqa5IPA8gX1DvJzhUHr6dSgGSaI6iuWm8IxZDNWMGxo87tr
 daNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++hAhtO4LPF1o2LlzQdmUXQLn2+1OzzrGNr+AYgwRSs=;
 b=payKxEyLaV+SMTw3oD9GNxK3E0eD+4t/Y2Vt9nuvEMXq6S7afZZgfe4Lnz8hTig7dn
 IvulXXv7h0oW2lNZOLZGjmoDuvTbDgOCgY9RjQZ7UNLWTSvpGHs9SveSZG+YqVCKN2Zv
 qwJqU7++pX6a6Rh9Ez/juX1NKj1z9CwKtS6c8NErUyUz+ELMjntOIyBK3c01NrflM6qp
 iJkD20o7Z83RpJKhILhSjj+POqsrSZcH6JAK6TLThkeTDs4KX/biUhAYhOQ9CpaOt88K
 obi0xjrvgyPF5lLId3VriX6NxIrF1tMYc+43gqvSOok/S8FFvA2y6FkGHSA9zP9a1PNj
 68Wg==
X-Gm-Message-State: AOAM530HcvkH/PN2v6SR5hsvYyprN+3g6Q9R1F7nb5ulqW9m9v9oMheM
 T7++vqj45p00a2GVsEBNwt/mNr08vw62zF9q6ULtnA==
X-Google-Smtp-Source: ABdhPJxT2WB+MMgrDruElIO+lMjuSvqiI2G3w23mRsvjxGG6EcMCflR7+6wve+kKNrJ77JPGTUG295BaY8lwqyCduD8=
X-Received: by 2002:a17:906:56d1:: with SMTP id
 an17mr5835058ejc.6.1621374236339; 
 Tue, 18 May 2021 14:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210518184527.1037888-1-titusr@google.com>
 <20210518194518.GY11196@minyard.net>
 <CAMvPwGquxnT7RDOVCeXG1Jdjg1hU+a1-20Pu4c7ufQDytbNHag@mail.gmail.com>
 <20210518205951.GZ11196@minyard.net>
In-Reply-To: <20210518205951.GZ11196@minyard.net>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 18 May 2021 17:43:20 -0400
Message-ID: <CAMvPwGonNtKeSwbLpUimBJ6U_OOjiC_3N_1t+L64uce-or6oFg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add support for PMBus in QEMU
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Hao Wu <wuhaotsh@google.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=titusr@google.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

That would be great.

On Tue, 18 May 2021, 16:59 Corey Minyard, <cminyard@mvista.com> wrote:
>
> On Tue, May 18, 2021 at 03:50:57PM -0400, Titus Rwantare wrote:
> > I would also like a directory for sensors. There are quite a few of
> > those incoming. Any objections?
>
> None from me.  I'll add a patch to move all the sensors from misc into
> it, if you like.

