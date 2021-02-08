Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC47313B20
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:40:52 +0100 (CET)
Received: from localhost ([::1]:43806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AWo-0004I4-Pu
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l94QA-0003Ze-37
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:09:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l94Pp-00042e-K0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612782549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2E/w24+Tw7l/RQDOGvg4ZkGl5rFr/ner1e4XVyXJFs=;
 b=Y2/DvjObMbQpj5f3VzL36KUtvU/mmpheYpcqI86twiHozDPDF3B+IrfWScgFvYFRB+/EOy
 9uoMSPU9rAXcZVtlV8kQB7vKHW47U6Q4EXBPd3My4mx/3Cy1DOiewqlV9vjXFeVv0Tbr1E
 +lctddAjjOhJ28FkH6SkKT3v+0mDE38=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-OFVO8hClMnqhd467Cg1xzg-1; Mon, 08 Feb 2021 06:09:06 -0500
X-MC-Unique: OFVO8hClMnqhd467Cg1xzg-1
Received: by mail-wm1-f69.google.com with SMTP id u138so3356143wmu.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p2E/w24+Tw7l/RQDOGvg4ZkGl5rFr/ner1e4XVyXJFs=;
 b=cqD/i7sIsLuwfquPZ7yLlav3UezmMHQ+6W4o8Et0h7FUAU4Ezsl6CLcaF8nz/P4L1n
 FDD6s/o01eRcOb6dnNONf5eOB/gZ7W5q7o1Y4QqoDjI2U6I5t1Sh+EFazDrXw92GNsxp
 CbmHqoaw0Jf7RRKJftv7ld/YiUS9aE6lj5rBgurKw3oiXPZrQb3TMInBy3SF/lnxRNLy
 1wo3UmGg9oLkiK9icLyovBiTlWsAXAPP3tjR5pS3hfQSU6P3q6l4mOsXieZ0NcMNt+X3
 I1fo0B1rDGfZHhtXL7Ej171IIJbQl/lMtF8YBWTUdqeGD3LCf/x19zVtaURkbg9EYc+h
 G0Uw==
X-Gm-Message-State: AOAM533R+TVi/qaQ/jHsfHUZx7xqBbUcaUdWbpuHOz/prqRJERBN8DrV
 pZ2n/NaQbMx4zHbisukxWcW8ziMG4WvPLnER0dFFRvuoMFAPw2nWqjJ3XJ8M6SGdAdr7AwH4wdW
 oeZ3jw+PmQ2VtjkE=
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr19528231wrt.124.1612782544606; 
 Mon, 08 Feb 2021 03:09:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3bdTfr4x7LA7qS0onhDlzf4UMmKaAqJFxgC73Zm8ZcUhHGquiL9TNfe+2my5bQNduevOpTw==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr19528214wrt.124.1612782544448; 
 Mon, 08 Feb 2021 03:09:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t2sm14635355wru.53.2021.02.08.03.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:09:03 -0800 (PST)
Subject: Re: [PATCH v2 1/2] net/slirp.c: Refactor address parsing
To: Doug Evans <dje@google.com>, qemu-devel@nongnu.org
References: <20210203213729.1940893-1-dje@google.com>
 <20210203213729.1940893-2-dje@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fc97283f-51ca-2a2d-d8ae-1345b990e52c@redhat.com>
Date: Mon, 8 Feb 2021 12:09:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203213729.1940893-2-dje@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Doug,

On 2/3/21 10:37 PM, dje--- via wrote:
> ... in preparation for adding ipv6 host forwarding support.

Please duplicate subject line, else this commit description as it
doesn't make sense.

> ---
>  net/slirp.c | 200 +++++++++++++++++++++++++++++++++-------------------
>  slirp       |   2 +-
>  2 files changed, 130 insertions(+), 72 deletions(-)
> 
...

> diff --git a/slirp b/slirp
> index 8f43a99191..358c0827d4 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit 358c0827d49778f016312bfb4167fe639900681f
> 

When updating submodules, please describe changes (usually -
when possible - a previous commit updating the submodule is
preferred).

I can not apply your patch using either
https://git.qemu.org/git/libslirp.git or
https://gitlab.freedesktop.org/slirp/libslirp.git:

fatal: bad object 358c0827d49778f016312bfb4167fe639900681f


