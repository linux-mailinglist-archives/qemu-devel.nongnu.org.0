Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC915F80C9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 00:29:12 +0200 (CEST)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogvqB-0002fE-9R
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 18:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ogvoe-0001I2-OK
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 18:27:36 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:44387
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ogvod-0006lY-1I
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 18:27:36 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Mkjc40P6Rz8PbN;
 Fri,  7 Oct 2022 18:27:32 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=
 content-type:message-id:date:mime-version:subject:to:cc
 :references:from:in-reply-to; s=default; bh=ylkw5m/wuTtUBqdaWQqD
 MW9ryO4=; b=K4492hijzhEsNriKknHH5LmaZJkdIyA0esanEMAByG2b/CX+RbD2
 puEaX9iNT5SEY0HTPMefaoW5wnXVvGEAgrULvLvDPs7xOXEUbadcowI5X92aBEAj
 duBKtIMPb8mIlRXe69kPJc+9U1TBqh5svns8dStSvF/YWUsJ40rFKg0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=content-type
 :message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to; q=dns; s=default; b=QaVzSidslquRcL6fTDropB/bAYbH17
 drjl7xMky55W/dqbY07P+Ob9n6IC8/ZsiBKkMEWK2DYXWsnDP9k/VGZXiHSyUR7K
 kwuWjwuGgNNczTUvhKtMDeg0/7QCQlV/nwkt3RzufwfencXrNHmXDZh6B6t4Fv9u
 Ns7JWdKwmhQsI=
Received: from [IPV6:2001:470:b050:6:ac54:f63e:f6b4:9cd1] (unknown
 [IPv6:2001:470:b050:6:ac54:f63e:f6b4:9cd1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Mkjc361B4z8PbK;
 Fri,  7 Oct 2022 18:27:31 -0400 (EDT)
Content-Type: multipart/alternative;
 boundary="------------eiXhQt5hiMeDzl0LlUoiJUEl"
Message-ID: <56a8c363-d2f2-3aa5-6b35-5c11cc967bf8@comstyle.com>
Date: Fri, 7 Oct 2022 18:27:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101
 Thunderbird/106.0
Subject: Re: [PATCH v2] tests: Add sndio to the FreeBSD CI containers / VM
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
Cc: Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
References: <Yz/TeblRI77AIHJe@humpty.home.comstyle.com>
 <CANCZdfoE=cXBnamXYFLV0ZDOYUsPKGr8RNpOLMmpRT3=w6ug8A@mail.gmail.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <CANCZdfoE=cXBnamXYFLV0ZDOYUsPKGr8RNpOLMmpRT3=w6ug8A@mail.gmail.com>
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.699, SPF_HELO_NONE=0.001,
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

This is a multi-part message in MIME format.
--------------eiXhQt5hiMeDzl0LlUoiJUEl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10/7/2022 4:33 PM, Warner Losh wrote:
>
>
> On Fri, Oct 7, 2022 at 1:21 AM Brad Smith <brad@comstyle.com> wrote:
>
>     tests: Add sndio to the FreeBSD CI containers / VM
>
>     ---
>     =C2=A0.gitlab-ci.d/cirrus/freebsd-12.vars=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-
>     =C2=A0.gitlab-ci.d/cirrus/freebsd-13.vars=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-
>     =C2=A0tests/docker/dockerfiles/alpine.docker=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +-
>     =C2=A0tests/docker/dockerfiles/centos8.docker=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-
>     =C2=A0.../dockerfiles/debian-amd64-cross.docker=C2=A0 =C2=A0 =C2=A0=
| 235 ++++++++---------
>     =C2=A0tests/docker/dockerfiles/debian-amd64.docker=C2=A0 | 237
>     +++++++++---------
>     =C2=A0.../dockerfiles/debian-arm64-cross.docker=C2=A0 =C2=A0 =C2=A0=
| 233 ++++++++---------
>     =C2=A0.../dockerfiles/debian-armel-cross.docker=C2=A0 =C2=A0 =C2=A0=
| 231 ++++++++---------
>     =C2=A0.../dockerfiles/debian-armhf-cross.docker=C2=A0 =C2=A0 =C2=A0=
| 233 ++++++++---------
>     =C2=A0.../dockerfiles/debian-mips64el-cross.docker=C2=A0 | 227 ++++=
++++---------
>     =C2=A0.../dockerfiles/debian-mipsel-cross.docker=C2=A0 =C2=A0 | 227=
 ++++++++---------
>     =C2=A0.../dockerfiles/debian-ppc64el-cross.docker=C2=A0 =C2=A0| 231=
 ++++++++---------
>     =C2=A0.../dockerfiles/debian-s390x-cross.docker=C2=A0 =C2=A0 =C2=A0=
| 229 ++++++++---------
>     =C2=A0tests/docker/dockerfiles/fedora.docker=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 230 ++++++++---------
>     =C2=A0tests/docker/dockerfiles/opensuse-leap.docker |=C2=A0 =C2=A03=
 +-
>     =C2=A0tests/docker/dockerfiles/ubuntu2004.docker=C2=A0 =C2=A0 | 235=
 ++++++++---------
>     =C2=A0tests/lcitool/libvirt-ci=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-
>     =C2=A0tests/lcitool/projects/qemu.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +
>     =C2=A0tests/vm/freebsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
3 +
>     =C2=A019 files changed, 1291 insertions(+), 1275 deletions(-)
>
>
> This looks good to me. Why did the Linux containers need updating for=20
> the FreeBSD update?
>
> Otherwise, the changes look good to my eye
>
> Reviewed-by:=C2=A0 Warner Losh <imp@bsdimp.com>


Because the CI configs are auto-generated. When refreshing them it=20
generates them all. The intent was
to update the FreeBSD configs, but when adding the dependency to=20
tests/lcitool/projects/qemu.yml
the FreeBSD configs are updated as well as the rest. Whatever OS's have=20
a corresponding mapping
in libvirt-ci are updated.

--------------eiXhQt5hiMeDzl0LlUoiJUEl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 10/7/2022 4:33 PM, Warner Losh
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANCZdfoE=3DcXBnamXYFLV0ZDOYUsPKGr8RNpOLMmpRT3=3Dw6ug8A@mail.=
gmail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 7, 2022 at 1:=
21
            AM Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com"
              moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">br=
ad@comstyle.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">tests: Add sndio to the
            FreeBSD CI containers / VM<br>
            <br>
            ---<br>
            =C2=A0.gitlab-ci.d/cirrus/freebsd-12.vars=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
            =C2=A0.gitlab-ci.d/cirrus/freebsd-13.vars=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
            =C2=A0tests/docker/dockerfiles/alpine.docker=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
            =C2=A0tests/docker/dockerfiles/centos8.docker=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
            =C2=A0.../dockerfiles/debian-amd64-cross.docker=C2=A0 =C2=A0 =
=C2=A0| 235
            ++++++++---------<br>
            =C2=A0tests/docker/dockerfiles/debian-amd64.docker=C2=A0 | 23=
7
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
            =C2=A0.../dockerfiles/debian-mips64el-cross.docker=C2=A0 | 22=
7
            ++++++++---------<br>
            =C2=A0.../dockerfiles/debian-mipsel-cross.docker=C2=A0 =C2=A0=
 | 227
            ++++++++---------<br>
            =C2=A0.../dockerfiles/debian-ppc64el-cross.docker=C2=A0 =C2=A0=
| 231
            ++++++++---------<br>
            =C2=A0.../dockerfiles/debian-s390x-cross.docker=C2=A0 =C2=A0 =
=C2=A0| 229
            ++++++++---------<br>
            =C2=A0tests/docker/dockerfiles/fedora.docker=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 230
            ++++++++---------<br>
            =C2=A0tests/docker/dockerfiles/opensuse-leap.docker |=C2=A0 =C2=
=A03 +-<br>
            =C2=A0tests/docker/dockerfiles/ubuntu2004.docker=C2=A0 =C2=A0=
 | 235
            ++++++++---------<br>
            =C2=A0tests/lcitool/libvirt-ci=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
            =C2=A0tests/lcitool/projects/qemu.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
            =C2=A0tests/vm/freebsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +<br>
            =C2=A019 files changed, 1291 insertions(+), 1275 deletions(-)=
<br>
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
          <div>Reviewed-by:=C2=A0 Warner Losh &lt;<a
              href=3D"mailto:imp@bsdimp.com" moz-do-not-send=3D"true"
              class=3D"moz-txt-link-freetext">imp@bsdimp.com</a>&gt;</div=
>
        </div>
      </div>
    </blockquote>
    <p><br>
      Because the CI configs are auto-generated. When refreshing them it
      generates them all. The intent was<br>
      to update the FreeBSD configs, but when adding the dependency to
      tests/lcitool/projects/qemu.yml<br>
      the FreeBSD configs are updated as well as the rest. Whatever OS's
      have a corresponding mapping<br>
      in libvirt-ci are updated.<br>
    </p>
  </body>
</html>

--------------eiXhQt5hiMeDzl0LlUoiJUEl--

