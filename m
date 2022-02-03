Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F904A8C31
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:07:28 +0100 (CET)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhS2-00028p-2A
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:07:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFgzm-0000X1-TX
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:38:17 -0500
Received: from [2a00:1450:4864:20::52b] (port=37809
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFgzj-0008DQ-TV
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:38:13 -0500
Received: by mail-ed1-x52b.google.com with SMTP id c24so8008261edy.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 10:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wOMqUYSypuPK63MJ5uFjZhI2zODiDRfAU3a5XhA8yts=;
 b=obILn5ctyhmaAYcB2I4zntw3VRYiWYhLRUFravNAfCVLl43DWGHwkSjKbi+CxprdS5
 tKmdMuCADxi33yEa8F/GaSIhw1/K9qp7pvQsVhdEEg472YXmPqVyvOiqG8BC3aUkSeOg
 rpIYQOSxXAeJDAmBLB/mp+a4bJmjJt1dcbXBCPosl1QUcNx7cz+D4+TXwR2mqxgbbC1M
 /DRPhKI00DV9mBLi6LH7jVm6xOuWlzMcg4QZqfOyDP/IgY2BXrR81CoedKrlDyMb3Vcu
 t8H7I+lR9yYQDrzRitCmFyUVZuEB/t2b4D5F2IllkxGh42nrEs1SaQMDZjKvzZ/4YyJK
 Abdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wOMqUYSypuPK63MJ5uFjZhI2zODiDRfAU3a5XhA8yts=;
 b=Shmg3Cm2xkHtbA7/WdO7s18oEttwlGRjUfmg/NzKdwE6xULFK/zvYvV/VUzVNp1NPH
 kqVvlCpMmMGu4ExYbvsD74j1jG78AYfaKwwVeMkPiNf05ukV45fPIkNlljiCnJo+tjZ2
 HS1evfQ5Qxu1Ak9VLBgaruV2GYU0F72P4oNzZ4i2gorMJ4krplkl2gsZrde8mFm4eXBc
 fOGewMsyNroQBKsd7ym8MVSXKc51xVAhSaiigZh1vGs/VlHZzKYQWVi6HczCwslQ2o8o
 D/N3r1zoGIgomYg9v53hnv1xpqTc+VnWTKQFeIVHelcMYlm9mqdz8bLPigp9LO1Xxqsv
 D+OQ==
X-Gm-Message-State: AOAM533Dv/b2/jWT6yWd2RTf/UpuHBu2cK7Smp1uZQWCaturhhlfyDmc
 pEVFefdAaH2rt6ywY01iUUU=
X-Google-Smtp-Source: ABdhPJyxNcaRCjmpA3cThflYsNcRNULJVK1KcTcQZLXYCfzuE0vKxBAnHnbyLX9WQhr/2b3KbvqCFw==
X-Received: by 2002:a05:6402:7d7:: with SMTP id
 u23mr15089435edy.451.1643913489504; 
 Thu, 03 Feb 2022 10:38:09 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id c8sm22683423edr.70.2022.02.03.10.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 10:38:09 -0800 (PST)
Message-ID: <c8b8434f-17c2-5a50-bc7f-49bb7fa9f7b9@redhat.com>
Date: Thu, 3 Feb 2022 19:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/3] qmp: Support for querying stats
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Mark Kanda <mark.kanda@oracle.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-2-mark.kanda@oracle.com>
 <YfkiyiK+jfrdbVcY@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YfkiyiK+jfrdbVcY@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 13:08, Daniel P. Berrangé wrote:
> I still feel like this is rather verbose, and should be simplified
> down to.
> 
>   { "return": {
>       "vm": {
>         "kvm": [ ... ]
>         "provider-XYZ": [ ... ],
>         ...
>       }
>   }

My main qualm with this is that not just QEMU, but every layer above 
then needs to either treat stats as a "dynamic" type unless they want to 
only handle providers that they know.

The main reason why I asked Mark to do all this work, was so that new 
stats and stats providers could be added transparently, and only new 
*targets* would need work all over the stack (but those are fewer, for 
example blockdev/netdev/iothread).

Paolo

