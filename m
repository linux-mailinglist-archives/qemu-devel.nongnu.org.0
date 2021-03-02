Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E689329690
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:01:41 +0100 (CET)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGz2K-0004mO-5S
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGz0I-00049d-7s
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:59:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGz0F-0007h3-8j
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614668370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yy+8ocjUokBnP4UjG9QSEfX4nmhTBc+g2kdnkdwlPk4=;
 b=JIOss5j3Do7Lg5xtTuuQMLpGy4mJcvwNFR4VPDjLHBnP3cLgcCimQw/gpRfQ/UNyMAeRgC
 XaXSAeEJ5sm/fRXX/Nq0wsHduXKDHirplLZT5CgTRD1eCekBfSYaY9A0sDFu99BqxnnpIO
 lwEOVwED/eKVijGOVMTNlHvjnf+JwrA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-TLd7NzhbMDmdi9u_PtI-5Q-1; Tue, 02 Mar 2021 01:59:27 -0500
X-MC-Unique: TLd7NzhbMDmdi9u_PtI-5Q-1
Received: by mail-ed1-f72.google.com with SMTP id p12so9914602edw.9
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 22:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yy+8ocjUokBnP4UjG9QSEfX4nmhTBc+g2kdnkdwlPk4=;
 b=YkWEjaPoflS+VBadVVSHXgHfxM3nfvpxMfdEf0s7IZg3DZVeOuIqrDMnlsqpaIJbRQ
 KBcBgREW/SKgmkjkxD+BMZv0RwDIL0tLsciVinbF6cvqekBOlUHjfe/Ct/XMcY8ipxVr
 xcpEAH4g9CP8OiRghcBh6OcrxFVWoY4dOsvb9gvLEXZusPUHsfbxjgp2AUdEEHUyswU1
 QjAmVqDGgWs6T9FJNY3dQ6u74BgAqpT3P8rVGWzSXcV+XFQd+M2bywkYkpqbSeiqIFij
 PlQl98mwsBWspqkz7vpLvd0ZFWcDlUwIgjoxiNMFJFXSx3N9TCE5vLLyBUGgR/8KB0Id
 UaHA==
X-Gm-Message-State: AOAM5326eUUOS6n5qWisEDPHMWczxmsnnL24xJ3WdpVrd2nodZt2HDkJ
 XXHkmg18+xvZR8JF5/pFoWRxHE0slkXg8kcmrKERm/Rdns7Hd5ZLe1LXW1jsQ8FoVLnPbh49OlL
 PA4vjs1wOTjMW1po=
X-Received: by 2002:a17:906:2344:: with SMTP id
 m4mr18932125eja.327.1614668366398; 
 Mon, 01 Mar 2021 22:59:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfHJJAEerkx05dgWg8DIR2HjhgkpXoflmwehyYx8v0h9LemKJk4BhhbfGn8K8UMGm3F/3x4Q==
X-Received: by 2002:a17:906:2344:: with SMTP id
 m4mr18932114eja.327.1614668366205; 
 Mon, 01 Mar 2021 22:59:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ck9sm17171172edb.36.2021.03.01.22.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 22:59:25 -0800 (PST)
Subject: Re: [PATCH V3 07/10] rtl8139: switch to use qemu_receive_packet() for
 loopback
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210302055500.51954-1-jasowang@redhat.com>
 <20210302055500.51954-8-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a930d57a-e36a-757b-49d5-cfad0a71f943@redhat.com>
Date: Tue, 2 Mar 2021 07:59:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302055500.51954-8-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: alxndr@bu.edu, qemu-security@nongnu.org, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 6:54 AM, Jason Wang wrote:
> From: Alexander Bulekov <alxndr@bu.edu>
> 
> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1910826
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Missing your S-o-b?

> ---
>  hw/net/rtl8139.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


