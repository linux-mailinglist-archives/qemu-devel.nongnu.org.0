Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7083DF61D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 22:09:25 +0200 (CEST)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB0j6-0007nw-G9
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 16:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mB0hx-00075x-DF
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:08:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mB0ht-00017p-CF
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628021288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IaWFDuWKXUic0kiLlmfVst0GBTUzw5ySPEa/Fu/URmE=;
 b=AHTi/JzOuUNmgEXxV8E1c9nRhGtMteVHHR/u1oBhKL5jZ8zqpEOJfry8abqGYONoGGbqpB
 YHV69ahLyGgPN8ckep8xjlD2RN5ItPj0yym3EslqxFO17v0cEYHncXN+P1/KgWNglTworc
 K31rp41liAWSSX+WNRRfyOeHde+ZElA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-IwwUAbNyPwOXEhD2GfVb5g-1; Tue, 03 Aug 2021 16:08:06 -0400
X-MC-Unique: IwwUAbNyPwOXEhD2GfVb5g-1
Received: by mail-pl1-f200.google.com with SMTP id
 j5-20020a170902da85b029012c4287ea54so190658plx.22
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 13:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IaWFDuWKXUic0kiLlmfVst0GBTUzw5ySPEa/Fu/URmE=;
 b=Bs/l+RMmIwsUqiDCXkKj2marYSvxA9W1gSmSukTejX/jH2D+y1ECHRWVR0beJy7lil
 RA0ezmYTjbEdtG/yd2sCWlant6GmXNbKjzp5E5w2DRGl1dGl8N0YtMOXBsvxO2IqVuCa
 Pj/e+B/FEQJPjZFYGUcog+3Ccik4AdvV+hmnxVcTJLV1CMDxHwEd/gxOm6Jq638lY4Jt
 AeQz3dPk1q7/sBMRWegKAESP5YXW9Dg0NhY+cOc56eJWtux0MhUkODYm4gI+qfGPuBcy
 Tpn+K4ENM+3bndQ3zpk35oCvPVgKGHn2xwxvDy2SDZ7+7vIRj/NY5WCArHQUT/7tNAsm
 1kWA==
X-Gm-Message-State: AOAM531SSu9Eaag1erYbOgKBOFN1GRJZJLHm7/XhQ3FYBn5/32XJXsP+
 qCiXokPMeNlDE+ekqiP2TuGepYd4RGJTCxiodsPHun8j1ELadu8H/X7+f6TpnePYSGWDcJkL209
 uYaKZBLCZjzw1sh/yu/fMjXGjcv2Ohtk=
X-Received: by 2002:a65:6107:: with SMTP id z7mr62905pgu.43.1628021285699;
 Tue, 03 Aug 2021 13:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqjGmqmhw0XuDB7NFM/W1xMashGhmjDIYXwo8VX2xoDSDAXMW7hUUH6WaVTh9ZRO4H3ecr0XmgZyQrfHVZtv0=
X-Received: by 2002:a65:6107:: with SMTP id z7mr62892pgu.43.1628021285484;
 Tue, 03 Aug 2021 13:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210803193447.3946219-1-crosa@redhat.com>
 <20210803193447.3946219-2-crosa@redhat.com>
In-Reply-To: <20210803193447.3946219-2-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 3 Aug 2021 17:07:39 -0300
Message-ID: <CAKJDGDbTZiGNpWby0c-=XaSTqh26OfN1j1gg_SOu_9OAwQ4ULQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Acceptance Tests: add standard clean up at test
 tearDown()
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 3, 2021 at 4:35 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> The avocado.Test class, used as the basis of the avocado_qemu.Test
> class, performs a clean of temporary directories up as part of its own
> tearDown() implementation.
>
> But the avocado_qemu.Test class is currently missing the same clean
> up, as it implemented its own tearDown() method without resorting to
> the upper class behavior.
>
> This brings avocado_qemu.Test behavior in sync with the standard
> avocado.Test behavior and prevents temporary directories from
> cluttering the test results directory (unless instructed to do so with
> Avocado's "--keep-tmp" option).
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


