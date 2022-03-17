Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2304DC600
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:46:51 +0100 (CET)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUpWf-0001ns-H6
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:46:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUpTz-0000oK-K7
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUpTw-0000Ff-N5
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647521035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tI1TIirv8XGFtnLC5xynvFzkoFl7ZVpXKm+PsmAa4Ec=;
 b=TXgcWzQvOXPXyLloBrYpi6NZ0hPGlDtg1kNA0FGp+KLeyJj60tWLuZuavOEMbIJGEy1LZN
 ouYh+lFTUQ7QuQkOLED/sFBHSLx3ugxw24eblv3rfTYrSHnGivXJT/4UK8ji7Bmvkhq/4e
 bFXmrma+tRZzwoxuxyiNnrxLXKFVax4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-6WkRqpbiPjaRM18__q9p7g-1; Thu, 17 Mar 2022 08:43:52 -0400
X-MC-Unique: 6WkRqpbiPjaRM18__q9p7g-1
Received: by mail-ed1-f70.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so3058538eda.5
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tI1TIirv8XGFtnLC5xynvFzkoFl7ZVpXKm+PsmAa4Ec=;
 b=nZd/05SBoHHeQSiJLiE6bH1n0zwr3IktImLOQPOjBxuAXdHUDPebzlu4zkt7UG7NGm
 zm9MvHoSWmd9gyQQmgvWaXaT3S79hJBM9JAQned95lbNNDBrYZFjZKvjSYJUq8LCUeRh
 qajBud/dy3NDQlxMpn8LkwoJwuesT4TtaJYN+Fqgaq+bIduUrzJZJrxMg/sAaIivGjTL
 X8YiBrWktTlbeZ6RnvOACocNVqragkTYtoED2lnBCu0VjRQuZUF0BUNDYOHb6kUwV+HV
 m5XYa25q6jNeSI1t0bJcB4nu3wbYbeXKvp0yKRfROX/cUMqArsnunwH7pXkJTSLyAjdw
 MGdw==
X-Gm-Message-State: AOAM533xMabQAkiSTeVawRCq6iMQXLi/fP06s7zuTEyEloTBYZtarNke
 JwftfOeJAvsuP+JuQrryqtBshMmCkVfHBOjtMOhGgW/4ejX0mUKjAtnlderpodS2ei17i9m2PCk
 y0ejXs5pvLjNdNMM=
X-Received: by 2002:a05:6402:42c9:b0:418:ac44:3418 with SMTP id
 i9-20020a05640242c900b00418ac443418mr4284443edc.97.1647521031411; 
 Thu, 17 Mar 2022 05:43:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyASK2Ui6uykRuOpI8qMdrO+0UC7sCtFvabMlu458tRBqw41EVA26yhujdMRIYcf4Alz6KBeQ==
X-Received: by 2002:a05:6402:42c9:b0:418:ac44:3418 with SMTP id
 i9-20020a05640242c900b00418ac443418mr4284401edc.97.1647521031117; 
 Thu, 17 Mar 2022 05:43:51 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 ho14-20020a1709070e8e00b006dbd26c2182sm2303861ejc.156.2022.03.17.05.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 05:43:50 -0700 (PDT)
Message-ID: <8d625a62-e287-63a0-a5ba-d64f83e55acf@redhat.com>
Date: Thu, 17 Mar 2022 13:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/14] iotests: remove remaining calls to qemu_img_pipe()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-10-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-10-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:54, John Snow wrote:
> As part of moving all python iotest invocations of qemu-img onto a
> single qemu_img() implementation, remove a few lingering uses of
> qemu_img_pipe() from outside of iotests.py itself.
>
> Several cases here rely on the knowledge that qemu_img_pipe() suppresses
> *all* output on a successful case when the command being issued is
> 'create'.
>
> 065: This call's output is inspected, but it appears as if it's expected
>       to succeed. Replace this call with the checked qemu_img() variant
>       instead to get better diagnostics if/when qemu-img itself fails.
>
> 237: "create" call output isn't actually logged. Use qemu_img_create()
>       instead, which checks the return code. Remove the empty lines from
>       the test output.
>
> 296: Two calls;
>       -create: Expected to succeed. Like other create calls, the output
>                isn't actually logged.  Switch to a checked variant
>                (qemu_img_create) instead. The output for this test is
>                a mixture of both test styles, so actually replace the
>                blank line for readability.
>       -amend:  This is expected to fail. Log the output.
>
> After this patch, the only uses of qemu_img_pipe are internal to
> iotests.py and will be removed in subsequent patches.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/065     |  4 ++--
>   tests/qemu-iotests/237     |  3 +--
>   tests/qemu-iotests/237.out |  3 ---
>   tests/qemu-iotests/296     | 12 ++++++------
>   4 files changed, 9 insertions(+), 13 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


