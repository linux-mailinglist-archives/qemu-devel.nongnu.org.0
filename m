Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6AA493865
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:27:11 +0100 (CET)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8BK-0007qB-CP
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:27:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nA82k-00006q-AI
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:18:18 -0500
Received: from [2a00:1450:4864:20::536] (port=34779
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nA82h-00074n-Kv
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:18:17 -0500
Received: by mail-ed1-x536.google.com with SMTP id cx27so8997018edb.1
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 02:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TNaGhLyXT0Q2wBc7OPNbX/B1LSJlYv4BrHYa0IQjINo=;
 b=et3GSuTqT1dli7gvzIsvWrc/wYPuN24wKbXNbpXoSIJYHS3p1A2fhqASoSCjZiJyTf
 nrpczcauKvUp5Y0X3qxgeMYhfvw3KmfWsjJOyof81Ml2YeRiw+VcKd8q3ugfY8TPUEfE
 7Sku2ZSVPlXjtxJU5I8C9BVzesPUiuH8KGRia8Dap5D72JrOwpOPNyx1uM2Z5+7HMjGn
 RoH17R7CpYxue/5lJswJF73+/BoAOAH5KzFNmrv9d/bByxlGlbcPnC1FvYdJuZTs20oY
 d5qvQscd6LwnOACEg7Xc1XY8Q1EaHndbNqQpSBqKe+Y7S/qSTVirqLakhIMl9J6pybP3
 mFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TNaGhLyXT0Q2wBc7OPNbX/B1LSJlYv4BrHYa0IQjINo=;
 b=2fdSPcoPNA/n/Eu71BbwBG9FBfEGkFG6JGfro7ap3jTLtYCYqYnC08P3ZKv4k9Pkfi
 bqQj3pt41ZTTHGJbaMF5dW8x+VF4YoYYqSvpLIYhWzRKBWRQWoIisRbW3lnIC+TRpN+N
 ilQA4fBw8vLkhNmyj4Cw4L4FZlYUvHD9s1dnROPySneQ6+LPnZhopdtrdnqt8FURFcks
 BGySh6DVqRFvTUFTUUWEM9/iAS9N03M2taDv2FRV20K71Gel6fzaq0ngLOkwhacVHiu0
 hZhHdMhM6ygkzqX85Fduoo5AZHChTwG1o9gxFIObmoY+Vl8Q8SA3VwuCBnqaSkpNrBA1
 /5MQ==
X-Gm-Message-State: AOAM533npTTTd0s5dDHA2bnD8JMrlu2I9xMDX3hFoeR6wtOSKpcboXg6
 z7BmYgkJgh/TvCc3Eq2VtfeGtQ==
X-Google-Smtp-Source: ABdhPJzCsDwVBRpBb56Uihry8PFNvyPRoF8WFf6BnuQtB/M2w69TU+ndREfP/xSuK+IZjijaug+/gw==
X-Received: by 2002:a17:906:6a17:: with SMTP id
 qw23mr23677241ejc.117.1642587491823; 
 Wed, 19 Jan 2022 02:18:11 -0800 (PST)
Received: from smtpclient.apple ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id l23sm428596ejk.97.2022.01.19.02.18.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:18:10 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: ui/cocoa.m compile error (Cocoa -> SDL)
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <8385AF43-75BC-476B-BB78-1FAAB97C4D9B@livius.net>
Date: Wed, 19 Jan 2022 12:18:09 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <CC42BBAA-5278-4C06-AFBE-8744BA4976B8@livius.net>
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
 <574D1950-B892-430B-A450-23262C258950@livius.net>
 <ef5e98d4-d8b2-fc6e-2735-53c075db3f3b@redhat.com>
 <CCB6E84E-5F90-4FC6-BEEB-42A7C591BDBF@livius.net>
 <CAFEAcA9sNksi2=xiFUp_r0_NeCuUKXYU6sd1LDvX=j0+Mh3gYQ@mail.gmail.com>
 <3DE1FD39-B0F7-45D2-BC44-66D9B0533057@livius.net>
 <8385AF43-75BC-476B-BB78-1FAAB97C4D9B@livius.net>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ilg@livius.net; helo=mail-ed1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 17 Jan 2022, at 15:30, Liviu Ionescu <ilg@livius.net> wrote:
>=20
> I will try to rebuild using --with-cocoa on newer systems, to validate =
the rest of the build.

I confirm that after reverting to --with-cocoa, both Intel and Apple =
Silicon builds are able to emulate Thomas' vexpress-a9 project.

However this was an expensive change, since I had to install a macOS =
10.14 virtual machine, with a full build environment, GitHub self-hosted =
runners, etc.

I think that decisions to deprecate support for older macOS releases =
should be considered carefully, since using older machines for running =
builds and tests is not a rare occurrence.


Regards,

Liviu



