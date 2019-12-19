Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFEC12621F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 13:26:34 +0100 (CET)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihusy-0000JP-G5
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 07:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1ihuqb-00075O-84
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1ihuqa-00055D-0Q
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:04 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54090)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ihuqZ-0004pm-OU
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:03 -0500
Received: by mail-wm1-x342.google.com with SMTP id m24so5222911wmc.3
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 04:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zYnrdkYzWtj4IvXDNVBh3Tn5uVa2SwLvkll/UF2YdH8=;
 b=o0Xqco/MBusUgV0lHiOBk+I3ATcH7sC5Wvp3cRhFLXTFK+CaXWdHf8m3MVu9XGr2fj
 gRPw3PuzmD7vQJbKBro1kV5wJfQQP13upjIJ1vQZiO0XlSmDx5ij+tTghOEvcQePGnNX
 gtH9HTSJDbSWZm/WaJ6m7102tZln2J6lsCiWLn9sA/5hRMfhczKzpidxP1EvA2k4fRxo
 iw0krWsE1998aXDA+edBWZM+FJbf6i+JgxS2lugKM5peRxDovEuiHjqFlUlZQcNn0M/x
 HPc95n3NXiwxqBuFfnI+THmC5tSW5HVrLPdxaFI7zGy5rIqaYZ3z0fK773t717Bae0JG
 Nl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zYnrdkYzWtj4IvXDNVBh3Tn5uVa2SwLvkll/UF2YdH8=;
 b=sIo75D+oIH3VSjAQq2dTCqxd4qwWSKr6YVQJdUkOdGBaiyX/0HEvUtzDF2L2qfw0Jh
 Hji7O05ET6lvfGzGQGzYbPct09SDYxrIcDKnAp/xhmNKPXI2QM7D2cBkuiBzVLA1DQsJ
 nttAJBchQdvk18lSX6225ymCS9zHfDmTXoDsx2cFrTpUkyDIQW648QQiWhk8BU+Nz5Zj
 jLl9qJ1H89CGP2ZwhxSO5bfrkG0ncHNeHcs7g0c734HuKlJVeXfeMBOj4N5utATMZmyS
 /zFm2EKShS+Lgh9mC2kTUY3QkhAnxFsOq4HLpqLnrtSWg3WgxSK/0AJMbEi07HdN2bWx
 /UCQ==
X-Gm-Message-State: APjAAAUE7onrMB/qKvGWHOrLRI7qYFUJCrBz0oNKsOyIgpmq9ai+3b1G
 V7633JJEaYFc70/ZW/QqXapngCUpLV7HSAGxFXI=
X-Google-Smtp-Source: APXvYqw22dOmjkYJP6docI+faTIi4zJpxCPANXfSXaMSukR1tycFG1UFW4eGsfT/y4bptUge4LbmS19Rv9HchhbW9Ds=
X-Received: by 2002:a1c:750f:: with SMTP id o15mr9916425wmc.161.1576758241089; 
 Thu, 19 Dec 2019 04:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20191211134506.1803403-1-marcandre.lureau@redhat.com>
 <20191211134506.1803403-8-marcandre.lureau@redhat.com>
 <20191212120642.GK1829331@redhat.com>
In-Reply-To: <20191212120642.GK1829331@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 19 Dec 2019 16:23:48 +0400
Message-ID: <CAJ+F1CK7KynVifnO_G7VOWURYyXQgyZX+jNzXwN6-m-Gh6SmhQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] dockerfiles: add dbus-daemon to some of latest
 distributions
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Michal Privoznik <mprivozn@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Dec 12, 2019 at 4:07 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Dec 11, 2019 at 05:45:05PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > To get dbus-vmstate test covered.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/docker/dockerfiles/centos7.docker  | 1 +
> >  tests/docker/dockerfiles/debian10.docker | 1 +
> >  tests/docker/dockerfiles/fedora.docker   | 1 +
> >  tests/docker/dockerfiles/ubuntu.docker   | 1 +
> >  4 files changed, 4 insertions(+)
>
> For docker
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
> Does it need adding to travis, gitlab, shippable, etc CI configs
> too ?

Those are all good, only shippable has an issue with w64 build:

backends/dbus-vmstate.c:313:22: error: format '%u' expects argument of
type 'unsigned int', but argument 3 has type 'gsize {aka long long
unsigned int}' [-Werror=3Dformat=3D]
error_report("%s: Too large vmstate data to save: %" G_GSIZE_FORMAT,

This seems to be a MXE build issue, since build correctly includes
"/usr/lib/mxe/usr/x86_64-w64-mingw32.shared/include/glib-2.0", and
fedora mingw works. Philippe, any idea?

And I didn't manage to run a Cirrus CI build, help welcome.


--=20
Marc-Andr=C3=A9 Lureau

