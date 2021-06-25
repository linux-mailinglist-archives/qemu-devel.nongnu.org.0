Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430DC3B48D8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:36:04 +0200 (CEST)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqgN-00037F-BL
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqaW-00063E-PU
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:30:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqaV-0002rT-2b
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wrVUw0xO59feolAQtbEdQVXCTwUhQTXSX1LJ8DW8Rig=;
 b=GcfN9f+IQUvUNwM9ZX/cnZZ5FJiT2+1s/lhJSPUJRHJdXnQBLddGmI4Ia1Y2quHQamtAee
 iNijFCGwgf0rFJizv1H+GmS2LXUtyFdcVMt0i1ZxFaKbKeHdh0MUlS6nnasBKesRPhpkdT
 I7DCP8+Ww6P7tZXyeEeeayfv7QTINuU=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-0-SbxgAZMoSZDqAmVXxeFg-1; Fri, 25 Jun 2021 14:29:53 -0400
X-MC-Unique: 0-SbxgAZMoSZDqAmVXxeFg-1
Received: by mail-ua1-f70.google.com with SMTP id
 a15-20020ab0684f0000b0290275ca73402eso2698245uas.12
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wrVUw0xO59feolAQtbEdQVXCTwUhQTXSX1LJ8DW8Rig=;
 b=byBBpYu2Z6G3YmpWb+A60sb0FCKaG8w6Ro9WOdzgJMHQcpGQMqhlqiDdS++BMbLSjm
 S6Bm38Ep8cJpDASMyMy7lVfsBDY4qFT0SiixFKDUN2ryUuI9zgakit7ODXlMl6xbmWBJ
 kbMZEo6ogl6hg8TmxG3xDbLL30JFQ62raEX7tppN4dr6hXrm+YMHCH7ZZQVsDSeky2e5
 HqJOIzLwh4pti5dN7u7PHykOOApyM6il4H/g7BHGiQuElRXJg5dryZ17I9x2T599gojj
 CfZyhXfX3x13Dsd0pb4LJv8KQmsoMujwdoCrTyPpWHv7JS0YIxOie+12WKBSn7ot4vc9
 XOog==
X-Gm-Message-State: AOAM531KI8o0DBUlPl5foof0IfTPlOumOtRCQf1m57Waz9Ve2ZcFbxtK
 4VDzt359BKpHEq6wb+NXEQBzrx0j6g0ykCEkLAwGmUiHoOrW84mGHXxj9JP/1gkuLlhAvaTQf2W
 AOVzo6U2iT8IrxJTwkzH/743Avt3SmbY=
X-Received: by 2002:a67:1905:: with SMTP id 5mr10443266vsz.1.1624645792939;
 Fri, 25 Jun 2021 11:29:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWVzW4WZtQOhbuk+tcWhtnRF3EUaEWrcwQ0T4gDaUFTJfnd+NA4TKKw4YChtFB+kT7ZezIsI9GIcnEqQtDjAU=
X-Received: by 2002:a67:1905:: with SMTP id 5mr10443250vsz.1.1624645792814;
 Fri, 25 Jun 2021 11:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-8-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-8-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:29:27 -0300
Message-ID: <CAKJDGDaME2-NKB6S8k5+cj-TwvwXcY4m-m=SmhOJAxNcOHkwYQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] python: update help text for check-tox
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>
> Move it up near the check-pipenv help text, and update it to suggest parity.
>
> (At the time I first added it, I wasn't sure if I would be keeping it,
> but I've come to appreciate it as it has actually helped uncover bugs I
> would not have noticed without it. It should stay.)
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Makefile | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


