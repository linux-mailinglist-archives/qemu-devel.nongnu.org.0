Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDA95879DA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:32:16 +0200 (CEST)
Received: from localhost ([::1]:46398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoG7-0001j7-54
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oInme-0005ZD-PX
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oInmZ-0003Lm-0q
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659430902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4OuCNJH4yNQz8G/Fmlzf2LAtldvNmLD0QY5AcpEBPI=;
 b=ASrp5EiMrvj2Y0q7QQaIsz/7wzf62TIX0/EamARlJJseRRtE5fzHSdbwiQMWYj4MzHh+ML
 MddWCU+8nAO73cH2MaGx5zolodG2DcTIEuX46VV4wS9T6KTn1q0+SBDJpPXU0GuPEPk6dH
 T9bOy09QWW4zh3FhtFLd7N6PbupJNf4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-i1ftQGqiPnOhMLvUoscRNg-1; Tue, 02 Aug 2022 05:01:41 -0400
X-MC-Unique: i1ftQGqiPnOhMLvUoscRNg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d27-20020adfa41b000000b0021ee714785fso3294675wra.18
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C4OuCNJH4yNQz8G/Fmlzf2LAtldvNmLD0QY5AcpEBPI=;
 b=KSOrno9hFp3t9gjte5hUEX/XS1p7dPRNNoe8c/r8qprNKwpRP4wlqCm5N7hGX0xDwf
 D5GQVbH4Z6N2kHcPwwsgmwjCfS6sD5fMz2Rk6XLxQhuvSszZu+VUbOOh4LB3L0Sv24rZ
 kuq2bwvZf7mKnoLUhlj5dVDQfJ5uvJca9kZZ8Uf1vOiXUNOcm9N5CzvpECa0Lh0l3hEL
 1rB5j9YEuEJrcJ61Jx3s9W6106FVmmDOp4IdvqIWd/SeSdYFort8iUjHiTttLmEXM5a9
 +SlI6juUJ3u15dT91jrjSlYKCmovV5eC4B++p1zqOQ1hUqzTMxGsWSYod93PnC6q7PZT
 kvmQ==
X-Gm-Message-State: ACgBeo3aJzzulqUS6Dm+NtHQ+wq+pbMR68YVVqPvkSQ1g4C+Vl7jV8ba
 cvToBVkABrEBneiVs2QwYTezEqy9HnMtkpuDEkSbppXwcL/wyLTxR92UKI6Demt+I+eKYWSQk1x
 XrvtUSnxEPn315nk=
X-Received: by 2002:a05:6000:1ac5:b0:21d:beaf:c2c3 with SMTP id
 i5-20020a0560001ac500b0021dbeafc2c3mr12444678wry.609.1659430899464; 
 Tue, 02 Aug 2022 02:01:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6FHXH11kRquJolEfLqZjt8kVDECeVE/ohvUZpNWy4Jitb1Dg1V2t7v7uaaoZOpXmRqyIWG9w==
X-Received: by 2002:a05:6000:1ac5:b0:21d:beaf:c2c3 with SMTP id
 i5-20020a0560001ac500b0021dbeafc2c3mr12444667wry.609.1659430899281; 
 Tue, 02 Aug 2022 02:01:39 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z16-20020adfe550000000b002185631adf0sm14637972wrm.23.2022.08.02.02.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:01:38 -0700 (PDT)
Date: Tue, 2 Aug 2022 10:01:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH for-7.1] Revert "migration: Simplify unqueue_page()"
Message-ID: <Yujn8EXzJjYXZWj7@work-vm>
References: <20220802061949.331576-1-thuth@redhat.com>
 <YujksCJ/JjRAJc9N@work-vm>
 <b941a128-11d8-cda1-b48a-bc356a0a60cd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b941a128-11d8-cda1-b48a-bc356a0a60cd@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Thomas Huth (thuth@redhat.com) wrote:
> On 02/08/2022 10.47, Dr. David Alan Gilbert wrote:
> > * Thomas Huth (thuth@redhat.com) wrote:
> > > This reverts commit cfd66f30fb0f735df06ff4220e5000290a43dad3.
> > > 
> > > The simplification of unqueue_page() introduced a bug that sometimes
> > > breaks migration on s390x hosts. Seems like there are still pages here
> > > that do not have their dirty bit set.
> > 
> > I don't think it's about 'not having their dirty bit set' - it's
> > perfectly fine to have the bits clear (which indicates the page has
> > already been sent to the destination, sometime inbetween the page request
> > being sent from the destination and it being unqueued).
> 
> Ok, could you maybe simply drop that sentence from the commit description
> when picking up the patch? Or shall I resend a v2?

Sure, I'll reword

>  Thomas
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


