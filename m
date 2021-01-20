Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA9D2FD63C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:58:59 +0100 (CET)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Gos-00049Y-Ho
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Gmo-0002rW-Id
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:56:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Gmk-0000bp-EL
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611161804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R1T08nEgYMiY0rA6TG/w2u5PAIKxZd6AmgmJHp3boPU=;
 b=K9fxYw7+nUNv8cNfC/d3J2lM/FYm1XiLl2mLPB78rfqg4VK5sT/PVZRbXSTjyELTqMHtj/
 A/bbLem1OKEaMRU/hN+Ms8qenWfUDo7MpHSbXNYNaOMLaDNF4sYzXvlgUWw7gm9b4HrPGN
 nZTJo92BHJD7UcPKB6YY8yjVkGzFeCA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-xHf97NcpPkihLNevs11Eqg-1; Wed, 20 Jan 2021 11:56:42 -0500
X-MC-Unique: xHf97NcpPkihLNevs11Eqg-1
Received: by mail-ed1-f72.google.com with SMTP id o19so4692399edq.9
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R1T08nEgYMiY0rA6TG/w2u5PAIKxZd6AmgmJHp3boPU=;
 b=M0oRJeUT8RAPvHcMLOmA2SasTUdrGVRYxg+1FBc81d9G/MCJKDWIR/iMCg17niK62g
 Acz9uZT8e3SFpJWXDPQJ1F3906fKlJ5CpYhFEdUkDn7aANNoy6e/+ELW0lOy0NcuRe0c
 hYUaWBxfn77dtA/vxv3RT/kDucqc7yjbiaBBlKqLJ7IvYB6V9iq00iszYGWRQBTzjMZR
 jOS/o0wshFmTOS6Gd3TEaa+AESjjvT16ELM7KlpUwAElkA51rrfyXs6RJybQ8cpG4GHO
 eYhDtaPDZxxapDEJl6cuEGJIyrP4994LmGUr1lKy9suvAq5NGMuM10Zs+b5RRGFmAvJo
 OFPg==
X-Gm-Message-State: AOAM532EHTXnAUAWRUG6gkYi+V4IYlxbVQaUcMt6v6KjddlQPXEkSrSp
 6FSn7WjeM7YsqaM47PaAiF/BSIa7UA4nUh0IJhy7b1abA7qI/Ga9r0ejt/bw2dqMt1wYcsdbW+l
 xQ2KTUday/DihEb0=
X-Received: by 2002:a17:906:780c:: with SMTP id
 u12mr6495994ejm.125.1611161801140; 
 Wed, 20 Jan 2021 08:56:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz7yqJY2tuHODH6PwVofdiMhxY/GSUXlAM+5oAm12ydBKJ83/EZKRaFBH6wVrQYv12ZDc1dw==
X-Received: by 2002:a17:906:780c:: with SMTP id
 u12mr6495988ejm.125.1611161800966; 
 Wed, 20 Jan 2021 08:56:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w4sm1421870eds.40.2021.01.20.08.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 08:56:39 -0800 (PST)
Subject: Re: [PATCH] meson: Declare have_virtfs_proxy_helper in main
 meson.build
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210120151539.1166252-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <79f7eccd-8e7f-1b2c-4bb3-cb972ca10a2c@redhat.com>
Date: Wed, 20 Jan 2021 17:56:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120151539.1166252-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/21 16:15, Philippe Mathieu-Daudé wrote:
> have_virtfs_proxy_helper is used from docs/meson.build, and can be
> not declared when including it before fsdev/meson.build. This fixes:
> 
>    ../docs/meson.build:54:2: ERROR: Unknown variable "have_virtfs_proxy_helper".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   meson.build       | 2 ++
>   fsdev/meson.build | 1 -
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 3d889857a09..8f5a8b997d3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1032,6 +1032,8 @@
>       libattr.found() and
>       libcap_ng.found())
>   
> +have_virtfs_proxy_helper = have_virtfs and have_tools
> +
>   if get_option('virtfs').enabled()
>     if not have_virtfs
>       if targetos != 'linux'
> diff --git a/fsdev/meson.build b/fsdev/meson.build
> index 65455a179e5..adf57cc43ed 100644
> --- a/fsdev/meson.build
> +++ b/fsdev/meson.build
> @@ -8,7 +8,6 @@
>   ), if_false: files('qemu-fsdev-dummy.c'))
>   softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
>   
> -have_virtfs_proxy_helper = have_tools and libattr.found() and libcap_ng.found() and have_virtfs
>   if have_virtfs_proxy_helper
>     executable('virtfs-proxy-helper',
>                files('virtfs-proxy-helper.c', '9p-marshal.c', '9p-iov-marshal.c'),
> 

Queued, thanks.

Paolo


