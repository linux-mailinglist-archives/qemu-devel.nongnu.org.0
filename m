Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095B52CB99F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:49:48 +0100 (CET)
Received: from localhost ([::1]:38608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOle-0006Z9-VM
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkO2r-0002f3-S8
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:03:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkO2k-0004NU-O2
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/CsFsu8Zo8W09D8GFWHobvxiqomcMaSYd8La8hhiJI=;
 b=Ft8E/T4Hzi/CseTrH7xkLYZJZtOvkcCrzYjEEfbJ/sMwdfvUvBNcGvzo/HBAuFGli+HTJ9
 ERhcY4qr6BWkzYK7LWuZRKAb/3frEDJ3cy3zAmsdrvhPQMnHw467+JcnjE9Ph7H3qTB0OC
 3e/fDghYgq+CWq+ZAV8yAX5pTaTfnmM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-3bYhvDLyNTyH3PGSqBUYLQ-1; Wed, 02 Dec 2020 04:03:19 -0500
X-MC-Unique: 3bYhvDLyNTyH3PGSqBUYLQ-1
Received: by mail-wm1-f72.google.com with SMTP id z16so1562164wma.1
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I/CsFsu8Zo8W09D8GFWHobvxiqomcMaSYd8La8hhiJI=;
 b=qXPbY0galfGiDz8nzo73fbnH8PXvkso7MC4MHrm+Vu+2YWCg29i+T0p6rBcsBS7LH8
 wc0eXwjK4ejKtmtQc2opqh9RBluPlonNxXTSB/2i/e/+WONQIAxB2FOKQVR8P9Au9ZC3
 g2sJRlaWD16eT+Qf1XbzNGlZIfqFxQHbIEB2Th3vzM1wGtws4okqHp8rauhVt8dCCo9m
 YHtzKrGF448vWE4vsZUvfTVcGSsMEKexbrpcRwBr/jHE7GvrlwG9vrnhf6g6t8+kmPZl
 pVSMdaO6/gtJBvKVbRjmBIc1JAPQ+VDNouHrBPEjWmHGWxb5/HJO7eIjcuwkQfqPbOMF
 1KjA==
X-Gm-Message-State: AOAM531RUtcaV2v6pZp4yAHaTqZamRZXBf7zXIKGNw7PDxoa1U0Ua3W/
 jxtNSEK7U1THVYcyaX2/qw2C9pmU+BcUN8F99x5SrERrDeC71T5pvMwHU4Xd/DrUuzyaTGiWkTX
 0AptZSRaZHwYYvT8=
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr2011752wmi.162.1606899798662; 
 Wed, 02 Dec 2020 01:03:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHmClAJ3WgiT3shKzFRTbNR3PcZ2NBtX9tm14s2H5tistp32GzRhXDrpUj0x78M+KzDUupxQ==
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr2011721wmi.162.1606899798413; 
 Wed, 02 Dec 2020 01:03:18 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id y6sm1224180wmg.39.2020.12.02.01.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:03:17 -0800 (PST)
Subject: Re: [PATCH v2 32/32] scripts: kernel-doc: remove unnecesssary change
 wrt Linux
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201201103502.4024573-1-pbonzini@redhat.com>
 <20201201103502.4024573-33-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a826644a-699a-517e-b7d6-deb81df6d878@redhat.com>
Date: Wed, 2 Dec 2020 10:03:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201103502.4024573-33-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 11:35 AM, Paolo Bonzini wrote:
> A comment in kernel-doc mentions QEMU's qatomic_set macro, but since
> this code originated in Linux we should just revert it and stay as close
> to the kernel's copy of the script as possible.
> 
> The change was introduced (more or less unintentionally) in QEMU commit
> commit d73415a31547, which did a global search-and-replace of QEMU's
> atomic access macros.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Typo "unneces[s]sary" in subject.


