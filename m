Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A9B37C11B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:55:41 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqGy-0001dd-30
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgqDE-0004hs-Hi
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:51:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgqD7-0000eU-Oe
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620831100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nsz7j3XPN1pL5qzERbTeETCZPBkcjrp971aD7MISoOo=;
 b=C7TmkUtQDBdhBwW66YP0SxHeWzsEgB4ikQhav9facvhytrfhq8EGM3dRIC97g8tWgi4bgQ
 J/z9Jp+5myLGQy54foQgbBt56I7pFdiRZlFNWBiffwDwTZ5swLbG+1FdVOVUNtLhyJfsEc
 xMEcgBTxbw0ikwg0TjW7qCKZUElY0tk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-0PdnqtcMMKqpc6cHgEazUg-1; Wed, 12 May 2021 10:51:38 -0400
X-MC-Unique: 0PdnqtcMMKqpc6cHgEazUg-1
Received: by mail-ej1-f70.google.com with SMTP id
 cs18-20020a170906dc92b02903a8adf202d6so6243774ejc.23
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 07:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nsz7j3XPN1pL5qzERbTeETCZPBkcjrp971aD7MISoOo=;
 b=rkCBYotJRbfgJIt5BfruL/150R2qG2R8VeAh23HiS1WFG9bV+4GSvxyRgoA1nZFaLY
 nlUJFzEA27P5IYXZ32pNOX11784iy9wz3Vqt6LQk/MU+6c7tideDNcqUk+P4r2+A9n2b
 wnNDDBRbX5e/CjTey8yFrm4zrtKYzBiFCodQ5fy+w/DaO1eukbFUlpqrZQzW9UH5ni1h
 EzQpA+L+JcvWhtRhxhwjB/A5ODp4DXvQxOZn2IH/YTkrLZ8GHaEWiOlflNuey3BC0E2b
 /0IY9csecTnThnE6teHqvTkdNBealoPz57Iedahn2+oAOKYy23+aNrZkSL8ZZaycFHDg
 Eh0w==
X-Gm-Message-State: AOAM532tEe5QfcoKfSWzXdWLI+gjIIM7a6h84+SyTjh4y7v5hQnlTYjs
 QDytWbsr/ttbh3TPi6G3BCAZJxQxNXXm+uA/Pd87tLWrpiRduUMN+stfyh+XQW1Lszo20Ux6LYK
 7QdCyTe89BHrFN4m7yJlDsLBdrytTq9A=
X-Received: by 2002:a05:6402:16db:: with SMTP id
 r27mr41910752edx.375.1620831097241; 
 Wed, 12 May 2021 07:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKioCTjH9HWfWau/x567BHXF80oGl1xyp0U1PjiZYsWlgyMaGp1R0gVfRTRD3L/B3XClhfhjL/dIH9RNR+huU=
X-Received: by 2002:a05:6402:16db:: with SMTP id
 r27mr41910724edx.375.1620831097016; 
 Wed, 12 May 2021 07:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
 <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
 <5b582933-6004-3549-b5fe-208c182d5efe@redhat.com>
 <CAKJDGDZUScyzVzhwpG+d6di3Wa0+Txk0SONVXiC++dukzNeTew@mail.gmail.com>
 <93b24ba1-0898-250f-0f8c-87bc08934220@redhat.com>
 <YJvfcLiItG4xbnvE@redhat.com>
In-Reply-To: <YJvfcLiItG4xbnvE@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Wed, 12 May 2021 16:51:25 +0200
Message-ID: <CAP+75-UesRXMwgvywUxdT8FsP0zW5xfucHFk0DyqHcSu+iB6Sw@mail.gmail.com>
Subject: Re: non-x86 runners in the Gitlab-CI (was: Re: [PATCH 12/12]
 configure: bump min required CLang to 7.0.0 / XCode 10.2)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Ademar Reis Jr <areis@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On Wed, May 12, 2021 at 4:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> On Wed, May 12, 2021 at 03:55:59PM +0200, Thomas Huth wrote:
> > On 12/05/2021 15.47, Willian Rampazzo wrote:

> > > I don't know if you saw this:
> > > https://docs.travis-ci.com/user/billing-overview/#partner-queue-solut=
ion.
> > >
> > > tl;dr, Travis now has support from partners to run non-x86 arch. It i=
s
> > > always good to have a plan B, like qemu own CI runners, but, at least=
,
> > > with these non-x86 arch available on Travis, we will have some time t=
o
> > > breathe.

>   "The build job under Partner Queue Solution costs 0 credits per
>    started minute. At the moment of introducing Partner Queue Solution
>    active accounts on the Usage based Plans, including the Free Plan,
>    with a balance of zero or fewer credits, balance is updated to
>    hold 1 credit. Thus everybody can use Partner Queues without
>    requesting Travis CI support to grant additional credits. If you
>    run into a negative account balance after that, you still need to
>    file an additional request."
>
> IOW, anyone ought to be able to use non-x86 jobs, bt if you accidentally
> run an x86 job and get into 0 (or negative) credits, then you won't even
> be able to use non-x86 jobs.

You once showed a script on GitLab triggering Travis-CI jobs and reporting
the success/failure on GitLab (or was it Cirrus-CI?). Is it possible to use
something similar with QEMU to integrate Travis-CI jobs with GitLab
pipeline?


