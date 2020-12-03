Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E42CD2AA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:38:15 +0100 (CET)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkl41-0008DC-Mj
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkl30-0007kZ-Ul
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:37:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkl2y-000866-SJ
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606988226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqUK4PX8mGZVg6MPkooa1iElcNfiXVeEOv1wCTMC9Os=;
 b=JS8tokkLLxsr/5FflgX5XlAInyDcj2L0gBH0LOcZbb5OiWTqBKfy5Te4mtDxBTuHID+UmD
 sLFtjoLx6zJ4HYIrtW13XWKBN9KLRNPGgPCoJE6HI0veYajC8usjRm8gLnoOD6awCBsre3
 ZK80Wk2W+lwOJJITCBKAwfthsHZ7l9M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-VTIoxQAEM1aKBWxLXPL-dA-1; Thu, 03 Dec 2020 04:37:04 -0500
X-MC-Unique: VTIoxQAEM1aKBWxLXPL-dA-1
Received: by mail-wr1-f70.google.com with SMTP id z6so983195wrl.7
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 01:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YqUK4PX8mGZVg6MPkooa1iElcNfiXVeEOv1wCTMC9Os=;
 b=lWgsy4T/FdGUXHuqZzodl9+USqbPtIQ/pAQvlAwTMMqjKo7tcjp4SjG2m5A1qAEdrF
 y5hFC+00QTSNxFO2h5AE9DRa4SmM+lsKvXT8U8VbICJc2Xm4ji+lXaPjpJB/6xZbg2hU
 6JQ6J14tiTIuKwzxrmSTd7WBpf/2dBPXcwsL2zR7z7Ny7XYHvlniC/yHmsj4VuRXDU7/
 jEtLWLHi9blJARECbRlDzUVIIEWiCUphrdYE/ML5U91LH7F1FZDAmxx6ZH2x+sOxkIDI
 5rmyD/rXMsR6Bvm3TYU5CcQeTFsexY7xY8lJ9ZbTWQVYv7hMtJFR3LPuk7A2ycx8tGiK
 a5cg==
X-Gm-Message-State: AOAM530dnBecnZOh6aUE9SrjpQ5T7RHeXMOOkEPH9YLa1XHCUJ3UCDa6
 0a1FeZPcyP67n+RCVKsg/MI2PC45Oa8aTPoA2c1Sq0qhWmwaNcb0YtokKn0dfJMROMIX3MHusnD
 bwKFeue0cLFeXVnw=
X-Received: by 2002:a5d:618c:: with SMTP id j12mr2624280wru.182.1606988223023; 
 Thu, 03 Dec 2020 01:37:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+2Yw9N7EQZv2ahm8zF0aNPhjFva+0IFasjYhUS+KhKl+m+q6Kh96RDSsO5M+SzUzSfnijZQ==
X-Received: by 2002:a5d:618c:: with SMTP id j12mr2624258wru.182.1606988222825; 
 Thu, 03 Dec 2020 01:37:02 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id z11sm777758wmc.39.2020.12.03.01.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 01:37:02 -0800 (PST)
Subject: Re: [PATCH-for-5.2? 1/1] Acceptance tests: bump Fedora to 32
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20201202215747.2719507-1-crosa@redhat.com>
 <20201202215747.2719507-2-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b00dc7be-cf66-34a0-3260-2a9cfcddde77@redhat.com>
Date: Thu, 3 Dec 2020 10:37:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202215747.2719507-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 10:57 PM, Cleber Rosa wrote:
> Currently in use Fedora 31 has been moved out of the standard download
> locations that are supported by the functionality provided by
> avocado.utils.vmimage.  So right now, the boot_linux.py tests will get
> canceled by not being able to find those specific images.
> 
> Ideally, this would be bumped to version 33.  But, I've found issues
> with the aarch64 images, with various systemd services failing to
> start.  So to keep all archs consistent, I've settled on 32.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_linux.py | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
> index 1da4a53d6a..0824de008e 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -42,13 +42,13 @@ class BootLinuxBase(Test):
>          vmimage.QEMU_IMG = qemu_img
>  
>          self.log.info('Downloading/preparing boot image')
> -        # Fedora 31 only provides ppc64le images
> +        # Fedora 32 only provides ppc64le images
>          image_arch = self.arch
>          if image_arch == 'ppc64':
>              image_arch = 'ppc64le'
>          try:
>              boot = vmimage.get(
> -                'fedora', arch=image_arch, version='31',
> +                'fedora', arch=image_arch, version='32',

I already expressed my view on this (latest QEMU should be
able to use at least f31 - which was tested - and eventually
f33 - which is coverage extension). I'm not going to vouch
this change. If other maintainers are happy with it, I don't
mind this gets merged.

BTW I don't see why this is urgent for 5.2.

Phil.


