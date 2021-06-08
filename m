Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8AA39F9E7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:04:49 +0200 (CEST)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdHc-0006Ir-5I
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqdEh-0003lo-M5
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:01:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqdEb-00077L-MJ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623164501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vx5R0BPvy494d/s9UoA5JBYkqxPxWI5fJnuec735xiY=;
 b=cnrpRH/CVuX2RdgVazFp7FuzlIky+39PMHchT+SWT/nuRBS8wCN2DP9s6e5Gxu/rrGCB3Q
 yl8h3GSJsU4sOEruqkXkYz8PHP0WZ1UJeZrKsxyRZlfrZnNpzj3yHTRHtD4YiEyDJx06Jf
 w2pw5po1puRMHfY6crNC2msJuX+nr8U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-P7t2CZwsNvWYUXJYVb3zTw-1; Tue, 08 Jun 2021 11:01:37 -0400
X-MC-Unique: P7t2CZwsNvWYUXJYVb3zTw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so851259wmh.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vx5R0BPvy494d/s9UoA5JBYkqxPxWI5fJnuec735xiY=;
 b=W4fOGrhWPAh/wUu+Q8CZV+HsP4jbnES4R4E2+NOj0xpr/FrfE+eHcy4awGZxkBmmSE
 xOkNFyxTeRpbjAdryj5HAqbnx/2JpHYnYZbufgR7nDJ9cA59PlnTq3ZHlw2KkTVsUlH4
 AaEKbfIbVG2UthPrk3fs3vHV0guqmakISaa9bRFhzBoSJURalid0eGdSFz04oJrxZqD9
 qFU/6xPP0YgQe7wyN4Nf7kZpqaS6UB1dzt/GpdZvhxhFSJ2DCKni1i96jOzn97fuuPhS
 27BhMx9bEZLo1fI7w6WglEFcBNKNFFtGTo+MBLGSV3DWEdwr7sQFESrQ9P4CgRP+h/Pa
 8dOQ==
X-Gm-Message-State: AOAM530J7TycwCe8/bXNN+WWLTJyRWQeotM4QBOix1mIOgLurMZX12pr
 DfHm6Q8cRDjGs4WuNdTgjjRBub90YGehSW3EZZ50ErZDhEDLMOcrjYhUbbHqIcgHKUJVsYYgwLT
 E476GsjQ9OaNeheg=
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr5329348wmq.123.1623164496743; 
 Tue, 08 Jun 2021 08:01:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHjb5ZTl04u0uG8jpBDjASI4g22SpaBx4j9AGB68ve3/YLIF4oP7BjtK+vXnId3oMcqMZBWg==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr5329308wmq.123.1623164496516; 
 Tue, 08 Jun 2021 08:01:36 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de.
 [217.232.61.128])
 by smtp.gmail.com with ESMTPSA id b26sm3073377wmj.25.2021.06.08.08.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 08:01:36 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org> <87im2ol8xu.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com>
Date: Tue, 8 Jun 2021 17:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87im2ol8xu.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/06/2021 16.27, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 6/4/21 8:53 AM, Alex Bennée wrote:
>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>> machines is about to be broken...
>>
>> Um, what?
> 
> Really what we want is to probe the -M (machines) that a binary
> supports rather than just barfing the test because we've built a QEMU
> that doesn't support all the random 32 bit machines.
> 
>> r~
>>
>>
>>
>>   and besides it's not likely this is
>>> improving out coverage by much. Test the "virt" machine for both arm
>>> and aarch64 as it can be used by either architecture.
> 
> I think this point still stands though, I don't think we get much from
> running the cdrom test with realview et all on qemu-system-aarch64.

In a lot of CI pipelines, we are either building aarch64 or arm, but not 
both, so I think it might be good to keep the tests in here.

  Thomas


