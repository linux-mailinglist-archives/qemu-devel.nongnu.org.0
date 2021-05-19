Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF23896B2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:29:31 +0200 (CEST)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRsn-0002sv-W4
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljRb6-0004LF-Kz
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljRb0-00021S-RL
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621451465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnwhDjhFwspxvY1/7/jgNwBMqKUN+bQRJDHqMBBX0WE=;
 b=BvCAzscUsXRJRjxo7VYIW4JiLnq3HtIhQyYXtf//OgfLRU57iJQ/LpzWr9h5b3wDtzWMLG
 LTIlJnHmpXNUbhkszzHtSAUn6pmYQDzR3mZ100idiu93IAx+atPSXDVOo8Fg04Df3Chjz1
 noEAma2t0vLhStaS+nptiWBUozY6rJc=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-YVRiElEKMEuOtnY_6euOdw-1; Wed, 19 May 2021 15:11:02 -0400
X-MC-Unique: YVRiElEKMEuOtnY_6euOdw-1
Received: by mail-ua1-f71.google.com with SMTP id
 r4-20020ab070c40000b02902064b454facso6044442ual.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KnwhDjhFwspxvY1/7/jgNwBMqKUN+bQRJDHqMBBX0WE=;
 b=HPtnWhfY9LDlYuS2l4cku5eLJQ9Aa87axYj6WW0o35LTc0VEAxBrBiNpyESZfr566h
 Y/hUUmcBxno63uFsrxIoPICmSLz4OoZ2vOzGJb+qGnmBZtw89DVV6zM0V/CJObLZl4fo
 Sh4JPRgot9qjOUIn+HDqbJEDsWuoFQ2h34l5MOCK1Foxhl2wK6ZNo7u46zm6r1gRillX
 eJ+9na1rI/Rrp2I22zgY+UfHHz0NA9lozNQD2xF0pcaMR4bSeLCRa4LJ8+svI3/ErEdR
 1TOlsY0L9AUqm4mzjFWURWPoE+6XvIdvcIZQE4Kq+cFIMztBnmsshWzowJdCK/p7og86
 FD+w==
X-Gm-Message-State: AOAM532Jhj+rVbNvWDhGHPXu7OxYxNzgV4XN8tUadugwC0a/NKzB+5kz
 tdr1XvgTK6kMdREEqXehi3RrumXmMqcMG5V9K27COnaTbhkmdi8cCa4vxciJy7Y2KqzETjWJq9A
 WT4eK9MuwfS0qP903HF4MOaRov8vmJvE=
X-Received: by 2002:a67:2642:: with SMTP id m63mr625347vsm.39.1621451462131;
 Wed, 19 May 2021 12:11:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykfRhHfAeCmBwrUKAfVnGoHEtObX784rUnEg+cINhT+etQjeHX+8JZuw8y4XDWnlBMlhKUqCjAc+0DOCGu6y4=
X-Received: by 2002:a67:2642:: with SMTP id m63mr625329vsm.39.1621451461972;
 Wed, 19 May 2021 12:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-4-f4bug@amsat.org>
In-Reply-To: <20210519184549.2192728-4-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 19 May 2021 16:10:36 -0300
Message-ID: <CAKJDGDbFiudVT3WwepgQjwkgkqu8bw6uSnJ6o76oCxqrf1ULUw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] gitlab-ci: Run GNU make via the $MAKE variable
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 3:46 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Add the $MAKE variable to call GNU make, and set it to 'gmake'
> on FreeBSD to avoid:
>
>   $ make -j"$JOBS"
>   make: Unknown modifier ','
>   make: "/builds/dTyar424/0/qemu/build/Makefile" line 3: Need an operator
>   make: "/builds/dTyar424/0/qemu/build/Makefile" line 4: Missing dependen=
cy operator
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


