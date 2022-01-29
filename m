Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB304A3200
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 22:06:29 +0100 (CET)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDuvT-0007lw-RU
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 16:06:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1nDusn-0006vo-T9
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 16:03:41 -0500
Received: from [2a00:1450:4864:20::12d] (port=35343
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1nDusm-0003bg-7e
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 16:03:41 -0500
Received: by mail-lf1-x12d.google.com with SMTP id x11so18765778lfa.2
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 13:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=csVm6OfYogKX7g55sVQkh76I9BcI7FDDSOuWh+dGLUs=;
 b=YDQcmwfocXawOx1WHTGpYbn8CO/HW8IDXY1dGnOVSWHXPW+EfaO3KMl+TY8YRZKqxE
 2rWfqUHYj1/KlKgpG0ch5Sn3vNeTd9YkmzsX1RAJLsEEc0WkN8XueU4wzoVNMVF7gfXr
 PTVV8og4SZ0tX0iTWPb9oDbDf4v+tQdnhiXoF+mu50apygXrQbwkeRfuwOZDJQsRklsM
 VoV3aulcLYcoM3crjHVcMbjqxQ38Aibh5NLDwXl3Vn2AqHfInSZJUMZRwCT1ch4J/Z5Q
 f3cqGZpXcOvUHye+I0oSZrNdMflw5UNTYWC3SS1a3L3LUu1WEIrc+ZQwPoQLQV0BQ1Cz
 OCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=csVm6OfYogKX7g55sVQkh76I9BcI7FDDSOuWh+dGLUs=;
 b=Jm9zeNstFJX/1fL1eOtkKWffUEB3hEbjiuNoLABtZKEckRxF88lpaVG+lRTvVR+XGF
 b31QW6zvA8ktnIvsBMnEDyWTiwOJbeaDTcR///PTTRA7uS8KeiEE9P6d2LNYxHmSBE3B
 f9WQaSXvQeFbEU+sBffYCbWcDKsoSYAadHqribGkL8VMO230LfDA4/xSP7Cbyfd7syyt
 2+ch6xFyDR9pKBlyvHtz3HSaqvP5brA3g56F0gRTJjTRlPs6bXqSn20ITj4IoVkxvtmW
 oBvDYQOZFCY6eKtz+jyrsMuT6CY2r+iQ9fcyVeZj2rwzwE7XZsMaUD474x4UvCvFVxxh
 OnCg==
X-Gm-Message-State: AOAM53007TtLnd0nZlu8JAcEzzswYnRzDLeDrhbQY7/2kvF6Rq8qBVCE
 xxyccl9yvhxrxQvORzoFnEpOlA==
X-Google-Smtp-Source: ABdhPJwd+zu4uRFcF9mUWkjAt6mexdyQelpHVVoQL2vSshBYfIQ8Rg9JpZA54/G8UnIGj7mGydsQzQ==
X-Received: by 2002:a05:6512:3408:: with SMTP id
 i8mr9934063lfr.17.1643490217371; 
 Sat, 29 Jan 2022 13:03:37 -0800 (PST)
Received: from localhost (ip-185-108-211-180.ip.asarta.ru. [185.108.211.180])
 by smtp.gmail.com with ESMTPSA id
 l1sm1322190lfh.151.2022.01.29.13.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 13:03:36 -0800 (PST)
Date: Sun, 30 Jan 2022 00:03:36 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
Message-ID: <YfWrqNWcqmtPUlb5@roolebo.dev>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <Ye53sOJekvKrM8iT@roolebo.dev> <7053351.4JHWUSIRgT@silver>
 <Ye7mwcl/rB714vgl@roolebo.dev>
 <CAFEAcA-UE5MmkESRrxdedkzYkc9jp81jzni=-xmivK88gkr6Rw@mail.gmail.com>
 <Ye8vjmFFRLPrhE1Z@roolebo.dev>
 <CAMVc7JXyFoUCkrGLKhCct_DatwU6Xu+L2XSK5y0YMV8xDHZC+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMVc7JXyFoUCkrGLKhCct_DatwU6Xu+L2XSK5y0YMV8xDHZC+g@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::12d;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, phillip.ennen@gmail.com,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 01:14:27PM +0900, Akihiko Odaki wrote:
> On Tue, Jan 25, 2022 at 8:00 AM Roman Bolshakov <roman@roolebo.dev> wrote:
> >
> > On Mon, Jan 24, 2022 at 08:14:31PM +0000, Peter Maydell wrote:
> > > On Mon, 24 Jan 2022 at 17:49, Roman Bolshakov <roman@roolebo.dev> wrote:
> > > > I'm not sure why blocks are Objective-C specific. All the data I have
> > > > shows the opposite [3][4][5]. They're just extensively used in Apple APIs.
> > >
> > > This is true, but for the purposes of our build machinery it is
> > > simpler to have three types of source files that it deals
> > > with (C, C++, ObjC) rather than four (C, C++, ObjC, C-that-uses-blocks).
> > > So unless there's a clear benefit from adding the extra category
> > > I think we should do the simple thing and keep these files named
> > > with a ".m" extension.
> > >
> >
> > Fine by me as long as majority finds it's simpler :) Perhaps it's just a
> > matter of personal preference.
> >
> > I've used to the fact that platform-specific code uses platform-specific
> > extensions or some sort of weird "GCC attributes". Therefore C with an
> > extension is easier to reason for me than Objective-C with ARC and other
> > kinds of implicit behaviour without an actual Objective-C code.
> >
> 
> Being technically pedantic, actually this vmnet implementation uses
> Objective-C and there is a file with .c which uses blocks.
> If a file is named .m, dispatch_retain(o) will be redefined as [o
> retain], and effectively makes it Objective-C code. Therefore, vmnet
> involves Objective-C as long as its files are named .m. It will be C
> with blocks if they are named .c.
> Speaking of use of blocks, actually audio/coreaudio.c involves blocks
> in header files; Core Audio has functions which accept blocks.
> 

Right, dispatch_retain()/dispatch_release() is just one example of the
implicit behaviour I'm talking about.

> I'm neutral about the decision.

> I think QEMU should avoid using Objective-C code except for
> interactions with Apple's APIs, and .c is superior in terms of that as
> it would prevent accidental introduction of Objective-C code.

That was exactly my point :)

> On the other hand, naming them .m will allow the
> introduction of Automatic Reference Counting to manage dispatch queue
> objects.

As of now ARC doesn't work automatically for .m files in QEMU. It
happens because QEMU doesn't enable it via -fobjc-arc.

If you try to enable it, Cocoa UI won't compile at all because of many
errors like this one and similar ones:

../ui/cocoa.m:1186:12: error: ARC forbids explicit message send of
'dealloc'
    [super dealloc];
         ~~~~~ ^

> In fact, I have found a few memory leaks in vmnet in the last
> review and ui/cocoa.m has a suspicious construction of the object
> management (Particularly it has asynchronous dispatches wrapped with
> NSAutoreleasePool, which does not make sense).

> Introduction of Automatic Reference Counting would greatly help
> addressing those issues, but that would require significant rewriting
> of ui/cocoa.m.

Agreed.

Thanks,
Roman

P.S. I still think that given the mentioned facts and implicitness
introduced by Objective-C it would be more natural to have C code in
macOS-related device backends like vmnet and coreaudio unless
Objective-C is essential and required (like in UI code).

> Personally I'm concerned with ui/cocoa.m and do want to do that
> rewriting, but I'm being busy so it would not happen anytime soon.
> 
> Regards,
> Akihiko Odaki

