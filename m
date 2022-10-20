Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C98606388
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:49:01 +0200 (CEST)
Received: from localhost ([::1]:46136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWqx-000290-NG
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:48:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWnc-00061h-Kc
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olVG0-0003o1-Oa
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olVFQ-0004Nm-RU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666271168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zz2Fg24QJ/kFfNj9EmQkL+k6EW7lQ4mU7NOSXQOA/KM=;
 b=b2BgvNCy5l5SL6XU+KdQv6Y5BJq52kTlDCK2p0VrbPdhS5cvH/bCi3/hnrKrWZHnczzw1X
 +vB716WXqoLcSNQkmqmD301lctBkmrsE1tMOLWBrYtonFBmmnPYKOjN3hs8qv/9e2qI8RY
 zxEpyTu5FO+upxxlSIIdIyXEYCNdpB8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-3wWnGou2OPi6qKEvFVXQrw-1; Thu, 20 Oct 2022 09:06:05 -0400
X-MC-Unique: 3wWnGou2OPi6qKEvFVXQrw-1
Received: by mail-qk1-f199.google.com with SMTP id
 q14-20020a05620a0d8e00b006ef0350dae1so1391119qkl.12
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 06:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zz2Fg24QJ/kFfNj9EmQkL+k6EW7lQ4mU7NOSXQOA/KM=;
 b=Qwtoan32lNG6umfntba2IBpFZn7uL6FEyCXkxx9ELpgGwYsTpfP3tEgz/4UZASMwWC
 YZACGrklmSKQdk4oIv3voqltnEbT7H88zYJBv2IJ9j9+JxfcdhOhoP1JqrxFZ6D+Rmis
 gj8NaB4hOyLkbgVv6o4X+XJnZPGfoWfTkdR3HisK/QC2YYN/ielpos01PPnBZeSTTes6
 9+6ZXNYiVfI/y4YMH4lNniq/8ZEMXPyb/ksKt4C/Kfqai7aXOuF+eJbhJaiWz1KIpjkH
 PADEq0wlFguZdECQ8DrZ4S+KZAtRxAstSlbVbw18Xx7VlsVliYfwAIMN3IlvI/4hVch9
 ToVw==
X-Gm-Message-State: ACrzQf1UhcHXQqp3HQpc+qItfrf1NJG8xVmYh0uYaL3IWuC+T/e1vMH+
 6DeCUvumK6qGpuhzR6ffcnmctalW/Pu32kyPnm5Jd4VqH1UNqQn23hwCRAV0wfrmTNlP0n6+aUO
 +giLBTWgR9hIv4LM=
X-Received: by 2002:a05:6214:21e3:b0:4b2:6624:753f with SMTP id
 p3-20020a05621421e300b004b26624753fmr10996683qvj.105.1666271165315; 
 Thu, 20 Oct 2022 06:06:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XNGRoPyW/m1eLx0FkPLEnDTtHdY2SJ4mdj1Sk6+ukqP8OoCLPk/+7Mn74uTJ92+lYPMZFJw==
X-Received: by 2002:a05:6214:21e3:b0:4b2:6624:753f with SMTP id
 p3-20020a05621421e300b004b26624753fmr10996631qvj.105.1666271165012; 
 Thu, 20 Oct 2022 06:06:05 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-247.web.vodafone.de.
 [109.43.177.247]) by smtp.gmail.com with ESMTPSA id
 he7-20020a05622a600700b003972790deb9sm5984742qtb.84.2022.10.20.06.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:06:04 -0700 (PDT)
Message-ID: <15edde23-e0e8-ee61-6287-56901e510f6e@redhat.com>
Date: Thu, 20 Oct 2022 15:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 06/26] tests/avocado: extend the timeout for x86_64 tcg
 tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221020115209.1761864-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/10/2022 13.51, Alex Bennée wrote:
> These are timeing out on gitlab.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index b7522ad3a1..571d33882a 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -19,6 +19,7 @@ class BootLinuxX8664(LinuxTest):
>       """
>       :avocado: tags=arch:x86_64
>       """
> +    timeout = 480
>   
>       def test_pc_i440fx_tcg(self):
>           """

Reviewed-by: Thomas Huth <thuth@redhat.com>


