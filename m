Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DD6577CB6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 09:41:27 +0200 (CEST)
Received: from localhost ([::1]:39942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDLNd-0007dx-Nl
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 03:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDLLj-0006FK-4f
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:39:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDLLf-0000Vb-PY
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658129962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LCo6sRwLI/gVr1wQuI3zNqBVFjNYBVYGPsLwNxpBPQ=;
 b=IpnQH5Jp/ydgjIE0ncwcofns2i1H0aoW4gbIteq3ff2ohJ5UpLf0DKxea/6KV6lCg1tUoR
 b3zs/Y7a0Jn5W+RJVQ2CUq5ZlUv8MLvVzi18QDwRMfBuslhpNysAwNIeyk44B2T9nko6V7
 /RBjFLhOkAc8eELLH37mp/TDQn6bqBE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-edvV0ZW2OnSA8hVoztz_sg-1; Mon, 18 Jul 2022 03:39:20 -0400
X-MC-Unique: edvV0ZW2OnSA8hVoztz_sg-1
Received: by mail-wr1-f71.google.com with SMTP id
 e7-20020adfa447000000b0021d669c6a76so1782213wra.19
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 00:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4LCo6sRwLI/gVr1wQuI3zNqBVFjNYBVYGPsLwNxpBPQ=;
 b=gZAFTPjl0AkKYumYf98a/wwSAKJwBs1JmJnya+jchp43TxllsGJxq5BqyuHbslSx3J
 oTb+/F2MdHuHUzHHtyHqfLU6gjTrrnS/gM81QGpf0sUyXcQdYq21ec3Met5nSnm0Bgkr
 hhOz0lVPSi36yfC2rEBiamfw0y4K5od98wOWTmDgKVFLl/HrYeVSZ20Yg5Pi/xXSVDxU
 /3+4FY6lyA+yZdE6FgtlyYxZCxgrWIODsqw5ctEwTOURDKxaGKrgQO3lJGZc2ve5C3D0
 uGTvHvHby2NuRmcKTYJ3vQdJRIcpAAFrRZljJTbgQ8IwWD4tcrrkV4uS8qa+1YnTrxrS
 GKGw==
X-Gm-Message-State: AJIora/wJvLYtVQcccMi12vQlHKUoRWAiMBrbf6T8dYyzem6Ku27sSMe
 ZTMz/cvKlHa8F9XZZWVzIDchriIjn2FrhDzHFmCR9ou9paaVxyG8ouUNMiUmcbZZtqGpqDjOoow
 tFQmBFt6CdiaW1fk=
X-Received: by 2002:a5d:45c5:0:b0:21d:978e:f93 with SMTP id
 b5-20020a5d45c5000000b0021d978e0f93mr22034140wrs.134.1658129959096; 
 Mon, 18 Jul 2022 00:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tP1W18/pijL+Ij1bt+8f1RXVcGC9inOIs1vQM4LJsrvDXgsoWefuu1xzPcQQtFerOjdulIPw==
X-Received: by 2002:a5d:45c5:0:b0:21d:978e:f93 with SMTP id
 b5-20020a5d45c5000000b0021d978e0f93mr22034128wrs.134.1658129958903; 
 Mon, 18 Jul 2022 00:39:18 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 h14-20020a1ccc0e000000b003a2e7c13a3asm14439978wmb.42.2022.07.18.00.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 00:39:18 -0700 (PDT)
Message-ID: <d971f93d-eca1-102e-675a-90d704221eb9@redhat.com>
Date: Mon, 18 Jul 2022 09:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Building tools on unsupported cpu/arch
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <31fb2fcb-6ad0-b769-9ec9-94fba0679065@msgid.tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <31fb2fcb-6ad0-b769-9ec9-94fba0679065@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 30/04/2022 16.11, Michael Tokarev wrote:
> Hello!
> 
> Previously, it was possible to build qemu tools (such as qemu-img, or qemu-ga)
> on an unsupported cpu/architecture.  In a hackish way, by specifying
> --enable-tcg-interpreter on the ./configure line.
> 
> Today (with 7.0), it does not work anymore, with the following error
> during configure:
> 
>   common-user/meson.build:1:0: ERROR: Include dir host/unknown does not exist.
> 
> This is with --disable-system --disable-linux-user --disable-user.
> 
> And without --enable-tcg-interpreter, it gives:
> 
>   meson.build:390:6: ERROR: Problem encountered: Unsupported CPU m68k, try 
> --enable-tcg-interpreter
> 
> What's the way to build tools on an unsupported architecture these days?

  Hi Michael,

I think all required patches should now have been merged - could you please 
try again whether building the tools now works again for you on unsupported 
CPU architectures?

  Thanks,
   Thomas


