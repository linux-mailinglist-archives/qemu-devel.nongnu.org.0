Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF3F4117BF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:03:14 +0200 (CEST)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKp6-0002sX-7B
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carpeddiem@gmail.com>)
 id 1mSKaO-0005JI-Qc
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:48:03 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carpeddiem@gmail.com>)
 id 1mSKaN-0006we-6u
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:48:00 -0400
Received: by mail-io1-f41.google.com with SMTP id a22so22431143iok.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=24mg11CfPNgL5VGRn8QQFImgrQkvZaOdisOo/Vo3Au4=;
 b=0tVrnILIa3caCc2egcCyVhgZln0KsqN/DfxR9LhA7vK9weoHQS36fdRSr198PguhiF
 eAXi71olBq4xPxDDfMefit74A0k+NIbxUPQXoQO3IOw/LLKO1PksAB6OkavC80MzMDXf
 I/3WgHcHztHvR9BS/TfKx23nC5pghM4gHiW771/ZhP0O0H2+JHufe37iyqQta9xu8moH
 /rMP1PeClXbp8IixsnfQnOrvhJiANH59UUYG04FjsEvWzG/BaNAaz2D0pmYkrjqXj5M0
 jY3cu/0yzgo1AS47eaVHJJRT3WNtPVzyWrNYdxbfKSdN518GGAayVASgFWQQf39BR/5v
 mtfA==
X-Gm-Message-State: AOAM530ua/1+3OM5/qEymCqsKuo98gcziS1USRHLlaTp3Pm9EkEYynj/
 rcCHeyw5bhc6OTGPlGAp6nViw5a+1qVOrTUPL/E=
X-Google-Smtp-Source: ABdhPJy8VS0YiaDiqrtjl2TrsmBqllrzdoLCZtZp6pn1llDtedB1L7r4/uo6/KemXZGDqdbrICKYk71iPqL3MO/bL/4=
X-Received: by 2002:a5d:9051:: with SMTP id v17mr15646212ioq.134.1632149277671; 
 Mon, 20 Sep 2021 07:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
 <20210917162332.3511179-2-alex.bennee@linaro.org>
In-Reply-To: <20210917162332.3511179-2-alex.bennee@linaro.org>
From: Ed Maste <emaste@freebsd.org>
Date: Mon, 20 Sep 2021 10:46:48 -0400
Message-ID: <CAPyFy2CzPyMRX-__35qiAcjR_SyXe_mDXsQFH2BCJo+3nr+yjg@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] configure: don't override the selected host test
 compiler if defined
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.41; envelope-from=carpeddiem@gmail.com;
 helo=mail-io1-f41.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Sept 2021 at 12:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> There are not many cases you would want to do this but one is if you
> want to use a test friendly compiler like gcc instead of a system
> compiler like clang. Either way we should honour the users choice if
> they have made it.

A little bit of a tangent, but I'm curious about this comment - what
aspects of GCC make it more test friendly? (I help maintain LLVM tools
on FreeBSD, and would like to make sure they provide as good an
experience as possible.)

