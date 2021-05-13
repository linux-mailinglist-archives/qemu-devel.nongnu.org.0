Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4637FF78
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 22:51:38 +0200 (CEST)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhIJ0-0002Xl-08
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 16:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lhII3-00016p-Ae
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lhII1-00034h-OR
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620939037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xmt78oDGURZ3Re9g3myJDucSdvestEJlflxOZ66AXq4=;
 b=QeBbW6tVZl85xRcncnZTtT1YfAWEoMrdD88yK0dRT51fyPgdq4DO66zstZtMf+KYjV3Ex5
 lo060K1CiYstYx3MVXLCN5SBqCNTySOG/nKCZQRzoIMzDBjy1sliwu82yzqtbEkNuJZP7N
 xvxYpzdZ74wpHKH3Bw7Cp08Y7zVbsos=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-AjbbmN33PFKch7EfEbedMA-1; Thu, 13 May 2021 16:50:35 -0400
X-MC-Unique: AjbbmN33PFKch7EfEbedMA-1
Received: by mail-oo1-f69.google.com with SMTP id
 r194-20020a4a37cb0000b02901fef0451710so13529948oor.15
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 13:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xmt78oDGURZ3Re9g3myJDucSdvestEJlflxOZ66AXq4=;
 b=G+lOwb0m7mW09NP5LX79F5fNDO/dcMvcL9hNTvJyAoJz0eXwCyUwQoRuT5BdP2Bspk
 GgClfLZoEXTr/LCqOt8lASntehW2ZRcswkUFHUQuDYJyzVHrr7RU1pFRjeFXbCaQpL/k
 /dpjc/TJFZPTmg5XlBCtCWnUqUVtBbcgP/SjnzFf+Q6AYdA2gy8YRukQaxOEBMsboOAE
 cs9/r/ZfZx7ydlH6xip1HhiW3sLzk4BmZfgpBoCc18tedQMsQu7PJ/gJZsnaGuLnUpQH
 xP3IbES8/dCijbD7LmRR2qBhRwuDEKRyERCcwMBPmTlz4tO7w/YqjIjAI2YBW2vN1K5A
 EzeQ==
X-Gm-Message-State: AOAM530dJI5LHBlh50vqAikMp5PubmMwXwhHE/xMEOLn44flur+IAVhC
 jnkrmr4NyJk7rtusVu3xeC/CYl2V7o5Iqia3ltA6Viqywr0/0EpayKlCrfeNvBg3ybwXgKf8b+V
 EJ1N+oJk+s9fmUzA=
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr36758432oth.140.1620939034766; 
 Thu, 13 May 2021 13:50:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzry+eTzzCRKILoxsdoJsfmIuEG/RP2IfSWk0f5Qz+wopVXaW19CD/M3mS+qDFMd0kFwo+tw==
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr36758422oth.140.1620939034623; 
 Thu, 13 May 2021 13:50:34 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 w25sm917457otq.40.2021.05.13.13.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 13:50:34 -0700 (PDT)
Subject: Re: [Virtio-fs] [PATCH 0/7] virtiofsd: Few cleanups in
 virtio_send_data_iov()
To: Vivek Goyal <vgoyal@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com
References: <20210511213736.281016-1-vgoyal@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <34daab90-0e71-20c1-139d-ac0e084f8ed0@redhat.com>
Date: Thu, 13 May 2021 15:50:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511213736.281016-1-vgoyal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 4:37 PM, Vivek Goyal wrote:
> Hi,
> 
> Code in virtio_send_data_iov() little twisted and complicated. This
> patch series just tries to simplify it a bit to make it little easier
> to read this piece of code.
> 
> Thanks
> Vivek
> 
> Vivek Goyal (7):
>   virtiofsd: Check for EINTR in preadv() and retry
>   virtiofsd: Get rid of unreachable code in read
>   virtiofsd: Use iov_discard_front() to skip bytes
>   virtiofsd: get rid of in_sg_left variable
>   virtiofsd: Simplify skip byte logic
>   virtiofsd: Check EOF before short read
>   virtiofsd: Set req->reply_sent right after sending reply
> 
>  tools/virtiofsd/fuse_virtio.c | 67 +++++++++++------------------------
>  1 file changed, 21 insertions(+), 46 deletions(-)
> 

With the codestyle fix to appease the bot:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>

(For the series)


