Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CF4AE070
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:14:08 +0100 (CET)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHV0B-00024c-Jx
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHT9P-0007mK-Rg
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHT9A-0000vt-Qi
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644336906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pz8FlJ1tRDmifhBLaiCmDW/k8a9q52BmrbUqgI8es0c=;
 b=CWuSsIz/xQLrrGBt30RsT+UKO354gOVOMxu/nda/e6ylplU2iBFs09MXeSAn2xq79T83Yc
 +9CRTcVvQ5fcuGwRhpliCpNyaLD8KINJ8/vye6uwr1g+lpk478fc8HbIQMe8qVhH7F7b7p
 Ac+pPGPhNFlh7m35hhsj373BbsVoH7k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-_2CdqTszMPeDwyRy3S3Tfw-1; Tue, 08 Feb 2022 11:15:03 -0500
X-MC-Unique: _2CdqTszMPeDwyRy3S3Tfw-1
Received: by mail-ed1-f70.google.com with SMTP id
 bq19-20020a056402215300b0040f276105a4so6391047edb.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pz8FlJ1tRDmifhBLaiCmDW/k8a9q52BmrbUqgI8es0c=;
 b=g9edvnYKeu42N+63pN1TsXN6odQjaaIqh8C/yh2bZRYgsVxix/tiQSRp/Fr2xi9BU6
 hVwbVtjRJyJuHg8mhp17DPGv/ZO0I4wTVjwaUKmilQ3UYIZQS/T5f3STeQb5Pi3mD03/
 UGhgGJ7SBy8YKTXTFDbw1a2HHwG386N4v1LzuRCTtXPgtOidQcDb0+IOEEIqzODiXdYv
 2h/nMoTBXwIzwHwCsnEDVLvYldOZvxDmdXr351hu+0ZvlbKRVAtpLzDdGQ/c47TmEyi4
 oLX13bP6Jhv37WMbfikqTbPbjXQfw4lEJ3K53oy2ibgrsJY0r0MssssSpQPLNoZqqfGI
 BJAg==
X-Gm-Message-State: AOAM530gV9oXL/3braRdgXS551oIX2BixqSI+/m/DJyRnCNK4qsIuaqb
 4//2Q/tGAJVBgp/htoDrXZLznfXSIrbF+G6JT+jwStN4vSVhOvXux/fhdIw2qYh8oheFn0xBgjs
 UseArIt4rQEnqUzg=
X-Received: by 2002:a05:6402:27d4:: with SMTP id
 c20mr5233449ede.182.1644336901790; 
 Tue, 08 Feb 2022 08:15:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywdIIVRKxnjm9cks3kIFCmoak1vb2WScdKf0mDd6YZwdOSEc/IhGkZRd7axRwDfxa0+7/y7Q==
X-Received: by 2002:a05:6402:27d4:: with SMTP id
 c20mr5233424ede.182.1644336901490; 
 Tue, 08 Feb 2022 08:15:01 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id z2sm2439361ejn.117.2022.02.08.08.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 08:15:00 -0800 (PST)
Message-ID: <0dbc714e-8d80-91c6-0bf0-79ae2c600ef6@redhat.com>
Date: Tue, 8 Feb 2022 17:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/13] meson: Display libfdt as disabled when system
 emulation is disabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-2-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220208152243.16452-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 16:22, Philippe Mathieu-Daudé wrote:
> When configuring QEMU with --disable-system, meson keeps showing
> libfdt as "auto". Mark it as disabled instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 571af34b7d..3c274386bb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2271,8 +2271,8 @@ if get_option('cfi') and slirp_opt == 'system'
>   endif
>   
>   fdt = not_found
> -fdt_opt = get_option('fdt')
>   if have_system
> +  fdt_opt = get_option('fdt')
>     if fdt_opt in ['enabled', 'auto', 'system']
>       have_internal = fs.exists(meson.current_source_dir() / 'dtc/libfdt/Makefile.libfdt')
>       fdt = cc.find_library('fdt', kwargs: static_kwargs,
> @@ -2315,6 +2315,8 @@ if have_system
>       fdt = declare_dependency(link_with: libfdt,
>                                include_directories: fdt_inc)
>     endif
> +else
> +  fdt_opt = 'disabled'
>   endif
>   if not fdt.found() and fdt_required.length() > 0
>     error('fdt not available but required by targets ' + ', '.join(fdt_required))

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Another possibility might be (for all submodules)

-summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : 
fdt_opt}
+summary_info += {'fdt support':       fdt_opt == 'internal' ? fdt_opt : 
fdt}

Paolo


