Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBB34CFB4F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:35:00 +0100 (CET)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAhf-0002Gb-Qf
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:34:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRAKh-0000x8-4B
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:11:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRAKe-0004DD-AY
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWw6FgwYx7bv6PZP+h9r4mJsOY7iZMaFopfnU6wShhU=;
 b=da1mplcrVPhJQvaSEdCa6el9zACH2Nk1wW9ehii0VSaT+mgNEyH8gpCgbzdamtmOJ4zLS0
 vtWaMn3+5zz86FeLM9gKKj4/6hZsN56R/9OOLyQ1Jpqy989sDNN1XdqCkzYtssRHXv3Hwz
 o9B3HDmhOvRTS0RHjjmteA+gYgHHnxs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-bHxbRU2kPFOdUpNY9YkFIQ-1; Mon, 07 Mar 2022 05:11:09 -0500
X-MC-Unique: bHxbRU2kPFOdUpNY9YkFIQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so7680800wme.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IWw6FgwYx7bv6PZP+h9r4mJsOY7iZMaFopfnU6wShhU=;
 b=Xh2IS35FUjYnJ9cAVJCEqHq95AuhtSVOLsa9eLTeZkvt8kMIkLKn0nCnneoKrcBDoh
 xG4zPB+eRcnhs1pL5Ue9wzYw/J4iIaYrarHjDQ4e3gQ6gVVyBMvpWuTUDRgQaztixUpF
 biMTBDF53kdQWGqdC96w0nOhpYEfMXZiEje92WVrew3wdIbwHZLSb9sYr9Q3gwFGQFQ3
 NQtVFXswHfgRFBSBbUDNJ5XyYRYYaxX5nly90mvDnMOx0F6ex0AWaKGNxlNwJqkOkNaN
 9Xc3fU/0DOzC21A5NISqHLOvbzeKBrpJ7j0ZAyy2km1AzW521uYWpWyCxXhY3jnDlqrl
 fHUQ==
X-Gm-Message-State: AOAM530faa+Jgx0Fng9DjUtWFF1P8MP+qbIKla7v8ucBD6+faK39/0i7
 ro0RLN/OgNi88jIg9jF/XxsL4p+/XlfYuCpNx1jZETaBYxB6KcTbXnbVVErn8HDi88tK+/RkPYf
 AKsu4l6f0WdaSYgs=
X-Received: by 2002:a05:600c:588:b0:389:9e5f:59d3 with SMTP id
 o8-20020a05600c058800b003899e5f59d3mr5869067wmd.35.1646647868793; 
 Mon, 07 Mar 2022 02:11:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydUzMDFSybbuZNEpR2onfZ5VlZrj5dHtzfIjK2l7hp2jD1Zl2NVynKGmlUDhIhe3+pGz7fSQ==
X-Received: by 2002:a05:600c:588:b0:389:9e5f:59d3 with SMTP id
 o8-20020a05600c058800b003899e5f59d3mr5869044wmd.35.1646647868473; 
 Mon, 07 Mar 2022 02:11:08 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b0038986a18ec8sm8647869wmq.46.2022.03.07.02.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:11:08 -0800 (PST)
Message-ID: <e4a80a6d-ab9b-8d9d-11d4-dd395ac7d347@redhat.com>
Date: Mon, 7 Mar 2022 11:11:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 08/18] tests: merge code for UNIX and TCP migration
 pre-copy tests
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-9-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220302174932.2692378-9-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/2022 18.49, Daniel P. Berrangé wrote:
> The test cases differ only in the URI they provide to the migration
> commands, and the ability to set the dirty_ring mode. This code is
> trivially merged into a common helper.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   roms/seabios                 |  2 +-
>   tests/qtest/migration-test.c | 86 ++++++++++++++++--------------------
>   2 files changed, 40 insertions(+), 48 deletions(-)
> 
> diff --git a/roms/seabios b/roms/seabios
> index 6a62e0cb0d..2dd4b9b3f8 160000
> --- a/roms/seabios
> +++ b/roms/seabios
> @@ -1 +1 @@
> -Subproject commit 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9
> +Subproject commit 2dd4b9b3f84019668719344b40dba79d681be41c

Did you really want to update the submodule here?

  Thomas



