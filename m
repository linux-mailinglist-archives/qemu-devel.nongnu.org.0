Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ADD3BE72A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:31:20 +0200 (CEST)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15lu-0006Yt-5v
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m15kI-0005I7-M3
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m15kF-0005nZ-NL
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625657373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMSzbofEzMVk2Y5/8MOeXkyMwNXxOZthUpQttf6a908=;
 b=BTnG7h/7EvmbIO1oKhUxUwvLBNqeTJeVyr//SJECCq74rSrkxyEALlW5EmRtcknhglL3qO
 0nT5FM1aDn0SPEBO422VxIGvdslJhqBufhZCy3PrIUbPy7R1ZNLr3zsgPDyxo+dq3VO8lp
 dIPGs9/8auFxsY9fF8zddIn/Jc71ZxM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-C2X24w70NGqAjKV1_FyrKQ-1; Wed, 07 Jul 2021 07:29:32 -0400
X-MC-Unique: C2X24w70NGqAjKV1_FyrKQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 r11-20020a5d52cb0000b02901309f5e7298so693473wrv.0
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NMSzbofEzMVk2Y5/8MOeXkyMwNXxOZthUpQttf6a908=;
 b=g9tgGKCPKi1vjmOyFAkMNCq+nM4Ydgc0UsAZXZutlMnpg2gx3+h++DeeXO2xvZG6sx
 gyRqGHVB66zE1cm9kJnbh3eOL5sVCVFnxvJSUy2tr725NIJJeyuSU6rNWo2+ncdzpDqM
 ee2N8MxEF49NbgumcYQ6Z8p/jtZX6qS0FA3qrsZohjbpGsqGjMwVT4fUh6SxvZ1KVZL0
 jibVyHU0xqv36Akrqcpf6qWkVg2Ekw6S83IQcuW+lnqNLUFX6xSENmGZVdMl9Su8Zhqv
 RoXBa4M5pXkscIKjXCwMMzBUqveH+N2ZVIw+MLbgh30iCGG38+3QmwGbPJ9SE5ANPqRd
 jGHg==
X-Gm-Message-State: AOAM531JPd68jh25tXgFUq2cmK4t3DKkK53cfMta94S7eWqXXxIbRtTP
 QR3N5dhb/ALjIep6sqYy8g7057If6+z9/8fdvxOHLjnYAWE/waoMF+5KU+pDorVzTjERFUq1hZD
 4O8lmY2I2Ded+tzI=
X-Received: by 2002:a7b:c4ca:: with SMTP id g10mr6352396wmk.148.1625657371039; 
 Wed, 07 Jul 2021 04:29:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP1D+n9+k3TN9U90B7NVVlaz1Vr1Mdc24S8riQuclEUX3D2FR74/eVfFaHFubQflQkYfLhyg==
X-Received: by 2002:a7b:c4ca:: with SMTP id g10mr6352361wmk.148.1625657370733; 
 Wed, 07 Jul 2021 04:29:30 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id h8sm20003158wrt.85.2021.07.07.04.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 04:29:30 -0700 (PDT)
Subject: Re: [PATCH v7 01/14] target/s390x: meson: add target_user_arch
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210707105324.23400-1-acho@suse.com>
 <20210707105324.23400-2-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <48347193-c974-147b-2397-1ee405e63ecf@redhat.com>
Date: Wed, 7 Jul 2021 13:29:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707105324.23400-2-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: cfontana@suse.com, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2021 12.53, Cho, Yu-Chen wrote:
> the lack of target_user_arch makes it hard to fully leverage the
> build system in order to separate user code from sysemu code.
> 
> Provide it, so that we can avoid the proliferation of #ifdef
> in target code.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/meson.build | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/s390x/meson.build b/target/s390x/meson.build
> index c42eadb7d2..1219f64112 100644
> --- a/target/s390x/meson.build
> +++ b/target/s390x/meson.build
> @@ -58,5 +58,8 @@ if host_machine.cpu_family() == 's390x' and cc.has_link_argument('-Wl,--s390-pgs
>                          if_true: declare_dependency(link_args: ['-Wl,--s390-pgste']))
>   endif
>   
> +s390x_user_ss = ss.source_set()
> +
>   target_arch += {'s390x': s390x_ss}
>   target_softmmu_arch += {'s390x': s390x_softmmu_ss}
> +target_user_arch += {'s390x': s390x_user_ss}
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


