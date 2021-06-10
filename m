Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7D3A2F60
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:32:55 +0200 (CEST)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMfu-0003W2-AI
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrMeB-0000tT-Fm
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrMe9-0005Y0-TO
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623339065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhQw6oEloHU6k1dqwdftImhKt4+1/3JzzEB5I8saXtQ=;
 b=JqUyTnWZva0SVoPQI89BjYs2FYiqj8wm5EuzRBOHS3P9YdaR6kXpE3yH9ZsRlhugPwFt8I
 RH3guHqCh6jk0wJeRT2mwahG70wQtM2hGEoAe1XbH6lGu/mL/jH8IIHD7nYN1Q67nPR1xp
 TqDUqsuGFWSQdEwm3CCT4FttliefYYU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-BkFsUt-SO2GHcNyBanpnMQ-1; Thu, 10 Jun 2021 11:19:57 -0400
X-MC-Unique: BkFsUt-SO2GHcNyBanpnMQ-1
Received: by mail-ot1-f71.google.com with SMTP id
 19-20020a9d04130000b02903cb28b38d0aso17102236otc.19
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 08:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uhQw6oEloHU6k1dqwdftImhKt4+1/3JzzEB5I8saXtQ=;
 b=jgRbyb4Wd4ct5rReHzU/4xrngBkv6RvZxMJXQPXyPI1uNRGuBsqUDP6e3C9MRpm6Px
 1ueRf5t3tJA5+ZPr0IoIZK2V9mId7sgACyLjQmwXapbJukVYouZ7BwV/L5eAyOr7pgOy
 hduhI8cubBCmUwjb0qDrmcZJhrQzBvha2247aMOKeA1JJyduk8ShJ2bBm1DnBZdpPlC9
 KG3mwZDy7YnStt4VaxXtAmxr3NvfMeze2feM3AaKHilbHfSy2ehgTIeGqhOkt+QhLRoi
 cQ9sGoMHs7m1Qaf/w9N5In+mwcE+ApsNw1uSJ8iLjUgwkrrZEjn92OZjKutEZLrC9PCg
 grow==
X-Gm-Message-State: AOAM532Anj8RFJ2NSbTaqPpqCy4YtQtFboGYHHDtKywdOFSHMeOKNjPb
 fB727cTsfS6Z3CPuZOOi2cunL/8lm8GjaixKdFNiOPV5Wl4+6kiPv50EXtu1TxGXl1f2HaR0iCN
 h9J+2IJx54QDaifo=
X-Received: by 2002:a05:6830:1396:: with SMTP id
 d22mr2843703otq.55.1623338396825; 
 Thu, 10 Jun 2021 08:19:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhddWMEHA/muc6v7kHEsTD09pMJjv+zmN9unhB/D5bhFojfNYyUkDwZMGmHqxx5wiKmlA7Jw==
X-Received: by 2002:a05:6830:1396:: with SMTP id
 d22mr2843697otq.55.1623338396650; 
 Thu, 10 Jun 2021 08:19:56 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 w8sm649012otk.16.2021.06.10.08.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 08:19:56 -0700 (PDT)
Subject: Re: [PATCH 10/11] target/i386/monitor: Move SEV specific commands to
 sev.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-11-philmd@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <0d8406ad-5f64-8add-9b05-4970ba1a14b8@redhat.com>
Date: Thu, 10 Jun 2021 10:19:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610064556.1421620-11-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 1:45 AM, Philippe Mathieu-Daudé wrote:
> Having the HMP/QMP commands defined in monitor.c makes the stubs
> rather complicated when SEV is not built in. To simplify, move the
> SEV functions to sev.c, and remove a layer of stubs.
> 
> Also make it clearer when SEV is not built in, so developers don't
> try to enable it when it is not enablable:
> 
>  - before:
> 
>   (qemu) info sev
>   SEV is not enabled
> 
> - after:
> 
>   (qemu) info sev
>   SEV is not available in this QEMU
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/i386/monitor.c         | 96 ----------------------------------
>  target/i386/sev-sysemu-stub.c | 29 +++++++----
>  target/i386/sev.c             | 97 +++++++++++++++++++++++++++++++++++

Hi Philippe,

I agree that the split from monitor.c makes it easier to follow. Instead
of putting the QMP entry points in sev-sysemu-stub. and sev.c, what do
you think of placing them in sev-qmp-stub.c and sev-qmp.c, respectively?

I find that appealing from a code organization/module boundary
perspective.

Connor


