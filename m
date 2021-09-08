Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307534033EF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:49:45 +0200 (CEST)
Received: from localhost ([::1]:50756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNqSt-000325-W3
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqQA-000700-0t
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:46:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqQ8-0005UN-JQ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631080011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1VzT2G94p+Efge/lcY7jEcdmUYJzO5EWOja60Y/4XA=;
 b=CeFIwP7PZXc5S7TpKr0S8aWN8O0RzRlSyTtJGmAM3pozwtH8uytpM8fOZX/mEC5KZOdO02
 PqMJyW4+ME3ofT+rwV+ivFzbjJstZ6h3aHHlXISgziq9V4Uu0BFMqpgDcHb0a9kmUb+tpn
 GGnHLEFfMutWrX3cj2PxqwexLwQ+x/8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-jJe7GkiwN_uOOHAUF7ZfMw-1; Wed, 08 Sep 2021 01:46:50 -0400
X-MC-Unique: jJe7GkiwN_uOOHAUF7ZfMw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so497168wma.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I1VzT2G94p+Efge/lcY7jEcdmUYJzO5EWOja60Y/4XA=;
 b=fuTXjtPS1MKdPmeQGTeQfgK/DWNE2H/Oc+MLLU4Tyn48LMZfLSLZ8gt7WETRbc30Mc
 1/z0PSM8n8wjTeg7TOE4RNVcUjdvatW/4iRmkxW//GFAzANLsr5OTeTuFAjZitkhe2+H
 avNDigM8j0o1OnuGYoH7Vk7g2fTc0IdCidN9WEypcWiRD5o2wPb3GiVG/C92q/BZjRYU
 TKgvJVxVedsKqlV7wAtLWMNz6X/g49dw6VzVW97f8eI6+ELy0TWiA0Df/3D1VBPHPVVN
 +E37AkrXvk4B8uhfd2K5RXy85Qg6c1DQZxn15geqlq2pb5dVQ9g+n9r4hq5t3T+hr3w6
 2/Uw==
X-Gm-Message-State: AOAM532E1WcPpVTUT5uCMCt/Ysy0Md2O1L9tVJP86JZOznVD38r5xM5b
 q2DBQkeOOrfbgh5faIDH4QJmjco0Cm2irvuNHBr3Dy2H6QwM74rZvY0w7SoiUL8KSeDUqEpApQG
 Oy+65swzH8l49SsdXbv4rPNDKX6qqxduxpvDXxParxAFBfIT4B52o1VXC7sQDXeUU9ig=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr1669947wmq.21.1631080009129; 
 Tue, 07 Sep 2021 22:46:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwptvcwIzMH1YiAF1c8fFa/9DJtEwo0U4M8uzf1LXof3kKgZG1JmrAuFXq5VvC9B6jw4d8vww==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr1669928wmq.21.1631080008863; 
 Tue, 07 Sep 2021 22:46:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t11sm1085781wmi.23.2021.09.07.22.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 22:46:48 -0700 (PDT)
Subject: Re: [PATCH] meson: look up cp and dtrace with find_program()
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20210907172625.227568-1-pbonzini@redhat.com>
 <CAJ+F1CJcj4rqMJmq0H01Wus4rJu0pZQXWG3RqO=Q0XT+n_z6NQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <59ca8a4f-987e-00dc-b3af-3664c8641217@redhat.com>
Date: Wed, 8 Sep 2021 07:46:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJcj4rqMJmq0H01Wus4rJu0pZQXWG3RqO=Q0XT+n_z6NQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/21 21:06, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Sep 7, 2021 at 9:27 PM Paolo Bonzini <pbonzini@redhat.com 
> <mailto:pbonzini@redhat.com>> wrote:
> 
>     Avoid that meson prints a "Program xyz found" test once per
>     custom_target.
> 
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com
>     <mailto:pbonzini@redhat.com>>
> 
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com 
> 
> Is there a meson bug already?

I don't think it's a bug.  It also prints the message a lot if the 
program is a Python installation however, and that is a bug that I'll 
look into later today.

Paolo


