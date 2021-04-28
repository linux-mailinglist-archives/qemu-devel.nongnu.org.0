Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1450736DCC3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:14:28 +0200 (CEST)
Received: from localhost ([::1]:44516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmpV-0003DT-SY
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbmCf-0002mq-9S
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbmCd-0000uV-7T
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619624054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uz/4CW8hNTcdcqaoC6PlPkM71z/XjfFrNW9esv66KJw=;
 b=el2s86yo2V5doOWYKTdORT9RPrBO5suzgtFVm/SDNdydvWLwS+CYwg1Z0rLmUPQrPkfHEG
 qmYfApjGAshgUSKML1GZv+P1T116JrqSo/P14R6TZbPbRRXA0YEedUda2oOKEB29urFKS3
 b97mW8Us4z7dzt3T2oFqw0O1E/QDrYM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-Bj3ubY_xPZS8F0YU26e1ig-1; Wed, 28 Apr 2021 11:34:11 -0400
X-MC-Unique: Bj3ubY_xPZS8F0YU26e1ig-1
Received: by mail-wm1-f72.google.com with SMTP id
 d78-20020a1c1d510000b0290132794b7801so5299893wmd.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 08:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uz/4CW8hNTcdcqaoC6PlPkM71z/XjfFrNW9esv66KJw=;
 b=l1r/v8s1QFRn4Jms/1MDQB7mgTROUIZChB+Cmck0/dBmey8mIT+I5FK0yyuLblJiZ8
 C4v9sT/SSzncTAN+Q7Ae+y+yH6jK4qiSNHNWqJQWKsJYsmC1w0qICkDN2qZ+GjVWjUYc
 f3FOWCRs/xvdGf0Gjxfe42AGx25YTlKbZYmms/5+Wp+jI+pgiKCZ4qnYaz2bnmpFA2OH
 /M2fZLV5DnoQH+zVo/tq2IvORaf6vXmAWwTFrRI/m33LIpqWlLhro49quvpOZJGluzwM
 NlGOrOvxBg6PjK4cFvcQzKL8prxO0upNFWBi2matIRWEFjmJnrs5DuEWVrk4w/KVGQte
 oUcQ==
X-Gm-Message-State: AOAM532GvgMrzLjVepV9/zlchc2qVOnSPJceFKbhzXq0ax0ea1I0tcCq
 t0v9wiPxVKDk46WVx4KW/g7pnH7isJmS0BDRE2ErS0qfoNQ6x6BmXXZjM4jW3/MFX8DKzVx36XF
 Zz2bF3AYGseVaLzM=
X-Received: by 2002:a5d:47cc:: with SMTP id o12mr36711368wrc.227.1619624050032; 
 Wed, 28 Apr 2021 08:34:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBhOQzvoBfIa22mQIQGqbdGuqwNjQTce1b4NEl48R2pLxwmdvg8sK9wfUPnupQ7JiEu+SV8Q==
X-Received: by 2002:a5d:47cc:: with SMTP id o12mr36711337wrc.227.1619624049839; 
 Wed, 28 Apr 2021 08:34:09 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n5sm68418wrx.92.2021.04.28.08.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 08:34:09 -0700 (PDT)
Subject: Re: [PATCH 1/2] meson: Check for seccomp/cap-ng libraries if
 virtiofsd is enabled
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-2-philmd@redhat.com>
 <CAFEAcA9chk8aEqe0jrYQouF0=UpznTrR+J8puVgNvf1VipPm2A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <afabff90-7af3-f4fe-86de-e0c169e286dd@redhat.com>
Date: Wed, 28 Apr 2021 17:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9chk8aEqe0jrYQouF0=UpznTrR+J8puVgNvf1VipPm2A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
 Connor Kuehl <ckuehl@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 5:06 PM, Peter Maydell wrote:
> On Wed, 28 Apr 2021 at 15:55, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
> (cc'ing Paolo for a meson.build question below...)
> 
>> When not explicitly select a sysemu target and building virtiofsd,
>> the seccomp/cap-ng libraries are not resolved, leading to this error:
>>
>>   $ configure --target-list=i386-linux-user --disable-tools --enable-virtiofsd
>>   tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd requires libcap-ng-devel and seccomp-devel
>>
>> Fix by checking the seccomp/cap-ng libraries if virtiofsd is built.
>>
>> Reported-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  meson.build | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index c6f4b0cf5e8..b466b418fed 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -393,14 +393,14 @@
>>  endif
>>
>>  seccomp = not_found
>> -if not get_option('seccomp').auto() or have_system or have_tools
>> +if not get_option('seccomp').auto() or have_system or have_tools or not get_option('virtiofsd').auto()
>>    seccomp = dependency('libseccomp', version: '>=2.3.0',
>>                         required: get_option('seccomp'),
>>                         method: 'pkg-config', kwargs: static_kwargs)
>>  endif
>>
>>  libcap_ng = not_found
>> -if not get_option('cap_ng').auto() or have_system or have_tools
>> +if not get_option('cap_ng').auto() or have_system or have_tools or not get_option('virtiofsd').auto()
>>    libcap_ng = cc.find_library('cap-ng', has_headers: ['cap-ng.h'],
>>                                required: get_option('cap_ng'),
>>                                kwargs: static_kwargs)
> 
> Now we have "virtiofsd requires cap-ng and seccomp" recorded in three
> places in different meson.build files:
>  * here, if this patch goes in
>  * in tools/meson.build, in its logic for setting have_virtiofsd
>    (I generously do not count the "decide which error message to print"
>    logic in that file as a separate item in this list...)
>  * in tools/virtiofsd/meson.build, where the executable('virtiofsd', ...)
>    lists them in its dependencies: setting
> 
> Is there some way to avoid this duplication?

I noticed that too, I think the problem is we never considered the case
of a standalone binary buildable without sysemu / tools, such virtiofsd.

TIL virtiofsd is not a tool, so tools/meson.build needs rework, in
particular to remove the 'have_tools' but maybe to move it out of
tools/:

have_virtiofsd = (targetos == 'linux' and
    have_tools and
    seccomp.found() and
    libcap_ng.found() and
    'CONFIG_VHOST_USER' in config_host)

If virtiofsd requires Linux, shouldn't we check it directly
in ./configure, not allowing --enable-virtiofsd on non-linux
hosts?
Maybe it is there for cross-compilation... Is it supported to
cross-build it on non-Linux hosts?


It could be clearer to use:

  want_virtiofsd = get_option('virtiofsd').auto()


BTW to test I used:

  $ configure --target-list=i386-linux-user --disable-tools
--enable-virtiofsd
  $ ninja tools/virtiofsd/virtiofsd


