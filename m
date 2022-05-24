Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3781532D4A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:23:02 +0200 (CEST)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWNB-0003Fx-PS
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ntWKM-0001bB-1E
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ntWKC-0001KJ-4F
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653405594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfStDNe5SP8HrDW5LadI1l4AYCDhrQJuZhKdqX0Ie6c=;
 b=Uq99qVzHHN1BoKJpToWu4XmHTnjP8zLVGSHjqfzLEyjsJkB144RUrblhQsRAh5Nou3Y7tm
 xNAxSqBUniRziIroUXXczs1yavW2XrcrGKKXI719f9EWHjzQJoIQwMq8LS1RPvKXlj9Ze1
 1XmAQUkisQfLOVBBal5Vha86PmI2iHI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-LTC6Rqg-OPCMHQ3i7fDOqw-1; Tue, 24 May 2022 11:19:53 -0400
X-MC-Unique: LTC6Rqg-OPCMHQ3i7fDOqw-1
Received: by mail-ej1-f72.google.com with SMTP id
 tl4-20020a170907c30400b006ff066327b2so1093913ejc.9
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pfStDNe5SP8HrDW5LadI1l4AYCDhrQJuZhKdqX0Ie6c=;
 b=4u7bjc903b+TRK39f6AsirJ0q03GsUdQUiDSQtMy5M9RSGc4guLoUpXck/v8nhQ+rI
 6fTnScQQeFLqvWos2Mq0/SPAnooZRglOoKG5f89nDnZvZZW1whefWlbHwQQyVdavWrNS
 iWDZHEjsZRgdUXRiGx/aXMTynYGRC4MYMpNf2ciVGc+koLAj6EMiuY1Z7H337CObNuJM
 bJbB2OSGUkXMKG2gcFac3WuNdYjGkZsvIMkzXeP9TS76CTR8nFwZwYTaXQmR3/Q+h6aG
 YQbz638Lw9pZr6X5CZ48UFH9lo/eqqgTaDAVRxHsnVOgOXtyY42uCve8ug4o1gH9bEKU
 9o8g==
X-Gm-Message-State: AOAM532KOAQhfB0L5RnPXqMZnhZ1xnU/1O1f1pfCyAYhpCpxEQgH3uyi
 MQmMluzcx7RTfplKKQeY017156C3oMiONxjWirFCZrcpM2eJdDgH8rKW2scQ2B3ank8KiN8OyGn
 kw5Nh59axxFfyebnSSX4bP7J1dzE+WSTfiQnYyuLBxO1T+aUmXTNJr33iQfSIfL8SHu4=
X-Received: by 2002:a17:907:7faa:b0:6ff:918:5251 with SMTP id
 qk42-20020a1709077faa00b006ff09185251mr1992987ejc.460.1653405591340; 
 Tue, 24 May 2022 08:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyllYlJiau297Idz29AriFCIVEEHyIAFK7/b0VSz8xtwKTu+6D1UHCtXG1YqpDa6EghM5Lu3g==
X-Received: by 2002:a17:907:7faa:b0:6ff:918:5251 with SMTP id
 qk42-20020a1709077faa00b006ff09185251mr1992958ejc.460.1653405591076; 
 Tue, 24 May 2022 08:19:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a170906088800b006fed5247df9sm2683820eje.196.2022.05.24.08.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:19:50 -0700 (PDT)
Date: Tue, 24 May 2022 17:19:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: babu.moger@amd.com
Subject: Re: [PATCH 0/2] i386: fixup number of logical CPUs when
 host-cache-info=on
Message-ID: <20220524171949.47508d9b@redhat.com>
In-Reply-To: <20220524151020.2541698-1-imammedo@redhat.com>
References: <20220524151020.2541698-1-imammedo@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 May 2022 11:10:18 -0400
Igor Mammedov <imammedo@redhat.com> wrote:

CCing AMD folks as that might be of interest to them

> Igor Mammedov (2):
>   x86: cpu: make sure number of addressable IDs for processor cores
>     meets the spec
>   x86: cpu: fixup number of addressable IDs for logical processors
>     sharing cache
> 
>  target/i386/cpu.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 


