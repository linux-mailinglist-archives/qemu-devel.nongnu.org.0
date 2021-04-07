Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C398357587
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 22:08:36 +0200 (CEST)
Received: from localhost ([::1]:35694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUETb-000883-Ae
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 16:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUENG-0001xK-CL
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 16:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUENA-0000Q7-MT
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 16:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617825710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bur75tc79RRfwOEdAtW7yUR9NUBlHZfD+h19pZv5Kfs=;
 b=g8XraoYA7A4ugfjTSuIPa/TghELVVJW4hj34Rcs5joyrLplPf1jyL/7QNOU+ic6WsiuR6d
 RVqBgiBwu8Y87FpBRKPI+cnGePhpoAl3md7MLxxJiMuVgDtAJbhKcoNkixsQItSBFKiSxj
 WRG+8R0DBgnNyl/fwylivAMUtjGdysQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-zGkiS036OXug8-qCNmaDvA-1; Wed, 07 Apr 2021 16:01:48 -0400
X-MC-Unique: zGkiS036OXug8-qCNmaDvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98E021853022;
 Wed,  7 Apr 2021 20:01:46 +0000 (UTC)
Received: from localhost (ovpn-118-57.rdu2.redhat.com [10.10.118.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E1D95C1C4;
 Wed,  7 Apr 2021 20:01:38 +0000 (UTC)
Date: Wed, 7 Apr 2021 16:01:37 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 0/3] tests/acceptance: Handle tests with "cpu" tag
Message-ID: <20210407200137.53fshmvqjbvrnpk6@habkost.net>
References: <20210224212654.1146167-1-wainersm@redhat.com>
 <20210309185237.GB2155904@amachine.somewhere>
 <d2825a6a-fcc1-7037-a574-5c0cc8ffb879@redhat.com>
 <c834302f-b379-0509-f3b9-afb873072dda@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c834302f-b379-0509-f3b9-afb873072dda@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, pavel.dovgaluk@ispras.ru,
 Cleber Rosa <crosa@redhat.com>, pbonzini@redhat.com, philmd@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 05:01:09PM -0400, John Snow wrote:
> On 3/17/21 3:16 PM, Wainer dos Santos Moschetta wrote:
> > Added John and Eduardo,
> > 
> > On 3/9/21 3:52 PM, Cleber Rosa wrote:
> > > On Wed, Feb 24, 2021 at 06:26:51PM -0300, Wainer dos Santos
> > > Moschetta wrote:
> > > > Currently the acceptance tests tagged with "machine" have the "-M TYPE"
> > > > automatically added to the list of arguments of the QEMUMachine object.
> > > > In other words, that option is passed to the launched QEMU. On this
> > > > series it is implemented the same feature but instead for tests marked
> > > > with "cpu".
> > > > 
> > > Good!
> > > 
> > > > There is a caveat, however, in case the test needs additional
> > > > arguments to
> > > > the CPU type they cannot be passed via tag, because the tags
> > > > parser split
> > > > values by comma. For example, in
> > > > tests/acceptance/x86_cpu_model_versions.py,
> > > > there are cases where:
> > > > 
> > > >    * -cpu is set to
> > > > "Cascadelake-Server,x-force-features=on,check=off,enforce=off"
> > > >    * if it was tagged like
> > > > "cpu:Cascadelake-Server,x-force-features=on,check=off,enforce=off"
> > > >      then the parser would break it into 4 tags
> > > > ("cpu:Cascadelake-Server",
> > > >      "x-force-features=on", "check=off", "enforce=off")
> > > >    * resulting on "-cpu Cascadelake-Server" and the remaining
> > > > arguments are ignored.
> > > > 
> > > > For the example above, one should tag it (or not at all) as
> > > > "cpu:Cascadelake-Server"
> > > > AND self.vm.add_args('-cpu',
> > > > "Cascadelake-Server,x-force-features=on,check=off,enforce=off"),
> > > > and that results on something like:
> > > > 
> > > >    "qemu-system-x86_64 (...) -cpu Cascadelake-Server -cpu
> > > > Cascadelake-Server,x-force-features=on,check=off,enforce=off".
> > > > 
> > > There are clearly two problems here:
> > > 
> > > 1) the tag is meant to be succinct, so that it can be used by users
> > >     selecting which tests to run.  At the same time, it's a waste
> > >     to throw away the other information or keep it duplicate or
> > >     incosistent.
> > > 
> > > 2) QEMUMachine doesn't keep track of command line arguments
> > >     (add_args() makes it pretty clear what's doing).  But, on this type
> > >     of use case, a "set_args()" is desirable, in which case it would
> > >     overwrite the existing arguments for a given command line option.
> > 
> > I like the idea of a "set_args()" to QEMUMachine as you describe above
> > but it needs further discussion because I can see at least one corner
> > case; for example, one can set the machine type as either -machine or
> > -M, then what key it should be searched-and-replaced (if any) on the
> > list of args?
> > 
> > Unlike your suggestion, I thought on implement the method to deal with a
> > single argument at time, as:
> > 
> >      def set_arg(self, arg: Union[str, list], value: str) -> None:
> >          """
> >          Set the value of an argument from the list of extra arguments
> > to be
> >          given to the QEMU binary. If the argument does not exist then
> > it is
> >          added to the list.
> > 
> >          If the ``arg`` parameter is a list then it will search and
> > replace all
> >          occurencies (if any). Otherwise a new argument is added and it is
> >          used the first value of the ``arg`` list.
> >          """
> >          pass
> > 
> > Does it sound good to you?
> > 
> > Thanks!
> > 
> > Wainer
> > 
> 
> A little hokey, but I suppose that's true of our CLI interface in general.
> 
> I'd prefer not get into the business of building a "config" inside the
> python module if we can help it right now, but if "setting" individual args
> is something you truly need to do, I won't stand in the way.
> 
> Do what's least-gross.

I don't have any specific suggestions on how the API should look
like, but I'm having trouble understanding the documentation
above.

I don't know what "it will search and replace all occurrences"
means.  Occurrences of what?

I don't understand what "it is used the first value of the `arg`
list" means, either.  I understand you are going to use the first
value of the list, but you don't say what you are going to do
with it.

-- 
Eduardo


