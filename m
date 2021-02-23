Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B76C3226ED
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 09:12:39 +0100 (CET)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lESoA-00030L-1f
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 03:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lESmq-0002We-4o
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:11:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lESmm-0004tz-So
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614067870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKskyLHNywLQ0gMH7Q+U+bv79eUhfYNvVspd2K2pIho=;
 b=AI8X61VryU0QjaPFxzsX+elOgZNv1fBPqhY/gdBgxj3KKHSolo+96FjHLYZXsI8hjHFiVE
 WOjdNECoDRHHZwqMS+ihAdh7m6d2t6GKQoB/9KD5NV5tAjmUZ0/eKIpfgsddY9OIol++Er
 e2kzn5vsv++X53Zl2T0/QFV69qmAHQE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-vzhiQxCcMpmUy_VomqvBxg-1; Tue, 23 Feb 2021 03:11:06 -0500
X-MC-Unique: vzhiQxCcMpmUy_VomqvBxg-1
Received: by mail-ej1-f69.google.com with SMTP id f3so3276859eje.20
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 00:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qKskyLHNywLQ0gMH7Q+U+bv79eUhfYNvVspd2K2pIho=;
 b=LrbQqmv25GdqNjHTUFKh//yufhwjezVdZIzJ+uWGkizOcc0sRKuVOVMk6i0ewESv8L
 jKuT78Y+XyWcDVEHJSJsnj/qrxH6kC32mwf77G61GYkq64jYyb+G/HD4fO3MQoXFuMOW
 m00qKAE9awnCtWlKST1jdHnDSbEas3yEOel0UJY05K3+4v6ZuEOCGjuikQ0AG0GuvOmv
 o28kAtKCMGHyEKvtp4Xc8VljCTnYFf/ZWIr7gS6yhR8+KeLjD8rW6EPZj9hmDO6lfiDJ
 UTgraQ+Y14IpVcytYUREzsbB8rFXc8L2o5bOt9pKMVrtDJXINBEqYWQTX8eaFkppo7ml
 uUgw==
X-Gm-Message-State: AOAM530m4LpjzHRZa8/YiBG6hnYIBCOU3alyUfQ6qhULWi0aA3GUSnnN
 1Q32ioS3upSoMhKiQFu/c+0MItpByfQydCnyJWX82hsrwA7VmF8GYdTZl8ubGH7rEkSEkSuJ4W6
 mgk7bXemwbxSekQE=
X-Received: by 2002:a05:6402:4316:: with SMTP id
 m22mr26759662edc.64.1614067865019; 
 Tue, 23 Feb 2021 00:11:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf41r3TD3iiVjcweuGTq9ZpxmYg3rvTNwXvsuXn190e4uh2fv3U6BXT6FxTeDAVggvrj/Ijg==
X-Received: by 2002:a05:6402:4316:: with SMTP id
 m22mr26759642edc.64.1614067864803; 
 Tue, 23 Feb 2021 00:11:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h12sm1707190edb.70.2021.02.23.00.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 00:11:04 -0800 (PST)
Subject: Re: [PATCH 2/2] gitlab-ci.yml: Add jobs to test CFI flags
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
 <20210222230106.7030-3-dbuono@linux.vnet.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e9973878-6181-41c6-5e65-afd07db7c476@redhat.com>
Date: Tue, 23 Feb 2021 09:11:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222230106.7030-3-dbuono@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/21 00:01, Daniele Buono wrote:
> +# Set JOBS=1 because this requires LTO and ld consumes a large amount of memory.
> +# On gitlab runners, default JOBS of 2 sometimes end up calling 2 lds concurrently
> +# and triggers an Out-Of-Memory error

Does it make sense to test only one target instead?

> +# Because of how slirp is used in QEMU, we need to have CFI also on libslirp.
> +# System-wide version in fedora is not compiled with CFI so we recompile it using
> +# -enable-slirp=git

Can you explain what you mean, and perhaps add a check or warning for 
incompatible settings?

Paolo


