Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708741E880
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:41:37 +0200 (CEST)
Received: from localhost ([::1]:56816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWDAm-0008Vb-7h
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWD8h-0006Mo-G0
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:39:27 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWD8X-00022J-PL
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:39:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m22so8530737wrb.0
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 00:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jqlIL+knClEttLSROwT1k3lb/7eehqPXjGV+EH/wzF4=;
 b=CzUK+HPZMI7CrkF9lN+jwXO0sPvYSb/XNxsu7UpLuKBdL182LUK0UlPWv5eFUjD2mu
 3uc1gEA7r6HJnGciyS9yQ1w9O7cZ9+MmLJ2NKKQwCxiv+VtgeyXgEKSUS6RZV3smSKCp
 /qui1EACReQ/xU4SnQMKgekZRihMcYGh6CZ/F+Qo8Aq1J1BOJvi9QnSIWQNg7VSmBk5H
 J9vudhMAcjP/u0hk3/mZbJVSjxT1sHxAo9SEUQGaCkW/8PY74cUXEe88tB5oT92sxfb+
 VJ7ECMpeTWbJhh+f5My8TGshB1OeIByoMfkGJL59rSg2trZNGchw9XzqTQSR+vuATNSD
 dygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jqlIL+knClEttLSROwT1k3lb/7eehqPXjGV+EH/wzF4=;
 b=CNAjlX02CPj91cIMxrvG6mDVwrFDLEwjhm7+vuVz9oBnLSFNNCbKy/SANPWSOvwp9c
 Niga9y+LvsXo26zW6lcDl7U7rgrNeh4+kvLzuM3SEqSDE1cTHhbXdgbBEunfKPk7IPVI
 Xx9RytDutdBZ3GoyIVAW1TEDvNmdfoUSzl6vGhCbDZ8ZE2KbNxVOpEiYAk5n2VLsA/HB
 ASzU6VksYr3bWac+DIWFb6q3ox754GlHPS/1SVuVX+VJ2UAVdLEXKZckT7M6jGy63Si4
 8FztR5faqMud5HcgneM+V/NLo9tId9dwRy7eNE+1ZmdLu6dNzWPvBEJDBtn6eW1npHzs
 3QcQ==
X-Gm-Message-State: AOAM532mP8C1e0qRXgD3Lgfqf+eS+/WDcl5yLNkDXooDtneeDAvdOwoZ
 pwq9ee3NPCLlfV4m1X2I2D0=
X-Google-Smtp-Source: ABdhPJz2LJAOZAS6edT6MONggIMxjosF8o17uemHjHwRdkqycgo13GCd7AwZe4usXEyrMe8Etd/gRg==
X-Received: by 2002:adf:ee8f:: with SMTP id b15mr10797578wro.126.1633073955854; 
 Fri, 01 Oct 2021 00:39:15 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id e18sm4878455wrp.53.2021.10.01.00.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 00:39:15 -0700 (PDT)
Message-ID: <769a612c-9a78-6fc8-0893-43ce2c173957@amsat.org>
Date: Fri, 1 Oct 2021 09:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Moving QEMU downloads to GitLab Releases?
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, michael.roth@amd.com
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/21 15:40, Stefan Hajnoczi wrote:
> Hi Mike,
> QEMU downloads are currently hosted on qemu.org's Apache web server.
> Paolo and I were discussing ways to reduce qemu.org network traffic to
> save money and eventually turn off the qemu.org server since there is no
> full-time sysadmin for it. I'd like to discuss moving QEMU downloads to
> GitLab Releases.
> 
> Since you create and sign QEMU releases I wanted to see what you think
> about the idea. GitLab Releases has two ways of creating release assets:
> archiving a git tree and attaching arbitrary binaries. The
> scripts/make-release script fetches submodules and generates version
> files, so it may be necessary to treat QEMU tarballs as arbitrary
> binaries instead of simply letting GitLab create git tree archives:
> https://docs.gitlab.com/ee/user/project/releases/#use-a-generic-package-for-attaching-binaries
> 
> Releases can be uploaded via the GitLab API from your local machine or
> deployed as a GitLab CI job. Uploading from your local machine would be
> the closest to the current workflow.
> 
> In the long term we could have a CI job that automatically publishes
> QEMU releases when a new qemu.git tag is pushed. The release process
> could be fully automated so that manual steps are no longer necessary,
> although we'd have to trust GitLab with QEMU GPG signing keys.

Before having to trust a SaaS for GPG signing, could this work?

- make-release script should produce a reproducible tarball in a
  gitlab job, along with a file containing the tarball hash.

- Mike (or whoever is responsible of releases) keeps doing a local
  manual build

- Mike checks the local hash matches the Gitlab artifact hash

- Mike signs its local build/hash and uses the GitLab API to upload
  that .sig to job artifacts

- we can have an extra manual job that checks the tarball.sig
  (hash and pubkey) and on success deploys updating the download
  page, adding the new release

Regards,

Phil.

