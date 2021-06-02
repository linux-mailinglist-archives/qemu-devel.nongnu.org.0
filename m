Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECB1397E0B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 03:27:34 +0200 (CEST)
Received: from localhost ([::1]:52548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loFfR-0002aj-HU
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 21:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1loFeT-0001I4-Ls
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 21:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1loFeP-0001Q7-Ka
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 21:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622597187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbDoXFvPzQ6QDiG26eSDKpzL1zjS2CjaZ8yFXa2h+9g=;
 b=WFBarpTEBs1aHAyVPlDUeuNeJ09Aov4Xq7pFlQ5AGoWXTyELS+/NKprSsuDotDld+LVhx7
 CsgADrdACDdAWHaROSwlMVvOOPJeCSjLG8Q0euF6xIBBcVYLxIf+c3gpiHHkvkmJLdRDeh
 n/2b4urMxEG1kvvC2KFGAgimis4UJfA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-VEd0nWVNNueiFqt68_oAtw-1; Tue, 01 Jun 2021 21:26:26 -0400
X-MC-Unique: VEd0nWVNNueiFqt68_oAtw-1
Received: by mail-qv1-f72.google.com with SMTP id
 r11-20020a0cb28b0000b02901c87a178503so587623qve.22
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 18:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bbDoXFvPzQ6QDiG26eSDKpzL1zjS2CjaZ8yFXa2h+9g=;
 b=dFv6ar9OJcpvWacqYBIL1uEiHl1/MIWB9svtf2xVBhXnWu8fB6AMudMvfvj+wUxxTI
 sYb1N9+oOk196H7JVIGIGMdsdosdZwWv0PyONsHtlsTu9JDdyCt4QxkMWbQbdgf48K3Q
 N51WZEQGmLESRYgnOTRGeNRmx3fARJ6h9RH3RRVmmGxzEfwAtpNhZHVxCt9UX8RUJGPK
 2tQUu9B4mbhAvI88oBC16ZxTZRSbBKenFHmz3+yJQsRc/VyJpnYTarJzzLen50a1TcMy
 SwD1ktEIFYOhrzFdswdmXm7Z9UbXjo/Ydcf+CyXc1Te69Me4YxXujD9uaiIRHUcUoh9n
 fHsA==
X-Gm-Message-State: AOAM532BfEPkaVRV4ma1pOfViFq14dGhuQSVR5E2nOfoj5MRxT3Az/wT
 TBJ7T7pfzgHwRLiXkOv2LALJzYP6Ud5rSUYC7IYCe94qO2Fk/4oNySTmr/Plqm7b47cLnBY1XxN
 dYItuKxrYYpdp5x0=
X-Received: by 2002:ac8:7581:: with SMTP id s1mr4302268qtq.302.1622597185959; 
 Tue, 01 Jun 2021 18:26:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUfwN3AdXw+a0XCt80C3HeE5tnLSZBgepkGG/HwaRrhHJBeh/IzVMb3GJlykVVF/tKlBlx/g==
X-Received: by 2002:ac8:7581:: with SMTP id s1mr4302254qtq.302.1622597185735; 
 Tue, 01 Jun 2021 18:26:25 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id o5sm12242270qkl.25.2021.06.01.18.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 18:26:25 -0700 (PDT)
Date: Tue, 1 Jun 2021 21:26:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v1 2/6] KVM: introduce dirty_pages into CPUState
Message-ID: <YLbeQMGCl+J3b2JL@t490s>
References: <cover.1622479161.git.huangy81@chinatelecom.cn>
 <78cc154863754a93d88070d1fae9fed6a1ec5f01.1622479161.git.huangy81@chinatelecom.cn>
 <YLbAoEWOE+no+a7H@t490s>
 <2749938b-f775-ec5a-6ac5-d59cde656999@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <2749938b-f775-ec5a-6ac5-d59cde656999@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 02, 2021 at 08:27:19AM +0800, Hyman Huang wrote:
> 在 2021/6/2 7:20, Peter Xu 写道:
> > On Tue, Jun 01, 2021 at 01:04:06AM +0800, huangy81@chinatelecom.cn wrote:
> > > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > > index 044f668a6e..973c193501 100644
> > > --- a/include/hw/core/cpu.h
> > > +++ b/include/hw/core/cpu.h
> > > @@ -375,6 +375,8 @@ struct CPUState {
> > >       struct kvm_run *kvm_run;
> > >       struct kvm_dirty_gfn *kvm_dirty_gfns;
> > >       uint32_t kvm_fetch_index;
> > > +    uint64_t dirty_pages;
> > > +    bool stat_dirty_pages;
> > 
> > Shall we make this bool a global one?  As I don't think we'll be able to only
> > enable it on a subset of cpus?
> Yes, it's a reasonable advice, i'll apply this on the next version

Or even drop the bool and do the accounting unconditionally?  No need to do +1
for each pfn, but do it once before returning from kvm_dirty_ring_reap_one().

-- 
Peter Xu


