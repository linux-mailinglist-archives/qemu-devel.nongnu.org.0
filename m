Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02204A95A4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 09:57:10 +0100 (CET)
Received: from localhost ([::1]:45888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFuOy-0004RH-7N
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 03:57:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nFta5-0000hT-Gj
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 03:04:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nFta3-0001KC-39
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 03:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643961865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YPwVE85vcfoS5SlA8dz6zFFg6v9/e3e7ccw8wZkeiag=;
 b=ARplLmGFz9XuC2EKpRU/wEW/W/wYLdJYKPEijXEdkhWyIZ+LuVkNDUZ7EJ/OGbW6hYtPRi
 /63aJHdaPGm49sNn3xf3WU1M3YcHUHiibq9qR7PXJ5Xicvh9x1z7cZrRRLWzvlBdxZRGLu
 LdYRO9vqXt52gFSKBAe86cMHNattEMA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-k2lugiJhOMmVmi2dopmA9Q-1; Fri, 04 Feb 2022 03:04:24 -0500
X-MC-Unique: k2lugiJhOMmVmi2dopmA9Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 k7-20020adfb347000000b001dd761d46c7so1649351wrd.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 00:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YPwVE85vcfoS5SlA8dz6zFFg6v9/e3e7ccw8wZkeiag=;
 b=KU0kPdJYhA197sXBsikRGXAFu7nxIYhZsezQXfvyEsOG3UQeIiPZIW2kQv0FkEUVSN
 nhinm/pI3zl39XQi3soNWQgjL3XxhDiOWrewt4hG8rpV9jLPv3wyTS0uo6WTRPMIzh9i
 +l9dYvizTFuSaF08unfRAYvRLeBaKs5t4yUb2DejE9qQfzP374hUuXg1+uAY1RopwN9Q
 iB3/kVzkG1U5ZQEl8+mkRSMAMrgtXt1otmy/J8/q3VSYdYvCaqCQp5SsHBW9Da3gdUo5
 B4O/tI8NGclKyDVBxcLCMprIp/wOYMRr5sUgPRdQ+6jPT8bC5jNO6X3tRpnsB8zfRpj9
 A8OA==
X-Gm-Message-State: AOAM53307UVMYM0FSBx0XD3ym4B5AeD1hu6NoIkRGQXeehEXjsdtR4GG
 /V06MTMUMdLDuMOIi8II9p7dVuasSp5kbqyipCHxxL+5yh2H95ESd8K+EjuoXknM0HriP9BxPbt
 4seuKm32HFkAYIk8=
X-Received: by 2002:a05:600c:5014:: with SMTP id
 n20mr1200186wmr.46.1643961863382; 
 Fri, 04 Feb 2022 00:04:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyi7ISabU3SFfyXc8b/lfrYkRT6KbeDAbAwMwmNBNVm5eKczP3TlKU7gb8Mj2bPuTrob5+FRw==
X-Received: by 2002:a05:600c:5014:: with SMTP id
 n20mr1200170wmr.46.1643961863145; 
 Fri, 04 Feb 2022 00:04:23 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id l10sm1298992wry.79.2022.02.04.00.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 00:04:22 -0800 (PST)
Message-ID: <15aa8677-8b4d-c77d-44fd-efe46dfc7b70@redhat.com>
Date: Fri, 4 Feb 2022 09:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/21] accel: Restrict sysemu stubs to system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203191814.45023-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2022 20.17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/stubs/meson.build | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
> index 12dd1539af..0249b9258f 100644
> --- a/accel/stubs/meson.build
> +++ b/accel/stubs/meson.build
> @@ -1,4 +1,7 @@
> -specific_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
> -specific_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
> -specific_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
> -specific_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
> +sysemu_stubs_ss = ss.source_set()
> +sysemu_stubs_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
> +sysemu_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
> +sysemu_stubs_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
> +sysemu_stubs_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
> +
> +specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: sysemu_stubs_ss)

Reviewed-by: Thomas Huth <thuth@redhat.com>


