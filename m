Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC06231C2BA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:59:21 +0100 (CET)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBk1g-0006Rh-PL
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBk0Y-0005TW-4Q
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:58:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBk0U-0002vB-Tw
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613419086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CBXtURgE7pU/CpaEiVdmYmEa3F9AWvoQfgKLx6igg78=;
 b=ceifSGT4Ar7gahLbSBigbJFy3at2KwTYZWMi8SBMxO/ADCYeKGV0dylZhU1SUUZHo7U1UQ
 +jfNyXtib9NRaHMZ5nzvYueFR+ugWqFAQLT0Au5OqIlQbjCU/Jd3fC13Ed+LCDASkvIQGd
 ZPnmnUiG5wkUHKwwp0AwlKd6BIdCk+A=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-nZUXfV00MxeGu_ijsnp_lw-1; Mon, 15 Feb 2021 14:58:04 -0500
X-MC-Unique: nZUXfV00MxeGu_ijsnp_lw-1
Received: by mail-ua1-f70.google.com with SMTP id k2so3632691uao.23
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 11:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CBXtURgE7pU/CpaEiVdmYmEa3F9AWvoQfgKLx6igg78=;
 b=DaXkrbf2V4ms+l2Sp4xsTen8BPZOzbk2AGxdKTWQTFmnSbAiMlxSw3iHNoqETI9r6h
 9wGnivCrS92u4PB2QFAMzIXxgKtQ9JcMvpACTt5y9yr3jie06gqrXjLlcgmfTTeSaR+c
 xIipQZ1OBpgQUFVGEVsGF8YNeUXc5f0uNqku9JwcY90+2u7T6E2KNrGPeSCfVzUE1S1t
 FsGpLK6KNLLOnR8d3qwYCzXG3uH6WCcAYa9gpR1961EQbBhyGd4x2VYpfx6ZX7Y9KZmd
 TByUIOiFpJ4YbRHMagCVVDuvhbSVTaaEMzPYMbCV14wXPySdgnoD5nFXH3fKrNQC02tZ
 ts9A==
X-Gm-Message-State: AOAM530x029uXCX3QXj4grsX+KsABE8hSmhhvDNMQpyh+aErzYG9LmgD
 vbvOBkoh2GjGrQ8VW32CcJE7Sj2m/jMTjmhbfnRDm6OAkbVxPKw71AqE6WEPQh9A/R+K0qDa5l+
 76nL6jWMxx4+GgaEr8tvC+CWXF5L6Xgw=
X-Received: by 2002:ab0:5a47:: with SMTP id m7mr10168373uad.124.1613419084076; 
 Mon, 15 Feb 2021 11:58:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6IH/T6lNZVvq0OSb12QvzA+Sw75seLIU16N/9ADZX8ftQ5LcXTRp+xzXczqOkMOomyb9VcvDrfUOFx0J1L+E=
X-Received: by 2002:ab0:5a47:: with SMTP id m7mr10168352uad.124.1613419083871; 
 Mon, 15 Feb 2021 11:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-22-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-22-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 15 Feb 2021 16:57:38 -0300
Message-ID: <CAKJDGDZ2sXA40hU8hhrRvFs4FCLHDZ+=p8bsVxCn8EHYHkceiQ@mail.gmail.com>
Subject: Re: [PATCH 21/22] Acceptance Tests: introduce CPU hotplug test
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 2:25 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Even though there are qtest based tests for hotplugging CPUs (from
> which this test took some inspiration from), this one adds checks
> from a Linux guest point of view.
>
> It should also serve as an example for tests that follow a similar
> pattern and need to interact with QEMU (via qmp) and with the Linux
> guest via SSH.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/hotplug_cpu.py | 38 +++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 tests/acceptance/hotplug_cpu.py
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


