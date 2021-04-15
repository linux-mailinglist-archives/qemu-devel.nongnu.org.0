Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DC1360A36
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 15:10:17 +0200 (CEST)
Received: from localhost ([::1]:49138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1lA-00049e-IQ
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 09:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1hg-00018A-By
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:06:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1hc-0003Du-Ah
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618491995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puBMi4NDnOD5ITFXisCSQxIlqEU05HUp46wCpGId5Ok=;
 b=bRfcbVHfxyqPaE4Bd7Z2h5a53FpTmUKg+/0/A++Y+/bzFscOmvLYmUvVyD71SKaHhX8t1A
 26R+G4lPk8CSw0NhZFbv+VzRmqacYRJ33W5QYzwEPIutNmmLJdKiRYnG7vncVkoGWxtxTm
 GJFHVNqlsu3j1AwE0QwDBcvDnXy1Z5w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-ZJu0BiUNPI6XkfXwkmZqjg-1; Thu, 15 Apr 2021 09:06:33 -0400
X-MC-Unique: ZJu0BiUNPI6XkfXwkmZqjg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j187-20020a1c23c40000b0290127873d3384so3254911wmj.6
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 06:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=puBMi4NDnOD5ITFXisCSQxIlqEU05HUp46wCpGId5Ok=;
 b=ehAmO44nAtqef//s47WU49KBxCg48whMFrGEEkNHUaV3MwUZqP/Z8U8EVWkaaZkYGd
 uytKS/wqC2tUtg0RDTsRNCa61TqjPN6yr4XZUefRTNotNDM3jqr9F9bkwJ1JSfBKFpLQ
 fEcMmDYsGMxpnr3zbey7yeVa6KQruva/mHoNG6JwjOt0auzSIKR+sejUPHkFDVKdRYdC
 UyIu8nPu5hhWJtXcTCIjhIk/73vj3Hqr7e9HESLG3NdyUGqnIdMMSPBN8qtLENzkFb7P
 tbuq0lDdaO0VWi1kzVlfgBfYKllIRMS1RKpbk8rQoF+PE8VUl010g8N9fnlFUCsNe7Iv
 9bUQ==
X-Gm-Message-State: AOAM532eaWYYLnCOJz4P5sDNGT28RfIWL8nwtWY/0c3t9hgO8D6Bc6rr
 LkV9a/ZJ0htdPvPfQQxYBIi3OeOqLXKvSV2EKMZN9pIHPnjfSE0is8mBreQPqA2MtbmFso8Wa5Q
 mEQ0RLlGE9yPtkqM=
X-Received: by 2002:a1c:60c2:: with SMTP id u185mr3033667wmb.157.1618491992691; 
 Thu, 15 Apr 2021 06:06:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGXysR1r9aW1RxD1iY/a3eQdoef0tPTaY4UwERfUdZwilZOfbtEU0QMhKZ5tyhtgDt86HnoQ==
X-Received: by 2002:a1c:60c2:: with SMTP id u185mr3033647wmb.157.1618491992496; 
 Thu, 15 Apr 2021 06:06:32 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u8sm3106010wrr.42.2021.04.15.06.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 06:06:32 -0700 (PDT)
Subject: Re: meson incorrectly detects libcurl as present even if it spots
 that its dependencies are missing
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8xHxCGhh2hibsdCxZrYRRU+xcwVsa85O7KL9BsmW7ohw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3e0214a-64ef-944c-d21a-87da6c71a2fa@redhat.com>
Date: Thu, 15 Apr 2021 15:06:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8xHxCGhh2hibsdCxZrYRRU+xcwVsa85O7KL9BsmW7ohw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 2:29 PM, Peter Maydell wrote:
> My build of system-emulation with --enable-static seems to have
> broken at some point since the last time I had cause to run it.

Maybe a side-effect of commit d7dedf428fe tri-state?
("meson: accept either shared or static libraries if --disable-static")

> Looking at the meson-log the cause seems to be that meson enables
> libcurl support even though it has found that libcurl's dependencies
> aren't present as static libs:
> 
> Determining dependency 'libcurl' with pkg-config executable
> '/usr/bin/pkg-config'
> PKG_CONFIG_PATH:
> Called `/usr/bin/pkg-config --modversion libcurl` -> 0
> 7.58.0
> PKG_CONFIG_PATH:
> Called `/usr/bin/pkg-config --cflags libcurl` -> 0
> -I/usr/include/x86_64-linux-gnu
> PKG_CONFIG_PATH:
> Called `/usr/bin/pkg-config libcurl --libs --static` -> 0
> -L/usr/lib/x86_64-linux-gnu -L/usr/lib/x86_64-linux-gnu/mit-krb5
> -lcurl -lnghttp2 -lidn2 -lrtmp -lpsl -lnettle -lgnutls
> -Wl,-Bsymbolic-functions -Wl,-z,relro -lgssapi_krb5 -lkrb5 -lk5crypto
> -lcom_err -llber -lldap -llber -lz
> PKG_CONFIG_PATH:
> Called `/usr/bin/pkg-config libcurl --libs --static` -> 0
> -L/usr/lib/x86_64-linux-gnu/mit-krb5 -lcurl -lnghttp2 -lidn2 -lrtmp
> -lpsl -lnettle -lgnutls -Wl,-Bsymbolic-functions -Wl,-z,relro
> -lgssapi_krb5 -lkrb5 -lk5crypto -lcom_err -llber -lldap -llber -lz
> None of 'PKG_CONFIG_PATH' are defined in the environment, not changing
> global flags.
> WARNING: Static library 'nghttp2' not found for dependency 'libcurl',
> may not be statically linked
> WARNING: Static library 'psl' not found for dependency 'libcurl', may
> not be statically linked
> WARNING: Static library 'gssapi_krb5' not found for dependency
> 'libcurl', may not be statically linked
> WARNING: Static library 'krb5' not found for dependency 'libcurl', may
> not be statically linked
> WARNING: Static library 'k5crypto' not found for dependency 'libcurl',
> may not be statically linked
> Run-time dependency libcurl found: YES 7.58.0
> 
> 
> This seems wrong to me -- if meson is smart enough to spot that
> it's not actually going to be able to statically link libcurl
> because of all those missing static libs, it should determine that
> it has not found a working libcurl, rather than saying that it has
> and letting the build proceed until the final link of executables fails.
> 
> thanks
> -- PMM
> 


