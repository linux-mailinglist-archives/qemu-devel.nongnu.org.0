Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49995A11AA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 15:14:29 +0200 (CEST)
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCgh-0000Re-VT
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 09:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRCXW-0001yK-WD
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRCXQ-0005p5-AC
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661432687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BH5bJ5qZx8fBJWD77+s4IGGKvOQ6N7S0tGLF3PxvJYc=;
 b=XFNnsn/mOiBpklTteWy8IZFz7ukqaKYe6A/r66zBN1fiIx7QTbOIX6UusAjxqEQ2WAkWFz
 FYZhvy6+QcCEg2V1SFVrMRfDum1CvMkQkGyN/G96zy3tFH3k9PbjQ1mV4CbLGGVvLSPAN2
 gFegDQVrW3brcBQWKVND3CcHUBAbD1s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-YR9t0ZGQNOKqjkLwF09WCQ-1; Thu, 25 Aug 2022 09:04:46 -0400
X-MC-Unique: YR9t0ZGQNOKqjkLwF09WCQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 az42-20020a05600c602a00b003a552086ba9so2437387wmb.6
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 06:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=BH5bJ5qZx8fBJWD77+s4IGGKvOQ6N7S0tGLF3PxvJYc=;
 b=O3D5Wg3wfDAGwaXnqzRaVHC7O+vvX3pL1COj+YXqh7EX6PWgRuTO/OIiBdWUb5/fJF
 O2l+IjCvDrUHArRPuaOS7n9yoVIZcNfyk8O4mwCggEbo2G31eVvGGXF8/tK9m3uWtzeC
 aWJmoUkPqbD8YKA3BIl0sbsbGzxqJbm5Y6VGZVWYdaMvO1xbaWc+W9o7muq88TDEMcA+
 nCcTmbXr9n+Wg536Rv30ToVOCm7LNDE9Q65W2aaRVum9KcdYNuCDwNvrJ5GA9IkWn8hV
 NiGuhiwrbdaYo3hGvfN8w7XDbB9jy84KJz70NGZ0GVNQPoBlT7El3akLhM1zArSATzWU
 xJdw==
X-Gm-Message-State: ACgBeo0Z8h1Uh6kIdyBxUxAk++UVGSaZ3yes8e9i1IVRf5HlrMsgvl1w
 n7LCpbiiANJClT/gjUDZ9P3wQ2tY4DpwR5gsJLddNR5fjqffJ7CxXa0qhiXnshCyIr7tLnr8sco
 bfO16oioQLlOhoBg=
X-Received: by 2002:a05:6000:1ac8:b0:220:8168:126b with SMTP id
 i8-20020a0560001ac800b002208168126bmr2290386wry.288.1661432685069; 
 Thu, 25 Aug 2022 06:04:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6HEo7agHUzTsxbkrEOzcF5b4Cmjj4ihk1Kx0XjIWoL0Dgzdrb2w0KhwDw/5t51eiVtP7UNJQ==
X-Received: by 2002:a05:6000:1ac8:b0:220:8168:126b with SMTP id
 i8-20020a0560001ac800b002208168126bmr2290364wry.288.1661432684847; 
 Thu, 25 Aug 2022 06:04:44 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b003a4f1385f0asm6094323wmq.24.2022.08.25.06.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 06:04:44 -0700 (PDT)
Message-ID: <dbb7f0fd-22e6-a5e0-88ce-5810290170ce@redhat.com>
Date: Thu, 25 Aug 2022 15:04:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 27/51] tests/qtest: Use send/recv for socket communication
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-28-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-28-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2022 11.40, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Socket communication in the libqtest and libqmp codes uses read()
> and write() which work on any file descriptor on *nix, and sockets
> in *nix are an example of a file descriptor.
> 
> However sockets on Windows do not use *nix-style file descriptors,
> so read() and write() cannot be used on sockets on Windows.
> Switch over to use send() and recv() instead which work on both
> Windows and *nix.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/libqmp.c   | 4 ++--
>   tests/qtest/libqtest.c | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
> index ade26c15f0..995a39c1f8 100644
> --- a/tests/qtest/libqmp.c
> +++ b/tests/qtest/libqmp.c
> @@ -36,7 +36,7 @@ typedef struct {
>   
>   static void socket_send(int fd, const char *buf, size_t size)
>   {
> -    size_t res = qemu_write_full(fd, buf, size);
> +    ssize_t res = send(fd, buf, size, 0);

This way we're losing the extra logic from qemu_write_full() here (i.e. the 
looping and EINTR handling) ... not sure whether that's really OK? Maybe you 
have to introduce a qemu_send_full() first?

  Thomas



