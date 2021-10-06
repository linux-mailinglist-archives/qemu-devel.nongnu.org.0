Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07D424665
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:59:17 +0200 (CEST)
Received: from localhost ([::1]:37944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYC8K-0003HX-MZ
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYC63-0008GF-Mu
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:56:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYC5y-0002jC-W4
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633546609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WutILPmU2/76w5AOIRDVfvExKhGvbGWuOoFY24RWIdY=;
 b=So56Rz/p3+iWmqEnPH+HAvvpGNJIMZJ46ifcxVXK7rZ6abRtMklNQPBJI36m/CCHXgZBG9
 /XKppIOuufIG9iSaFB0ObAtB/7T18HXEkQoXF+FlOPhGl/rqgBJCC+ahAynOXQp9Eo3HEG
 7TggD+uO+3mUA05+RH2sPiThz3+lMG4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-JdO-0G7DP9iXfjAqvY-Euw-1; Wed, 06 Oct 2021 14:56:48 -0400
X-MC-Unique: JdO-0G7DP9iXfjAqvY-Euw-1
Received: by mail-pj1-f69.google.com with SMTP id
 o15-20020a17090ac08f00b0019fafa34327so4125868pjs.3
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 11:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WutILPmU2/76w5AOIRDVfvExKhGvbGWuOoFY24RWIdY=;
 b=yBTUTmjU6kDamXvQtimTgrpAc3JSmQmtz7KMS7qSldGZM6zwv5mnOYcJg5lW1sJUNy
 Z8w5CCIx0ImfwDQ5UVEGd4un7+mNVHnbjX6ej0th4QOWW9DcGYig5PiQYr4VSR7HuaIJ
 TNmtOkk/i3SZJR+XL6a3LoGDXhFp/yZ2bWKD52kCEvDv9jrhi/cBl7ddwcjaKz8MIqVA
 eYZnM2Wao4Q0sgqq2gFjZ7bwo1xuODVEPb4Lp9/XwG0yskVcplhR99q/oliMpM1nEjP0
 N/OQ4BrdJ6UQWTNhgvYJx70Q6xpzNbVuZfs9oP6+gNCzxs9blFxTvwg6KHGYjF5ufHxt
 HSRA==
X-Gm-Message-State: AOAM530lCUqz/yVwuoxavOaL7oWxdJQHA7XtbywlE5eoWQuRW08YfnxJ
 QrJF8liCt9pDN9AiVDqLAC4pmG9JByTgn2rfqR46UbHciycCYDK+9SO4IpYYPVu7skVmqe0k56W
 oA1xWczlZi93WrweEpf0TeAzabJFQk/k=
X-Received: by 2002:a63:9d4c:: with SMTP id i73mr306942pgd.216.1633546607824; 
 Wed, 06 Oct 2021 11:56:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiqG1xtFvSv02wSNjrboytFwnLCN8ojgLq9Klvl20XwrVuOzhnpydJBmI9Wb4FTNzNf8iOgpT7Tf2OkISGtbU=
X-Received: by 2002:a63:9d4c:: with SMTP id i73mr306921pgd.216.1633546607599; 
 Wed, 06 Oct 2021 11:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-11-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-11-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 6 Oct 2021 15:56:21 -0300
Message-ID: <CAKJDGDardVBwdNSQeGwsX6ZaptfZ-xH5YNE=AgcOK_DKp6A+WQ@mail.gmail.com>
Subject: Re: [PATCH 10/16] tests/acceptance/boot_xen.py: unify tags
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 3:58 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Because all tests share the same tags, it's possible to have all of
> them at the class level.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_xen.py | 26 +++++---------------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


