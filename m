Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E776C4F4022
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 23:13:24 +0200 (CEST)
Received: from localhost ([::1]:37996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbqUN-00061N-5M
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 17:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nbqTX-0005KT-Nh
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 17:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nbqTV-0007a9-EZ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 17:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649193147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H47bHcdywaz59oyRQ1W1JaDd0ewL2VeP7+ZcvBciFp4=;
 b=f8MN/Soc0B8AlvgswWaZH683RFlrezK1tF8QivTYknMmX0JnIu0eu5JgQjQv8j7bJAeixs
 ygKA9Z98ltSJAu0b1gm9+z3ftvGQs8yGUyGrRYCzzKVVWcmc1AKf2ddhnjThQxV1IiWN/i
 92VZjW3TQWW8vgwwIAjaPrzBjdOVKmc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-3Gl9J1gqOOmO__XNYpwbMA-1; Tue, 05 Apr 2022 17:12:26 -0400
X-MC-Unique: 3Gl9J1gqOOmO__XNYpwbMA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j67-20020adf9149000000b00203e6b7d151so19257wrj.13
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 14:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H47bHcdywaz59oyRQ1W1JaDd0ewL2VeP7+ZcvBciFp4=;
 b=IuYwAfOMm35s/pLxbd8UbdrR5m7be+z55sIpuM8P8Wi5fotUY1LuDbFNsFXeWCIX2x
 KyEaavdZLRmr3bBsvjrJR7VUE/EOtktBRyx2M0DjdcN6xdnM/YyDY7egtw6nT3uZLAfJ
 F/SwtZrZW5xO40JccWDB8Pz0dfSemGb7oh1Nrp/oyHBC+Aa/tTNOL6ialy8r6yWc3lkK
 kzYhI41ALcR6k7MGrjaZJ3oi58q9uDWPUg6f+XUJDMwwWtyKr9kCU0/PN3IiN5v5RlNI
 PiHSI2nVTh/mgwfsS7nEoF4OLY9lu2Kv2yv33VBnab5KWCYsWakgFMgQX2QBXPxwLEjR
 hz3w==
X-Gm-Message-State: AOAM5323rDoV9yfcadb3TZK7o34AbMY1zOc7L2ZtWrLM1/ToRymt6NPX
 X4yYmK/EY+mWkNsOQ3Z3hVjkFFrfpz2UDi8YtewFKKTPe98gjBASsbbB+9WyfXEoD4k+arAID5G
 w2ivfuhgzDQb2CBQ=
X-Received: by 2002:a7b:c5d0:0:b0:389:fe85:3d79 with SMTP id
 n16-20020a7bc5d0000000b00389fe853d79mr4819215wmk.77.1649193145059; 
 Tue, 05 Apr 2022 14:12:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLmxNacWJH2ZNYS6ZYi7tzFdsZYDj2aZiZWdj9mfaauSFtJ1+hFcoICONjp/mUVqnfRd2mQw==
X-Received: by 2002:a7b:c5d0:0:b0:389:fe85:3d79 with SMTP id
 n16-20020a7bc5d0000000b00389fe853d79mr4819193wmk.77.1649193144716; 
 Tue, 05 Apr 2022 14:12:24 -0700 (PDT)
Received: from redhat.com ([2.53.144.12]) by smtp.gmail.com with ESMTPSA id
 14-20020a056000154e00b00203f8adde0csm16155099wry.32.2022.04.05.14.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:12:24 -0700 (PDT)
Date: Tue, 5 Apr 2022 17:12:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <20220405171152-mutt-send-email-mst@kernel.org>
References: <20220405190658.65187-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220405190658.65187-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, alex.williamson@redhat.com, leobras@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 05, 2022 at 08:06:58PM +0100, Dr. David Alan Gilbert (git) wrote:

The patch is fine but pls repost as text not as
application/octet-stream.

Thanks!

-- 
MST


