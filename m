Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB0300059
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:34:23 +0100 (CET)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tlm-0006OG-8x
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2tkT-0005sz-Ka
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:33:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2tkO-0000CZ-Qg
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611311575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkArZT09Crzpny9piBFKP09T1EyvvKqsm0vRqGf99/Q=;
 b=FFgPKIsrbXV3LUgJ9J57XR4L/i8ZnUed4VYKfL2mo16oErsr5nnC0ftkuvVRZbezvReqxF
 /AGIJafk7RTOksPtoPbyH9R13WznQzLQIb7OoNIGHQf7okU2wFxB+5iR/FwBpr3W5bCPTh
 4ilsVwaiwjT0f9yzxGKU8l8mOpU4/pk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-aY3FLWWuNsKfwsCNlNd_9A-1; Fri, 22 Jan 2021 05:32:53 -0500
X-MC-Unique: aY3FLWWuNsKfwsCNlNd_9A-1
Received: by mail-ed1-f70.google.com with SMTP id g6so2700048edw.13
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OkArZT09Crzpny9piBFKP09T1EyvvKqsm0vRqGf99/Q=;
 b=DV5abFyDvx6wvFf/sFSxmiIDXlHL7B6YByVO0FSOw4JaVzEUz9eZspe8LzHxeaGUbo
 /jaVq2uRufUQOr8iQ51e6eUP+9EkMlWB9J/CHDm2zSAPIZ9bHVCZRJSJUyzJa/JZWYFr
 D4mp5b7CnSARJh2cb+67ri2/6qFQuwAFo5E7oj5u9JWZ5LxOQO79X/YONM6sMZ7y3agM
 0u4cCyqpYtvz/C+VlWGmsccVZyi82nvR/RiSnALksZ3+3gim48NysyvrLTAo6VqmQRCJ
 kU08QDUVn7ysMmiSQVIj3DazIK+yZWKplltgN6ZOqK0xKPVIo126v3hP+Frmms8Nnes/
 C9Mw==
X-Gm-Message-State: AOAM532TnM0uzH1jxJLPWRKvPj5uG0Et7P9x7B/o9xQJNDxb4gwCYI9f
 g2GsMNYYZzEZUo7aVvtMQlBj+qXRtjklu7Hc3WhrZ1RyBgwYeRrQ+TH7xGUZ6anuzeudCUezCD6
 CJnbuPO5+OP84+70=
X-Received: by 2002:a17:906:3685:: with SMTP id
 a5mr2467028ejc.544.1611311572237; 
 Fri, 22 Jan 2021 02:32:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFiCmzlKsW5AFPb1VrabRHp1D9TtsnsVCQGgrV00ZETSYrEMV/IU3k+ys2+3LfcSJ9FDiyyg==
X-Received: by 2002:a17:906:3685:: with SMTP id
 a5mr2467021ejc.544.1611311572099; 
 Fri, 22 Jan 2021 02:32:52 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b26sm5013133eds.48.2021.01.22.02.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 02:32:51 -0800 (PST)
Subject: Re: [PATCH] util/log: flush TB cache when log level changes
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161130982491.1038646.15688151175539344664.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <672fc936-9207-636c-4f16-76fb2f849960@redhat.com>
Date: Fri, 22 Jan 2021 11:32:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161130982491.1038646.15688151175539344664.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Pavel,

On 1/22/21 11:03 AM, Pavel Dovgalyuk wrote:
> Sometimes we need to collect the translation logs starting
> from some point of the execution. Some TB listings may
> be missed in this case, when blocks were translated before.
> This patch clears TB cache to allow re-translation of such
> code blocks.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  accel/tcg/translate-all.c |    8 ++++++++
>  include/sysemu/tcg.h      |    1 +
>  stubs/meson.build         |    1 +
>  stubs/tcg.c               |   12 ++++++++++++
>  util/log.c                |    3 +++
>  5 files changed, 25 insertions(+)
>  create mode 100644 stubs/tcg.c
...

>  /*
>   * Formerly ifdef DEBUG_TB_CHECK. These debug functions are user-mode-only,
>   * so in order to prevent bit rot we compile them unconditionally in user-mode,
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index 00349fb18a..7415f11022 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -9,6 +9,7 @@
>  #define SYSEMU_TCG_H
>  
>  void tcg_exec_init(unsigned long tb_size, int splitwx);
> +void tb_flush_all(void);

Why not declare in "exec/exec-all.h"?


