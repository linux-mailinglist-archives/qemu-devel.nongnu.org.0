Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7FA399F78
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:05:30 +0200 (CEST)
Received: from localhost ([::1]:34750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lolAH-0002mu-Jv
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lol8a-0001xo-PH
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lol8X-0005Ek-Hf
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622718219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/wtfishHGPz9vIEJ2WW8UJjwB6D5P9ZkEWEs34YdL0=;
 b=eJ/JPghlDMpfwzIv4E+PP71fjZIHcJ1fRi//AVmB9CIoq0kwI/Pzp/9mE080AtUR9yTwIY
 FHyrYto2nqusNgnfohH1kj+NVMlX2Mkhp0lrfriJCCM5YH9EZEtzHTaIGTyTWr9ELZVbAh
 vCTmt3dxwMIR+awUxuTw+4ukSLnzDGw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-F8LCF0E5PE2RRT8meJ68oA-1; Thu, 03 Jun 2021 07:03:38 -0400
X-MC-Unique: F8LCF0E5PE2RRT8meJ68oA-1
Received: by mail-ed1-f69.google.com with SMTP id
 h18-20020a05640250d2b029038cc3938914so3065974edb.17
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 04:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w/wtfishHGPz9vIEJ2WW8UJjwB6D5P9ZkEWEs34YdL0=;
 b=J2Rceua4q/Vs4fc/gYA/2/XoQ6bUTL1gDHbvrtoPEJsWUA1gcodR/M3Up42olhPMit
 AS38NuQf9R0OSRIYMeXOgOeiN43VSGoWVAziQPYpSm4qj6fVZpVyJFCHWbkhsNAREOf/
 RJCixSroA5x0FzJN94LfyuxyzTqloiJCVSl/8GsPyEC0mPJ4jhewhDyBmJlxu9+2942r
 OvWRTGlKaQbdgQ5VuixbwO1xpK2MVAgfBh228/30u1RUYDO1ZKQ6ABSAbTaPXRFSiJ3x
 NgoSWMUgW2oXJ+njI36ZretSKhqWtTuadEJ5GN10dUtogV8QRTW3IdNbHNgjssTlF2Dn
 o/1g==
X-Gm-Message-State: AOAM532udlBNQDqnLFk3AGXUGyZs18EPtBeZ0nShdGVRZr6oZnV2cCjc
 tz9Klnitw80uePKlgWvfwMtwiOFM21LzT/puSAAlEY2NOEpj9XUROOimTmxre9PGnOMgAc0Liuc
 vD9Q0a45aki3IMPM=
X-Received: by 2002:a17:906:1444:: with SMTP id
 q4mr38629437ejc.459.1622718217042; 
 Thu, 03 Jun 2021 04:03:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4rbigplohISvHuE9kHNMFQVWeJX0xkamdUtx9ZcCf+Idn5MrRjxud10LoQgOraDvzIxuaww==
X-Received: by 2002:a17:906:1444:: with SMTP id
 q4mr38629407ejc.459.1622718216761; 
 Thu, 03 Jun 2021 04:03:36 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 r21sm1590278edy.78.2021.06.03.04.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 04:03:36 -0700 (PDT)
Subject: Re: [PATCH v4 05/15] qemu-iotests: delay QMP socket timers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-6-eesposit@redhat.com>
 <5bde3128-e972-3653-308b-4faa4eb52bb6@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <bbf2c63d-662b-541e-6a65-1419f650e066@redhat.com>
Date: Thu, 3 Jun 2021 13:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5bde3128-e972-3653-308b-4faa4eb52bb6@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> 
> So, you just make the class do nothing.. I'd prefer something like this:
> 
> @contextmanager
> def NoTimeout:
>     yield
> 
> if qemu_gdb:
>    Timeout = NoTimeout

I am not sure I understand what you want to do here.
I have a basic understanding of @contextmanager, but can you explain 
more what you want to do?

Alternatively, I send the patch as-is, and then you can send this change.

Thank you,
Emanuele

> 
> 
> anyway:
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 


