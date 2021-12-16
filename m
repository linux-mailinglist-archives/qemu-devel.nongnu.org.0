Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FA9477C2A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 20:04:23 +0100 (CET)
Received: from localhost ([::1]:33472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxw3B-0000yi-Pf
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 14:04:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@redhat.com>) id 1mxw1p-0000Fv-Re
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 14:02:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@redhat.com>) id 1mxw1l-0004nD-KV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 14:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639681372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKsi+z77W8jJZiToUbFe+dXpTLjB7v+tatv+ckXRGt0=;
 b=NnAOxcIR7NgbeQuzkP9Bv2qvSxKUXSdvT3/38dKfH7xsLQoTnDWStb5qfukL5bixNgGWlQ
 834nUw9thkDpx2o6gBDJrM62HZPaiXsNthzli4WdxVdJn7vMQ+1qJcwPVWTY9Ma9tlRq8L
 +FohbLtOQeEwWeRKSp2bmkhGkNW/ry4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-iloiqnp1OYeH6fJKSejESg-1; Thu, 16 Dec 2021 14:01:36 -0500
X-MC-Unique: iloiqnp1OYeH6fJKSejESg-1
Received: by mail-qv1-f70.google.com with SMTP id
 a11-20020a0562140c2b00b00410ea70de9cso141335qvd.17
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 11:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QKsi+z77W8jJZiToUbFe+dXpTLjB7v+tatv+ckXRGt0=;
 b=v4GixZpA5QePswv7CmBN1LOulo4bM1MNnsEoOOSPQ9JNKG1CFL/CZQBZgOu90UM3+O
 nGs4iGXav0pLtgClZ9ERnXF79wvxbYyZe7bdLEMLlyo26O3/ygDuxcdMD0isq2Gyg20I
 E6cyciADAUx+LRbIBk9JgfPECRjVGWur9XTVl9pk4nJPRuIqHjFsoZRqi0jOlXEvMjhq
 2x/BK8wqBakdKLx8j/f2cLo7aw7FovcNMI2tjmetohxMzgqEqgbratKXz6F4nz+O2Ftd
 tc/JLYSb3mv3gOmQwNA+YyFthXD63qTXcUbZ4vdFpS6dxTBlgmKKFZfEW4Y2jVS+4Kv5
 2xtw==
X-Gm-Message-State: AOAM532BhGBcGUD1EfTpwU+Kg6T/HdAI3j+tpQA84dL1GIeUKUNohl6j
 JKTmSWICcZXgkVmMMWXszRJENkbmLP7h4qt4yParRVK2PM1jfnHSWzPmgrNWLg4NfLQSnt65y41
 9W0+1kpuokfR76jo=
X-Received: by 2002:a05:6214:246e:: with SMTP id
 im14mr17789886qvb.14.1639681290527; 
 Thu, 16 Dec 2021 11:01:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcigL6hWQ7L8nG9sbZC5TjfFcUzrZm+S2CnZTYuh55ZQQwoSvlNUQBnq1Ocfw4/mfUFXXHzw==
X-Received: by 2002:a05:6214:246e:: with SMTP id
 im14mr17789849qvb.14.1639681290266; 
 Thu, 16 Dec 2021 11:01:30 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id v5sm4543350qtc.60.2021.12.16.11.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 11:01:29 -0800 (PST)
Date: Thu, 16 Dec 2021 14:01:26 -0500
From: Alexander Bulekov <alxndr@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] e1000: fix tx re-entrancy problem
Message-ID: <20211216190108.z4d7mod4nlar5qwz@mozz.bu.edu>
References: <20211021161047.578751-1-jmaloy@redhat.com>
 <61ba1305-321a-1de2-a399-e7b608e4dad4@redhat.com>
 <d8f0ab15-de92-4286-485f-dff907ac0762@redhat.com>
 <0e38d05c-829d-d827-30de-9019a9fb60c3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0e38d05c-829d-d827-30de-9019a9fb60c3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alxndr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=alxndr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jon Maloy <jmaloy@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 211216 1935, Philippe Mathieu-Daudé wrote:
> On 12/16/21 16:51, Jon Maloy wrote:
> > On 12/16/21 04:36, Philippe Mathieu-Daudé wrote:
> >> Hi Jon,
> >>
> >> On 10/21/21 18:10, Jon Maloy wrote:
> >>> The fact that the MMIO handler is not re-entrant causes an infinite
> >>> loop under certain conditions:
> >>>
> >>> Guest write to TDT ->  Loopback -> RX (DMA to TDT) -> TX
> >>>
> >>> We now eliminate the effect of this problem locally in e1000, by adding
> >>> a boolean in struct E1000State indicating when the TX side is busy. This
> >>> will cause any entering new call to return early instead of interfering
> >>> with the ongoing work, and eliminates any risk of looping.
> >>>
> >>> This is intended to address CVE-2021-20257.
> >>>
> >>> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
> >>> ---
> >>>   hw/net/e1000.c | 7 +++++++
> >>>   1 file changed, 7 insertions(+)
> >> I can not find the reproducer in the repository, have you sent one?
> >>
> > No, I did not add it to the repo.
> > It was referenced from the tracker BZ, but I was unable to get access
> > back then.
> > It ended up with that I had it sent by mail to me directly.
> > 
> > What is your question? Is it that it should be in the repo, or that you
> > cannot find it?
> 
> Well I'd like to reproduce the bug, but first I can not find it ;)
> Having such reproducer committed along with the fix help catching
> future regressions if we refactor code elsewhere.
> 

Blind guess, but assuming write to TDT == set_tctl, maybe this one?
https://bugs.launchpad.net/qemu/+bug/1917082


