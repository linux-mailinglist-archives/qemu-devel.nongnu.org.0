Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C733AC4B4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 09:09:57 +0200 (CEST)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu8dX-0006NL-Pp
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 03:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lu8c2-0005gN-Dv
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 03:08:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lu8by-0007hH-6X
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 03:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624000096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YabS/sZJ6CDZMd0EbOyQRgbIrwE2bJ+J3oRIdEDEaWI=;
 b=XAzWdhh7vApTrrJSkOLySPqjI1a9cfYVY4cDM+sZ2FoHbz7C4vPr2s6Tti25+5Y4f2Upcu
 PEJGfSiSH42GcbEcPqu1GLCXyjQ0qnduBLJJ72N5STxIiII3DbLbOhFaGR9SIMz9droyz+
 47NxgOWYoHai1UpgZpc1kFo5uVmAHWk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-VpD9MP2JOvyk6QOegvJbmg-1; Fri, 18 Jun 2021 03:08:11 -0400
X-MC-Unique: VpD9MP2JOvyk6QOegvJbmg-1
Received: by mail-wr1-f71.google.com with SMTP id
 j2-20020a5d61820000b029011a6a8149b5so3548795wru.14
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 00:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YabS/sZJ6CDZMd0EbOyQRgbIrwE2bJ+J3oRIdEDEaWI=;
 b=Nc8xi0fvB/FHM88X++9utcfEcBkef/j/FneLhn1Y2LGthiWFQ9O7Uk8kwNlZwcuCim
 +P6tKnNx1J/ojc+duFUsRm0pbGgOe/UvMjByaG61CCa36204Os9C9pt8dKYYFZ2mOgxd
 VJ1HfWwDa2Xz2oCCkLgbBScXK3phhLz+vxMlXz5ks6PL838IZn3GHvDf+WvGV+llF7I0
 uRRp1v0Q4hSnJ5Af5RbSOs8AVVmMA9ut3O28IMvR4IoO+WXqKp9MdAEyRCWxHc+iX6pd
 18j1u4P2OMgweo1aFXwBkiRHzMO/bvxSYj0wuhuTMzN+I+e3zBGAUYvQoVfRuvSRI58P
 /1pw==
X-Gm-Message-State: AOAM5331LtRR8Y2gIvhRD10kt7FHjetkHz490sBIsYgvRopLd1ZI1odU
 5B17PApVyEzRFiF5dK4YV3kOQD195O78pUcEO6ZnDpsoQY7D/0PE+0GrzbjzRXVaI2iV7wEnIur
 8aMPonpQmEG5MqX65ulw7tSQzlqsfQfE5cTrNVxKdM7/v31FOCFJr412km09zEwQ=
X-Received: by 2002:a05:600c:2190:: with SMTP id
 e16mr9829384wme.188.1624000090416; 
 Fri, 18 Jun 2021 00:08:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKO2zuvt4QVYzgIwp5A5H/2RvCWGdXqUdpsvf0LK9/K6qZp7m2hrD5O9PglkWd1ibU4j/jvg==
X-Received: by 2002:a05:600c:2190:: with SMTP id
 e16mr9829362wme.188.1624000090194; 
 Fri, 18 Jun 2021 00:08:10 -0700 (PDT)
Received: from thuth.remote.csb (pd9575f42.dip0.t-ipconnect.de. [217.87.95.66])
 by smtp.gmail.com with ESMTPSA id l23sm5487900wmc.5.2021.06.18.00.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 00:08:09 -0700 (PDT)
Subject: Re: [PULL 1/4] Hexagon (target/hexagon) fix bug in fLSBNEW*
To: Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1623966755-30225-1-git-send-email-tsimpson@quicinc.com>
 <1623966755-30225-2-git-send-email-tsimpson@quicinc.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4f68879e-d210-1153-a2bc-5b11e6ec3a35@redhat.com>
Date: Fri, 18 Jun 2021 09:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1623966755-30225-2-git-send-email-tsimpson@quicinc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/2021 23.52, Taylor Simpson wrote:
> Change fLSBNEW/fLSBNEW0/fLSBNEW1 from copy to "x & 1"
> Remove gen_logical_not function
> Clean up fLSBNEWNOT to use andi-1 followed by xori-1
> 
> Test cases added to tests/tcg/hexagon/misc.c
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h    | 27 ++++++++++-----------------
>   target/hexagon/op_helper.c |  5 -----
>   tests/tcg/hexagon/misc.c   | 39 ++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 48 insertions(+), 23 deletions(-)

  Hi!

Looks like you've missed to add a cover letter with the PULL information to 
this series (at least I did not receive one and the archive on 
https://lists.gnu.org/archive/html/qemu-devel/2021-06/threads.html doesn't 
show it either)... I guess Peter won't be able to process this PULL request 
that way, so please send again with a proper cover letter added.

  Thomas


