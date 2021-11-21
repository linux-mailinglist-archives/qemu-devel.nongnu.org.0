Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9384584B1
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 17:25:00 +0100 (CET)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mopeF-0006EM-A2
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 11:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mopcm-0005Xh-G2
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 11:23:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mopci-0002Wq-Do
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 11:23:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637511802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1SamVUoJ1k4R7hsMF0X3ntVHj9+3sMoI1aVjovaGOI=;
 b=WbNzX2h+QdbyH8RgoKi1DcFDpOD7t4eERWOMhVJSva4/DbxY0i+eKnNsQ2nmQlYixkztxK
 6oz9f/kIORlXjPiw3c+HdggTQ7kiCPyCpy+v3M8ntMKvFxQfaNd3MCr93kdg0DPlb12is9
 BDPvCrUDZ1NqpM9vgyoQXz/xLGE+qw8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-420-Lvf_i0TbM1Oq95GvxSXQ4A-1; Sun, 21 Nov 2021 11:23:20 -0500
X-MC-Unique: Lvf_i0TbM1Oq95GvxSXQ4A-1
Received: by mail-wm1-f70.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso8962159wms.4
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 08:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l1SamVUoJ1k4R7hsMF0X3ntVHj9+3sMoI1aVjovaGOI=;
 b=nboUoV4FGZy8vvPsIEU5J/FGWQhN/x4Umnz9x9k4qcNR6oy6P9o62waNy0cbKqT8Xs
 0vJ3cCcgeggcIBxsX9uT0k6O5V8WrCIFJP3DF8yyxg6Ud9iOpSqkoGwrpvwJN8ebPG2I
 fmS+2X+Lbm3uNHkizvObfKR26CWI+bGpBZoRF67l/rqZB2J13U4X7zubEjmhUj06Kj9h
 IqMEOmw+4oEEkiRiWUtEd75KLMK5jPsjUM2jgUzyNS5HHAPXmuaGywN9hJQj6JwPrkBp
 6KB4l4+Vv9eKeCPRDFxZtKx3/y/CzIGRBj1DF7p18NPHs3U1vid/6+LtVIlZXKhv1ol2
 58GA==
X-Gm-Message-State: AOAM533ewfihxNuJx1JfGrJx/2oVCKyiuP/6DiQEyiEiB5+EpdT0tTqo
 5K1gmafRphY1bw4i9UC+OERomPlCiTm0vHaahc76eF2wGxhewAlBPHDLYBfUXy+5ZCQjt7qHxdN
 /JIbpofgbq5VR2MauZp0Y26n/1rNoNjylBQKwJTfLubphVpgaAUKP7lp/Jtb+6eVJ/Q==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr28098649wrs.437.1637511798552; 
 Sun, 21 Nov 2021 08:23:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZPmoPz0BVDHC4d1aNfJdw6RkMZLL37f/lk8NIFdsh+ndXS8w/DqWwfHUBbuwjGy6ROt64ug==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr28098615wrs.437.1637511798259; 
 Sun, 21 Nov 2021 08:23:18 -0800 (PST)
Received: from [192.168.100.42] ([82.142.2.234])
 by smtp.gmail.com with ESMTPSA id l5sm6208412wml.20.2021.11.21.08.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Nov 2021 08:23:17 -0800 (PST)
Message-ID: <b484d92d-8d2f-b5aa-8cec-e7ae013b1db2@redhat.com>
Date: Sun, 21 Nov 2021 17:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] migration: fix dump-vmstate with modules
To: qemu-devel@nongnu.org
References: <20211116072840.132731-1-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211116072840.132731-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.022, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think it would be good to have this in 6.2

Thanks,
Laurent

On 16/11/2021 08:28, Laurent Vivier wrote:
> To work correctly -dump-vmstate and vmstate-static-checker.py need to
> dump all the supported vmstates.
> 
> But as some devices can be modules, they are not loaded at startup and not
> dumped. Fix that by loading all available modules before dumping the
> machine vmstate.
> 
> Fixes: 7ab6e7fcce97 ("qdev: device module support")
> Cc: kraxel@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   softmmu/vl.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 1159a64bce4e..620a1f1367e2 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3766,6 +3766,7 @@ void qemu_init(int argc, char **argv, char **envp)
>   
>       if (vmstate_dump_file) {
>           /* dump and exit */
> +        module_load_qom_all();
>           dump_vmstate_json_to_file(vmstate_dump_file);
>           exit(0);
>       }
> 


