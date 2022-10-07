Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655CA5F8153
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 01:43:43 +0200 (CEST)
Received: from localhost ([::1]:35594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogx0H-00051J-C6
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 19:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ogwwy-0003X2-Ow
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 19:40:17 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ogwww-000899-Cl
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 19:40:16 -0400
Received: by mail-ed1-x52b.google.com with SMTP id l22so8964607edj.5
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 16:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kylVYteQp8DJDJhI87wkldxd7v2RnaoKBqAg5oh1Xy8=;
 b=w3dy8nWffI8r9m3xUDxZioLF82XoBmh9YtuP+/FxKAeap0lPm9ajPsMPbQSuSrWK9E
 mklzvbhnuXY7ixhRew4/3YrZMyK2AsXcWq06m33A5dkhe8odEOdnnHjTQgY+CuwcGfAn
 IMm32HFyWJBarb9dTXfMoBPB/qMBqj4rvxvz++Bvax9cjPADrTFRki3+af+LC5jTwJyX
 kPXHUbtEREZF9Nx1KUBpKDTJZh1V+tHr+/oC9EQduan5CSDi00T8U2VeXeLugZYrikGi
 uuWXnLFfoeuBasWnHEfc9dvIxDnldAaMhGamDQyWrUHvIduAIElf5uqdN1jBv1WM+Tao
 36ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kylVYteQp8DJDJhI87wkldxd7v2RnaoKBqAg5oh1Xy8=;
 b=EuU13vXUXfUVi7gACIp+czlJkwhe+BShiwMMXYjdvgyzvVGXPLpTIJFwq/Rj6FaVPe
 aGQKJYjThdL8vcXhS9Js6lZeVVZ7de81zNjhFlo5HKgf2FDPWxnRZWSa3VMOCB+J9JDI
 BWseWKUBSXqccl0WSvPcu01LsensqLKe1yJNDmdRk7rnHR+0JsqmNUmphn5OpyMHkqIk
 0ifpEdzbxtpRPGD407bS+VWr6C/sypVeavN6RjjocnLXEuKtdpXxj/R1OpTyFGTp7Qhm
 IH6Ulvx6gQ4cTunZ5gKf4gtQtVMB5wr6/D4qw2352bf7/P8v//U0KU6R5MD3fD08Hu5c
 6Q2g==
X-Gm-Message-State: ACrzQf0QJWQmzNxjxmcpL3VcB1zUvPIO5Hivx+chr3Dl3JhN1zeSKITh
 TvLv7gGYURwISS/nOmFMyJXuMwNKuuf56ObD1G84xg==
X-Google-Smtp-Source: AMsMyM6bkx3lfXDCb3wmxHChBz2xGldmkf8EPPVfWzAR3/nhMRC6H4j8nfk+QcL3nsw2bj98Q+cOjVyHtNvAvoRpofE=
X-Received: by 2002:a05:6402:2696:b0:45a:9264:64d8 with SMTP id
 w22-20020a056402269600b0045a926464d8mr1996254edd.154.1665186011929; Fri, 07
 Oct 2022 16:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <Yz/TeblRI77AIHJe@humpty.home.comstyle.com>
 <CANCZdfoE=cXBnamXYFLV0ZDOYUsPKGr8RNpOLMmpRT3=w6ug8A@mail.gmail.com>
 <56a8c363-d2f2-3aa5-6b35-5c11cc967bf8@comstyle.com>
In-Reply-To: <56a8c363-d2f2-3aa5-6b35-5c11cc967bf8@comstyle.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 7 Oct 2022 17:40:00 -0600
Message-ID: <CANCZdfpX7cM+b0+Rag=qTRdRhufCPWn66fueyx9dEBatotp4LA@mail.gmail.com>
Subject: Re: [PATCH v2] tests: Add sndio to the FreeBSD CI containers / VM
To: Brad Smith <brad@comstyle.com>
Cc: Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>, 
 Li-Wen Hsu <lwhsu@freebsd.org>, Alex Benn_e <alex.bennee@linaro.org>, 
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b9f12b05ea7a541a"
Received-SPF: none client-ip=2a00:1450:4864:20::52b;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--000000000000b9f12b05ea7a541a
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 7, 2022 at 4:27 PM Brad Smith <brad@comstyle.com> wrote:

> On 10/7/2022 4:33 PM, Warner Losh wrote:
>
>
>
> On Fri, Oct 7, 2022 at 1:21 AM Brad Smith <brad@comstyle.com> wrote:
>
>> tests: Add sndio to the FreeBSD CI containers / VM
>>
>> ---
>>  .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
>>  .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
>>  tests/docker/dockerfiles/alpine.docker        |   3 +-
>>  tests/docker/dockerfiles/centos8.docker       |   2 +-
>>  .../dockerfiles/debian-amd64-cross.docker     | 235 ++++++++---------
>>  tests/docker/dockerfiles/debian-amd64.docker  | 237 +++++++++---------
>>  .../dockerfiles/debian-arm64-cross.docker     | 233 ++++++++---------
>>  .../dockerfiles/debian-armel-cross.docker     | 231 ++++++++---------
>>  .../dockerfiles/debian-armhf-cross.docker     | 233 ++++++++---------
>>  .../dockerfiles/debian-mips64el-cross.docker  | 227 ++++++++---------
>>  .../dockerfiles/debian-mipsel-cross.docker    | 227 ++++++++---------
>>  .../dockerfiles/debian-ppc64el-cross.docker   | 231 ++++++++---------
>>  .../dockerfiles/debian-s390x-cross.docker     | 229 ++++++++---------
>>  tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
>>  tests/docker/dockerfiles/opensuse-leap.docker |   3 +-
>>  tests/docker/dockerfiles/ubuntu2004.docker    | 235 ++++++++---------
>>  tests/lcitool/libvirt-ci                      |   2 +-
>>  tests/lcitool/projects/qemu.yml               |   1 +
>>  tests/vm/freebsd                              |   3 +
>>  19 files changed, 1291 insertions(+), 1275 deletions(-)
>>
>
> This looks good to me. Why did the Linux containers need updating for the
> FreeBSD update?
>
> Otherwise, the changes look good to my eye
>
> Reviewed-by:  Warner Losh <imp@bsdimp.com>
>
>
> Because the CI configs are auto-generated. When refreshing them it
> generates them all. The intent was
> to update the FreeBSD configs, but when adding the dependency to
> tests/lcitool/projects/qemu.yml
> the FreeBSD configs are updated as well as the rest. Whatever OS's have a
> corresponding mapping
> in libvirt-ci are updated.
>

OK. That makes sense. Thanks for the explanation.

Warner

--000000000000b9f12b05ea7a541a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 7, 2022 at 4:27 PM Brad S=
mith &lt;<a href=3D"mailto:brad@comstyle.com">brad@comstyle.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <div>On 10/7/2022 4:33 PM, Warner Losh
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 7, 2022 at 1:21
            AM Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com" target=
=3D"_blank">brad@comstyle.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">tests: Add sndi=
o to the
            FreeBSD CI containers / VM<br>
            <br>
            ---<br>
            =C2=A0.gitlab-ci.d/cirrus/freebsd-12.vars=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
            =C2=A0.gitlab-ci.d/cirrus/freebsd-13.vars=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
            =C2=A0tests/docker/dockerfiles/alpine.docker=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
            =C2=A0tests/docker/dockerfiles/centos8.docker=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
            =C2=A0.../dockerfiles/debian-amd64-cross.docker=C2=A0 =C2=A0 =
=C2=A0| 235
            ++++++++---------<br>
            =C2=A0tests/docker/dockerfiles/debian-amd64.docker=C2=A0 | 237
            +++++++++---------<br>
            =C2=A0.../dockerfiles/debian-arm64-cross.docker=C2=A0 =C2=A0 =
=C2=A0| 233
            ++++++++---------<br>
            =C2=A0.../dockerfiles/debian-armel-cross.docker=C2=A0 =C2=A0 =
=C2=A0| 231
            ++++++++---------<br>
            =C2=A0.../dockerfiles/debian-armhf-cross.docker=C2=A0 =C2=A0 =
=C2=A0| 233
            ++++++++---------<br>
            =C2=A0.../dockerfiles/debian-mips64el-cross.docker=C2=A0 | 227
            ++++++++---------<br>
            =C2=A0.../dockerfiles/debian-mipsel-cross.docker=C2=A0 =C2=A0 |=
 227
            ++++++++---------<br>
            =C2=A0.../dockerfiles/debian-ppc64el-cross.docker=C2=A0 =C2=A0|=
 231
            ++++++++---------<br>
            =C2=A0.../dockerfiles/debian-s390x-cross.docker=C2=A0 =C2=A0 =
=C2=A0| 229
            ++++++++---------<br>
            =C2=A0tests/docker/dockerfiles/fedora.docker=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 230
            ++++++++---------<br>
            =C2=A0tests/docker/dockerfiles/opensuse-leap.docker |=C2=A0 =C2=
=A03 +-<br>
            =C2=A0tests/docker/dockerfiles/ubuntu2004.docker=C2=A0 =C2=A0 |=
 235
            ++++++++---------<br>
            =C2=A0tests/lcitool/libvirt-ci=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
            =C2=A0tests/lcitool/projects/qemu.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
            =C2=A0tests/vm/freebsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +<br>
            =C2=A019 files changed, 1291 insertions(+), 1275 deletions(-)<b=
r>
          </blockquote>
          <div><br>
          </div>
          <div>This looks good to me. Why did the Linux containers need
            updating for the FreeBSD update?</div>
          <div><br>
          </div>
          <div>Otherwise, the changes look good to my eye</div>
          <div><br>
          </div>
          <div>Reviewed-by:=C2=A0 Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div>
        </div>
      </div>
    </blockquote>
    <p><br>
      Because the CI configs are auto-generated. When refreshing them it
      generates them all. The intent was<br>
      to update the FreeBSD configs, but when adding the dependency to
      tests/lcitool/projects/qemu.yml<br>
      the FreeBSD configs are updated as well as the rest. Whatever OS&#39;=
s
      have a corresponding mapping<br>
      in libvirt-ci are updated.<br></p></div></blockquote><div><br></div><=
div>OK. That makes sense. Thanks for the explanation.</div><div><br></div><=
div>Warner=C2=A0</div></div></div>

--000000000000b9f12b05ea7a541a--

