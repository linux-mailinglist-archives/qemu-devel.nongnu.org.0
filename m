Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C996542F78
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 13:51:56 +0200 (CEST)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyuE6-0004jK-21
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 07:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyu3q-0001fu-As
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 07:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyu3n-0004vP-HW
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 07:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654688474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wbACJzlgy+F4tnHKUWkA5u+1JxD/8oJ27sTvLw2bDEo=;
 b=MrxZQyL4Xe9M5XVIUXdnDHsQZm3pzbTRa3SM74VCsCI+J64LmrmZOsaa1DLKAZX32AB3dD
 f+9jYQ44Yj3g4fRnPRy0nkhdLGj4vEuXsq5OzRvWsOXzKuEhDfQF6sulByyeb9aVGa+db/
 Aek9/TA/noOI2pFqT3Rly2WbvG4u9dU=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-tFGraTqJOXaZdzM_zERi8w-1; Wed, 08 Jun 2022 07:41:13 -0400
X-MC-Unique: tFGraTqJOXaZdzM_zERi8w-1
Received: by mail-io1-f69.google.com with SMTP id
 j12-20020a5d93cc000000b006692aee869fso6030464ioo.5
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 04:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wbACJzlgy+F4tnHKUWkA5u+1JxD/8oJ27sTvLw2bDEo=;
 b=vE5g70svo8TViFeCVh1YS4nsWV/RetZSCu+vawfoyEZZe/oY1R1d2uDJLWHqqbwbfs
 oQXKHr2vcgwXTvsXDl/t+Dji9UPUuuIiE3W9OgZ1gSDZlTvJNrNuPjO4pU74PB7Mbhmk
 9pYVSaa4z+H49QzRiTmgOKHuVeVaKClCqgAuaKi5BEcYL5AS6LtsqkAd57UsiAnZjSyk
 Mek1BljulmcWmogtTNa29fwrRXU59p0Lbo6HD2rDcAP1LeML5Hn5n24EbUMguxlP2hDQ
 P//Lgkke7x2TEHV8yS+QMVCgK+pMb+6JPdF7+Vo4SudOMtJpVtHXIqRIfFKTB28HPOZT
 UU2w==
X-Gm-Message-State: AOAM532f6hchJuCX+hzLdKU3gu+JqsTqRzVyaS786kRN7ZcueRlQ9qt2
 S0xPsH0YdSgHH877yS4g7+VD6pXQ50Z7p9edWmwUcPAIq/iUcJVo5IH7gzOPNCECS6Ao36DaAwU
 Rel4W+AiGW/lhzDk=
X-Received: by 2002:a05:6638:250c:b0:331:591f:98ee with SMTP id
 v12-20020a056638250c00b00331591f98eemr18021978jat.23.1654688472851; 
 Wed, 08 Jun 2022 04:41:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7DE3MAHBp0Am3ofWd8BXB3Go9pZLMH5eh4KCMfCPrbthsluphHN9yhmeFoC2JZ/CejTkgaQ==
X-Received: by 2002:a05:6638:250c:b0:331:591f:98ee with SMTP id
 v12-20020a056638250c00b00331591f98eemr18021954jat.23.1654688472636; 
 Wed, 08 Jun 2022 04:41:12 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056e02124700b002d4099d2377sm6357702ilq.26.2022.06.08.04.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 04:41:11 -0700 (PDT)
Date: Wed, 8 Jun 2022 07:41:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
Message-ID: <YqCK1UBLjXzo+nm7@xz-m1.local>
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
 <YpdwcHu7I8dGDimt@xz-m1.local>
 <CAJ6HWG7vxRzEN5CRf93m_afHPn9zvMdYe=DZ4pGKKBQ8gyTY+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG7vxRzEN5CRf93m_afHPn9zvMdYe=DZ4pGKKBQ8gyTY+Q@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 08, 2022 at 02:37:28AM -0300, Leonardo Bras Soares Passos wrote:
> (1) is not an option, as the interface currently uses ret=1 to make
> sure MSG_ZEROCOPY is getting used,
> I added that so the user of qio_channel can switch off zero-copy if
> it's not getting used, and save some cpu.

Yes (1) is not, but could you explain what do you mean by making sure
MSG_ZEROCOPY being used?  Why is it relevant to the retval here?

I just figured it's a bit weird to return >0 here in flush().

> 
> (2) is not a problem, but I fail to see how useful that would be. Is
> the idea manually keeping track of flush happening?

Yes if we can check this up it'll be good enough to me.  The trace point
could help in some case in the future too to monitor the behavior of kernel
MSG_ERRQUEUE but if you don't like it then it's okay.

-- 
Peter Xu


