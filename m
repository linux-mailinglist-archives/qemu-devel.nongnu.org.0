Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80195303C99
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:10:34 +0100 (CET)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4NB3-0000G1-KI
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4N9X-0007xO-EB
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:08:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4N9V-000172-WF
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611662937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBvmAtkbogEdKgvtww+rDWU+f40o0hwqQQXMvPj9dGM=;
 b=Flme914LwWfQaSyCCxQ7ApuwsG4AxDKypJ3wXekXvY5Qo+Ov/cf33Hp0QmUOtNsvwkAATR
 9RsqUEBKfBp1/2bpc7QnmBfICjGfpju1O0luCUwR02eZtWbRQLo4twznL0vicikTY/0fcv
 XvwZkAv76bmwdtxeO5EEk5cdXWXnEz8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-gbJ16d_0OXmPnEsKWJrbxQ-1; Tue, 26 Jan 2021 07:08:54 -0500
X-MC-Unique: gbJ16d_0OXmPnEsKWJrbxQ-1
Received: by mail-ed1-f72.google.com with SMTP id v19so1242056edx.22
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 04:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FBvmAtkbogEdKgvtww+rDWU+f40o0hwqQQXMvPj9dGM=;
 b=sU6WQw9bh4EM+GrrC1WxlQYPbtksiDmX6S3IgkxZVbV3PYQ5w71WSJ6ysOFSNSiNHN
 bJO/Cd6BgM6tvmbqRi9Ief22bkdgly/JEduz7I795wOboAWgqlmoLtwdnU1nt0MDBU6M
 b145IF7IypvoeRqXPI+VQXXwBa6muu+XQ2JA9uGJRwsD0OP78V+G+3hQY5nF8m5EsoWX
 CAbdAkiwbn/5lOiegef0yGr73WKLCUee/WN9Qiuhhj3jeMBQr2osnWb2HLmtD1eC8u8E
 pFm0pxhF95TNMVP+jTpPMv7AZoKVuaFSqqPaKcEl3Z14VgbISTxFCq2jT7XN89tOLGIn
 HRKw==
X-Gm-Message-State: AOAM531vJWdn+ffwgT79jDCcxG16u+VfCz3jm+DxfLA0M6ha+siRLMdH
 vk5a4nCu7h7TgGoOaGuSOrU2QYHkcA8NUrIkAQD/mvBMiI8d/ySiaCjeS8mmHfiaA5D4QL7p4Iz
 PTEeFGzfFAyljOXM=
X-Received: by 2002:a05:6402:35d6:: with SMTP id
 z22mr4251001edc.58.1611662932478; 
 Tue, 26 Jan 2021 04:08:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvGRpsNGp9EuqyYvMFJsDfdTroydrM9cuH37JYQe/pY0qjbnoilZNA3By9jnXdnUGI122qPA==
X-Received: by 2002:a05:6402:35d6:: with SMTP id
 z22mr4250993edc.58.1611662932370; 
 Tue, 26 Jan 2021 04:08:52 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s2sm7637248edx.77.2021.01.26.04.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 04:08:51 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci.yml: Avoid some submodules to speed up the CI a
 little bit
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210121174451.658924-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bd0ff3d1-56a4-ba1d-8129-521937b092b2@redhat.com>
Date: Tue, 26 Jan 2021 13:08:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121174451.658924-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 1/21/21 6:44 PM, Thomas Huth wrote:
> Since the meson build system rework, the configure script prefers the
> git submodules over the system libraries. So we are testing compilation
> with capstone, fdt and libslirp as a submodule all over the place,
> burning CPU cycles by recompiling these third party modules and wasting
> some network bandwidth in the CI by cloning the submodules each time.
> Let's stop doing that in at least a couple of jobs and use the system
> libraries instead.
> 
> While we're at it, also install meson in the Fedora container, since
> it is new enough already, so we do not need to check out the meson
> submodule here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.yml                               | 6 +++++-
>  tests/docker/dockerfiles/centos8.docker      | 1 +
>  tests/docker/dockerfiles/debian-amd64.docker | 1 +
>  tests/docker/dockerfiles/fedora.docker       | 3 +++
>  tests/docker/dockerfiles/ubuntu2004.docker   | 1 +
>  5 files changed, 11 insertions(+), 1 deletion(-)

So now which are the jobs left building from git submodule clone?


