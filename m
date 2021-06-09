Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C483A1731
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:26:41 +0200 (CEST)
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzAG-0005Bv-Nq
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lqz8z-0004KG-1K
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:25:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lqz8x-0008I2-Gw
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623248718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IAhZLKvsElHmf5lAbmWbxc804MiMIq/PUXdveDXqrUs=;
 b=Pdd7HV7ks+vNJkn6pEy/GXMc9nWEb1hZEajMsDrGVxLaf/YP5Xb3jl1ueOUzf7SfUXT+/S
 UHBihn/XYBvRwfNKRivVpC781eeAG0s68xB8vycYDgXfGic0WLszRopWpdpWAn3l6xM9jN
 AQevVvyhrbTe75dObbX6zqg8Kqt6VM4=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-wKOnp-UMNQqBw40IS_Ly8g-1; Wed, 09 Jun 2021 10:25:16 -0400
X-MC-Unique: wKOnp-UMNQqBw40IS_Ly8g-1
Received: by mail-ua1-f71.google.com with SMTP id
 j17-20020ab018510000b029020db76022bbso8003138uag.12
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 07:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IAhZLKvsElHmf5lAbmWbxc804MiMIq/PUXdveDXqrUs=;
 b=fSg2Rd0UbVMqSivjNTI0EAW8KET4rcl+p4mjHOzTfSf7gPVLVlEBrDN2GPmTH3SDs+
 PkkO2TQxnbC7QAFrSONbazu/4SqNAPdgGPBJZtwfSp+cty2KRjGT+hNEh49MLXIIV0uv
 uuuiJG93y4AFHMdWvdX3pp5g9g4oojFUVT8Cltb6vsyyRp6pYkXzEqqWmlptMKPB2j7M
 UehpCFQhW8fT6XW84NluT/6U+oe3CweE/pLoFPCF6q5nCyGfEPzRSNTuzan3j+E1h3Jl
 bLy7fRuZjo2Y6vY5iXNu10G1rnbG9w+mgWbyQRv2Z+iF/rVDAa7Src1gONPM5qaiF5/J
 H9rQ==
X-Gm-Message-State: AOAM531OQLYoEkyISZaSX8bIDeA7l2bOwu53GQwk+85aBZxyGWspu9pS
 ltq2t1LCrfkm+X+fYv0ke5/GDIiwxcHNWWj8GMWZsecVlIckNH0GuEnRUZL0Rdnu1Bt0MJaGnYm
 z7k2Y0y9EhmVXXQGhyl1XX++oBydz+HA=
X-Received: by 2002:ab0:6848:: with SMTP id a8mr18576030uas.110.1623248715656; 
 Wed, 09 Jun 2021 07:25:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwOI1sLgNzNT9XRqLIkHyQ+eBnZA5YFBVZXikAVvIkJ8O8oyZEAv+tO4TBTuZG982VqlBnWrDTnG7+0s8imrk=
X-Received: by 2002:ab0:6848:: with SMTP id a8mr18575990uas.110.1623248715444; 
 Wed, 09 Jun 2021 07:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-2-crosa@redhat.com>
In-Reply-To: <20210608031425.833536-2-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 9 Jun 2021 11:24:49 -0300
Message-ID: <CAKJDGDYFAhyUXf-FBno=D8XQVqOs8oCwXHo-t72N=Nv2-pLjsA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 12:14 AM Cleber Rosa <crosa@redhat.com> wrote:
>
> As described in the included documentation, the "custom runner" jobs
> extend the GitLab CI jobs already in place.  One of their primary
> goals of catching and preventing regressions on a wider number of host
> systems than the ones provided by GitLab's shared runners.
>
> This sets the stage in which other community members can add their own
> machine configuration documentation/scripts, and accompanying job
> definitions.  As a general rule, those newly added contributed jobs
> should run as "non-gating", until their reliability is verified (AKA
> "allow_failure: true").
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
>  .gitlab-ci.d/qemu-project.yml   |  1 +
>  docs/devel/ci.rst               | 28 ++++++++++++++++++++++++++++
>  docs/devel/index.rst            |  1 +
>  4 files changed, 44 insertions(+)
>  create mode 100644 .gitlab-ci.d/custom-runners.yml
>  create mode 100644 docs/devel/ci.rst
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


