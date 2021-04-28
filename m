Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8995636D9E7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:53:33 +0200 (CEST)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblZE-00046M-Io
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lblYG-0003Gd-CF
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lblYE-0007sv-Jo
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619621549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNCwhcll3/4y+2Vskt4kh23AsRJwKCCdvf6mEg6HRhI=;
 b=W7QMKIKvOxSwg4UkbQMiK8D6kUh/o2HXH/uyHu5SMijavlupss9V2EF2xKYG0rGmzedwJP
 +bTYac2Kifst785t/tOyOjnCfCq/+vni9HNzQrYholjDAQy1/oG6yGy7lXQoEk9UL6gO21
 8fie8afI496UnZGXW/ap3NanCe6sHgM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-X0QJ4D7_NgicTm83ZvhdSQ-1; Wed, 28 Apr 2021 10:52:27 -0400
X-MC-Unique: X0QJ4D7_NgicTm83ZvhdSQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 89-20020adf83e20000b029010c35eb9917so4551821wre.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bNCwhcll3/4y+2Vskt4kh23AsRJwKCCdvf6mEg6HRhI=;
 b=Ny8EVWTh0aD7MJ/CCnMkR+KsF5VjO7/thNzFbvxW39kAJ/FSSbtaX7NoScflnPgmFq
 oj+P8LwQVOVwUFwi8hdBXNwZi0rkr7Jmq0y09GWAy8q+anocB+x0se4CvTonh7yWIgxH
 W0qNbQzvWjqbuDByDcsimxM1jb9XEkJXTyg3BREtM2csVAf1bI5JSYYD06wNgBasFOKt
 EVEsHH4W7shoyk78Xqx53MKICl+ma4Ph4ojuHNbxM7cRY9kJZK+qTfiCxhAWPJeuY6ac
 kCeRbzZ2J2PH9ErNNEvOFi9nMWIOmuPAJvFoii9sPCffn+s6FLIbJriXAOh7fCDay4Iq
 EYiQ==
X-Gm-Message-State: AOAM5308k6Ta8zsh/U+vfEKtfJIEM7OZqAtiDnTPrZpVmw9sY/X74abi
 SVdcNMCQv2tv3CS7QW4Lf0nhs9fXedsCRITnWnRuizkFN5UrcgVKLHGpSut7HteFNOweIVgoFbh
 UtxU8ezJwpyChBwM=
X-Received: by 2002:a05:6000:18ae:: with SMTP id
 b14mr36540921wri.211.1619621546539; 
 Wed, 28 Apr 2021 07:52:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz57u3M5S4qDU4b/oebYUthPzyh2r9cvggAowbA13K4LnnRKjp1Yy096JksmDIS1CoZAzcXXA==
X-Received: by 2002:a05:6000:18ae:: with SMTP id
 b14mr36540902wri.211.1619621546368; 
 Wed, 28 Apr 2021 07:52:26 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j13sm197706wrw.93.2021.04.28.07.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:52:26 -0700 (PDT)
Subject: Re: [PATCH 2/2] util/meson: Build iov/hexdump/buffer_is_zero with
 virtiofsd
To: qemu-devel@nongnu.org
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-3-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <baed1872-7a87-2aae-a042-0cfaf280ad9d@redhat.com>
Date: Wed, 28 Apr 2021 16:52:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428144813.417170-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 4:48 PM, Philippe Mathieu-Daudé wrote:
> When not explicitly select a sysemu target or the QEMU tools and
> building virtiofsd, libqemuutil.a has missing symbols:
> 
>   /usr/bin/ld: tools/virtiofsd/virtiofsd.p/fuse_virtio.c.o: in function `virtio_send_msg':
>   tools/virtiofsd/fuse_virtio.c:236: undefined reference to `iov_size'
> 
>   /usr/bin/ld: libqemuutil.a(util_iov.c.o): in function `iov_hexdump':
>   util/iov.c:240: undefined reference to `qemu_hexdump'
> 
>   /usr/bin/ld: libqemuutil.a(util_iov.c.o): in function `qemu_iovec_is_zero':
>   util/iov.c:494: undefined reference to `buffer_is_zero'
> 
> Fix by linking bufferiszero/hexdump/iov objects when building
> virtiofsd (regardless of sysemu / tools).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  util/meson.build | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/util/meson.build b/util/meson.build
> index 510765cde46..c2eda2d1374 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -59,12 +59,10 @@
>    util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
>    util_ss.add(files('base64.c'))
>    util_ss.add(files('buffer.c'))
> -  util_ss.add(files('bufferiszero.c'))
>    util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
>    util_ss.add(files('hbitmap.c'))
> -  util_ss.add(files('hexdump.c'))
>    util_ss.add(files('iova-tree.c'))
> -  util_ss.add(files('iov.c', 'qemu-sockets.c', 'uri.c'))
> +  util_ss.add(files('qemu-sockets.c', 'uri.c'))
>    util_ss.add(files('lockcnt.c'))
>    util_ss.add(files('main-loop.c'))
>    util_ss.add(files('nvdimm-utils.c'))
> @@ -83,3 +81,9 @@
>                                          if_false: files('filemonitor-stub.c'))
>    util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
>  endif
> +
> +if have_block or config_host.has_key('CONFIG_VHOST_USER_FS')
> +  util_ss.add(files('hexdump.c'))
> +  util_ss.add(files('bufferiszero.c'))

Doh it isn't sorted :/ and maybe better subject:
"Build virtiofsd with iov/hexdump/buffer_is_zero objects"?

> +  util_ss.add(files('iov.c'))
> +endif
> 


