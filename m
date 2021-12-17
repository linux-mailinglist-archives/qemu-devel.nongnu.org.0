Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91515478C87
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:41:49 +0100 (CET)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDUa-0006gc-IX
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:41:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDOn-0002FJ-7u
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDOh-0006XH-1Z
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639748142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3K33SkBj+OPdGEQthL+b64ibQZv5UQcsV1zIU8X0aQ=;
 b=GP/HyqC9SQFc7cvk71Ar3EK19HKLwJUZsbU/4YV0KbrxoQZmnR3kHEl9RZS4rQTdT3kCiy
 pkn0OKfktk0h/8g8jYIYLAtHgPlYcGJ9T+9GkLcAkGY9+SjX0cgTQp6VHVGX/1y6Myw0Sa
 IWPlMTN/OTAUMVcYcebFQmcKKy3w/wM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-fWmVbtCLP8yefB4v1PzVHA-1; Fri, 17 Dec 2021 08:35:40 -0500
X-MC-Unique: fWmVbtCLP8yefB4v1PzVHA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1057811wms.7
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 05:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q3K33SkBj+OPdGEQthL+b64ibQZv5UQcsV1zIU8X0aQ=;
 b=KRZU9x4aZCNe2pStAaUQ28pBmeTkHjPFH+cD2/wpJmAJ1J7wsd/sm+kA/PEhE8j+jI
 MuLG7ljpmheb2SgNJZcQLOaCzdiWk+I0ZLOfYHc1RXvWz895sxvWXnSkD+PEdraMuUUP
 NlfKrzQfkXDdl2taZNwLcW/l8ZyYFmYCiwGYFGBvMCKx6s046jVhrPtMrGrllZRiJAj5
 ALX9AS1bGNTGhZ64HPv6YKz39MdH29nGmlHnOlUhHGaawgX7duTKVlvcQBlsbtoowqrB
 NSgQzl8m9Q9ThtiTc0JGeU6O797BlxLnPTbPlj3eC+Dlj1ej1yuS17RQUk29f6qurs2Z
 K/JQ==
X-Gm-Message-State: AOAM531crAxiX1K3VqrqJpaXfYLJvRG0xthQ9/Qf3S0YeZmBfMRqVnLo
 SSeq8UJ73ZIC6FV2TYiARkhjA5xr8dln+LFbfpUGnIStHP32u5x2YcGpFirMDxby2dMFLjgfsuQ
 5RuPGRCeFQu9B1KI=
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr2801597wmn.98.1639748139731; 
 Fri, 17 Dec 2021 05:35:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMofePou+W8/YVrT7s07+aQKZCLmA6YPdW1IoatGO8nQSgkAEDgkcmWy6TLaQ725sOthneAg==
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr2801588wmn.98.1639748139533; 
 Fri, 17 Dec 2021 05:35:39 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id y15sm10512634wry.72.2021.12.17.05.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 05:35:39 -0800 (PST)
Message-ID: <25f4195a-94bf-db04-6bd7-2221e807a34f@redhat.com>
Date: Fri, 17 Dec 2021 14:35:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 36/37] ui/dbus: register D-Bus VC handler
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-37-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211009210838.2219430-37-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/21 23:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Export the default consoles over the D-Bus chardev.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/dbus.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)

> +static void
> +dbus_vc_parse(QemuOpts *opts, ChardevBackend *backend,
> +              Error **errp)
> +{
> +    DBusVCClass *klass = DBUS_VC_CLASS(object_class_by_name(TYPE_CHARDEV_VC));
> +    const char *name = qemu_opt_get(opts, "name");
> +    const char *id = qemu_opts_id(opts);
> +
> +    if (name == NULL) {
> +        name = "";

Could also drop this assignation, and:

> +        if (g_str_has_prefix(id, "compat_monitor")) {
> +            name = "org.qemu.monitor.hmp.0";
> +        }

           else

> +        if (g_str_has_prefix(id, "serial")) {
> +            name = "org.qemu.console.serial.0";
> +        }

           else {
              name = "";
           }

> +        if (!qemu_opt_set(opts, "name", name, errp)) {
> +            return;
> +        }
> +    }
> +
> +    klass->parent_parse(opts, backend, errp);
> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


