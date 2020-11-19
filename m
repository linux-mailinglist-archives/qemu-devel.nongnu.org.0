Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89EF2B9513
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:50:01 +0100 (CET)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kflG4-0002pi-P6
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kflEh-0001OE-Vg
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kflEf-00068y-9a
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605797312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPpTjMVyVxdYWEJ478cYhxFn5hnCKqJzM3snnY2n91E=;
 b=WsuUd8pgQNevb7VU4zHVpG8gJCDDe2gL4FVjGArtDIB4eeTHrn3no0MGSyURf61XYmAo44
 OjdlW0cCDXBOFkYrFvUqzufgQezEC1qN4SRpB85n1U/nOW2LujW19zkLbPLNVlDC7rF/fe
 YhxJPyl0KzMSrGjMaPdur7m/pU4iCUQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-8mCPUAhFNdOmu61V5cuDVw-1; Thu, 19 Nov 2020 09:48:30 -0500
X-MC-Unique: 8mCPUAhFNdOmu61V5cuDVw-1
Received: by mail-wr1-f72.google.com with SMTP id w5so2073721wrm.22
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 06:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EPpTjMVyVxdYWEJ478cYhxFn5hnCKqJzM3snnY2n91E=;
 b=K7j+jjf57Na+82+IglJ0gM98ER6K8jtLrTUNADcRcYAMM3VmsEd8hvOygZZCWxQ7sr
 sdGmN6eB3/pQjuVbkHEQNT1GULI6lNhZdvdO7Su95SCZ+Wt0EFmwuzGXfqxwsyJfGDxn
 COORxKt5WDlK7b0LbxNMHuEL5U0xhmqK5DFd/sWXhWB2/tUziAUVhExE9blCIHQ+tQxq
 ERNzBl/UZzW9eLdwDpVduxrRLz/4/lQrYWsbVvIvtpksWGPcWfmyoXdRIEo3AG3otTtL
 RIZdd1tWlCZzXja3EvrSlrPHMyejLLliehqAElWI4k/jj2hUvOxXFdLyeDKuE3V5spGZ
 EE5w==
X-Gm-Message-State: AOAM530F59c7vvAKEZ5zsLX5rWkgOrwI9+GPnRMPfgxEhtX2Rk3PUEoO
 osJf41MVJlnMmw1OUATioPCg7pX8BwAiQqrqmwD4R4uBbSaeUlddI//7OkM5CjE19XmsHBGjjpc
 KTa22x4tH68F6dNk=
X-Received: by 2002:adf:e611:: with SMTP id p17mr11215635wrm.180.1605797309432; 
 Thu, 19 Nov 2020 06:48:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHFMwJXZbfo2PGnYyvsxZFAQFj5YbB2iDmh9qu8aAt2UiHi4QrAdjtJ2Jpu+Ez/vbxqxk+PQ==
X-Received: by 2002:adf:e611:: with SMTP id p17mr11215620wrm.180.1605797309293; 
 Thu, 19 Nov 2020 06:48:29 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id c6sm42720184wrh.74.2020.11.19.06.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 06:48:28 -0800 (PST)
Subject: Re: [PATCH v3] trace: use STAP_SDT_V2 to work around symbol visibility
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201119141457.844452-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <17ee8035-4259-46c4-dde1-10507ee56bc2@redhat.com>
Date: Thu, 19 Nov 2020 15:48:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119141457.844452-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 rjones@redhat.com, fche@redhat.com, kraxel@redhat.com, wcohen@redhat.com,
 Miroslav Rezanina <mrezanin@redhat.com>, ddepaula@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:14 PM, Stefan Hajnoczi wrote:
> QEMU binaries no longer launch successfully with recent SystemTap
> releases. This is because modular QEMU builds link the sdt semaphores
> into the main binary instead of into the shared objects where they are
> used. The symbol visibility of semaphores is 'hidden' and the dynamic
> linker prints an error during module loading:
> 
>   $ ./configure --enable-trace-backends=dtrace --enable-modules ...
>   ...
>   Failed to open module: /builddir/build/BUILD/qemu-4.2.0/s390x-softmmu/../block-curl.so: undefined symbol: qemu_curl_close_semaphore
> 
> The long-term solution is to generate per-module dtrace .o files and
> link them into the module instead of the main binary.
> 
> In the short term we can define STAP_SDT_V2 so dtrace(1) produces a .o
> file with 'default' symbol visibility instead of 'hidden'. This
> workaround is small and easier to merge for QEMU 5.2 and downstream
> backports.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1898700
> Cc: wcohen@redhat.com
> Cc: fche@redhat.com
> Cc: kraxel@redhat.com
> Cc: rjones@redhat.com
> Cc: ddepaula@redhat.com
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
> v3:
>  * Tweak commit description for clarity [danpb]
>  * Add Buglink tag
>  * Add explanation comment into ./configure [Philippe]
>  * Add Reviewed-by tags
> v2:
>  * Define STAP_SDT_V2 everywhere [danpb]
> ---
>  configure         | 7 +++++++
>  trace/meson.build | 4 ++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 714e75b5d8..796cec14de 100755
> --- a/configure
> +++ b/configure
> @@ -4832,6 +4832,13 @@ if have_backend "dtrace"; then
>    trace_backend_stap="no"
>    if has 'stap' ; then
>      trace_backend_stap="yes"
> +
> +    # Workaround to avoid dtrace(1) producing a file with 'hidden' symbol
> +    # visibility. Define STAP_SDT_V2 to produce 'default' symbol visibility
> +    # instead. QEMU --enable-modules depends on this because the SystemTap
> +    # semaphores are linked into the main binary and not the module's shared
> +    # object.

Thanks!

> +    QEMU_CFLAGS="$QEMU_CFLAGS -DSTAP_SDT_V2"
>    fi
>  fi
>  
> diff --git a/trace/meson.build b/trace/meson.build
> index d5fc45c628..843ea14495 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -38,13 +38,13 @@ foreach dir : [ '.' ] + trace_events_subdirs
>      trace_dtrace_h = custom_target(fmt.format('trace-dtrace', 'h'),
>                                     output: fmt.format('trace-dtrace', 'h'),
>                                     input: trace_dtrace,
> -                                   command: [ 'dtrace', '-o', '@OUTPUT@', '-h', '-s', '@INPUT@' ])
> +                                   command: [ 'dtrace', '-DSTAP_SDT_V2', '-o', '@OUTPUT@', '-h', '-s', '@INPUT@' ])
>      trace_ss.add(trace_dtrace_h)
>      if host_machine.system() != 'darwin'
>        trace_dtrace_o = custom_target(fmt.format('trace-dtrace', 'o'),
>                                       output: fmt.format('trace-dtrace', 'o'),
>                                       input: trace_dtrace,
> -                                     command: [ 'dtrace', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
> +                                     command: [ 'dtrace', '-DSTAP_SDT_V2', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
>        trace_ss.add(trace_dtrace_o)
>      endif
>  
> 


