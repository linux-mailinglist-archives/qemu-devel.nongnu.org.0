Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F924D7FF9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:37:55 +0100 (CET)
Received: from localhost ([::1]:60094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTi5K-0004iV-C4
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:37:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nTi3B-0002TH-GY
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nTi38-00028D-Or
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647254137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OyCGeTAPawy1k6jp3JiykPwANnVoLqPthRkMuJ9L2z0=;
 b=K92c0cdqov/q2LNFdvJirb8/I6SWUWi/8rh7lCgz08SBF0d8AsfZsMYQCoFInBvJuAud4r
 a8IMGrYGVaMn+ehe2J0VI83Zq/RvPiP80X9QOGk2hv9WAn4l7QK/FIUtN21/sK4yQUtuTc
 QLH8nwJAesseR6yowDOUmBq0Wf9FO7A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-7jCArfUfP2CbaFYowUz3Kw-1; Mon, 14 Mar 2022 06:35:36 -0400
X-MC-Unique: 7jCArfUfP2CbaFYowUz3Kw-1
Received: by mail-ed1-f70.google.com with SMTP id
 l8-20020a056402028800b0041636072ef0so8369739edv.13
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 03:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OyCGeTAPawy1k6jp3JiykPwANnVoLqPthRkMuJ9L2z0=;
 b=tlH0/TBX5t1+G+M36LSOGFZjUbWwbsPhtagmiRqi7KdoaKXZOypY8yqO9ruXka5SNv
 Opg/Gpu3nsuK2ewMA1gcF7rq4y3jK3OmFU0bLYzuEYOwiwtcgGhU68T2ba9A+fm/lNqj
 cRmp7Zv6xhKs6oj50TeWC/ZzSpVOG6sp75OXy8NJM6tRlh+DPyHJxUajvMPRq0kmjgFB
 WppzXfftbxZirPinLHHj1E0J3j18d3jShzyZUqlL7XQ4xOSq89Fy5CqcsYBDSmJwNOzr
 Kny6+gknxbEs4RXtMPWviKlRY1c5FRTI8ddkBztUvUBKltH9lhgDZLXwWC2ITH6t0pPT
 +ZcQ==
X-Gm-Message-State: AOAM532LUDGupdBgwYd/hn/+yzpePzzOPhnMi4gnU6ikyH/V5ESh70Ck
 7DOLuivkvdgSKREEDaTbPNamMKRdC0K6oQ5ebmW+fmz3s3Nvv3VVwJW9PHzhhYQdrMucVJNzvyu
 5iFDnHYxcKJO9UHs=
X-Received: by 2002:a05:6402:d51:b0:416:5f17:990 with SMTP id
 ec17-20020a0564020d5100b004165f170990mr20021432edb.239.1647254134750; 
 Mon, 14 Mar 2022 03:35:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMi7eA2l86Zg20i7nEc/LPR3cDBuMpQlQrPeQDP6U19GDzR5lnT1FFqxSJdtl+hVtbCtWVtg==
X-Received: by 2002:a05:6402:d51:b0:416:5f17:990 with SMTP id
 ec17-20020a0564020d5100b004165f170990mr20021412edb.239.1647254134505; 
 Mon, 14 Mar 2022 03:35:34 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b006da6436819dsm6648341eje.173.2022.03.14.03.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 03:35:33 -0700 (PDT)
Date: Mon, 14 Mar 2022 11:35:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] x86: q35: require split irqchip for large CPU count
Message-ID: <20220314113532.10518837@redhat.com>
In-Reply-To: <8d4912d595bcaca36013e22060c22c1bfe3c44c1.camel@infradead.org>
References: <20220311143901.96481-1-imammedo@redhat.com>
 <8d4912d595bcaca36013e22060c22c1bfe3c44c1.camel@infradead.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Mar 2022 14:58:41 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Fri, 2022-03-11 at 09:39 -0500, Igor Mammedov wrote:
> > if VM is started with:
> > 
> >    -enable-kvm -smp 256
> > 
> > without specifying 'split' irqchip, VM might eventually boot
> > but no more than 255 CPUs will be operational and following
> > error messages in guest could be observed:
> >    ...
> >    smpboot: native_cpu_up: bad cpu 256
> >    ...
> > It's a regression introduced by [1], which removed dependency
> > on intremap=on that were implicitly requiring 'split' irqchip
> > and forgot to check for 'split' irqchip.
> > Instead of letting VM boot a broken VM, error out and tell
> > user how to fix CLI.  
> 
> Hm, wasn't that already fixed in the patches I posted in December?
It might be, could you point to the commit/series that fixed it.

Regardless of that, fixing it in recent kernels doesn't help
as still supported kernels are still affected by it.

If there is a way to detect that fix, I can add to q35 a compat
property and an extra logic to enable kernel-irqchip if fix is present.
Otherwise the fix does not exist until minimum supported kernel
version reaches version where it was fixed.


