Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1895188EB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:43:56 +0200 (CEST)
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlugs-0001I0-SX
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlud1-0005qt-Lp
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:39:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlucy-0006HZ-Bz
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651592391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=redIlLxwCOrB5/dphju8QCaOaA1Ld+FEdrIsR5+spV4=;
 b=Kw6tEMBTOE+0fgtbhKxjWi00K3Y/Hrkk3gI94bZYdPKPrGkutHUuMeqtNGGhZvpeiTeopC
 7jW6/EQ0tIH6MBONL2I1cJLgWznOvoL0cfXl/kSh53QFqEtwgU5pMl2QLytYxd9qqYg0Al
 ZWSchmxdMEDfxIDs1UzoMLadFg23VoA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-HPSTAWELM9m-NoTv76jqXw-1; Tue, 03 May 2022 11:39:50 -0400
X-MC-Unique: HPSTAWELM9m-NoTv76jqXw-1
Received: by mail-wr1-f72.google.com with SMTP id
 u26-20020adfb21a000000b0020ac48a9aa4so6499018wra.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=redIlLxwCOrB5/dphju8QCaOaA1Ld+FEdrIsR5+spV4=;
 b=n98OOiO4PzBB7bf2tymVwJkHBcqOWkGEYWKjID+1bYRErCUinpv4NhmbKDrZC/iTP7
 6e1c9U2JSAPaw85eQfFfxVb9NcIgQp2AxkzgEosbfkSDvDhKkmHtJYAJXkGr7CIvCzO0
 UdFFefrAlpDUH4T9D2ymlJWPv+/gDOyTbAvDa9/cdcczQBb3EEP6UuzuMb1Q0biiKbKS
 afEQs2F6WjhBGMBgVqT/wTp9X+L7AHMZk4mDhJtmXKiiYssuD0kVm8bslR9RxYNw/3og
 abYj0o/0Wef/MooJyFa6W5wsaV8yl1kvFblRI226A4WBGzzzg1xkCAL74a0suF5qZEyy
 wTIg==
X-Gm-Message-State: AOAM533dDMnVLltXKFV6yPfpReInyDQa44v4+QVxVWyIDHHMGRom66CI
 yTWPVWxO4zhJz3OjDxFQLCJgt8WKg0QT86hKgkP+D8BhXp/pW2apnOWVhzHD+itipxmOaI287zf
 lDjCjSu13JDa/LrY=
X-Received: by 2002:a5d:52c9:0:b0:207:99d3:7b4d with SMTP id
 r9-20020a5d52c9000000b0020799d37b4dmr13674629wrv.77.1651592389386; 
 Tue, 03 May 2022 08:39:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNguUzO3f6pYvwbJuneLx1hpRyp+C0evMBPYlp7C/saiQLgVCBl73sOiMNsKJ+h54Vdwyvhw==
X-Received: by 2002:a5d:52c9:0:b0:207:99d3:7b4d with SMTP id
 r9-20020a5d52c9000000b0020799d37b4dmr13674612wrv.77.1651592389150; 
 Tue, 03 May 2022 08:39:49 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 m13-20020adfc58d000000b0020c5253d8cesm9520638wrg.26.2022.05.03.08.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:39:48 -0700 (PDT)
Message-ID: <1192fecb-a730-65e1-c3fe-1e89456e6981@redhat.com>
Date: Tue, 3 May 2022 17:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1] vga: avoid crash if no default vga card
Content-Language: en-US
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220503091724.970009-1-qtxuning1999@sjtu.edu.cn>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220503091724.970009-1-qtxuning1999@sjtu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2022 11.17, Guo Zhi wrote:
> QEMU in some arch will crash when executing -vga help command, because
> there is no default vga model.  Add check to this case and avoid crash.
> 
> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---
>   softmmu/vl.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index c2919579fd..a49e29312b 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -977,7 +977,8 @@ static void select_vgahw(const MachineClass *machine_class, const char *p)
>   
>               if (vga_interface_available(t) && ti->opt_name) {
>                   printf("%-20s %s%s\n", ti->opt_name, ti->name ?: "",
> -                       g_str_equal(ti->opt_name, def) ? " (default)" : "");
> +                        (def && g_str_equal(ti->opt_name, def)) ?
> +                        " (default)" : "");
>               }
>           }
>           exit(0);

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/978

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>


