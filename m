Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53BD2EF5FF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:49:48 +0100 (CET)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuxP-0006Gg-G1
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxuu7-0004Be-EC
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:46:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxuu1-0003q3-D6
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTEz3JnPjCZl6L8/+3Qt0JzG0AEK5I8Yc5I8f8AXGYA=;
 b=GK8YDNn3EVanwp67iEiQyJwm2PuPRlgBz++fPS5DgsNsV6iIFPAa7dBKD2fiRZDjmBKwDh
 yINU2cIpHqzgc2RgZSl0k14Z8mCh4H4d2jlkVFb4E6UqKBD3+DtI3StGo5GbTGyplvJcOQ
 ix4/eMr+GnXpGMOSmMcaG9oEW2LbP04=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-z03IFTlSMjONkOCv_ZJDXw-1; Fri, 08 Jan 2021 11:46:13 -0500
X-MC-Unique: z03IFTlSMjONkOCv_ZJDXw-1
Received: by mail-wm1-f71.google.com with SMTP id h21so3434413wmq.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:46:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kTEz3JnPjCZl6L8/+3Qt0JzG0AEK5I8Yc5I8f8AXGYA=;
 b=Qe1W5NV9L79Afpegs3CdRLH39XZI/9geLH8g1GmmZmHvf5ZIcRPIVni2/EtL6uBmTd
 JDxclv+UqSs/y7CMK+kr9WAv4Edg1OUetIa/ooCmLp5IoTSQdcAlfsa2kiJCEYHRjT8a
 rzm5sGnvYsa4AIpL0gyL0DYUTh66969VDyvkRZ+80Ar5JMX5Xa4yFwEDvKdAZiA2BM7I
 BUm71cEOBZW+vDpIJOOUCa/mHaI3n7MgSe3t+t0QqJ1bGXuRgzQW8fXnRxONEJHHcOM0
 EdEvJzsu1OsAwKmmxCcBxQq2TORsfPPlvUSYXRJqGRkHlUEkw3Ts1ziVm2SsuAn/sbo4
 BSMw==
X-Gm-Message-State: AOAM532m2Vm7H4tZdTmq05op6ek/duvqzmvvWSdJKNSAgdlkMXqn4/1c
 2zp81gt/mrqijhyuSKnkqaAo8IET6hetbrQOv8xHDhwRgTJvkj50L1X77uvWFvEOG8FC7i/7CoP
 nGYrb9n9tKcqPmKI=
X-Received: by 2002:a05:600c:2106:: with SMTP id
 u6mr3890564wml.4.1610124372660; 
 Fri, 08 Jan 2021 08:46:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz52zwk9a1j9Iwv6+Eho4GO3ZqFhGFdqLTnOd+osmK0iZmv7SaRQKnlcC+k/kzt2UP/Y6HsSg==
X-Received: by 2002:a05:600c:2106:: with SMTP id
 u6mr3890556wml.4.1610124372537; 
 Fri, 08 Jan 2021 08:46:12 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id w17sm12250605wmk.12.2021.01.08.08.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 08:46:11 -0800 (PST)
Subject: Re: [PATCH v2 1/2] docs: Add qemu-storage-daemon(1) manpage to
 meson.build
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210108161416.21129-1-peter.maydell@linaro.org>
 <20210108161416.21129-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f06a1192-e14a-2e8a-9f40-8158b51127c7@redhat.com>
Date: Fri, 8 Jan 2021 17:46:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108161416.21129-2-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 5:14 PM, Peter Maydell wrote:
> In commit 1982e1602d15 we added a new qemu-storage-daemon(1) manpage.
> At the moment new manpages have to be listed both in the conf.py for
> Sphinx and also in docs/meson.build for Meson. We forgot the second
> of those -- correct the omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  docs/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/docs/meson.build b/docs/meson.build
> index 71641b4fe07..fae9849b79b 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -62,6 +62,7 @@ if build_docs
>          'qemu-img.1': (have_tools ? 'man1' : ''),
>          'qemu-nbd.8': (have_tools ? 'man8' : ''),
>          'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
> +        'qemu-storage-daemon.1': (have_tools ? 'man1' : ''),
>          'qemu-trace-stap.1': (config_host.has_key('CONFIG_TRACE_SYSTEMTAP') ? 'man1' : ''),
>          'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''),
>          'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
> 


