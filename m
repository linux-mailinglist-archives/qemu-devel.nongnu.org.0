Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B0137B6D0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:24:40 +0200 (CEST)
Received: from localhost ([::1]:41076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjEV-0005bM-9Y
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjDQ-0004vP-0E
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:23:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjDN-0004z8-Rk
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620804209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAQAnlGqZcO9VLPef0pmWmzPLGEx3U1k+GCPFulyVNk=;
 b=AKVkaV3ac0UUbemBc31wPWYeaCxxBKa97CRLCc9BIDmynTUjIau1WBcqC7ld41Uymxi6YR
 9IRaRB/nIrDFjjfdS2o+fVru8PZPuQah4ek3f8yrDo+eyiiQMclrEPUpNcgp9xuWXV0Fgg
 iwGuT9rfBWaIklQZMInpuKouM8Rz/vU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-d53JaphqPqy1op8RT9tiUg-1; Wed, 12 May 2021 03:23:22 -0400
X-MC-Unique: d53JaphqPqy1op8RT9tiUg-1
Received: by mail-ed1-f71.google.com with SMTP id
 g19-20020a0564021813b029038811907178so12314275edy.14
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pAQAnlGqZcO9VLPef0pmWmzPLGEx3U1k+GCPFulyVNk=;
 b=Nf9l+lcyNrUG5n3E+eUQeD91zszfIj9+CS4N8zg99uEj36UFbd58c0Pou5+Kuqe4Tg
 lgIqQgcl8WG/rjbsYsQZ4INDG8lCMzWCBVWKMad5gGxTfkGs9arVeAHaUj+EWUa+a4Az
 /oAQ4ETSuG36NYLpBt51M9+H4RzYk8lyudBjjZ2AuaJuFWbqUmiV9faEyDT7/gi57SQy
 ggDtyj+A7L8khiENAtYuPP6t4dPcvDbndqsuXpcZmEZBkBWFtfLnJ3fnty9HWHcO7s4D
 poAeMqYt3XiIPOx9HQJtzJS6Xqx8AiLWg/yqfLDMKyYBGYQLBLlrJBaYQD/pcjxkaTqc
 70pw==
X-Gm-Message-State: AOAM53122r+ptsg9NHvMq+QWPACQwIBfptjd5jXWom0OlFvMP7hYGp/6
 Z4hZL5ACrna7XvHvE5OKZCb33Oj0YxZ3RGWbtwa7kO2YOlQ3myLx60UDBaThbKwTc04xLAROtgo
 BSTmAwH0jgPBbpDg=
X-Received: by 2002:aa7:c610:: with SMTP id h16mr40862677edq.202.1620804201163; 
 Wed, 12 May 2021 00:23:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBsDYxH3NG2s9mNhG0uFe08O2RQH3bnG8Qbh5A9c4uKQybH1KlBldsC3Y5jH2fuprl0GMB2A==
X-Received: by 2002:aa7:c610:: with SMTP id h16mr40862656edq.202.1620804200959; 
 Wed, 12 May 2021 00:23:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p13sm13164710ejr.87.2021.05.12.00.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 00:23:20 -0700 (PDT)
Subject: Re: [PATCH] configure: Only clone softfloat-3 repositories if TCG is
 enabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210512045821.3257963-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d5f979aa-876b-ccbe-e664-69327613c9ad@redhat.com>
Date: Wed, 12 May 2021 09:22:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512045821.3257963-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Thomas Huth <thuth@redhat.com>, "Emilio G . Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/21 06:58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   configure | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 5877a6b2bfe..e0e02623e3e 100755
> --- a/configure
> +++ b/configure
> @@ -257,8 +257,6 @@ if test -e "$source_path/.git"
>   then
>       git_submodules_action="update"
>       git_submodules="ui/keycodemapdb"
> -    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
> -    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
>   else
>       git_submodules_action="ignore"
>       git_submodules=""
> @@ -2277,6 +2275,11 @@ if test "$solaris" = "yes" ; then
>     fi
>   fi
>   
> +if test "$tcg" = "enabled"; then
> +    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
> +    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
> +fi
> +
>   if test -z "${target_list+xxx}" ; then
>       default_targets=yes
>       for target in $default_target_list; do
> 

Queued, thanks.

Paolo


