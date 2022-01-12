Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F048C0DD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:18:50 +0100 (CET)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZmL-0001zR-Ve
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:18:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7ZcQ-0001kH-Vp
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:08:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7ZcP-00083p-Hh
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641978513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbWpJ8w5jtFyR+W+wt9Sp7pmknR9AfF/hHqetJVLep0=;
 b=DCbF0QssjhXZ3MCn9H63iLhwm+LonGeCrSSJ4LYseVUVhHQqAjgHxan5SdMvEWLCEoL2RZ
 iGZj3gT2gpX4h0xPMAAye5DaSb8T9P69KyJdOLP017XFxQf3Zt3KKjEoqFoAav0eyCcGfm
 1u5GloUinOEauA7L4M+2eYVmiJGx1Yw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-s5MWnjZwP7qM47Afac6RAg-1; Wed, 12 Jan 2022 04:08:31 -0500
X-MC-Unique: s5MWnjZwP7qM47Afac6RAg-1
Received: by mail-ed1-f69.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso1651174edt.20
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 01:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KbWpJ8w5jtFyR+W+wt9Sp7pmknR9AfF/hHqetJVLep0=;
 b=afFRchLYkp4aB5wIsdTWlhqBgVdqu83tynGNWErWWPddkqRz5ombSbMokoFzXIXM1A
 n81g/A0H41kU55Ndus7XlyXRdknAtc0FB/w+jQkZwU5uv7y4ohUOuPU9qfXGMdNBNG6M
 Ocz2T61rbC9GovXwHSKDnYU+fi2W/9mwJOKFCWi0MRRt8qVFe4y5SClvZBDWQjl8yoJb
 6ohwejvsuRhqGb8ObEqwNI9MD6eefrXczeVLZMQUu4Zhkvq3PamqWnBmcSsHMMwctmzn
 ik9ZKoo1F2/yac3B7EM+9rxV4XQUHLd7r8Fp9cQEERtgDXxJ94HQEHSotg0jjEhbndxC
 oQTA==
X-Gm-Message-State: AOAM5313G2+X5uron9zOJLgDAN1VK6olQNEmIa/pVh8PTLAZz5vcvUI/
 9v40rxkwl3ccXKhMpmrqeMQjLQSqBoy0MPf6KmDZVzmyjAq75WOrcXVC4PEGjZTVLdOZTtjfe/C
 oHM+ZyPVJG4pAqsg=
X-Received: by 2002:a17:906:6a26:: with SMTP id
 qw38mr7371526ejc.518.1641978510791; 
 Wed, 12 Jan 2022 01:08:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwv985Q8U61c6wcM/+1uohHZypY0bEeEB3eWdlH7GkrZAlBLRd2ycCvvTUqyha7o3/pUkF8YQ==
X-Received: by 2002:a17:906:6a26:: with SMTP id
 qw38mr7371511ejc.518.1641978510536; 
 Wed, 12 Jan 2022 01:08:30 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id ne35sm3264385ejc.48.2022.01.12.01.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 01:08:30 -0800 (PST)
Message-ID: <cf0ef57c-7d7b-780c-a120-0b29a41510eb@redhat.com>
Date: Wed, 12 Jan 2022 10:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 01/10] stubs: Restrict fw_cfg to system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220111184309.28637-1-f4bug@amsat.org>
 <20220111184309.28637-2-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220111184309.28637-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.01.22 19:43, Philippe Mathieu-Daudé wrote:
> fw_cfg_arch_key_name() stub is only required for sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  stubs/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 71469c1d50a..363f6fa785d 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -11,7 +11,6 @@
>  stub_ss.add(files('dump.c'))
>  stub_ss.add(files('error-printf.c'))
>  stub_ss.add(files('fdset.c'))
> -stub_ss.add(files('fw_cfg.c'))
>  stub_ss.add(files('gdbstub.c'))
>  stub_ss.add(files('get-vm-name.c'))
>  if linux_io_uring.found()
> @@ -51,6 +50,7 @@
>    stub_ss.add(files('replay-tools.c'))
>  endif
>  if have_system
> +  stub_ss.add(files('fw_cfg.c'))
>    stub_ss.add(files('semihost.c'))
>    stub_ss.add(files('usb-dev-stub.c'))
>    stub_ss.add(files('xen-hw-stub.c'))

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


