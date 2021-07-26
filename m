Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754803D67B9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:51:49 +0200 (CEST)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86dg-0006dj-HO
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m86Sd-0005c0-0l
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m86Sb-0004kF-JV
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627328420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6D8xJCr3TSGHRNlyQ+zT6EJGYsDb5ZSeqE2l1TlA6xA=;
 b=RE1W8bx8X4RfcUegekpBQ6Rf7X+H7ndqQjzFQt7k9++iRfClCdNElqMk4RzyyaMT7WJEWi
 71qSCmPO/feI2/dahwYu+OKlhExicpiN9ox76Vm3zyjN7OeMQubKUBWvIv0E1GQPlssKeZ
 GuxbtbyyRAFmBz1cRfs8aV2NjrJtN5Q=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-cWXw-cGDNt60Rahqj_jRDQ-1; Mon, 26 Jul 2021 15:40:19 -0400
X-MC-Unique: cWXw-cGDNt60Rahqj_jRDQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 j22-20020a17090a7e96b0290175fc969950so284889pjl.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 12:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6D8xJCr3TSGHRNlyQ+zT6EJGYsDb5ZSeqE2l1TlA6xA=;
 b=GMiSCfwMUu31HpKO05bnIWBC0iuie0HYuala+OpO0MuTSskKaQyO+YOnEXX/aIzYXU
 LZxSmbWFfNWPjcFDFwlgi162HMFBymNbOu9nvmlFQ0Sw9nwa9KC19XuurCfraY5MbQe9
 oSms3WpTyDQlJ4QMSgsTpNH1E/SoU63fG1R/l0amnpr+9OCJuiL4mBU5rGiwRKUEg7B8
 wSxksMNV223Z3lYQN9rjXQUvsRnwsOzv4ngwdaVNjUq0wgmvodUWdXaL2vG483o+/bwS
 IRIcG4rdepvKIkS+evud9Ioo2f0m6EFkDbpaxXLmcLK654srT5Jpd4zLJQ+SQF91hDPL
 ZxCA==
X-Gm-Message-State: AOAM533wJf7VLObIL9oXBGV0CA5O4kXkg8qLmZXR/QUmicEcmmNRE5zt
 ySFqa7QNSmExJhxm1t/eIn0yimAAJydq/BJ92NB2zF7SYpjqLM/yyGMc0f7ia103xtexk8wvh/v
 ANPXyCR1srY60EnuVLn9zXIDeyC6Dc7w=
X-Received: by 2002:a17:90a:7789:: with SMTP id
 v9mr19426160pjk.159.1627328418454; 
 Mon, 26 Jul 2021 12:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDw+jLhwej7sxwJ2kEVQHJgVzJHLpCBed2F6TDnTX2vJNx9yLIw6AWSETZUrFoqX4xv5t0KyKywhWeGrYMMI0=
X-Received: by 2002:a17:90a:7789:: with SMTP id
 v9mr19426133pjk.159.1627328418217; 
 Mon, 26 Jul 2021 12:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210726150429.1216251-1-philmd@redhat.com>
 <20210726150429.1216251-3-philmd@redhat.com>
In-Reply-To: <20210726150429.1216251-3-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 26 Jul 2021 16:39:52 -0300
Message-ID: <CAKJDGDYLxVQx7LnhBXghii7sROT6khow98eBkO9M47tBxDJcLw@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 v4 2/4] gitlab-ci: Fix 'when:' condition in
 acceptance_test_job_template
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 12:06 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Jobs depending on another should not use the 'when: always'
> condition, because if a dependency failed we should not keep
> running jobs depending on it. The correct condition is
> 'when: on_success'.
>
> Fixes: f56bf4caf71 ("gitlab: Run Avocado tests manually (except mainstrea=
m CI)")
> Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


