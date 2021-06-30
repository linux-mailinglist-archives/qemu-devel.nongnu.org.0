Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00A3B80BF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:17:28 +0200 (CEST)
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyXHb-0002Ct-3V
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyXGb-00016y-KO
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyXGZ-0007qm-DA
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625048182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3b52Sx02AT8DbzoZQXVrQO80kP603wsH8wAKvofgkU=;
 b=PJrV9xn+u91vHyapu3frT7BSelnlmbEIhyHBG1+k0AM4f/ixW4w+LmjbsrIhrXOs2P/frQ
 BfZvmQyN1bFuStjBj8RU8JdbXkgpvqxaKw7ilQSy1qapFrGdeyfvh7Acilia9OL3euN2JM
 ET/6aukKvV3ljuZoexchvFuJQCdTEYo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-jef4a4faOeipdY2NpFW_xA-1; Wed, 30 Jun 2021 06:16:21 -0400
X-MC-Unique: jef4a4faOeipdY2NpFW_xA-1
Received: by mail-wm1-f71.google.com with SMTP id
 a129-20020a1ce3870000b02901f050bc61d2so461193wmh.8
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 03:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v3b52Sx02AT8DbzoZQXVrQO80kP603wsH8wAKvofgkU=;
 b=d88iz5OOCZeKwQ0yDabseyYD115mXKLim8AZZ1WLZTU+NbsO8o7atA+Gjp6UlYtqeX
 55zwKAxYJ1A3dcjo10W1yNPl1Sfhl2e25Uj6iA2UQ0A2TapAomSpdN26/FnvRyK6r0D1
 hshOKf+h5SKsx5vbANi717WdZtc7KwUL3w2odbcxHSmJzJ1mIPc6V1I3J+hJOsJTdS+s
 TE4OgPUxiIkKwnVUoQ3g4jlN4vOa4YN/AobCwXeOSa1QrTRHl5M5gZCLU02TijKTa7jG
 aVZ0twD45Ea/3p3P7euL5vM0gM8rIlvChObWKsU+jWn5WS2z1TLBaSO/zliUTjwB7M+i
 ggHg==
X-Gm-Message-State: AOAM531oTL4u8kt1l5QXWnRcXIkFFOKlDgPTg4QOyuR1QuoaGHGBzJDD
 T7ApEZ1/I/k1kbhZOC3qYgX1jxVVZ47xtGF+BlrCkQLpMlytrHJLDGYoW+/LjmF/A59i/pprSV1
 /3oSo9vXWkays4Mw=
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr23573022wmq.49.1625048179932; 
 Wed, 30 Jun 2021 03:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdx6eLZlErlyXU2WXpmwF2axTEzAzX8pp+C8avN2U319p1DoSHJH65Gq41KsTTYnDZ9kiXOg==
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr23573005wmq.49.1625048179758; 
 Wed, 30 Jun 2021 03:16:19 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ed8.dip0.t-ipconnect.de.
 [217.87.94.216])
 by smtp.gmail.com with ESMTPSA id m41sm5967647wms.26.2021.06.30.03.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 03:16:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210630092127.374720-1-thuth@redhat.com>
 <CAFEAcA_XDvTxRHWE3TwP-hZk_DeS-AUCyv9-WZCYKE3zQtSU6Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] ui: Mark the '-no-quit' option as deprecated
Message-ID: <e67d70cd-1e0c-5618-2572-3e0aa95049ff@redhat.com>
Date: Wed, 30 Jun 2021 12:16:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_XDvTxRHWE3TwP-hZk_DeS-AUCyv9-WZCYKE3zQtSU6Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Libvirt <libvir-list@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/06/2021 12.01, Peter Maydell wrote:
> On Wed, 30 Jun 2021 at 10:22, Thomas Huth <thuth@redhat.com> wrote:
>>
>> It's just a cumbersome wrapper around the -display ...,window_close=off
>> parameter, so we should rather tell our users to use that instead.
> 
> This is an interesting definition of "cumbersome" -- personally
> I would say the long -display option is the cumbersome one :-)

The cumbersome was rather meant from a code / maintenance side of view. But 
I think the naming of this parameter is also quite misleading. It really 
just blocks the closing button of the window, you can still quit QEMU by 
other means (e.g. with the "Quit" menu item in the GTK menu or by shutting 
down the guest), so the "window_close=off" wording is certainly more 
understandable.

... and by the way, I think the documentation in qemu-options.hx is 
inaccurate, too, it only talks about SDL, but it seems like this option is 
also available with GTK. So this -no-quit option really seems like old cruft 
to me which we should try to get rid of...

  Thomas


