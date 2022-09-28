Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EDC5EE876
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:40:14 +0200 (CEST)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odemr-0001sG-Ee
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odeHh-0002rd-4s
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 17:08:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odeHd-0004dq-P3
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 17:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664399276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npgEWEPY9BCX1R4o0a9RLtWZiDXSw9D39L+ve4T9Zyw=;
 b=dkDcihqzqNL+Lob0EZIiM2DcYDqF57bf02LPxfZ8UdIrEwQpTMa03VlyHmm7XlgsREjzP0
 XFJDUYKA/HhVU+cWDAdMOPAInjAexP6ArwayQWBwV43qxKgmvcIfZ8Yyg0m7jA4ngU7M54
 iuHDuJkCT30i/jaCczDaEWCDv8O5owg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-T5rvPDTsP5Ov3ebmNhrdCQ-1; Wed, 28 Sep 2022 17:07:54 -0400
X-MC-Unique: T5rvPDTsP5Ov3ebmNhrdCQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so7604455wmn.2
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 14:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=npgEWEPY9BCX1R4o0a9RLtWZiDXSw9D39L+ve4T9Zyw=;
 b=tZsrxr1kC22o2WZOzoqOrqP57Mr+CyIMcHCWbeugasxEqU1hIZfTSJsg12R/yDnAQT
 gXkaJ6ALLcpi/gHbGPIs5fez0MF9v52Ha4vBmPdoBIE2xIFPY/ZmpvOB+i1H66WFkdKS
 HZ8AfxePJccNXl+FfmKk1Vo3YLO8GMx0868B9xXJOGMCisbDT0tIE4cBPpQN5IZ+PMlE
 h7tZ5yRQVVZHvqPcQCzkSiVPSdLuNiYILSzOKyXNsKNBhPBeZbaNAVWq0e4L5y20oeO9
 kyy7geSxFn2obIkRiGmtoPGNb3+tboY6PACEE/0xG4TyyfdrXx71kbiDdvREeU1Cxu+7
 5ZbQ==
X-Gm-Message-State: ACrzQf3/a7EsXW8JXnpI+BvypFkfjSSt58vRH0X2nwL4Jx8aThOIXHJ5
 Et4+XVd8LYxdrMdNdiTfM8XiEEEu4Gp+wah8VtBpXIV21F+8jC0vS6zDJeXjbrtXv2PdzQZ2x9K
 iAU8baPnoJfncMts=
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id
 bg14-20020a05600c3c8e00b003b4d224ae27mr8519114wmb.187.1664399273446; 
 Wed, 28 Sep 2022 14:07:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7fSgu4d0eIus4sNzQpP7Nor2b5lX7KY5A7gY/YFeqcO4dB66Fh9XllT6QqV2/1Db2kgIRbIg==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id
 bg14-20020a05600c3c8e00b003b4d224ae27mr8519097wmb.187.1664399273215; 
 Wed, 28 Sep 2022 14:07:53 -0700 (PDT)
Received: from redhat.com ([2.55.17.78]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c230300b003b4727d199asm2665587wmo.15.2022.09.28.14.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 14:07:52 -0700 (PDT)
Date: Wed, 28 Sep 2022 17:07:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220928170234-mutt-send-email-mst@kernel.org>
References: <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <CAFEAcA985ardY5zWkrZYgWjj+tdVNUnRcaBUChGFX0-o99cjQA@mail.gmail.com>
 <20220628064831-mutt-send-email-mst@kernel.org>
 <20220928204803.GS28810@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220928204803.GS28810@kitsune.suse.cz>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 10:48:03PM +0200, Michal Suchánek wrote:
> Hello,
> 
> On Tue, Jun 28, 2022 at 07:00:59AM -0400, Michael S. Tsirkin wrote:
> 
> > 
> > git submodules are awkward basically because they are an automated wget.
> > I don't think an explicit wget is much better ... but
> > looks like I'm alone in this. Oh well.
> > So it will be a weird dance of wget a tarball, unpack, generate
> > ISO and run. God help you if you need to patch the test - it's
> > wget all the way down.
> 
> That's the problem - the submodules are not automated. They are
> half-automated, and the rules for when the automation works and for when
> the automation falls apart are not intellibible for the general Joe
> Developer.
> 
> You might spend a few days studying how they behave exactly, and then you
> will know. But unless you will use them every day you will forget again,
> because the rules do not lend themselves to some abstraction easily
> understood by humans.
> 
> Thanks
> 
> Michal

But why would learning a different tool be easier?

-- 
MST


