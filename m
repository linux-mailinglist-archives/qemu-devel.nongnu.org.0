Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AF6481DEF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 17:07:30 +0100 (CET)
Received: from localhost ([::1]:50504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2xxh-0008Vn-Q6
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 11:07:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xu6-0007D0-UR
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 11:03:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xu4-00047m-Fz
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 11:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640880223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JtPDPu3QtCmxReWn+yjMCRr4WSNNaK7KyhJQAskfNig=;
 b=QDqwd63SvXR9sTSubsxNsjFM97pfZdA3W65+LBXhYu3dmSIDUfOhHciztuWZNmzG3LilR/
 3f2O7AFB+wEc2qnQKSK5fKxTLe589paZ43xmaaMSJfRVyN8OwxWT9GcmHbt/MsktA+trLG
 MbXPjnCsA3Yp668FKDFaAzqn5nEQ8WM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-bktOsDUXOaS5W0CpPth2yg-1; Thu, 30 Dec 2021 11:03:42 -0500
X-MC-Unique: bktOsDUXOaS5W0CpPth2yg-1
Received: by mail-wr1-f72.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so5076605wrh.23
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 08:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JtPDPu3QtCmxReWn+yjMCRr4WSNNaK7KyhJQAskfNig=;
 b=0AQqNm5laY8CB7gWcQWSG8yUtht+mllPZXoUQkSQwZPc4dYT+Ynt+xHSvyrNPt3EzU
 UoBarbp4zJsVUQsXAiiE+T/BycSoB0bYqRJrB0SC5KJO0yhQoEm9R4AA1ysfSKBtfc3M
 pq92PI9GNfiFaFZoq+MOHt5T3tcu6ToVCdixhJ4WAt8/+TqLvEpC9voOtiVBp5K8lGjL
 DltO7m6dAhu9DqOSwIiHwyPIlS7KLUIQfSUitv90N1kK/N658xR7vvaW4lxMueN7oItz
 WqrJVIQ08vqf81ZxOF/wvHtwUjeGF9A20Db4Kzm/lRI01WwUeKbxbHm0gtHp1V2ouRzC
 Yl+g==
X-Gm-Message-State: AOAM533oEUud086w7k71RYF2ATeDbN8OLBg5OqBp7cJoAfASph67qexP
 T+kPUaWsU8mpS1RF7pMKvoPDiu6JChVBjHm2RXKV0MzPvqFLyiVtpxIvFoQmrdAHUmmR4r1bmoP
 rDMd64Ijdbf3h3zU=
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr27255453wri.45.1640880221739; 
 Thu, 30 Dec 2021 08:03:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxj/jYe2Gnys70nwCHGLe3VDROsPnDi7jfgoB1kmU1cHxR1AjDqJn+K33d1czj2BHus1KgLw==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr27255412wri.45.1640880221160; 
 Thu, 30 Dec 2021 08:03:41 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id j17sm23989414wrp.68.2021.12.30.08.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 08:03:40 -0800 (PST)
Message-ID: <657e35d6-57c0-c84b-44e3-5ba25639ce40@redhat.com>
Date: Thu, 30 Dec 2021 17:03:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 5/8] migration: Drop return code for disgard ram process
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211224065000.97572-1-peterx@redhat.com>
 <20211224065000.97572-6-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211224065000.97572-6-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/21 07:49, Peter Xu wrote:
> It will just never fail.  Drop those return values where they're constantly
> zeros.
> 
> A tiny touch-up on the tracepoint so trace_ram_postcopy_send_discard_bitmap()
> is called after the logic itself (which sounds more reasonable).
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c |  5 +----
>  migration/ram.c       | 20 +++++---------------
>  migration/ram.h       |  2 +-
>  3 files changed, 7 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


