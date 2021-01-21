Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9412FF29E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:59:57 +0100 (CET)
Received: from localhost ([::1]:59894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eFQ-0002zI-5Y
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2eDP-0002AM-GJ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:57:52 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:47199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2eDM-0000BC-RS
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:57:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 95D477DBA9C5;
 Thu, 21 Jan 2021 18:57:44 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 21 Jan
 2021 18:57:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006f791af86-1cb3-4fed-8f9e-783604899b75,
 A41C5EF03AA0D3A03B7528971392D1AB75695B26) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 21 Jan 2021 18:57:43 +0100
From: Greg Kurz <groug@kaod.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] virtiofsd: Add _llseek to the seccomp whitelist
Message-ID: <20210121185743.66138047@bahia.lan>
In-Reply-To: <20210121173553.GL3072@work-vm>
References: <20210121171540.1449777-1-groug@kaod.org>
 <20210121173553.GL3072@work-vm>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: f5f40336-339c-4e95-be35-0683f1f8e402
X-Ovh-Tracer-Id: 13877842252119775709
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeeftdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhvefhkeeugfekhfehhfdvkeefjeeukeekleevgefgleefgfdtjeehtdefkeetffenucffohhmrghinheprhgvughhrghtrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhm
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Jan 2021 17:35:53 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Greg Kurz (groug@kaod.org) wrote:
> > This is how glibc implements lseek(2) on POWER.
> > 
> > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1917692
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> 
> OK, I'm going to assume that _llseek is present on pretty much
> everything?
> 

I've only manually checked it is present on fedora x86,
but this patch successfully passed gitlab CI and travis
before being posted.

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> > ---
> >  tools/virtiofsd/passthrough_seccomp.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> > index a60d7da4b4e2..1ecf5bf318b3 100644
> > --- a/tools/virtiofsd/passthrough_seccomp.c
> > +++ b/tools/virtiofsd/passthrough_seccomp.c
> > @@ -65,6 +65,7 @@ static const int syscall_whitelist[] = {
> >      SCMP_SYS(linkat),
> >      SCMP_SYS(listxattr),
> >      SCMP_SYS(lseek),
> > +    SCMP_SYS(_llseek), /* For POWER */
> >      SCMP_SYS(madvise),
> >      SCMP_SYS(mkdirat),
> >      SCMP_SYS(mknodat),
> > -- 
> > 2.26.2
> > 


