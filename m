Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F213B59DA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 09:36:36 +0200 (CEST)
Received: from localhost ([::1]:50272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxlop-0006ZY-TC
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 03:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lxln6-0005Qu-IR
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lxln4-0005Y5-Px
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624865686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yTZB3xWK4EAHn9ne40QsWL7iAZR4e711i/H16xpyoE=;
 b=g3lN+kbFs5WXaz4V3054dr8RjevrJMxOHaFWEMqiTqib4lPXm3+ZjbIDZunzZUY+WUJ30y
 g/fLY4/dP7wYY/eHVrzHS1cxJ4ibXKj3CZQIG7NDkKK6OjtliNmffKQZqakll2ykVoBnQr
 Vb5Zx1GRjvxXOMozqLSJKM2ziFoZ6hE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-1puB1HlOOc6SrSpD6HAA2A-1; Mon, 28 Jun 2021 03:34:44 -0400
X-MC-Unique: 1puB1HlOOc6SrSpD6HAA2A-1
Received: by mail-wr1-f69.google.com with SMTP id
 k3-20020a5d62830000b029011a69a4d069so4277857wru.21
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 00:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/yTZB3xWK4EAHn9ne40QsWL7iAZR4e711i/H16xpyoE=;
 b=krec0XHuBQzkp7h5EaFKNaMwbaA6XXv8L8qPOUix6bshsLbWJ1LP07waSgmKcqJClH
 qTWsN5d7Nb93qq4Wl+PzozLMl4l6hNoGCBucjbJRyxp8yOWRCzIk8rXTzb0k+gwCXV79
 lhZQ08lsWb7sqGttiDVQjzunEw4KukJz8bSR0uqJdImQZ9iFhqLFeMMLtQ1dEriiNYn8
 rtzbf87KYD/hQP1g1b5z2w14kePcg7R5Qchddd4KN2hPRT6MX/SrBATYer847RqkLIL2
 gCba2BBGmSXJPcVEJkfULYsGbO0llgyT6hnWKKAZM+ICBj2pJTaNwyFZZGUDCLk6i3L4
 WADQ==
X-Gm-Message-State: AOAM531khIsOEWEKeUmZmdSURrJG2K4Ka84sm/KAvpkCFbUUU9cYnYCS
 t+8G8JqR/jO2clSMGTsVOA6/tJjQPzWa9JRytOBMd6xd8jk/C9GVmBebGUe1UsyUku8LlxxaZ/O
 CuXubhbEJEeHksCk=
X-Received: by 2002:a7b:c107:: with SMTP id w7mr24531306wmi.107.1624865683400; 
 Mon, 28 Jun 2021 00:34:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5qPrV04mX+/Ahhygw+ZSap1/1cRMCE2PMpR+0WQDhgfWQmZpukkb0SbXpBkSYDlA4u3Z0HQ==
X-Received: by 2002:a7b:c107:: with SMTP id w7mr24531275wmi.107.1624865683197; 
 Mon, 28 Jun 2021 00:34:43 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ea7.dip0.t-ipconnect.de.
 [217.87.94.167])
 by smtp.gmail.com with ESMTPSA id p9sm1498755wrx.59.2021.06.28.00.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 00:34:42 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210625172211.451010-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/3] ci: use cirrus-run to utilize Cirrus CI from GitLab CI
Message-ID: <37c78715-0819-3961-93ea-5c5d95a2791a@redhat.com>
Date: Mon, 28 Jun 2021 09:34:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625172211.451010-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.696,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.765, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 19.22, Daniel P. Berrangé wrote:
[...]
> The MSys Windows job still remains in the .cirrus.yml file. This
> can be addressed to, if we extend libvirt-ci to have package
> mapping information for MSys.

I think gitlab-CI offers shared Windows runners, too, see e.g.:

  https://about.gitlab.com/blog/2020/01/21/windows-shared-runner-beta/

So I think we likely should rather convert that job to a shared gitlab-CI 
Windows runner instead?

  Thomas


