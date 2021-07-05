Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB243BC260
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 19:49:05 +0200 (CEST)
Received: from localhost ([::1]:53160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0SiN-00012a-VV
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 13:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Sgq-0000JH-H1
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 13:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Sgl-00047z-2h
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 13:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625507242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qkepVVUDMf9gLU9as+UaTdYHuZRBWoOskzWolIX0pD0=;
 b=f5Bt+EFPOcI5bQdesvQx54VlY37/CiiJr1bnCqdVmP9eN94tOU71rmKhaiQsx6iutEqZZa
 UDWm9SGUf/xGWbc5VWFLFam+tuYq4o4V55TuH4L3u8pLbGiugcaXG5J7kWD53IPsSTbp+r
 mJcKH199HtNLCAKyCBl9k2iNlEX+aFg=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-t39D902wPQ-A3IonQnQGPA-1; Mon, 05 Jul 2021 13:47:19 -0400
X-MC-Unique: t39D902wPQ-A3IonQnQGPA-1
Received: by mail-vs1-f70.google.com with SMTP id
 v15-20020a67c00f0000b029023607a23f3dso4381716vsi.10
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 10:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qkepVVUDMf9gLU9as+UaTdYHuZRBWoOskzWolIX0pD0=;
 b=tX695jb3hxkXrn8pbhonkjRuyaJJ7x9mrSmXpytWr9lvs8QP0XXgd7ooviJUOzcSlt
 9q54nqpeC3/ESZoTgpYv8NiZh1DEhvDHg5tTnj0ymDIHYYOrd4iZfypyy1pUkNU0XetD
 d5sQOb+1qBCCPGFr6x9XkHCWqHGFKqus9mw8DT4Od45RZvUpwF6H0jRrljwiDu12A7t5
 4LVldzqGP9WTPFwOkMPA/1WbA9x5eRcv1K9SDYH2ntusDddXMdIlZskjuCZmRRgxs9Il
 3Vf+2pzMqYxeZYBm+OAn+YxsIY7uy/kKwu6diRsN+/b8B/SGcXabM4LahvPcsTK11cE2
 PmVg==
X-Gm-Message-State: AOAM5318BstYn5eKeN6BoLQTKsu25D11jB9ZKCZayyXXF52uMm4hrYWW
 itugIw6rQRfsowrSeeqDgvpaVUrdHmf3Hp3HvExusaiE70Opp1D/dq7wlImMg31ikwlkqibZ5Ug
 llAKH9R2WFenUOr8tyKlGxN+8/qC8Dw0=
X-Received: by 2002:a05:6102:214e:: with SMTP id
 h14mr10390412vsg.1.1625507238912; 
 Mon, 05 Jul 2021 10:47:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7+GIEaCAxPV3aFlTK7kvBh+w1QhUGGe7kxhwXuHw6WzlW2CPZL/7olkNBgJztrqVkzPrKXnctADZxfPrGaoY=
X-Received: by 2002:a05:6102:214e:: with SMTP id
 h14mr10390392vsg.1.1625507238696; 
 Mon, 05 Jul 2021 10:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <162459953801.387455.14911900669864582030.stgit@pasha-ThinkPad-X280>
 <162459954921.387455.17000468377504697052.stgit@pasha-ThinkPad-X280>
In-Reply-To: <162459954921.387455.17000468377504697052.stgit@pasha-ThinkPad-X280>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 14:46:52 -0300
Message-ID: <CAKJDGDb+fDxJw2ZnLPGSZ0_VLPrJdfq2wbVw=zbsvb8_tU1kOA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] tests/acceptance: add replay kernel test for ppc64
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Already upstream :)

On Fri, Jun 25, 2021 at 2:39 AM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> This patch adds record/replay test which boots Linux
> kernel on ppc64 platform. The test uses kernel binaries
> taken from boot_linux_console test.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  tests/acceptance/replay_kernel.py |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
> index cdc22cb6d3..7e7f4c8ccc 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -367,6 +367,19 @@ def test_xtensa_lx60(self):
>          self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf',
>                                   args=('-cpu', 'dc233c'))
>
> +    def test_ppc64_e500(self):
> +        """
> +        :avocado: tags=arch:ppc64
> +        :avocado: tags=machine:ppce500
> +        :avocado: tags=cpu:e5500
> +        """
> +        tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
> +        tar_url = ('https://www.qemu-advent-calendar.org'
> +                   '/2018/download/day19.tar.xz')
> +        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
> +        self.do_test_advcal_2018(file_path, 'uImage', ('-cpu', 'e5500'))
> +
> +
>  @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
>  class ReplayKernelSlow(ReplayKernelBase):
>      # Override the timeout, because this kernel includes an inner
>


