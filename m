Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E092A1762F6
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 19:43:38 +0100 (CET)
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8q2U-000253-0X
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 13:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8q1P-00010X-08
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:42:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8q1O-0006bg-56
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:42:30 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:38932)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8q1N-0006bN-W0
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:42:30 -0500
Received: by mail-ot1-x32c.google.com with SMTP id x97so274635ota.6
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 10:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pLoozhXvDFBpxaihsnJnBPua4MwyOChZI+phtNSrSA8=;
 b=ykEVUPzTfVUC4rKSJiyrsb4/wXp1oMQGaO6hpwW9VRUCi3jQiSY+gVS3kV/BpSpt6I
 rl93v34n1/Jpk3kDJDwyg4+nx792LVdD+ZAExGbG/hmW9Y6qjCdUqPvbgqcOrOeFu2Zc
 yqbUlihIdWxJIjM+tJlsNcqSQwIxC+CIJVKZdUE2V2r9/9xjyuEyuwbvJr1a483aTrvQ
 SBtW06CQomIxfTXAvSXlTcFVd9urXDjEV4ClraMEVlFjrQ0+nA7UroYHg7zAWVozaJUJ
 XiWMIyYHbjA9iGcncKCTomZqEHGcUEoI/AV+aDeQylIA5wGCN2j3YOLHPAY8jx/V67+u
 ix3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pLoozhXvDFBpxaihsnJnBPua4MwyOChZI+phtNSrSA8=;
 b=ds7CYUni4aCtrNgLl6JQBRs6DqSh7ig/B4WafVTZaBzQgB9Ug9qHtLi3WxyAIOQaXQ
 hqiFpbA/LCIbFF0IOUu4mVFjrc+9OThimIHzdZSfvLba8GNt7DFYecEkvnHSo35mN2D1
 DkcCHa8DUg3vZSoqp8wnhxoimggzzCfGse9XFWvIjlCxjI1voxsBOrQEJTkBvZ/f+iZj
 6ACBfcP9RHv3zZBNrCyOxK3HA6kTTqu7vz37qboj0x68dRXrwY1a6quBPL3kyPQkS2NS
 hkD4jWtVovtSrY7Z56EuOsNraxYDdMuw2Uo1hWV3NyL/TDP/voaTz5MKOz26hXdfVzgq
 cOrw==
X-Gm-Message-State: ANhLgQ28f6Er/uVdrX3YESpUiMAsTZEduXVrAoDCKZ+dpI6kMHVAoeSN
 ae25g/+Q//bsIyDN3g8G6KMJMJF23+fQ91y0IKdCog==
X-Google-Smtp-Source: ADFU+vvp1XVp5VsKBE8FOopN4jjueGxlGfwe/DA3avAUCoOK7e0AuJGravEWgA9yhgoIrJ0gp9K0bG8rVT+ZCePuXiQ=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr386717otq.221.1583174549174; 
 Mon, 02 Mar 2020 10:42:29 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9rQ4_o53zfsdcGZWse3eYWksYJdYHLeUFhq6TcBX3_zw@mail.gmail.com>
 <20200302174551.GK4440@habkost.net>
 <c73a059c-6d6f-607d-0cdb-fbc515b45edf@redhat.com>
In-Reply-To: <c73a059c-6d6f-607d-0cdb-fbc515b45edf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 18:42:18 +0000
Message-ID: <CAFEAcA-GwNG0rvw3gVZMs2Nz05FUjzoiT-H+-FkwQAZzgC2tAw@mail.gmail.com>
Subject: Re: CPU reset vs DeviceState reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32c
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Mar 2020 at 18:19, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Without verifying the code base/commits, my understanding is that was
> required to use cpu object with linux-user before Markus added support
> for anonymous object container for QOM objects on linux-user. So now we
> could make CPUClass inherits of DeviceClass.

CPUClass already does inherit from DeviceClass...

thanks
-- PMM

