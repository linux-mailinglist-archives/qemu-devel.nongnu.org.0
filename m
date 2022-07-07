Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D79556AE3D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 00:19:38 +0200 (CEST)
Received: from localhost ([::1]:42330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ZqR-00023H-M6
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 18:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Zp7-0001Hi-Iu
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 18:18:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Zp3-0004ar-Vu
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 18:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657232288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xn42YU/aO1FwMtKy5Bz2UBQ2zzht3ZCG69IYO0ZbiHU=;
 b=L5EJBVnNKookH1IxE+fxnkmO4J5ZVseqJmrkK3LLLGudQcFDD10XB/lS+7kSt9W7yIVmw3
 y1PhgKUugL0q9WF0rP8q86FqFhMvqCH99CTBj/DUlIOiLS2G0b0nCT+FbiTuutuNUUbeuG
 HKWIcSAAYwI0obu9J06K7HQQgYo20jE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-QM5fuBUiMGS54-XIUgbVdw-1; Thu, 07 Jul 2022 18:18:07 -0400
X-MC-Unique: QM5fuBUiMGS54-XIUgbVdw-1
Received: by mail-qt1-f197.google.com with SMTP id
 cf8-20020a05622a400800b0031e80dcf14cso10142360qtb.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 15:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xn42YU/aO1FwMtKy5Bz2UBQ2zzht3ZCG69IYO0ZbiHU=;
 b=O762cqfQs1LN3Pm54oJgU0fOBDwsz51WQikKniqkF+m6jVKoGbb+nBVcO8c91bCS+A
 vLLXqEYRPwNiUhYNlNUIB/9BHoRvKGZuvP+aZRoAphGZgv5K2kgbD9mYHblI4HnTZaR/
 Lod53hNTZUt3L8rU5CDyciLljGl1VEmszx5jHS+EPWYM2a3UKwFsITEf4H02XD5weuPl
 UEhG6JKipN+w+HAJskLJuQmf2ZTNrhULwrtyq936Yz2H876FMloIaV2lW3Ji/0CxcVTB
 z3HYO9voyecBeTpcHOUaSSAb3pC3EdXlfVwfMKF2w3M4lEtEadue65gCqAvARdd8vDng
 o4Jw==
X-Gm-Message-State: AJIora8Pht8ZSTccUWLfAXBT/f92AlHW4hcKE/02VSJhqebVG3qHabux
 /rm06Pk1Qw25t8+niWNKBzG+y5qJ34JiNdXSZ5LSsZl9oQWnKiCqe3NznrdxSNIDrST6eITQxXF
 oAMDeUeYE36QxTlY=
X-Received: by 2002:a05:620a:574:b0:6b5:5032:5e98 with SMTP id
 p20-20020a05620a057400b006b550325e98mr152069qkp.509.1657232287393; 
 Thu, 07 Jul 2022 15:18:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vDs/YM05ybqiiXJ8jFWL9Nuzv5nLzsD+GDRRgzu2uVnG54dViIL7U33chhFotdQiKHY6oKSQ==
X-Received: by 2002:a05:620a:574:b0:6b5:5032:5e98 with SMTP id
 p20-20020a05620a057400b006b550325e98mr152059qkp.509.1657232287173; 
 Thu, 07 Jul 2022 15:18:07 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
 by smtp.gmail.com with ESMTPSA id
 o23-20020ac84297000000b0031871343473sm25683773qtl.83.2022.07.07.15.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 15:18:06 -0700 (PDT)
Date: Thu, 7 Jul 2022 18:18:05 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo =?utf-8?B?QnLDoXM=?= <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 1/3] QIOChannelSocket: Fix zero-copy flush returning
 code 1 when nothing sent
Message-ID: <YsdbnfbTnE/ZJvQt@xz-m1.local>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-2-leobras@redhat.com>
 <YsccDel9oiTPqvHW@xz-m1.local>
 <CAJ6HWG5YbABGpacT9hD1dx0-o3Ey8sN++=MxhEaGML62jzQ=xQ@mail.gmail.com>
 <Ysc5hpnTb3k96Ubo@xz-m1.local>
 <904f8698a28c27bddbabaa1207a695fe0a832607.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <904f8698a28c27bddbabaa1207a695fe0a832607.camel@redhat.com>
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

On Thu, Jul 07, 2022 at 06:14:17PM -0300, Leonardo Brás wrote:
> Having 'if(queued == sent)' will cause us to falsely return '1' in two buggy
> cases, while 'if queued == 0) will either skip early or go into 'infinite' loop.

I'm not sure I strictly follow here..

Imagine the case we do flush() twice without sending anything, then in the
1st flush we'll see queued>sent, we'll finish flush() until queued==sent.
Then in the 2nd (continuous) flush() we'll see queued==sent immediately.

IIUC with the current patch we'll return 1 which I think is wrong because
fallback didn't happen, and if with the change to "if (queued==sent) return
0" it'll fix it?

-- 
Peter Xu


