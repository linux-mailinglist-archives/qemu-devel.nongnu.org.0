Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFF668B9DA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 11:20:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOyaz-0000wV-6j; Mon, 06 Feb 2023 05:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOyau-0000sL-K7
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:19:30 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOyas-0000rO-WB
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:19:28 -0500
Received: by mail-ej1-x636.google.com with SMTP id ml19so32871718ejb.0
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 02:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mP0odKeZCLa1H7OyrrD27HnTdHrt4lOP6jJS86fjanI=;
 b=X8TAo7Oij5fB7zuRkFDSof1VACqA/1yLT/qOSEGdw7Aej4XaFy+JsGFf3h3CnZfIei
 e9tEIeXCcr8IUPmrmIyvdDvJE+BOrtr23mKMqNilm4WTbeLIqMPkMlIc2Nw3pyRFZrSe
 E6NXpUeBe9R0E9gjYKHP2lKqJ26LLpLhaQLTUSHMNGJHlTJyT+FWJz/Za1fM66meocLh
 sGRuSIdB1bU0rdkJhGVl70Q5oHj1JG+X1ma1uE7jkRSBGLuMRAJ95cykaMtF7FQC+JPn
 VXn4EwTrVXJB9F4mQqxJd98XvpBNh1XRlfbszBeZwuBLi0H8rvZF4WSvKalCEASZyLri
 hFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mP0odKeZCLa1H7OyrrD27HnTdHrt4lOP6jJS86fjanI=;
 b=kYUnpx/+j4n4nXzRG45BBq7A6Esn7s7RYpzFrSNIut1tA5T057iBPMDWxl5zeN4qZf
 rwhbatk1y+CeyPQetkzrqsbKGv+4A3N2+yQuilQgVVeXS67De3Fwe1Xv2JjFpDqTIegN
 Nxcv7mIgzY3eOD5iOjzZXwjQk9OERrXCpXzFpHRZaxQDkrmKJz6QA5fUXt60ZzDNWc6A
 zqokd+jRwX9WZHBUEd1G1i9gvqZwveVzwO/R4ewZp9wAxsEOrzi7tFjXDeDKJSrVuso2
 A+iflg00Mq6jZlY/QA8wPFDdFttsK7QwR2mBGFc5E/EUTxokBRcX/pnsDfZrTDvFg5N5
 PXiw==
X-Gm-Message-State: AO0yUKWdkT0J0jO5aKtnTedaV7GTSx+78sI4EatZhnTwXLhagUWE81/R
 BbMf052d1rHr7SISleqtrDRSJVGGi4tD5Rrm8k+SuDp+
X-Google-Smtp-Source: AK7set/oN3TZBmWEmlxeUxy8SZzgoM1MNdgGsUZdFJo9gSEizLljNjY11aZ4Y8UsHJ+8ZqVHqjOOVz5c1XdBdGecUFI=
X-Received: by 2002:a17:906:8395:b0:888:f761:87aa with SMTP id
 p21-20020a170906839500b00888f76187aamr6180585ejx.163.1675678765573; Mon, 06
 Feb 2023 02:19:25 -0800 (PST)
MIME-Version: 1.0
References: <CALj-+m3GVB8s60wMbQuZVEHm2kJRLaYxoveQg_wg=hV6MYcS_A@mail.gmail.com>
 <9d13db25-0ee3-4eaa-227a-dd3ca909a1ba@linaro.org>
In-Reply-To: <9d13db25-0ee3-4eaa-227a-dd3ca909a1ba@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Feb 2023 18:19:14 +0800
Message-ID: <CAEUhbmWNeOEJLkkCQ=jCRP9A3MzdQMRW-A_pGTwEfRGGqC3vVA@mail.gmail.com>
Subject: Re: Qemu - how to run in Win?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Jacob A <extrapowernosugar@gmail.com>, qemu-devel@nongnu.org, 
 Stefan Weil <sw@weilnetz.de>, Yonggang Luo <luoyonggang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
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

On Mon, Feb 6, 2023 at 5:55 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Cc'ing Yonggang & Stefan.
>
> On 5/2/23 13:01, Jacob A wrote:
> > Hello,
> >
> > After installing Qemu on Win, I don't see any shortcut to run it? There
> > is only a link to 'uninstall'. launching exe files doesn't do anything.
> > Can you please explain how to launch this application?
> >

QEMU is a command-line utility so you need to run QEMU with some
parameters from a Windows shell.

Regards,
Bin

