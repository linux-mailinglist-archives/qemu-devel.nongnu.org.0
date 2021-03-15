Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB7233C4BC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:44:19 +0100 (CET)
Received: from localhost ([::1]:40564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrGM-0005WB-QQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lLr9z-00024h-Rm
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:37:43 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:53095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lLr9x-0006PM-KO
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:37:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.208])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 53C8A90704C3;
 Mon, 15 Mar 2021 18:37:39 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Mar
 2021 18:37:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006ef09adda-c8dc-4acd-9dd8-f0071d0e9d16,
 C2FE56B6373390384040EEB24197F6B99D02A218) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 15 Mar 2021 18:37:37 +0100
From: Greg Kurz <groug@kaod.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 3/3] virtiofsd: Don't allow empty filenames
Message-ID: <20210315183737.19b0d824@bahia.lan>
In-Reply-To: <YE962LeQCJfR03NZ@work-vm>
References: <20210312141003.819108-1-groug@kaod.org>
 <20210312141003.819108-4-groug@kaod.org>
 <20210314233604.GC223210@redhat.com>
 <20210315110630.5ae99490@bahia.lan> <YE962LeQCJfR03NZ@work-vm>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d2ed2557-6f3c-4a2b-8750-99873aceffe9
X-Ovh-Tracer-Id: 11196793100870392288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvledguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueeiieekueffvdeggeehjeeuleeifeejgeevtedugfehheefleegffdukefhfeetnecuffhomhgrihhnpehophgvnhhgrhhouhhprdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 15:18:48 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Greg Kurz (groug@kaod.org) wrote:
> > On Sun, 14 Mar 2021 19:36:04 -0400
> > Vivek Goyal <vgoyal@redhat.com> wrote:
> > 
> > > On Fri, Mar 12, 2021 at 03:10:03PM +0100, Greg Kurz wrote:
> > > > POSIX.1-2017 clearly stipulates that empty filenames aren't
> > > > allowed ([1] and [2]). Since virtiofsd is supposed to mirror
> > > > the host file system hierarchy and the host can be assumed to
> > > > be linux, we don't really expect clients to pass requests with
> > > > an empty path in it. If they do so anyway, this would eventually
> > > > cause an error when trying to create/lookup the actual inode
> > > > on the underlying POSIX filesystem. But this could still confuse
> > > > some code that wouldn't be ready to cope with this.
> > > > 
> > > > Filter out empty names coming from the client at the top level,
> > > > so that the rest doesn't have to care about it. This is done
> > > > everywhere we already call is_safe_path_component(), but
> > > > in a separate helper since the usual error for empty path
> > > > names is ENOENT instead of EINVAL.
> > > > 
> > > > [1] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_170
> > > > [2] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap04.html#tag_04_13
> > > > 
> > > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > 
> > > Hi Greg,
> > > 
> > > Minor nit, if you happen to respin this patch, it probably should come
> > > before the first patch in series. Once we make it clear that file server
> > > is not expecting empty path in these top level functions, then it is
> > > easy to clear AT_EMPTY_PATH in function these paths are calling as
> > > appropriate.
> > > 
> > 
> > The patch order is chronological : I just spotted the AT_EMPTY_PATH
> > oddity before coming up with the bigger hammer of patch 3. But you're
> > right, it probably makes more sense to do the other way around.
> > 
> > > What about lo_create(). Should we put a check in there as well.
> > > 
> > 
> > Good catch ! I'll post a v2 then ;)
> 
> I'm just brewing a pull now, since soft freeze is tomorrow.
> I'll take 3,1,2 - please follow up with a separate lo_create one - we
> can add that later.
> 

Sure, I'll do that.

Cheers,

--
Greg

