Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8249A37B535
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:59:31 +0200 (CEST)
Received: from localhost ([::1]:49102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggy2-00056K-Ly
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lggvs-0003YT-5T
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lggvq-0006bu-BE
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620795433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cf5rt09u6t4BUK8Dx3r8UkaGq4tT7ZIettykxnJtL+s=;
 b=U35+WAoADgMz5JRtMsuu+C57rV3lD5KJMWSh33XaNf/6+AULgd4AgU99QlD03uqsE8MwaO
 O07dLBj8GvGgRvqIglfoeWCsz7D2Hplt+5apBoC3J15T+toJUGdX8L0oYUHLIHaN0mGSxj
 ZMoHtl8nWgZ2kKSQUXNYSpPuGnpn8lo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-_LAOoisDNK-f6A9M5pxaJA-1; Wed, 12 May 2021 00:57:12 -0400
X-MC-Unique: _LAOoisDNK-f6A9M5pxaJA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d20-20020adfc3d40000b029010e1a640bbfso9653218wrg.21
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cf5rt09u6t4BUK8Dx3r8UkaGq4tT7ZIettykxnJtL+s=;
 b=UWavzLsCdGRto0uc6LKSE5trkgTm3O4X2fSDoMBxGu4B17nn5ZEtJnOFaf3BEIKoT1
 8rXzS1iVuL+yA1l2KWk9gsnL6oRjfAPwuQ7z4KE4i8SjaKNeO2DtRAbm42H+kVFmjF/X
 RqoQfoelXTLDkOqCUto2ou0pb3ogauHtmyfVH+Dq/D2xbNzLEzatizjuVWraOIG8ORVN
 oFYXipJHEW9wDAHZaQ36a8SMJB3SeuNBRzqUrq4Nn+3bK6HfAnMxIT5zT7fngZPJMh8Q
 H7y1ukA/XS3mRETuUNlsccbTpjh0Nm4DOtusWC2wRu3VjziIGnyDfv2kLwnaSTsHrp6A
 Ee9g==
X-Gm-Message-State: AOAM532eRrzKzs6nIfAfHuXyvMqSENrEwJzAZobbAZG8v8CGGLkNWAyM
 HYDo8jJCIzKiO4iIwE4KToqKzwKc3gdFHVRFRebbyY12DfWRjC5x7Q6rYnsoNhHVLBDH+mrJcn6
 3o0ExsEZBjb2O1Sg=
X-Received: by 2002:a1c:2985:: with SMTP id
 p127mr36973301wmp.165.1620795431001; 
 Tue, 11 May 2021 21:57:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmsAQGVjc8Keam51KBMciDjRi0TTxYtMoKxcyXJvUHB9mJrpgov7hF2rN0ZT4szUy/dYKR+A==
X-Received: by 2002:a1c:2985:: with SMTP id
 p127mr36973278wmp.165.1620795430762; 
 Tue, 11 May 2021 21:57:10 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id s5sm25908508wmh.37.2021.05.11.21.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 21:57:10 -0700 (PDT)
Subject: Re: [PATCH 1/1] gitlab-ci: Add KVM x86 cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210512044228.3254073-1-philmd@redhat.com>
 <20210512044228.3254073-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cb1077a4-a1ff-b88c-f648-7dfbbfafebc3@redhat.com>
Date: Wed, 12 May 2021 06:57:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210512044228.3254073-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 06.42, Philippe Mathieu-Daudé wrote:
> Add a new job to cross-build the x86 target without the
> TCG/XEN accelerators (IOW: only KVM accelerator enabled).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index e44e4b49a25..a8eac2cddba 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -198,6 +198,14 @@ cross-win64-system:
>     variables:
>       IMAGE: fedora-win64-cross
>   
> +cross-i386-kvm-only:
> +  extends: .cross_accel_build_job
> +  needs:
> +    job: i386-fedora-cross-container
> +  variables:
> +    IMAGE: fedora-i386-cross
> +    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-xen

We already have build-tcg-disabled in the main .gitlab-ci.yml file ... so I 
fail to see what additional test coverage we get by this job?

  Thomas


