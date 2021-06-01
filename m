Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61462397D31
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:49:19 +0200 (CEST)
Received: from localhost ([::1]:38274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loE8L-0002v8-U4
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loE6Z-0001jp-Pn
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loE6V-0006sY-Is
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:47:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622591242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKHKRR1/Wx+37sInOxVpNyGNRkD3YGdAjZ4cPLw7Pp8=;
 b=eYtYcTTXSn63qCmQweW5y6eWdCDcTY09w4bJ/UGfcYU3bOdvAAcmL89x/8ulVqCUHF7pab
 +CeYVAAp6a33vTcW454FNe+0y9FoLorD/i6H9c3TSyJfX9JP9IDcLWap6j5DIUfR8prvtL
 d51CpIYCSIUJVKrDKvRgd7Ff1WgFslI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-B24efuLfPTewYM5YpwuyMA-1; Tue, 01 Jun 2021 19:47:21 -0400
X-MC-Unique: B24efuLfPTewYM5YpwuyMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F02CD180FD6E;
 Tue,  1 Jun 2021 23:47:19 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BF7C761E0;
 Tue,  1 Jun 2021 23:47:08 +0000 (UTC)
Subject: Re: GSoC Intro - TUI interface for QMP
To: "Niteesh G. S." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
 <CAN6ztm8rpDARg786+yq2S58T2wQ7TWSQ+H_3xgfUnRTbgc0k+A@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <d45d686b-ca43-821c-e843-cf0f963e4e6e@redhat.com>
Date: Tue, 1 Jun 2021 19:47:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAN6ztm8rpDARg786+yq2S58T2wQ7TWSQ+H_3xgfUnRTbgc0k+A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, wainersm@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 11:35 AM, Niteesh G. S. wrote:
> Hello Stefan,
> 
> On Mon, May 24, 2021 at 7:02 PM Stefan Hajnoczi <stefanha@redhat.com 
> <mailto:stefanha@redhat.com>> wrote:
> 
>     On Sat, May 22, 2021 at 12:32:00AM +0530, Niteesh G. S. wrote:
>      > By end of this summer, I would like to get a basic TUI with some
>     desirable
>      > features working. Some of the features I would like to get
>     working are
>      > 1) Syntax checking
>      > 2) Syntax highlighting
>      > 3) Code completion
>      > 4) Logging
>      >
>      > I would like to hear some of the features you would like to have
>     and also
>      > your
>      > advice's on implementation.
> 
>     Welcome Niteesh!
> 
>     It would be great to have an QMP API documentation viewer built into the
>     TUI. When you enter a command like 'migrate' it would automatically
>     display the associated QMP command documentation from qapi/*.json.
> 
> That's a great idea.
> Do you want the documentation as a popup or in a separate tab?
> By separate tab what I mean is a full window dedicated to documentation
> with some kind of search functionality.
> 
> Thanks,
> Niteesh.
> 
> 

If we're talking about an urwid interface ...

There are a few ways to do this.

1. Explicitly, if you type something like "/help [command-name]" in the 
command bar, you could create a panel that temporarily replaces the 
history panel that shows the arguments and usage of the requested 
command name.

You could use page-up/page-down to scroll the help up and down accordingly.

To exit the help window, you could issue some keypress (like Ctrl+X? If 
you prototype this, just make it configurable -- I am sure people will 
have opinions.)

While the help window is up, the command entry bar could stay active -- 
i.e., you can type your command while the help is visible on-screen.

(As an aside: If we expect that we will have more than just one or two 
slash commands, it may be nice to have urwid create a popup suggestion 
box when you type a '/', hinting to the user what local shell commands 
are available.)


2. You could just display the help output as a flow item directly in the 
history pane, but if QEMU is receiving lots of events, you run the risk 
of having the help message flood off the screen.

Still, it might be a very simple way to implement it -- and the user can 
always just scroll up.


3. If we get around to implementing any kind of fancy syntax for the 
command entry bar, it may be possible to have the shell read the 
partially-entered command and guess which command we want to see help 
for -- maybe by pressing Ctrl+H?


A challenge will be where to pull the help text from. The QEMU server is 
not capable (today) of sending help information over the QMP socket itself.

We will need to implement a QMP command inside of QEMU directly that is 
capable of delivering this information to the client so that it can 
render it.

Since not all versions of QEMU will have this feature, the qmp-shell 
will need to be able to gracefully deal with the lack of help text, 
displaying an error indicating that this version of QEMU does not have 
help information compiled into it.

--js


