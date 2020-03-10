Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D071808B0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 21:05:27 +0100 (CET)
Received: from localhost ([::1]:39624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBl81-0002B0-J1
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 16:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBl6x-0001Br-Qn
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 16:04:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBl6s-00054v-0g
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 16:04:19 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34472)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBl6r-00053W-Fo
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 16:04:13 -0400
Received: by mail-ot1-x343.google.com with SMTP id j16so14489259otl.1
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 13:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PkIKzGfL+CuDyiCIFkAm9PnwkLcshWHdCjkTM1bBS0A=;
 b=fcxyt9dlzUBB2A5LrvfZMNad3kppPXMP2goKSh6rTiwjn+wtXvxKEDMtWM6EH9Rc2N
 pC/uYkdMwCjnTnnHxrDMV/rTUh/saxKmVXT1zjiqln3i1htCoz9neVStDrhpuZVgv8iF
 EftwwelzAA+gr9Gf7g/qc4hjV4wqbGbEMusTC4I+Z0izwWD2IdTSy8hjcyhOcm671txr
 NpGXp3qLD7WbuTvxgzT0o8OInd06QfiLdiIheniFBVOEd3ir0ix+P+bL+vvDw7p25RCL
 +rxZWA7xdCd1i4Z1EPzl+1pP5YMUAgCzyJACqFpJxyGzwvKkwCSn7/MUstLgRxyFFL7E
 ocAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PkIKzGfL+CuDyiCIFkAm9PnwkLcshWHdCjkTM1bBS0A=;
 b=BOnHql56BTiF393AuJH4PU/5ezYXyNnDMGQfvPWC+y8ErkCXP9DgUQZ3lgO+iupuJP
 rcoFSgbS2SMxEVQO/TGVxCM8AaGy3AnPKQnq9329qxsDQuaWFTDMSMT9Y+Y/61bDmBm7
 SfcM7sasjfp81j6EjwWyhuTKY2J6/zFakUSh5bi+J2ItoT9tvripw5LwkRkeGhTH4DzP
 43clf+aS9Y3OpHmjj4R1A2eXQda5igpwRS98hybjHMbsg1SNPi55hXBKfM3cGZALqnvc
 yWXexe75k69TIj6Xhyc7fM/IPx5HqfOZDmWBa2Cb1ah4zmFlC8SlZ8fFSyz2P+WJoESn
 Z5jw==
X-Gm-Message-State: ANhLgQ0r+TTyzu7C1UNHGbJO6BHhJ0AjhbqllKc5k9s9ohr1c3cRakk7
 FdJcq7hkf5DSxzmHwzUONp/dZ95Gj5ZgzRRgaiw6WqnPt8g=
X-Google-Smtp-Source: ADFU+vubZXi5XbRclUmqkMWcGZdTfPOghup5VacJlu6vPddJOrcEhWYIHM9IWde3y64VUunE/DuquPOVG59Y3FYvztw=
X-Received: by 2002:a9d:1920:: with SMTP id j32mr9492368ota.221.1583870651970; 
 Tue, 10 Mar 2020 13:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200310150947.3510824-1-borntraeger@de.ibm.com>
In-Reply-To: <20200310150947.3510824-1-borntraeger@de.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Mar 2020 20:04:00 +0000
Message-ID: <CAFEAcA9sfh92uNyx43ofFdS0hSi9hwzoDBqZJtvwKgsQa4Cmtg@mail.gmail.com>
Subject: Re: [PULL 0/4] s390x/ipl: Fixes for ipl and bios
To: Christian Borntraeger <borntraeger@de.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Mar 2020 at 15:09, Christian Borntraeger
<borntraeger@de.ibm.com> wrote:
>
> Peter,
>
> The following changes since commit 373c7068dd610e97f0b551b5a6d0a27cd6da4506:
>
>   qemu.nsi: Install Sphinx documentation (2020-03-09 16:45:00 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/borntraeger/qemu.git tags/s390x-20200310
>
> for you to fetch changes up to 94c21436e5a89143f8b9cb4d089d1a2f3f4fd377:
>
>   s390x: ipl: Consolidate iplb validity check into one function (2020-03-10 10:18:20 +0100)
>
> ----------------------------------------------------------------
> s390x/ipl: Fixes for ipl and bios
>
> - provide a pointer to the loadparm. This fixes crashes in zipl
> - do not throw away guest changes of the IPL parameter during reset
> - refactor IPLB checks
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

