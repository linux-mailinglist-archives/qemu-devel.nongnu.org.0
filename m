Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2328B3278F7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:13:42 +0100 (CET)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdgT-0006JG-5Z
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGdfc-0005qR-S7
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:12:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGdfa-0007d7-Sc
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614586365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9/ucvcTEzXbNbU/OddA91U7jqTV/TmyBIbmxntldHTU=;
 b=K2W7WJTGMayM/6Ir+++S8woWxQVAgDnc7U8a3ov6ck/2lR1/T3uMANcjZTMg0XzOjyYpUM
 6vHbtvpCwLai7s82cNwShH4qNESVZAiYSlWYRzmeE3a/f2yCN9MdK33sz2Ro1G+0hlBGCL
 9hEhNQTbXVO/HN66zpYU31HuX/3V0e8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-FNdb-BFwMSSRmPfHtBaYHg-1; Mon, 01 Mar 2021 03:12:43 -0500
X-MC-Unique: FNdb-BFwMSSRmPfHtBaYHg-1
Received: by mail-wr1-f69.google.com with SMTP id z6so278386wrh.11
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 00:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9/ucvcTEzXbNbU/OddA91U7jqTV/TmyBIbmxntldHTU=;
 b=BoxXIPCqis2DlwzBJiCzSDiiI1sMPdW5UZPGstRseK9Wv0KMDI1yPXIaa7F9qBNK7I
 G6XJouTimmrQWYDZhkasGeT9pmOXcuKhNPIti3OwH+HgdhIwdtxxNJPmkFkKoBGpfdvd
 q0iqOMsF8tTQaudrXL0lpQJ+2dLQsxTbO9qXanf5u2eZWAjiD3RXlvIkzxPVxaV8qUqR
 bHE0A2SDk0DJLDnLkBFjMNv/LrIbpPhe7gUweqETpbBlSDaKMgdVNHcRgLPnxHIHA8MI
 7Z0TvbTMiSTq51+Q16bZNGjFzJ0ZJ+AEugFIBQzNRDIzUbPWDfZTMcG97fSa7RpJSEdX
 3+6g==
X-Gm-Message-State: AOAM531XfHxVDyTXaPiUr4OaHCtVioP6+Kqun6N4TxqfGGtqpHy9FVJZ
 4gXs5RbI+GnGzzstEIlEp1J4tKQLSyj3S16E/sZUunVz3QR8BIZihbU2uH9gn15WNurcSGzJcqb
 N6oUCHBjNuzyffWU=
X-Received: by 2002:adf:f889:: with SMTP id u9mr5051996wrp.180.1614586361896; 
 Mon, 01 Mar 2021 00:12:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEDA7DPZN9r8oaEbSJoFCX2+Ujh4zf+hTkvcH0v4sxIlBJ7C6VXO6bkS2PzNeUbu/3sFGDPg==
X-Received: by 2002:adf:f889:: with SMTP id u9mr5051987wrp.180.1614586361802; 
 Mon, 01 Mar 2021 00:12:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x18sm22911619wrs.16.2021.03.01.00.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 00:12:41 -0800 (PST)
Subject: Re: [PATCH 1/3] docs: vhost-user: clean up request/reply description
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210226143413.188046-1-pbonzini@redhat.com>
 <20210226143413.188046-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a696d1eb-d43f-3d24-487d-6624c1c43535@redhat.com>
Date: Mon, 1 Mar 2021 09:12:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226143413.188046-2-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: sgarzare@redhat.com, jag.raman@oracle.com, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 3:34 PM, Paolo Bonzini wrote:
> It is not necessary to mention which side is sending/receiving
> each payload; it is more interesting to say which is the request
> and which is the reply.  This also matches what vhost-user-gpu.rst
> already does.
> 
> While at it, ensure that all messages list both the request and
> the reply payload.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/interop/vhost-user.rst | 163 +++++++++++++++++++++---------------
>  1 file changed, 95 insertions(+), 68 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


