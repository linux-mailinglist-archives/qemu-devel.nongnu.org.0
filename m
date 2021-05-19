Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF73896F3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:47:00 +0200 (CEST)
Received: from localhost ([::1]:36508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljS9j-0008Ve-GM
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljS6i-0002nJ-Bq
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:43:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljS6d-0003Ye-3h
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621453426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SBLAr+bdkHddNCXH3RMOJFmvAhm87cp8juWpGOlVRpU=;
 b=WYhz9o4aTd+ycp88jvqhmznHOdl+gklCt29fhzESLEIF0PRyoGz9F96tgZ812/jbV8kDqj
 2ASfHQMr1/b07lyJs48m4VajKN6fEUu4pMDmbqGo2VJuDOEto18bs4qvJhB8wUQy+7wAoD
 HHSYr8qOuIxb2jndiPU7DtM5Ui6G/+M=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-akMI8Du2NEeYXhkKdyquuQ-1; Wed, 19 May 2021 15:43:42 -0400
X-MC-Unique: akMI8Du2NEeYXhkKdyquuQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 m17-20020a67d5910000b02902284fa9a2c5so3473945vsj.8
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SBLAr+bdkHddNCXH3RMOJFmvAhm87cp8juWpGOlVRpU=;
 b=eMpNk2a/Os6HSS6BFHG0KPZ5OA8RaXFgmrOdFJA6WqTnYLnczZ3UQ667cg2A6nC0u+
 LmMUuvDN0Q+o620vYpuYZS1uIMMWWPdZN7ukeSCPlkOTBAi0VyHe5a4cRwZsud0guxKt
 G0GyU+shVdcPmS7WzVeGg1SuwtahJWNAuVOXsK4uIHGFX6jNZZW21TT4mA6XmOfXtSo7
 udREXwNU4tN/ljaHCDAiDx0bPQAZhW1YVGEHX4ta1XZuxXOiN8Nt7XrZT9eOcIIWRfCO
 vR5jyIxfrI3+kOo1ghY62QOu6PObDwmSKbGjZh1/sDp6jw1vSMRR08etPbQvRlR3zvA9
 Najw==
X-Gm-Message-State: AOAM532l++RD2PbO++BLzwYQCFP4Pfhu1bWKXayFoE4JGiSCanwNYIZt
 pz5+fgAQG/ySTGU7iKqC/cNv9v8CnhUYHtQnMtL1zIYNQeJ8R2A5c6DDwNaPcD8GuUyJVpfslju
 Y2xYC1zTIUUzCg8xXbpnvB5iJP1JKh78=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr743216vsi.45.1621453422320; 
 Wed, 19 May 2021 12:43:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf7r9PVJahlj8lj2q7lxsCjB5Ln7tiIMm12LCHgozgrHyIXapH38Yb4X6eCfJo6u5bPnt93BXTdqx+x7rXyZE=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr743211vsi.45.1621453422205; 
 Wed, 19 May 2021 12:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-7-f4bug@amsat.org>
In-Reply-To: <20210519184549.2192728-7-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 19 May 2021 16:43:16 -0300
Message-ID: <CAKJDGDbVA24PmZ38-aTcPd8nu-SZrL7VdKyMHn6T7V-HDVeyGw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] gitlab-ci: Add FreeBSD jobs
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
> Add system/user emulation jobs on FreeBSD host.
>
> To build these jobs, you need to add a FreeBSD runner and
> add 'freebsd' to the QEMU_CUSTOM_RUNNER variable in your
> GitLab project.
>
> Reviewed by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest-freebsd.yml | 59 ++++++++++++++++++++++++++++++
>  .gitlab-ci.d/qemu-project.yml      |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 .gitlab-ci.d/buildtest-freebsd.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


