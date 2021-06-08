Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D873A0420
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:30:14 +0200 (CEST)
Received: from localhost ([::1]:46968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhQR-00085q-NJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lqhP5-00079P-FG
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lqhP3-0006xf-S1
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623180523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DtK1WPweqToUzsf/Cmm3DR/cZvSjbtW1iAaq21urrBw=;
 b=do600PyR784PYS9DLLO9A88tvTU/D88AI8zjP60ECjkeF5sAmdKCEnWkaN4eJSU8D4sKgq
 W4xZOCd2qnSALbdd471L1Qk6TgT3s1wQ4WcjefqDN3U8/45tEJEVG8hE/ZP6i+7MUzl5Il
 42PpKN3tcuxgJ51PmjU97y5TJkwznJw=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-ZjG32EHmN76yQRkzlck7Mg-1; Tue, 08 Jun 2021 15:28:42 -0400
X-MC-Unique: ZjG32EHmN76yQRkzlck7Mg-1
Received: by mail-oo1-f69.google.com with SMTP id
 r130-20020a4a37880000b029024987ad471cso6784657oor.17
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DtK1WPweqToUzsf/Cmm3DR/cZvSjbtW1iAaq21urrBw=;
 b=OcNRnA0oEXTAB8nuUNlOq+JoacfIfVx6S2GDd4MgO2JykzoyfA1Spr9UDPzDYCEEcL
 L14I9ZAYoJ9KbZxcGys0rP5qftva8Cufxo6m1kHy1srWIQKsRKUdKuzbbA/nujzvlRuQ
 onydr4Ch47imZyAG9FffjcyWo0PMjxc3aDKQEui7cHSSljECI6kNr411V9OChpr+N09U
 q2S1dKcvGkUGJaWwzQhSAP6iEzaoGWROkd6K9v94miqVQqO/vpk2EJgu13pvyiajDLfp
 YwUvJewzWhcC+Pwd3Wr7xktu1W/kvQvJbFL0l37+GoXt6/tVpVDRWhLBbY2U6cxKRXwe
 tyQg==
X-Gm-Message-State: AOAM530gc3Apwb4iUWMAjnxHEcvvk7qFmUZuugoU4dzs6vDWNi/LnnSd
 HHA2O5LpvNFHLFIgqDBFogRJrFbO4DzmMraf718z31MY9sjOvOrpn1GLiOloTXljVqwYbYfjMi4
 aT97LI+ybHJQVEMM=
X-Received: by 2002:a4a:1401:: with SMTP id 1mr16372417ood.50.1623180521300;
 Tue, 08 Jun 2021 12:28:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBXStSWe4aDINXWW0vW+c2QTC5UOwfjXaYWelY05sA7ttR7uKjKxb7m+ZT8qTg5Dvl5ddjaQ==
X-Received: by 2002:a4a:1401:: with SMTP id 1mr16372403ood.50.1623180521154;
 Tue, 08 Jun 2021 12:28:41 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 q1sm3043537oog.46.2021.06.08.12.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 12:28:40 -0700 (PDT)
Subject: Re: [PATCH] Add Connor Kuehl as reviewer for AMD SEV
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
References: <20210608192537.103584-1-ckuehl@redhat.com>
Message-ID: <2fa0225d-6d6c-b70f-c9d2-81538230aee5@redhat.com>
Date: Tue, 8 Jun 2021 14:28:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608192537.103584-1-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 2:25 PM, Connor Kuehl wrote:
> It may not be appropriate for me to take over as a maintainer at this time,
> but I would consider myself familiar with AMD SEV and what this code is
> meant to be doing as part of a VMM for launching SEV-protected guests.
> 
> To that end, I would be happy to volunteer as a reviewer for SEV-related
> changes so that I am CC'd on them and can help share the review burden with
> whoever does maintain this code.
> 
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
> Note: because there's no maintainer entry, when running
> ./scripts/get_maintainers.pl on target/i386/sev.c, my name and the qemu
> mailing list is the only thing that shows up... it doesn't even show
> previous committers (as it would before applying this patch). Which is
> probably not great considering I do not make pull requests to QEMU.
> 
> Is the way forward to get someone to sign up as a maintainer before
> applying a patch like this?

I need to resend this patch since I realized I forgot to add
target/i386/sev_i386.h, and target/i386/sev-stub.c, but I still am
wondering about the answer to the question above.

Connor


