Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16871B1FC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 10:40:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ6Vp-00019J-IJ
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 04:40:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQ6Ua-0000ft-2U
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQ6UY-00028z-E5
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:39:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>) id 1hQ6UY-00028e-5R
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:39:26 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01F575946B;
	Mon, 13 May 2019 08:39:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-122.ams2.redhat.com [10.36.116.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A2981719E;
	Mon, 13 May 2019 08:39:23 +0000 (UTC)
To: Greg Kurz <groug@kaod.org>
References: <155721868351.451636.16735088470797960209.stgit@bahia.lan>
	<155721871721.451636.4261205814714842408.stgit@bahia.lan>
	<2a5ac8c4-60d3-2246-54ca-678ed7a6f988@redhat.com>
	<20190509151804.56cd4179@bahia.lan>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <1e89091d-c079-e0b2-54b4-778db04d3e37@redhat.com>
Date: Mon, 13 May 2019 10:39:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509151804.56cd4179@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 13 May 2019 08:39:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 6/6] virtfs: Fix documentation of -fsdev
 and -virtfs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/05/2019 15.18, Greg Kurz wrote:
> On Wed, 8 May 2019 17:54:42 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 07/05/2019 10.45, Greg Kurz wrote:
>>> This fixes several things:
>>> - add "id" description to -virtfs documentation
>>> - split the description into several lines in both usage and documentation
>>>   for accurateness and clarity
>>> - add documentation and usage of the synth fsdriver
>>> - add "throttling.*" description to -fsdev local
>>> - add some missing periods
>>>
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1581976
>>> Signed-off-by: Greg Kurz <groug@kaod.org>
>>> ---
>>>  qemu-options.hx |   84 +++++++++++++++++++++++++++++++++++++++----------------
>>>  1 file changed, 60 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 9c5cc2e6bf70..975342dfbd66 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -1232,26 +1232,35 @@ the write back by pressing @key{C-a s} (@pxref{disk_images}).
>>>  ETEXI
>>>  
>>>  DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,
>>> -    "-fsdev fsdriver,id=id[,path=path,][security_model={mapped-xattr|mapped-file|passthrough|none}]\n"
>>> -    " [,writeout=immediate][,readonly][,socket=socket|sock_fd=sock_fd][,fmode=fmode][,dmode=dmode]\n"
>>> +    "-fsdev local,id=id,path=path,security_model=mapped-xattr|mapped-file|passthrough|none\n"
>>> +    " [,writeout=immediate][,readonly][,fmode=fmode][,dmode=dmode]\n"
>>>      " [[,throttling.bps-total=b]|[[,throttling.bps-read=r][,throttling.bps-write=w]]]\n"
>>>      " [[,throttling.iops-total=i]|[[,throttling.iops-read=r][,throttling.iops-write=w]]]\n"
>>>      " [[,throttling.bps-total-max=bm]|[[,throttling.bps-read-max=rm][,throttling.bps-write-max=wm]]]\n"
>>>      " [[,throttling.iops-total-max=im]|[[,throttling.iops-read-max=irm][,throttling.iops-write-max=iwm]]]\n"
>>> -    " [[,throttling.iops-size=is]]\n",
>>> +    " [[,throttling.iops-size=is]]\n"
>>> +    "-fsdev proxy,id=id,socket=socket[,writeout=immediate][,readonly]\n"
>>> +    "-fsdev proxy,id=id,sock_fd=sock_fd[,writeout=immediate][,readonly]\n"
>>> +    "-fsdev synth,id=id\n",
>>>      QEMU_ARCH_ALL)
>>>  
>>>  STEXI
>>>  
>>> -@item -fsdev @var{fsdriver},id=@var{id},path=@var{path},[security_model=@var{security_model}][,writeout=@var{writeout}][,readonly][,socket=@var{socket}|sock_fd=@var{sock_fd}][,fmode=@var{fmode}][,dmode=@var{dmode}]
>>> +@item -fsdev local,id=@var{id},path=@var{path},security_model=@var{security_model} [,writeout=@var{writeout}][,readonly][,fmode=@var{fmode}][,dmode=@var{dmode}] [,throttling.@var{option}=@var{value}[,throttling.@var{option}=@var{value}[,...]]]
>>> +@itemx -fsdev proxy,id=@var{id},socket=@var{socket}[,writeout=@var{writeout}][,readonly]
>>> +@itemx -fsdev proxy,id=@var{id},sock_fd=@var{sock_fd}[,writeout=@var{writeout}][,readonly]
>>> +@itemx -fsdev synth,id=@var{id}[,readonly]
>>>  @findex -fsdev
>>>  Define a new file system device. Valid options are:
>>>  @table @option
>>> -@item @var{fsdriver}
>>> -This option specifies the fs driver backend to use.
>>> -Currently "local" and "proxy" file system drivers are supported.
>>> +@item local
>>> +Accesses to the filesystem are done by QEMU.
>>> +@item proxy
>>> +Accesses to the filesystem are done by virtfs-proxy-helper(1).
>>> +@item synth
>>> +Synthetic filesystem, only used by QTests.
>>>  @item id=@var{id}
>>> -Specifies identifier for this device
>>> +Specifies identifier for this device.
>>>  @item path=@var{path}
>>>  Specifies the export path for the file system device. Files under
>>>  this path will be available to the 9p client on the guest.
>>> @@ -1279,17 +1288,33 @@ Enables exporting 9p share as a readonly mount for guests. By default
>>>  read-write access is given.
>>>  @item socket=@var{socket}
>>>  Enables proxy filesystem driver to use passed socket file for communicating
>>> -with virtfs-proxy-helper
>>> +with virtfs-proxy-helper(1).  
>>
>> Why did you add a "(1)" after each virtfs-proxy-helper?
>>
> 
> Oops forgot to mention that in the changelog... We have a manual page for the
> virtfs-proxy-helper command, and IIUC this is the way for a manual page to
> reference another one. Makes sense ?

Makes sense for the man page ... but it might look a little bit strange
in the qemu-doc.html file? I've got no strong opinion, but I think I'd
rather not include the "(1)" here.

 Thomas

