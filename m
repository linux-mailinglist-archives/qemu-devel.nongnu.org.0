Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA953D0133
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:06:55 +0200 (CEST)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5u8s-00026L-Fb
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m5u5K-0003Z7-1p
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:03:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m5u5I-00083P-BH
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626804191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FkHap5lcMSyPvtxQtE+yo00M0uainMVcsqYckiMFQ+0=;
 b=MsTBOHtBgFmjgZ5wU4HPEHteqwwVdSwVGOzmLrA/OWeF4tT9QajjaW5Apyq/t7mtzRZGq+
 wO+or23ykHmzYhieLveGb9BuscDP5GHreBClXDK0qM6IQAjIRr8MfpaKMdkseSOoAplm7V
 bgQzX+xAM+FvqWfElcrdyjzMImNmlEE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-dAMAz99rOBWzev_BYQlM_Q-1; Tue, 20 Jul 2021 14:03:08 -0400
X-MC-Unique: dAMAz99rOBWzev_BYQlM_Q-1
Received: by mail-vs1-f69.google.com with SMTP id
 l18-20020a67f8120000b0290292c808d508so5158562vso.23
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FkHap5lcMSyPvtxQtE+yo00M0uainMVcsqYckiMFQ+0=;
 b=ffAJeaTsLcQ8AkTmmkGTvL2l/V1SBYYJG3Uu1IEVHl57PdXhxMbTuTcb+lgU6QSWeK
 cPMZvRTRmmUW7i1+dy7ulH4T+3PiQxZVMfisf+Wx0qF/wckZx+I9ULhwrVISjnEtO8vd
 nkdRgvsSrH4FiQkkxLqvibb6rrxTH+v0WIlr+V9qyhdqng9xIW0EJ2WqeYBRtSlQyFyU
 2LSw9x8fgeQ9FoF5JYdZpcjnPErHLq/6OYh3SBc99V/ZDe+Ghcpk4oMWMiQj9U76+JOU
 s9pdCc8l2Ycua5ee7Z6S4loL+1okNCiSA0WPTEGgKuixJJuHcC9cmenPNKtP2wJu1CKX
 FS3g==
X-Gm-Message-State: AOAM530zSbJCfRGQAERelJB13R8a0F+5nSQsin/Lhf8dDad4OdshdEKl
 Stpn7ryzF3xzmHqGe9a1yzUMY99ghL0yeRT5CIf0gwxfitCHuFOZdNiuSvrJCYhHgt0Sroii0U6
 UMBVJOnobjJQgTLmDgZM6/+y81z3C17k=
X-Received: by 2002:ab0:36c9:: with SMTP id v9mr12990180uau.5.1626804187742;
 Tue, 20 Jul 2021 11:03:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy89yKbpSqJ5GEqCDpuIhnz5D/IdESYtfqG7cKqmoKjGsju3sicmCMDY1aTEStep41S295swONFsudcbI+9hJ0=
X-Received: by 2002:ab0:36c9:: with SMTP id v9mr12990153uau.5.1626804187591;
 Tue, 20 Jul 2021 11:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210720164829.3949558-1-philmd@redhat.com>
In-Reply-To: <20210720164829.3949558-1-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 20 Jul 2021 15:02:41 -0300
Message-ID: <CAKJDGDaeXSBNu7EW8QRfAd3m=v8eqmkwRz_JnGNYsDXk2VXVvw@mail.gmail.com>
Subject: Re: [PATCH-for-6.1] gitlab-ci: Extract OpenSBI job rules to reusable
 section
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 1:48 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> All jobs depending on 'docker-opensbi' job must use at most all
> the rules that triggers it. The simplest way to ensure that
> is to always use the same rules. Extract all the rules to a
> reusable section, and include this section (with the 'extends'
> keyword) in both 'docker-opensbi' and 'build-opensbi' jobs.
>
> The problem was introduced in commit c6fc0fc1a71 ("gitlab-ci.yml:
> Add jobs to build OpenSBI firmware binaries"), but was revealed in
> commit 91e9c47e50a ("docker: OpenSBI build job depends on OpenSBI
> container").
>
> This fix is similar to the one used with the EDK2 firmware job in
> commit ac0595cf6b3 ("gitlab-ci: Extract EDK2 job rules to reusable
> section").
>
> Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Latent bug on CI, safe for 6.1.
> ---
>  .gitlab-ci.d/opensbi.yml | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


