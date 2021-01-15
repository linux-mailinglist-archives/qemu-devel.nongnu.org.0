Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F52F751A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:21:46 +0100 (CET)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LIe-0001F9-Cw
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LGf-0006dz-2O
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:19:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LGd-000315-Kl
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610702378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHLWs7JMgHszINv21PMrynr+XUAnbW1hXiT57+sF73c=;
 b=PtH3pqAPISZJ8lYdjOg0DBynFj3vbgv5e2aWPbQ5sZ7bZ6VBB8AWyBNN+RVo+LjjTzeEjh
 DoRDuxb6PPVYK+kbFuoZbYBHvFtT7SboOMMGnMkg5J5w6gagCqT7nOU5bpl8KslMATOXLo
 Fldgzque3wx+YMI9g+Wv5x1jrPhiT3E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-JMWuhZk3OG-UeQ-jO46D1w-1; Fri, 15 Jan 2021 04:19:37 -0500
X-MC-Unique: JMWuhZk3OG-UeQ-jO46D1w-1
Received: by mail-ej1-f70.google.com with SMTP id dc21so1653694ejb.19
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 01:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uHLWs7JMgHszINv21PMrynr+XUAnbW1hXiT57+sF73c=;
 b=iYuQ4aQ9OKJW/NfdnQOEflmcXTm+GHwVGR2GI3skpclu+z0qqfizfRnathWrl+9Vwp
 WeTCgU5luler/aZZZTQeeALXtUIK+Tx1ShJGRvtH+JAwknCpD/55DtQBKm4aWdpihJVC
 SXaEdTRzeA8eSXAQjPm1K2Te+1r2jODT5xpPUn4h/xm9Bgcf6DryaYtsTkkDtDy0xQ6s
 vOOTP1lxWOZ/Prpev+5fYQgV4OPznaEeUCLxsB8lMXxuBhiVLBiKA+oOvybRRTffh4t/
 GqxsyOleUQCZJmjZXtZS+P0cwfXS+YrCoS+7VZpmSVMpkSBRRh6pyWEga301Pq+JvS4W
 IWCw==
X-Gm-Message-State: AOAM532QWE0d4yewHj1/s7H/UmyVgxkSHS1j3TYyIpx41uVCVvVLxBXK
 UkgIGX74RDldCSf7yhN5pXOto2hYBJNYj0YUGRsLGIz/lhbwR2U0Y5EO5BAGOkM40SpvFo3j4sp
 7JYixt5piol02DGv4sPC0vCqp/ajwhTIBPil/DzCzMKn8vRVfGXFXF5Mma8iSV2NM
X-Received: by 2002:a17:906:e247:: with SMTP id
 gq7mr8481055ejb.27.1610702375965; 
 Fri, 15 Jan 2021 01:19:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx3jThGuFHYIz7b6WaXtbK0v1QBc5IK4FGYB4+RYf+ASskuhQJgvRRa6TcjjpghYeMoLVSow==
X-Received: by 2002:a17:906:e247:: with SMTP id
 gq7mr8481040ejb.27.1610702375712; 
 Fri, 15 Jan 2021 01:19:35 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r7sm3009710ejo.20.2021.01.15.01.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 01:19:34 -0800 (PST)
Subject: Re: [PATCH v4 1/3] block/nvme: introduce bit 5 for critical warning
To: zhenwei pi <pizhenwei@bytedance.com>, kbusch@kernel.org,
 its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
References: <20210115032702.466631-1-pizhenwei@bytedance.com>
 <20210115032702.466631-2-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <808cdb29-1e9c-c94b-5d26-737fcdc37ca1@redhat.com>
Date: Fri, 15 Jan 2021 10:19:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115032702.466631-2-pizhenwei@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 4:27 AM, zhenwei pi wrote:
> According to NVMe spec 1.4 section

"According to NVMe spec 1.4 section 5.14.1.2"

> <SMART / Health Information (Log Identifier 02h)>, introduce bit 5
> for "Persistent Memory Region has become read-only or unreliable".
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  include/block/nvme.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


