Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB860403B16
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:57:40 +0200 (CEST)
Received: from localhost ([::1]:46044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNy55-0005S7-M4
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mNy3i-000450-8k
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:56:15 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mNy3g-0003UV-MK
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:56:14 -0400
Received: by mail-wr1-x436.google.com with SMTP id x6so3414474wrv.13
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P1XjSupSTJSdshcJFTVaoBeOPJQ0mNCe2s06+WGL+3c=;
 b=nR3EDE03a3HZ48p6yDQZpPS9mf5JK9+0RfP3iOxfA3KIVOZ3y7tCiv71KdtdCdefeV
 Dz0bwkCwDRJHEOGAtzzugjnLk/ZLW3ZyILfzIjG1YLz4XWYSmdqf1si7MC6ihKSJni3d
 wNVaqNgH4mRSPMBmXXAh4zZ8kDd2qnNIhK6ey+X8B3jmtFMe42gfrfRcOrE+T0m+C+gK
 hxCjn0ZLP9Z3lOMfRdzHU9p8HnsGDdlhDaZLQ8Ik3zRqGuoxK5GcooTlHoYmSc6tMYUk
 WR4lgRhgzlpJC5c2jxGO8ufV2i/4BylsMmFdJHSghzytknUAKAJdFNVHVi0ldPIbTcke
 yHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P1XjSupSTJSdshcJFTVaoBeOPJQ0mNCe2s06+WGL+3c=;
 b=dB05Agr7NelsOt9IpGF46MHVEuoaEOURPbLMQB617JqsczEEGriYOyemS74lDCpi1h
 EbO1bzMKloJel2HJ9RVc8kwG8cyyk2nhDY9Y8ygX35GZjvw5mIQ6YZoswa0XpjuVu8WX
 jCIgb5OdDKoFd2gvTiKYEMQfKy9VrS5B5MSjyM01hjAubLsqT7ZktYVe2/3ITI3OpdIV
 +DfWOJ0BwFQXLUekHHbhyczkJjzovW8EQ3OTLoqiunTLO8htvGpwKc3Ge0ajEElUjXZZ
 a4fF9YGUncV2xZuJWK9Q6BOgjXH4RAohHm3ctBHe9Iv07LI1N8HwzaWWm3iLRlX0NLNx
 zYkw==
X-Gm-Message-State: AOAM533E/AzUw0e6/xzokprMWCjjfjexddBvIut04AzrMt3E94sde49C
 2Uqg+MsfH15PuFkxXmSslZkrbO437/1n6i9UDP0=
X-Google-Smtp-Source: ABdhPJyo9HJGdSErvaUIo0RKhDlGcohHyUJjFWr/fSVB7+UZlG6+KEfoxAm4u8r9tplRiHWc/LdWD+OuTYBPK4yiHfg=
X-Received: by 2002:adf:e404:: with SMTP id g4mr4221532wrm.143.1631109371234; 
 Wed, 08 Sep 2021 06:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <871r5zurqm.fsf@dusky.pond.sub.org>
In-Reply-To: <871r5zurqm.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Sep 2021 17:55:59 +0400
Message-ID: <CAJ+F1CKDieE9jb0eMYErV5HzM_XDURqr5V90PZHH3Amo97u6hA@mail.gmail.com>
Subject: Re: [RFC v3 00/32] Rust binding for QAPI and qemu-ga QMP handler
 examples
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a98f5705cb7c3e54"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a98f5705cb7c3e54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 8, 2021 at 5:23 PM Markus Armbruster <armbru@redhat.com> wrote:

> Build fails for me:
>
> make: Entering directory '/work/armbru/qemu/bld'
> config-host.mak is out-of-date, running configure
>   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> fatal: remote error: upload-pack: not our ref
> 7077bbbd11a67d60062a9483f996113a349a4ca1
>

Looks like I didn't update the repository on github. done

I will update .gitmodule to use the repo on gitlab instead (gitlab.com:
marcandre.lureau/qemu-rust-vendored.git)

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a98f5705cb7c3e54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 5:23 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Bui=
ld fails for me:<br>
<br>
make: Entering directory &#39;/work/armbru/qemu/bld&#39;<br>
config-host.mak is out-of-date, running configure<br>
=C2=A0 GIT=C2=A0 =C2=A0 =C2=A0ui/keycodemapdb meson tests/fp/berkeley-testf=
loat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp<br>
fatal: remote error: upload-pack: not our ref 7077bbbd11a67d60062a9483f9961=
13a349a4ca1<br></blockquote><div><br></div><div>Looks like I didn&#39;t upd=
ate the repository on github. done<br></div><div><br></div><div>I will upda=
te .gitmodule to use the repo on gitlab instead (gitlab.com:marcandre.lurea=
u/qemu-rust-vendored.git)</div><div><br></div></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a98f5705cb7c3e54--

