Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34056324E45
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:39:07 +0100 (CET)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFE30-0005l7-7t
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFE2F-0005LK-2J
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:38:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFE2D-0005rj-6q
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614249496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m+7TZCPPP0QLeasfyjVpZSyVR1Pl13t405cPGna5bbw=;
 b=J9pSWZQIYyBWUENUl2shyAoq9ypr7bKbmBJwevWjPzhBd3/Sfj2j4Wy3St/PDHJFXkGp0O
 mI6xnZvjtb67Te+QEEjCVPEQe0B52+ob3geedeRvVQivGkS/LjVFJnwZUzvR1n/a1CTFLT
 eeR5JJ79/bJRX4LzMYZdqUmjFZhNVc8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-ZUAY0LRbM1S90cMvVAuLAA-1; Thu, 25 Feb 2021 05:38:13 -0500
X-MC-Unique: ZUAY0LRbM1S90cMvVAuLAA-1
Received: by mail-wr1-f72.google.com with SMTP id d10so2460401wrq.17
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m+7TZCPPP0QLeasfyjVpZSyVR1Pl13t405cPGna5bbw=;
 b=S8XKeDLgE75ZwklcI3HBK+mUgZzoVN9Hw/LOaEJ87bcSkK5Z9C9m3VKmrA0tRlL9Kd
 eBZZ9QAIpMiTe4JihincRYHN+zYjv2Cl95LvZqQL3fvErSqo8g3IbpqjBuNPZz6vYGf1
 uc13XJz07VoN8w9R7IiJPURWaJO5d+0sF414E75jaR1sOjl5kBg9U1yhD16Som0cyXGk
 Og0L7W/S1QAW9Ah/V7yNJuxMDp2YlhMToa2x5MkS8/KjaZGpUVWzHEVFjwL39x5EZaHl
 V4sD7TvkPV0WquPc2o4Jrcejw3pxV6QeSp7FqLWx65Yolu4CSy9u2OgcIQp9k+uamBg/
 bylg==
X-Gm-Message-State: AOAM530ELFkC1YIFcwgNpFMYzEyLMVvfpjuf99mObAaV0sKjvgkQ0CzG
 D9aoqgtwWfAF8Cl3VBrz4YoxHc2ly6CaNd7t+V9487u0kcGuMeBfaOLt96SwTG+S/bH8pFStZL8
 pxzPMBG0SdfPZqhQ=
X-Received: by 2002:a05:600c:410e:: with SMTP id
 j14mr2667169wmi.36.1614249492049; 
 Thu, 25 Feb 2021 02:38:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9xwY/ITImOie6TDPeaCmpv4+Y7bxMqLuTlgRzOcDSN+NmBPDFsVTkvkF6gMt79iPEsgavkA==
X-Received: by 2002:a05:600c:410e:: with SMTP id
 j14mr2667143wmi.36.1614249491869; 
 Thu, 25 Feb 2021 02:38:11 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g63sm7286323wma.40.2021.02.25.02.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:38:11 -0800 (PST)
Subject: Re: [PATCH] multiprocess: move feature to meson_options.txt
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210224122306.451764-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <72fc7d76-f8e3-2c0f-e890-99509bb6230d@redhat.com>
Date: Thu, 25 Feb 2021 11:38:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224122306.451764-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 1:23 PM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 12 ++++--------
>  meson.build       |  9 +++++++--
>  meson_options.txt |  2 ++
>  3 files changed, 13 insertions(+), 10 deletions(-)
...

> @@ -2535,6 +2540,7 @@ endif
>  summary_info += {'target list':       ' '.join(target_dirs)}
>  if have_system
>    summary_info += {'default devices':   get_option('default_devices')}
> +  summary_info += {'Multiprocess QEMU': multiprocess_allowed}

Since you are changing this, it is a good opportunity to find a
better description to this feature (similarly how we recently clarified
the TCI description).

The current description is confusing with multiprocessing (which is
by default on QEMU and every developer want to exploit that).

So the main multiprocess code resides in hw/remote/mpqemu*.

I have the impression "monolithic application" is common in
software engineering. What about "polylithic QEMU"?

Stefan once described it as "out of (main) process device emulation".

Relevant links:
https://english.stackexchange.com/questions/112633/whats-an-antonym-of-monolithic-as-in-monolithic-architecture/119212#119212
https://infovis-wiki.net/wiki/Polylithic_design

...
>  if not supported_cpus.contains(cpu)
> diff --git a/meson_options.txt b/meson_options.txt
> index 675a9c500a..bf11de7bb2 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -45,6 +45,8 @@ option('cfi', type: 'boolean', value: 'false',
>         description: 'Control-Flow Integrity (CFI)')
>  option('cfi_debug', type: 'boolean', value: 'false',
>         description: 'Verbose errors in case of CFI violation')
> +option('multiprocess', type: 'feature', value: 'auto',
> +       description: 'Multiprocess QEMU support')


