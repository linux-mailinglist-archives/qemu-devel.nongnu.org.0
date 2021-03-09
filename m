Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E26332747
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:36:21 +0100 (CET)
Received: from localhost ([::1]:60194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcX6-0004Dv-1k
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJcTW-0000Pd-NX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:32:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJcTQ-0005Xk-4g
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615296749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzBLxZqS4+qQu3ArXedPzVa4NYGCPGwBgmxryNjwHRQ=;
 b=WSVDWcql7Zc79ow3MN1dSpAzf8PPxr/TH6vlGj9LRCX6A+OEHuvI3Of3YTejf9JTGgdnTb
 H1JXfUiC8XrTzXMfkoxDIGIZj9MsKcd1QNtOqsrfTcL0LENA/wCGO5/uTYhO8mfwF4KJUG
 Ma/hUb+8SQt/twN6ZnD2M5jsJs1Hl0A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-1qlmdy5FOfC9zTL3m0MKnA-1; Tue, 09 Mar 2021 08:32:27 -0500
X-MC-Unique: 1qlmdy5FOfC9zTL3m0MKnA-1
Received: by mail-wm1-f70.google.com with SMTP id i14so1136921wmq.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 05:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DzBLxZqS4+qQu3ArXedPzVa4NYGCPGwBgmxryNjwHRQ=;
 b=gT3+jBbcWlvsle8yuFPqzDuSLGV3J6i78jARWdDZyKTX5S957Jv1CGfZwTSHI3LKf6
 vRPqj/t/xFda9mFzllR/jyvNkAMduU3Ks+J04kVO1t6maPHlajnwnT12duszKuB6DJ81
 xvfkUHHNW9p7i/NpQvUu+QVBse/S3cr3kqgIOnFRXEcP+KvzFCJWCzEkw6++KWDNble7
 it+0EdbVFDzaqviZ98SRhQgQ/+F1KAq7D/db5vp/cmnZtKmpRHJMJXkH3VHNcUBahW4w
 +ov0DHKK/NUy5fplYs42samieawtKLc+rYWR82g60iPFj4mcaR6PmoSrjDBeaIhFkTvJ
 5WXw==
X-Gm-Message-State: AOAM531GzaOKeMi1jg67jPP2gKx2yZRHtv8VBu71A4DFS4IV9VorLgV1
 f8+ORAJ/smCxYTKCfnRxORw50m/N3nz/xFcn1ktUTrgRi23jRWqX9ao2CAk55V86RqXxcVh2ehA
 nJzjRAMqg5J+sagY=
X-Received: by 2002:a5d:4b83:: with SMTP id b3mr28484136wrt.76.1615296746611; 
 Tue, 09 Mar 2021 05:32:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfJIu9Unhpg7xHqWHGLMxdCRcrLqxMvnsrDbhMvyxTPRXMMzuVRY1p4Pun4NTUB/aSWP8mEg==
X-Received: by 2002:a5d:4b83:: with SMTP id b3mr28484115wrt.76.1615296746438; 
 Tue, 09 Mar 2021 05:32:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m10sm4192296wmh.13.2021.03.09.05.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 05:32:26 -0800 (PST)
Subject: Re: [PATCH] virtio-gpu: Adjust code space style
To: lijiejun <a_lijiejun@163.com>, kraxel@redhat.com
References: <1615292050-108748-1-git-send-email-a_lijiejun@163.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1808a180-d8ce-fb52-38c5-085ee9d9a26a@redhat.com>
Date: Tue, 9 Mar 2021 14:32:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1615292050-108748-1-git-send-email-a_lijiejun@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 1:14 PM, lijiejun wrote:
> Fix code style. Operator needs align with eight spaces, and delete line space.
> 
> Signed-off-by: lijiejun <a_lijiejun@163.com>
> ---
>  hw/display/virtio-gpu-3d.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


