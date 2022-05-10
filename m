Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A62520F9F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 10:22:01 +0200 (CEST)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noL83-0004uU-4R
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 04:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noKrW-0006eX-Ja
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noKrR-00049y-Cz
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652169888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mwn4nUATFvLa4KeZ6rq0zYkAGEL7uSNBwPHTrRVNiCI=;
 b=YiO1AhQ6dwDCEKcePqfLtGA0hGo67RLkm4+LtqafZAA1ck+nIKpg29iXYQbqBNIEE/ZmlT
 rno7y1WXYY8RYM2PXWK8czG6WKsoQN/elTGffGTPSafn95ru9Z0f0TzymPm28Zd5qsXJPV
 K40dATYaP1k6O4llAIlcAgFGFvKTXBk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-mcr-FGyGMoaYT1Qgl3Np4Q-1; Tue, 10 May 2022 04:04:47 -0400
X-MC-Unique: mcr-FGyGMoaYT1Qgl3Np4Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ba21-20020a0560001c1500b0020ca6a45dfcso4864936wrb.9
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 01:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Mwn4nUATFvLa4KeZ6rq0zYkAGEL7uSNBwPHTrRVNiCI=;
 b=yMajPUJGxuuSZoaB01uwGmRB9y3i16APGO8/y+XnDXK4+KvIf9LzLwObqMjjkH46rF
 K5/W3lq24Urf2V0HNX4uyOQC7ZwvVbNhVX8Vn1SBG0nCD65g84I1FOh+kEMU+EQC9vnR
 xPHTxm5o/qGIICVI0pRv9xtR3cBj+HqG1dL5/JFXJBlKIcwTL6B1WbAG6BPWGPK7nYEh
 DZkfp13vnayeCtyj09I0wO+124SbKWTM1AeqPEzlgAevddcqM7N/wOkV8LVqTWOu8X9T
 PjIq6PcsxkhMYXJQd+8X8qk7YTF/6CXFixbWTHadZrrHbq88NiHfIAwpXPi4MYCSX8uo
 5/hw==
X-Gm-Message-State: AOAM532mBNvcJD0MtEzB0UG91jIPiuqAqOW7HV0pemJt6u9sWYgrTOML
 mT4Fy4qchuRH4lhhPFpozY0tXSFvlqLP5vKjLgbD9d0oVc0JqOSGjI/I1N8lDLwm7udXtEeAccn
 UnbeQyzw7/EZIS5s=
X-Received: by 2002:a5d:59a5:0:b0:20c:561c:2a0b with SMTP id
 p5-20020a5d59a5000000b0020c561c2a0bmr17141380wrr.290.1652169885994; 
 Tue, 10 May 2022 01:04:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw56+3Ry3uW4kct3A2NWYMlI4Z77vr3gikRbc3dCzNjJHV/HxI050T19XjzJMDwELdvsrbyvQ==
X-Received: by 2002:a5d:59a5:0:b0:20c:561c:2a0b with SMTP id
 p5-20020a5d59a5000000b0020c561c2a0bmr17141369wrr.290.1652169885830; 
 Tue, 10 May 2022 01:04:45 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b003942a244ebfsm1868226wms.4.2022.05.10.01.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 01:04:45 -0700 (PDT)
Date: Tue, 10 May 2022 09:04:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Daniel Berrange <berrange@redhat.com>
Subject: Re: [PULL 12/16] migration: Add zero-copy-send parameter for QMP/HMP
 for Linux
Message-ID: <Ynocm3lqoumCEgFy@work-vm>
References: <20220509150253.218715-1-dgilbert@redhat.com>
 <20220509150253.218715-13-dgilbert@redhat.com>
 <3628fa0b-165a-863a-ffa1-f939d092f79f@linaro.org>
 <CAJ6HWG6Ew7v28aRPYRHH2ZE_j_5_YagFnD6RNpcogm8dbDaNcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ6HWG6Ew7v28aRPYRHH2ZE_j_5_YagFnD6RNpcogm8dbDaNcw@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Leonardo Bras Soares Passos (leobras@redhat.com) wrote:
> On Mon, May 9, 2022 at 4:45 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 5/9/22 10:02, Dr. David Alan Gilbert (git) wrote:
> > > diff --git a/roms/skiboot b/roms/skiboot
> > > index 24a7eb3596..820d43c0a7 160000
> > > --- a/roms/skiboot
> > > +++ b/roms/skiboot
> > > @@ -1 +1 @@
> > > -Subproject commit 24a7eb35966d93455520bc2debdd7954314b638b
> > > +Subproject commit 820d43c0a7751e75a8830561f35535dfffd522bd
> >
> > This is an error, probably in rebasing.
> 
> Yeah, that's odd. Should not be there.
> 
> David, could you please remove that?

Yes, new version coming soon.

Dave

> Thanks!
> 
> >
> >
> > r~
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


