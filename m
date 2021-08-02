Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F73DDFEB
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:20:14 +0200 (CEST)
Received: from localhost ([::1]:40692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdTx-0002vn-Ew
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAdSq-0002Fs-Ak
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:19:04 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAdSo-0002Mf-I0
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:19:03 -0400
Received: by mail-ej1-x62d.google.com with SMTP id o5so32597931ejy.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E7EciJb56DP5sN+KDPQ1Agdwxm97K4qy4fW5CLKJIkE=;
 b=KOG0OAiu+8LEwrEOjcJzmPkT23mUuwggR8si48P23sTlPR0asvmrAG+GmFLOwrojcc
 VKDDIG1ynGnFcrrpnVF8GkX7D6DLbso9aOAI8rPf0w927XGtNV4XKaY2J7OZvgkrSHB8
 7Nyv/8bYzIVMXaQaKpEvJ2JphJrfZZJbem+izlLcTG4FnoWJwoXVjc0lY9deD2jHYEB7
 vnSZNhNIpYgsWPyvfrqTSi/Qorp51SpG8gdDQ5MqFuBObtLsqp6nX8/E1cOVR2/hGtAm
 dTNnYDjBXLiGb6CmeSBLRHCdreuiB9MHykOcoGSt2K51/dXhJiC2Dbda/uf+UB1r25pv
 OXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E7EciJb56DP5sN+KDPQ1Agdwxm97K4qy4fW5CLKJIkE=;
 b=ufqo1ds+m5jpausQWqWZoYzaLxnyWP6HIYFCRpXXnFCmhh1tmN+CO59uQsI4XU6zR8
 5NZac/brU2waw4GOotvzO6+ZM9/YKdwJWwMYGmchZPHguxs8WLy0/IupYD7L9+VgZxPQ
 B82+MhpGtUN4pj+tcnU83RwLt36uKEt7nfN/LVb5WEQ1egTyRr4DpDR+UI/l5Od90SqW
 PjvvGLa6M297w7G9GVmD917u+US1mAH6jFYwgOsNxhG/acgr4MA5bT4VA5czKclYhAEf
 TW05BCK89Akyh/doH/4Bq9qXOXk5XHMy5QfojrBB8cP+VRfcJohDz9iBm16jXckq1iQP
 SfZQ==
X-Gm-Message-State: AOAM531+uyGyNRZRABTflh5lGmn+/UFp3AH8JmhIuHRJOLZWh7AixNFj
 VZGfesDOi7C6u8+K7eomt8wWzxMk5dCWpfcOCHg7pw==
X-Google-Smtp-Source: ABdhPJzYJiDU6iQrCucgwqDArMoUVghiSiW/aI/M5BqPwglI9TAAmMgEae8F+9C9V6IGRTJuJ7BdchukBnG6pZGsMh4=
X-Received: by 2002:a17:906:6cb:: with SMTP id
 v11mr16876837ejb.482.1627931940809; 
 Mon, 02 Aug 2021 12:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
 <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
 <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
In-Reply-To: <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 20:18:17 +0100
Message-ID: <CAFEAcA_Sw3qvXbFDArqpDYH5cwsGSAxMh062a9UR6PU2sWncSA@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Aug 2021 at 19:58, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi Peter
>
> On Sun, Aug 1, 2021 at 4:10 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
>>
>> On Wed, 28 Jul 2021 at 16:47, Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@gmail.com> wrote:
>> > I wish my previous pull request with the submodule change would
>> > receive more help or attention, as I either couldn't reproduce the
>> > failure (neither CI) or it was just some one-time warnings due to the
>> > transition...
>>
>> Well, I reported the failures back to you. I can't do a lot more,
>> because libslirp development is now much more opaque to me because
>> it doesn't happen in-tree. So instead of "some small change happens and
>> we pick up issues with it early", you have to deal with all of
>> the accumulated problems at once when you update the submodule :-(
>>
>> rc2 is on Tuesday, so we're starting to run short on time to
>> get an updated slirp in for 6.1.
>>
>
> Do you mind checking the https://github.com/elmarco/qemu/tree/libslirp br=
anch?

OK, I'm running that through a test build. (If it works, I think you'll
need to squash the two commits there together, to avoid breaking bisection
on OSX hosts.)

-- PMM

