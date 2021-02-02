Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D302830C2A5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:58:30 +0100 (CET)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x8P-0003wV-U0
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6wmh-00033G-8e
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:36:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6wmf-0006xG-BO
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3K0kMTvB93Z/UR05c8oisgCZDcMa9fmDOPuQ34m7k2s=;
 b=iLOORfcjxDYHUmZpAJ3bPxUfrdEFPuaSJokjQKTIYXHbCbLf2uAch+EdKmmTmsr6zmaCrY
 VMIEU56qWgZNBj7gLPfq2FnUIAECllxfVRSnTFVRLqkux7usOhAChEJSU+o34NjZEmcGkA
 eGIHSb04z5ECuLGkim5nBB8NOTN3q7E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-r21ZmUl_NmmkNq2XHQWEDA-1; Tue, 02 Feb 2021 09:35:59 -0500
X-MC-Unique: r21ZmUl_NmmkNq2XHQWEDA-1
Received: by mail-wr1-f70.google.com with SMTP id l7so12705503wrp.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3K0kMTvB93Z/UR05c8oisgCZDcMa9fmDOPuQ34m7k2s=;
 b=nQLR6D5na1AAPIKVRyPsu3WS5UMEO14vgiSfIIoaXyni1QCZLIMHNiNOiqke8x2dLX
 Kt0JJJtMVvvl7pTlpzDSbGJnDb6xAn3Uv38uzNQLHtLKwkOfqWgZsIDrlq78KHpc7JGQ
 siHIzR1BuXGqVwHzgtkqQMLN/XtkDXMcXIOz1h4zQvjaQQfLVN+Pt0iQ+YoDfuvZ9uea
 muXgwITQ92A3UHev6MmkvhNG0R+I+fjvsEEGRE4GCETRBPnFf29sZ+qFMZXrnXmwKqk5
 gFhslavTL1TREU858HD9R7tyXVSVKoij7wRyCksk3N2pnZ4uxQSkcS5+KIaqFcopWVUF
 mysw==
X-Gm-Message-State: AOAM530EOnzy7tUoFk7AMBM7pQwUBn0wdt88li9kZ5X6jV4kdW/d1ZYv
 Sbw4UcnsKTB6YsbB2oWQfAolVkSEiSc/If2FeaX0EAYf+cYpRimfD4UyJl8JBxvomAHTBzzNxLX
 BOziKHWr6AaTmEgm24MJ2PRwSrQeOEtsv6VuVIqdvXNUbnlepsWW+krnsLNfyAJ91
X-Received: by 2002:a05:6000:10cd:: with SMTP id
 b13mr24060840wrx.163.1612276557204; 
 Tue, 02 Feb 2021 06:35:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzO/2X+aAqfSVz6hxJsweHNWTONTGtRunHL6b58CyIPpHTmC/xVhJcx1sggVhzWG4lf2OAkoA==
X-Received: by 2002:a05:6000:10cd:: with SMTP id
 b13mr24060815wrx.163.1612276557005; 
 Tue, 02 Feb 2021 06:35:57 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id t18sm28248300wrr.56.2021.02.02.06.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 06:35:56 -0800 (PST)
Subject: Re: [PATCH] iotests: Revert emulator selection to old behaviour
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210202142802.119999-1-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6aaccae2-9368-aeb3-47fe-b5ba136a314b@redhat.com>
Date: Tue, 2 Feb 2021 15:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202142802.119999-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 3:28 PM, Kevin Wolf wrote:
> If the qemu-system-{arch} binary for the host architecture can't be
> found, the old 'check' implementation selected the alphabetically first
> system emulator binary that it could find. The new Python implementation
> just uses the first result of glob.iglob(), which has an undefined
> order.
> 
> This is a problem that breaks CI because the iotests aren't actually
> prepared to run on any emulator. They should be, so this is really a bug
> in the failing test cases that should be fixed there, but as a quick
> fix, let's revert to the old behaviour to let CI runs succeed again.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/testenv.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


