Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30659432E74
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:39:38 +0200 (CEST)
Received: from localhost ([::1]:51120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcimf-0003KS-9o
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mcikm-0001Cn-2K
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mcikk-0003Cp-8N
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634625457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqEJ+JDwI4hyP7ukXN0YkRs2dBr1I6uwVUeoyovqGeI=;
 b=iiMgT2ra28Ryxg/A7PdTYXTAQbpZxPya5LV4vvaBeDVoQ/LnGpKpjW2+s4OqOMWPrKDcDG
 5zBbQ0baOwvs1KSS4PyKlGCPEluOzZtlMrqRksat1WKldRc0NhGwzN10L0BwpdsP1sLwA0
 hqSpqleJ7TsbQZI3WcCLQJj3bT16msw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-C8k0fhoYOd-ZpGTZtNUHpw-1; Tue, 19 Oct 2021 02:37:29 -0400
X-MC-Unique: C8k0fhoYOd-ZpGTZtNUHpw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so2375519wmc.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eqEJ+JDwI4hyP7ukXN0YkRs2dBr1I6uwVUeoyovqGeI=;
 b=eGYrgGdtezrWBOfZHoGYgeURkHYISZSDcL50bDeAFv7EIGyT0oBtQYw2M9Y+qR7oTb
 5bWkpyQlGddT55sExsimW4xBfCaeWo8J53OTicfsxhRxkwJfeab1LDqTzFempXyDl6NJ
 UX0k9bKrcgJIjsMHYnxy+9XR1KW0bCaMlRZqxLRqVZHtsiC7EUccDxF6oWcejSowFgI9
 m7QRkYaUwfw3zVXxOfFGLqVNyo6wVHf/UJZa7OxO971NGCT94FLQNBx8I0jqdZiIqC/J
 EvfdW5/S+Sm72wbRzRK0ReMS5ZjSRNM6De8/CyxPR7+fYJJaA7b9g4khRlEPZM/fusVC
 Nt7w==
X-Gm-Message-State: AOAM533p1l2VrFS/FYObb1Mddhg3VO+t9wwy3Wjw9Bh2Z2JRT9XwjD7h
 LeopfDMZ6EHLryp1WO1RHjDoviVsEgPcVtO6nVwSBeiDSpsefq/v4+23ZdomwVcrsBvw5yaHtPm
 /jW8Ien7T0JspY/0=
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr41691297wrx.142.1634625448540; 
 Mon, 18 Oct 2021 23:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkEauAvaTpeQk7qab1ZalFWSmWWn61vdqTAE2QiX9aCYCQHt+1qLjs+xikKjIIej0gmPnHKA==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr41691282wrx.142.1634625448378; 
 Mon, 18 Oct 2021 23:37:28 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id 36sm13702404wrc.92.2021.10.18.23.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 23:37:27 -0700 (PDT)
Subject: Re: [PATCH] tests/vm/openbsd: Update to release 7.0
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211018205313.3526915-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6054fa06-e066-03fb-3870-9cf8120d0836@redhat.com>
Date: Tue, 19 Oct 2021 08:37:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018205313.3526915-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: brad@comstyle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/2021 22.53, Richard Henderson wrote:
> There are two minor changes required in the script for the
> network configuration of the newer release.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/vm/openbsd | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index c4c78a80f1..337fe7c303 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
>       name = "openbsd"
>       arch = "x86_64"
>   
> -    link = "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
> -    csum = "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
> +    link = "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
> +    csum = "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
>       size = "20G"
>       pkgs = [
>           # tools
> @@ -95,10 +95,9 @@ class OpenBSDVM(basevm.BaseVM):
>           self.console_wait_send("Terminal type",           "xterm\n")
>           self.console_wait_send("System hostname",         "openbsd\n")
>           self.console_wait_send("Which network interface", "vio0\n")
> -        self.console_wait_send("IPv4 address",            "dhcp\n")
> +        self.console_wait_send("IPv4 address",            "autoconf\n")
>           self.console_wait_send("IPv6 address",            "none\n")
>           self.console_wait_send("Which network interface", "done\n")
> -        self.console_wait_send("DNS domain name",         "localnet\n")
>           self.console_wait("Password for root account")
>           self.console_send("%s\n" % self._config["root_pass"])
>           self.console_wait("Password for root account")

Works for me!

Tested-by: Thomas Huth <thuth@redhat.com>



