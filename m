Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C249C453228
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:28:23 +0100 (CET)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxZW-0006US-UH
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:28:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mmxVg-00049X-P3
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:24:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mmxVZ-0000QG-HD
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637065453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRvp0Oy4NKo9fBtKQy196BNevnup1FxpCp+7UyScbkU=;
 b=GpsisM6u7FNURrLvOygv/7ege1NwzWNsC6Rz1UuNLpyyxxUFGB4PmddAHFBGp+tu++rAzO
 WlcmljPvWBmDaoN4qngW40AyGBjY4Fek6kZF3l9JG2LP/o7wehj/wOq2wf09DnJJX5IHhv
 2R+MU6IQY21Hy1kiwliWQnaBhjG1idk=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-NKveICRFNJaBRgk2h7N6pg-1; Tue, 16 Nov 2021 07:24:12 -0500
X-MC-Unique: NKveICRFNJaBRgk2h7N6pg-1
Received: by mail-pf1-f198.google.com with SMTP id
 g142-20020a625294000000b004946d789d14so11716406pfb.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bRvp0Oy4NKo9fBtKQy196BNevnup1FxpCp+7UyScbkU=;
 b=YdoKQBEaFdWFwlf1f2H4M+2WpjsUVhJdSCTzTrqWES7wvugluwZQvANz52eAtidQcv
 I0C6zHQuh31ttB8aAP83fFOgdUUeReFoN2fkK+4plPvnbrGRzXOwy8JVsELFysWTQ2eI
 1QWeQOmpj1ZvCGokEK5k6RX1OG6FRro4F24OCQqGudikHzDq0SUAz3Y5Q7OjQDnBH6rt
 SqMj9LHMDJeqt5rGT+i318jat9NGQ2f3PJk3ELvLKU5SRNRsM4ZzyS6/Zep8zvyQZKo1
 PafuQ1AzYKLgW6gGbFEptp1UIVmUmfIwdDM43TBNZ7aE+qkVWw+STFYn8Z264fN37IT6
 AuWQ==
X-Gm-Message-State: AOAM532L46R+m3f267N11McpKMCG6n3ddjMdM4U8QDiqKcniEZJkVDgF
 N2DYfHjl0gV7tAnmouIUprbc0QzS1P0GnrAcG4xEOyghx5KNlHe1Zw8fn0PVBCADEyLoebmBBdJ
 vmlPga6iLte2HoNysa0mWmvv0fix6ksQ=
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr75634930pju.123.1637065451389; 
 Tue, 16 Nov 2021 04:24:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMITy0UIX3/uFqRRNkX7k2pamO7MdGR09CA3LjVOz4H3IHs8YLs4exVkVZGJYPVPH2Y58+d14yfnhL+uX2g+s=
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr75634896pju.123.1637065451155; 
 Tue, 16 Nov 2021 04:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
 <20211115142915.3797652-4-alex.bennee@linaro.org>
In-Reply-To: <20211115142915.3797652-4-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 16 Nov 2021 09:23:44 -0300
Message-ID: <CAKJDGDavU3NPBpTBJ+Ns-B8QfyOxwDdBUqd_Lqy5pSfvUEr5Ww@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] tests/vm: don't build using TCG by default
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 11:29 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> While it is useful to run these images using TCG their performance
> will not be anything like the native guests. Don't do it by default.
>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/393
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/vm/Makefile.include | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


