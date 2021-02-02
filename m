Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970B30BAE8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:28:06 +0100 (CET)
Received: from localhost ([::1]:55712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ryf-0006Lf-4P
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l6rxV-0005um-81
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:26:53 -0500
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:47041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l6rxS-0000YU-Hi
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:26:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.173])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 9557723BF32;
 Tue,  2 Feb 2021 10:26:39 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 2 Feb 2021
 10:26:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002a4c1bd17-bca2-4faf-a69a-142cfd9bb192,
 DC0DBEB447F422121002C77F277C88083E2578C3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 2 Feb 2021 10:26:36 +0100
From: Greg Kurz <groug@kaod.org>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: Makefile has local changes that will be overwritten
Message-ID: <20210202102636.3b1474e5@bahia.lan>
In-Reply-To: <E9865C2F-68A9-404F-896C-09C2A78C51A3@gmail.com>
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <CAOZ2QJOq6GNXMWkk_1oxqtT_GYW8FmXT8jYGHzyROXC_yoWfxA@mail.gmail.com>
 <CAFEAcA_m3vbjh42_tox4h_9wS_BSEad=nJrc=v_it01FxVV=EQ@mail.gmail.com>
 <E9865C2F-68A9-404F-896C-09C2A78C51A3@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 257b891a-aea9-481e-99a5-8d13f78372f5
X-Ovh-Tracer-Id: 1931762765334878688
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgedtgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=groug@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Dan Streetman <ddstreet@canonical.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 10:30:25 -0500
Programmingkid <programmingkidx@gmail.com> wrote:

> 
> 
> > On Feb 1, 2021, at 9:52 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> > 
> > On Mon, 1 Feb 2021 at 14:49, Dan Streetman <ddstreet@canonical.com> wrote:
> >> 
> >> On Mon, Feb 1, 2021 at 9:23 AM Programmingkid <programmingkidx@gmail.com> wrote:
> >>> 
> >>> When trying to build QEMU I see this error:
> >>> 
> >>> error: Your local changes to the following files would be overwritten by checkout:
> >>>        Makefile
> >>> Please commit your changes or stash them before you switch branches.
> >>> Aborting
> >>> 
> >>> What I do to see this error:
> >>> ./configure --target-list=i386-softmmu
> >> 
> >> Sorry, I don't see that error, what commit are you building from?
> > 
> > ...and what does git think the local changes to Makefile are ?
> 
> This is the output of 'git status':
> On branch master
> Your branch is up to date with 'origin/master'.
> 
> Changes not staged for commit:
>   (use "git add <file>..." to update what will be committed)
>   (use "git restore <file>..." to discard changes in working directory)
>   (commit or discard the untracked or modified content in submodules)
> 	modified:   dtc (new commits, modified content)
> 
> Untracked files:
>   (use "git add <file>..." to include in what will be committed)
> 	pixman/
> 
> no changes added to commit (use "git add" and/or "git commit -a")
> 
> 
> This is the output of 'git diff master':
> diff --git a/dtc b/dtc
> index 85e5d83984..88f18909db 160000
> --- a/dtc
> +++ b/dtc
> @@ -1 +1 @@
> -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> +Subproject commit 88f18909db731a627456f26d779445f84e449536-dirty
> 

This looks like you have a change in the dtc submodule based on
an old commit:

commit 88f18909db731a627456f26d779445f84e449536 (tag: v1.4.7)
Author: David Gibson <david@gibson.dropbear.id.au>
Date:   Mon Jul 23 13:00:50 2018 +1000

    dtc: Bump version to v1.4.7
    
    We've accumulated a bunch of bugfixes, including considerable improvements
    to libfdt's memory safety, so get ready for another release.
    
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

while current head of dtc is:

commit 85e5d839847af54efab170f2b1331b2a6421e647 (HEAD)
Author: Claudio Fontana <cfontana@suse.de>
Date:   Tue May 12 12:33:15 2020 +0200

    Makefile: when building libfdt only, do not add unneeded deps
    
    implemented originally for the QEMU consumer of libfdt.
    
    Signed-off-by: Claudio Fontana <cfontana@suse.de>
    Message-Id: <20200512103315.1926-1-cfontana@suse.de>
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

> I have tried 'git clean -d -f', 'git reset --hard' and 'git pull'. I am now at 74208cd252c5da9d867270a178799abd802b9338 and still seeing the error with MakeFile.
> 

Since the change affects the dtc submodule, you should
'cd dtc && git diff' to see what these differences are,
and possibly 'git reset --hard' if you don't want them.
Then go back to the QEMU source dir and update the dtc
module with 'git submodule update dtc'.

> 


