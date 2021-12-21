Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1A247BF0A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:37:09 +0100 (CET)
Received: from localhost ([::1]:51244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzdS8-0001fB-6d
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:37:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdPX-0000GJ-0I
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:34:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdPV-0000iU-AX
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640086464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RS+K/awkt6W+6YOvrTQH+e3r+chq1ALFbXh3NIRgShA=;
 b=ArMrnIRrtSr3JRtDPTaOK6qn8ENVtTPEfVx9Nlvm/6uFyXsJ4cQlXfrpSyo0DpA9PFIruV
 OGWLARbCswl0LQE83rpx10i42uC243i508xo6IsKg73RuDlFkb4du9ef6aNOxNn5BceSR2
 Tq1HpecFqhmMtGTeTn7xZlOiix10PdI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-UsQJx_OLN1uMjZmRvhZtSw-1; Tue, 21 Dec 2021 06:34:23 -0500
X-MC-Unique: UsQJx_OLN1uMjZmRvhZtSw-1
Received: by mail-ed1-f71.google.com with SMTP id
 ay24-20020a056402203800b003f8491e499eso5503177edb.21
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RS+K/awkt6W+6YOvrTQH+e3r+chq1ALFbXh3NIRgShA=;
 b=ZsunsSk1CrwGOfwH22fi5GbNRaQ8PIAQ/jvUDmX0RL+0+ufr7SDF82z/HBwaCViCOd
 cut31kQI8ZIHtAYpDvxumX0XsbMkZtFl825NgwZe3LYVdUQkmfRgAQtFVyr18pUkqZOr
 PnRvq0+yYeG9qTwiarCwDdbhqTOj7RbFdV2EFm/SpALK4MQoELpA7iwnQORpsjYnWebC
 z/5YWRqZ10Cu/tPyG81axw4GheVCykQof3zQ7BVz8jQg52kSbVRTaZw2ZVb+IyV6etyl
 3EEkIiKHm1Gb9vtOrWkiJgfz9Q1vud46flf6Rth81Js+Ug5x4/KmnC7jUup893VKBx4r
 fJKw==
X-Gm-Message-State: AOAM533I2AlxYl+MZspFvIXxPgMukJ8pU1TsnLY+G3xQMgk2Kyzgv4PK
 +oXPoHDYsYrPEkVYIM+ZzWJioSlvjqDetsex8u8XH7V2TlfFp9ptAQiDpGQA8Lgcl8mKjbiVRz4
 RlbPXvjroURhIi1s=
X-Received: by 2002:a17:906:341a:: with SMTP id
 c26mr2327925ejb.302.1640086462317; 
 Tue, 21 Dec 2021 03:34:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzptf8CQ8TK4l4nbsQXcq/c4Clt6T5k8aLRm+P6XKnUvxWYtX2YAGmaLnIvGd5V7EQgb22aJA==
X-Received: by 2002:a17:906:341a:: with SMTP id
 c26mr2327917ejb.302.1640086462114; 
 Tue, 21 Dec 2021 03:34:22 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id i22sm3691807ejw.75.2021.12.21.03.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 03:34:21 -0800 (PST)
Message-ID: <4cba400e-bd9a-69cb-385b-96eccf0ab306@redhat.com>
Date: Tue, 21 Dec 2021 12:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] docker: include bison in debian-tricore-cross
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221111624.352804-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211221111624.352804-1-pbonzini@redhat.com>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 12:16, Paolo Bonzini wrote:
> Binutils sometimes fail to build if bison is not installed:
> 
>   /bin/sh ./ylwrap `test -f arparse.y || echo ./`arparse.y y.tab.c arparse.c y.tab.h arparse.h y.output arparse.output --  -d
>   ./ylwrap: 109: ./ylwrap: -d: not found
> 
> (the correct invocation of ylwrap would have "bison -d" after the double
> dash).  Work around by installing it in the container.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/596
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/docker/dockerfiles/debian-tricore-cross.docker | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
> index d8df2c6117..3f6b55562c 100644
> --- a/tests/docker/dockerfiles/debian-tricore-cross.docker
> +++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
> @@ -16,6 +16,7 @@ MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
>  RUN apt update && \
>      DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
>      DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
> +       bison \
>         bzip2 \
>         ca-certificates \
>         ccache \


