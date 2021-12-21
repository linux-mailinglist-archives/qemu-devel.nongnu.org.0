Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B447BBD9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:30:03 +0100 (CET)
Received: from localhost ([::1]:54166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzaX4-0000xQ-Cm
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzaVa-0000Gn-Md
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:28:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzaVZ-0003ZG-BH
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640075308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlbB2gnztVngNLbWv2YSFzUXNURf1ZNEpID/gcLGE3o=;
 b=CjReY6hLYpLTW79q8yZfyMN2GE6xM7HbrECESwA+31MwbXAPVKsqx8TWlYlC8Mv4gFd2Q0
 kaYb/ZVx2HlGD+3xHU6hjaM8k/nyBOiabTBGyPR21jr1r6nTnvMtMTFahqiH2rZuHxsvXz
 gfwoa05UgsjMirpfbJq9pmTC/E9P/MQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-ofoZcGibOHGUCr4NiqIrZQ-1; Tue, 21 Dec 2021 03:28:27 -0500
X-MC-Unique: ofoZcGibOHGUCr4NiqIrZQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 s23-20020adf9797000000b001a24674f0f7so4414245wrb.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 00:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WlbB2gnztVngNLbWv2YSFzUXNURf1ZNEpID/gcLGE3o=;
 b=pxbT0w6GNVgZWqbFuYEdSI4Hsu+xeYsgKcLd+6uNn46kONJzFcVj3S2K3DHo/dONEd
 noA0hRCjarZ4n8yXaonDi5HvYknjYx7/2Mw3O7inRtKzpBHpioJ2S3ZuvgcBtqko6HhU
 RjMb+PKN4uKYt1nRzmeVZOmB/oW7iVcLdUgNuL23x7HA9Ras53epbF2nYc523j2gYdce
 fa0xGpVD/u7lYweEc5o/KqV7+ZDdt+XOQNS6bdRZ6CLod9EgcUI5hNTyfSwfRankQKIu
 5pTHOPY8xL3u2Xx3CyXYhBq4eFAfqH1fzQfgoYpxi9JyYVW/peQd2we6bcxRQELYwpQH
 m1dw==
X-Gm-Message-State: AOAM531IfXmvqQgbKXbVGXpw2/oVUZ9r7nrZcG4A0RRRtrAHXx4Gy1XF
 ywrhCAf6NOaNi+niRWmq6nKHPkh72j3GBA0wQv5iLV9PuuSH7ovMJSnsWKdyIoVMcf8kt/ioo8S
 yEoNuITaiod8on1s=
X-Received: by 2002:a05:600c:2242:: with SMTP id
 a2mr1624534wmm.63.1640075305839; 
 Tue, 21 Dec 2021 00:28:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxT209l+EdMjDfxQ6sUCsFfG5ttUsQ/wszUX4MGUzRFf0txjwmey9DIj06gXq6pOt3gnHBTbQ==
X-Received: by 2002:a05:600c:2242:: with SMTP id
 a2mr1624522wmm.63.1640075305652; 
 Tue, 21 Dec 2021 00:28:25 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f18sm17358658wre.7.2021.12.21.00.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 00:28:25 -0800 (PST)
Message-ID: <6a02517a-dc5c-ba94-b8d8-934f3a2960ad@redhat.com>
Date: Tue, 21 Dec 2021 09:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC v2 2/2] migration: Tally pre-copy, downtime and post-copy
 bytes independently
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20211220093413.1383190-1-david.edmondson@oracle.com>
 <20211220093413.1383190-3-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211220093413.1383190-3-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 10:34, David Edmondson wrote:
> Provide information on the number of bytes copied in the pre-copy,
> downtime and post-copy phases of migration.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  migration/migration.c |  3 +++
>  migration/ram.c       |  7 +++++++
>  monitor/hmp-cmds.c    | 12 ++++++++++++
>  qapi/migration.json   | 13 ++++++++++++-
>  4 files changed, 34 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


