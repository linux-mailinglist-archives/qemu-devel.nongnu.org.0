Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E349B212
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:46:06 +0100 (CET)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJKv-0008Sm-C3
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:46:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCJ8K-0004tJ-2B
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:33:04 -0500
Received: from [2a00:1450:4864:20::434] (port=45045
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCJ8G-0006E7-NB
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:33:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id k18so18956338wrg.11
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 02:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PHFtLE9rLmpj4OseBk/Pn49d4Xqx8fH9tGzgo/lrVRg=;
 b=lc4kyK2WTrNJvEecc9YiJOhsKWIy/P5bxBB5I9QlUpZLsrntMHckW4VABGHEZPBDsj
 WEQK+oJfW4qeodNnoZCCsjqwLnysJ8NWbieMY8RHPnZI3u4otyohjdTtXWdk8xODLeBm
 kBJRhbrLDr867hphDtHSX9qEHtgqxxldHraqES/uRZrRR4g8ktTMpjGSDiHmaL7uM/st
 DuhvC+iblrevg7jXZRqRbZ/z9bdzWlLUvDCZ3F1Cg810UeUpgI3aCFPYp6O88sJT3a+M
 XURxJ3YOfZ32YQYa5EChBOvnzV+AOuqvgEuZH3HQiRyiD0vcbwYmeTC4uh0muQAYeVs2
 imrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PHFtLE9rLmpj4OseBk/Pn49d4Xqx8fH9tGzgo/lrVRg=;
 b=ko5GSN/QovcX02x07tegOYIwSc+JOUoj6YK0l6oBeZBRsXBcR2+xLefOsbYHGTO9YC
 VgJ3EtjNDbDxMf9UHBSArQE0yMOJ+PyJk0+t6NFFJenwjl2ATOcc/UZ5I+UZKcj/pLXd
 6N/T9+DQ2LWomjYMT0b8IGoRhPJestgxYhTSV+RPH7BAVmM749zv+4twp3g/V9fJ/fbL
 gt9PiZ83okGdi37pNDHCJdcPrNxLk6lOxNR09hki8oxTf4LUOzje/42ilvRY09YSDlrr
 jOzPAYG2+q9BbBh4QjvQ6Ln5pKAHC+Ei3J2vzIqLxPoiYPadQV7KkyOqojjhrTgFQDmI
 EurQ==
X-Gm-Message-State: AOAM531StsHQCZUepjIU3C7NGcKSmcE/szRzM9WbmXarYmZXVCbMHYUY
 6CvjGTizlcIivADWF2rBvsOe/vbOE7umELyiLzbI+Q==
X-Google-Smtp-Source: ABdhPJxV5wj7D7ixtoZXboh2kSUQ2rFZJh39eWVs9NJ00HLzKMDMIUQwwQMkqZQSVPbpUtCYoxfp9lOFjd8HamhIFn0=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr18383335wrv.521.1643106777821; 
 Tue, 25 Jan 2022 02:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <Ye53sOJekvKrM8iT@roolebo.dev>
 <7053351.4JHWUSIRgT@silver> <Ye7mwcl/rB714vgl@roolebo.dev>
 <CAFEAcA-UE5MmkESRrxdedkzYkc9jp81jzni=-xmivK88gkr6Rw@mail.gmail.com>
 <Ye8vjmFFRLPrhE1Z@roolebo.dev>
 <CAMVc7JXyFoUCkrGLKhCct_DatwU6Xu+L2XSK5y0YMV8xDHZC+g@mail.gmail.com>
In-Reply-To: <CAMVc7JXyFoUCkrGLKhCct_DatwU6Xu+L2XSK5y0YMV8xDHZC+g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jan 2022 10:32:46 +0000
Message-ID: <CAFEAcA_CT6AJx_ns4zjw1_udq-Ab3YdM2mzPcKKZberUPOqhPA@mail.gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, phillip.ennen@gmail.com,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Roman Bolshakov <roman@roolebo.dev>,
 Alessio Dionisi <hello@adns.io>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jan 2022 at 04:14, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> I'm neutral about the decision. I think QEMU should avoid using
> Objective-C code except for interactions with Apple's APIs, and .c is
> superior in terms of that as it would prevent accidental introduction
> of Objective-C code. On the other hand, naming them .m will allow the
> introduction of Automatic Reference Counting to manage dispatch queue
> objects. In fact, I have found a few memory leaks in vmnet in the last
> review and ui/cocoa.m has a suspicious construction of the object
> management (Particularly it has asynchronous dispatches wrapped with
> NSAutoreleasePool, which does not make sense).

I think those are probably my fault -- in commit 6e657e64cd (in 2013)
we added NSAutoReleasePools to fix leaks that happened because
we were calling into Cocoa APIs from threads other than the UI
thread that didn't have their own automatically created autorelease
pool. Much later in commit 5588840ff778 (in 2019) we put in the
dispatch_async stuff because newer macOS was stricter about
requiring Cocoa API calls to be only on the UI thread. So
I think that means the requirement for the autorelease pools
has now gone away in those functions and we could simply delete
them -- does that sound right? (I freely admit that I'm not a macOS
expert -- I just look stuff up in the documentation; historically
we haven't really had many expert macOS people around to work on
cocoa.m...)

On the subject of cocoa.m, while we have various macOS-interested
people in this thread, can I ask if anybody would like to
review a couple of patches that came in at the beginning of the
year?

https://patchew.org/QEMU/20220102174153.70043-1-carwynellis@gmail.com/
("ui/cocoa: Add option to disable left command and hide cursor on click")
and
https://patchew.org/QEMU/20220103114515.24020-1-carwynellis@gmail.com/
("Show/hide the menu bar in fullscreen on mouse")

either from the point of view of "is this a sensible change to
the macOS UI experience" or for the actual code changes, or both.

We've been very short on upstream macOS code reviewers so if people
interested in that host platform are able to chip in by
reviewing each others' code that helps a lot.

thanks
-- PMM

