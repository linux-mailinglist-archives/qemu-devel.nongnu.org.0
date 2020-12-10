Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881142D5EA8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:53:45 +0100 (CET)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNKC-0003vt-Jr
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1knNGr-00023n-FY
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:50:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1knNGo-0006lC-3R
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607611811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p6ZLlBz5Y6AkBvx4isJCMiyeQmxt0MW+uZahiLuJP9A=;
 b=B6mw+T8+poQOxACmSGb4DaUfV7ZIOqDLYG/3dJdHlG2ONF6hkr/dbwm+qBjmtPkT56vQZ/
 CU10Bl/fTltNghepRLIvnkEOSTdG63aLORq8PF5R69XD5/+z3UMru3AiLsCIEXyaA2Cdb/
 qvKL2+R+kjk5BCm77W+6R6Xx0sTosHs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-uvMultnXNYiyIfjcHH8QiA-1; Thu, 10 Dec 2020 09:50:10 -0500
X-MC-Unique: uvMultnXNYiyIfjcHH8QiA-1
Received: by mail-qt1-f198.google.com with SMTP id o12so4091701qtw.14
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p6ZLlBz5Y6AkBvx4isJCMiyeQmxt0MW+uZahiLuJP9A=;
 b=JxN5c/7bMpGPJH2Bpp6TZEpdYEZhpVaKDfR1GSbiIh1IAKZxLrbmZ5FvpHA5PX7Sb3
 gZuL8yOs0LeQWy168+8NImGrJrIRE7R1isr0AmxTWhb9mIA8CxGT9WcaT6ILCCuG2dSE
 FaCPb//3BRYuDzzhZcONpGPtLxgsaWmt6SuH1IbmulrnOBmuJEA6JOr2t9/ab696OFTE
 5qmA4oP3CVfM4b1AGfceG3NeQLNzs6C4MDXx77TtPpxa1WPezyLrrb6F1Ahi6DJhDf7w
 k19vCupCvL8G5AGijo2/f+Y0GnTJxDscBTYzXPtgDYHyDbM0dOrIaYfLK97j0r6EzVse
 rIww==
X-Gm-Message-State: AOAM532TOZE2RoTNSnAnKoodUzoZqnWxee11dBPgzRrDMRpnD5JxyuZc
 Ee2oSuUykj7ZoALTh/3S+4RPLk5MyZBXWFU90g8dZC3OgVB8h0KoEn1V30dYeU9krgJ2x/IGjj3
 8VpGlInpzzmFgtPU=
X-Received: by 2002:ac8:4b50:: with SMTP id e16mr9727947qts.205.1607611808666; 
 Thu, 10 Dec 2020 06:50:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjJ6WswwqGFvyiv9ip5WIAUM0JCIUYY8mmXDfsQtdy0IJ+fsvY10//4cIOe8MqDtXBsvPBog==
X-Received: by 2002:ac8:4b50:: with SMTP id e16mr9727933qts.205.1607611808464; 
 Thu, 10 Dec 2020 06:50:08 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id v128sm3583774qkc.126.2020.12.10.06.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 06:50:07 -0800 (PST)
Date: Thu, 10 Dec 2020 09:50:06 -0500
From: Peter Xu <peterx@redhat.com>
To: zhukeqian <zhukeqian1@huawei.com>
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
Message-ID: <20201210145006.GD3211@xz-x1>
References: <20201208114013.875-1-yuzenghui@huawei.com>
 <20201208151654.GA6432@xz-x1>
 <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
 <6dc82702-9246-4684-4f28-e104abc0c11d@huawei.com>
 <20201210020843.GB3211@xz-x1>
 <7d46e5ca-24ab-7c44-201c-77e8fc6a2ace@huawei.com>
MIME-Version: 1.0
In-Reply-To: <7d46e5ca-24ab-7c44-201c-77e8fc6a2ace@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 10:53:23AM +0800, zhukeqian wrote:
> 
> 
> On 2020/12/10 10:08, Peter Xu wrote:
> > Keqian,
> > 
> > On Thu, Dec 10, 2020 at 09:46:06AM +0800, zhukeqian wrote:
> >> Hi,
> >>
> >> I see that if start or size is not PAGE aligned, it also clears areas
> >> which beyond caller's expectation, so do we also need to consider this?
> > 
> > Could you elaborate?
> > 
> > If start_delta != 0, kvm_log_clear_one_slot() should already go the slow path.
> > 
> > Thanks,
> > 
> 
> Hi Peter,
> 
> start_delta /= psize;
> 
> If start is not PAGE aligned, then start_delta is not PAGE aligned.
> so I think the above code will implicitly extend our start to be PAGE aligned.
> 
> I suggest that we should shrink the start and (start + size) to be PAGE aligned
> at beginning of this function.

Callers should be with TARGET_PAGE_SIZE aligned on the size, so at least x86_64
should be pretty safe since host/guest page sizes match.

Though indeed I must confess I don't know how it worked in general when host
page size != target page size, at least for migration.  For example, I believe
kvm dirty logging is host page size based, though migration should be migrating
pages in guest page size granule when it spots a dirty bit set.

-- 
Peter Xu


