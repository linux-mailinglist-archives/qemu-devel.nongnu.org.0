Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7C03A8805
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:48:42 +0200 (CEST)
Received: from localhost ([::1]:49130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltDB3-0002UE-81
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltD8b-0008PP-Al
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltD8Y-0006hn-2R
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623779164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPbjb3EP2AVsrXjpE3rkE/RXDfGXi0S62xvIUZxYXn0=;
 b=UW8K+9nIpONnLS18X8VXn9LTxDnO4Y5B3L8HBFNSyVXGUPtnjGfBQS0aeAmQmTaUs1jwQq
 tn2kYlHttkE8JRx4+XXD3iysynCnnYd5gEDUL+S6cmYa1JIAEtxPZikSZOYG5Dmv2hr4hm
 J6opmPzk9FaXQ4Pe5TS+CEPx+6H8wRg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-I03mTXELM6WzrX5eEvaUiQ-1; Tue, 15 Jun 2021 13:46:03 -0400
X-MC-Unique: I03mTXELM6WzrX5eEvaUiQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so8976492wrq.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FPbjb3EP2AVsrXjpE3rkE/RXDfGXi0S62xvIUZxYXn0=;
 b=Z5U7FaYYheDP2WsEda/V2qjK5MxYbny+lZKw0uv0QtB87tREZKlDK/GxksauO+NO8M
 e3ZleUVdaDcU9QuUzvyQrtQ6Pr4VNTxDxSCSI/Puk5ywanApF39zPCb72Uaa0++gqAJG
 uVzyFKWPYSxKeNo4R8cL7IZSBDvt/FuDzzzyz/MnJH4CARgcaYXky/jzazOwnBOWegHO
 6rSyiCBWkte5AWfjvZbj3XNpXUp2WhayBGjqGGcpxNmqYx51T8SrlSLtXxoQtpfSTgNx
 61Jxff2Ks/1DkY0+x13Upj83NINYsUib+q7sywo+AA6CqWp31aYqcMwgNfk3k/VU/4ct
 rGTA==
X-Gm-Message-State: AOAM531jEHbQEItG0LisPjn3AKrHIYuM6fV+GIuebUBk5EJBe5dvxOio
 z2T/hhL5aceSqqj8iyXfMF2qn03SiWGzaNldXLJCOfOmOIiFzZtoRCU3ZHwenenkPeeNNQfub8S
 HrT4kyXdpu3h4G3E=
X-Received: by 2002:a5d:4408:: with SMTP id z8mr317131wrq.336.1623779162280;
 Tue, 15 Jun 2021 10:46:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3nKqtUEr6BDs2MabflnyNdtOmvwmMFDDJeMCJOwZOvtJS6gOVbKupGidR9ZN0DrjgAU8oyQ==
X-Received: by 2002:a5d:4408:: with SMTP id z8mr317109wrq.336.1623779162111;
 Tue, 15 Jun 2021 10:46:02 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p5sm20653630wrd.25.2021.06.15.10.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 10:46:01 -0700 (PDT)
Subject: Re: [PATCH 01/11] MAINTAINERS: Add Connor Kuehl as reviewer for AMD
 SEV
To: qemu-devel@nongnu.org
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f7df7248-83cf-a849-a18e-08ba7608e63a@redhat.com>
Date: Tue, 15 Jun 2021 19:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610064556.1421620-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 8:45 AM, Philippe Mathieu-Daudé wrote:
> From: Connor Kuehl <ckuehl@redhat.com>
> 
> It may not be appropriate for me to take over as a maintainer at this time,
> but I would consider myself familiar with AMD SEV and what this code is
> meant to be doing as part of a VMM for launching SEV-protected guests.
> 
> To that end, I would be happy to volunteer as a reviewer for SEV-related
> changes so that I am CC'd on them and can help share the review burden with
> whoever does maintain this code.
> 
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> Message-Id: <20210608192537.103584-1-ckuehl@redhat.com>
> [PMD: Cover more files]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks for stepping in!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


