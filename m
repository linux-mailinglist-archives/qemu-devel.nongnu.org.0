Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FAD29D007
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 14:29:46 +0100 (CET)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXlWL-0003Ww-Ov
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 09:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kXlUu-0002oA-NP
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 09:28:16 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:48069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kXlUs-0008D4-H3
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 09:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Aoru0PiPVCrhbOCvb7pSBL9iZdYEbqiiGbBjRHY5nSA=; b=G68+MJuLY39xxDb39zXWIA3MOR
 HhSTm/d91yLqBJSRxDdnjaEWlGnqCWzePf0K2kMBKwbmARSpLC+cN+mA+YFf0S9YtKJE03wnVOJ4G
 ESCmD/gG8euCz6bEBZKH73Iir49Y8rgPHmayxrE2CUfZgqHEfFtLJojr4mDpD7fPywzzl8F2wlknS
 tSdlghnxU+DNMfHcHWdLAPhFHsnVdM7U1cMaBQblzyxeYLq+IM2Et/rnJm/ZkF5bRifGSAVj83pe1
 ge+y5hQQFXvmE3iXnWPaGUQLIovjA+BeUXTgszzJusY+TfKdAymBPWtbfbKqdXGleYmKlz+2z76KP
 A0246DQQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Eric Blake <eblake@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 04/12] libqos/qgraph: add qos_dump_graph()
Date: Wed, 28 Oct 2020 14:28:10 +0100
Message-ID: <3275118.OWnzUEy8WN@silver>
In-Reply-To: <4dde4915-8f44-d8fc-898f-bd61a40e084b@redhat.com>
References: <cover.1602182956.git.qemu_oss@crudebyte.com>
 <11a4d5e3-cb5d-b74d-df7e-6e5a659c63a4@redhat.com>
 <4dde4915-8f44-d8fc-898f-bd61a40e084b@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 09:28:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 28. Oktober 2020 14:00:21 CET Eric Blake wrote:
> On 10/28/20 12:51 AM, Thomas Huth wrote:
> >>>> +#define GREEN(txt) (  \
> >>>> +    "\033[0;92m" txt  \
> >>>> +    "\033[0m"         \
> >>>> +)
> >>> 
> >>> I don't think this is very portable - and it will only make logs ugly to
> >>> read in text editors. Could you please simply drop these macros?
> > 
> > Sure, colored output is nice, but we certainly also need a way to disable
> > it, e.g. if you want to collect the log in a file and then have a look at
> > it in a text editor.
> 
> Agreed. GNU libtextstyle
> (https://www.gnu.org/software/gettext/libtextstyle/manual/libtextstyle.html)
> is a much more portable way to do colored output where it becomes easy to
> enable/disable or even adjust the colors to user preferences.  Sadly, it is
> GPLv3+, and thus unusable for qemu.  But the bare minimum that you must
> have when making colored output gated on whether stdout is a
> terminal (that is, any program that does color should have a
> --color=off|auto|on command-line option, and that in turn implies
> function calls rather than macros to properly encapsulate the decision
> logic.

Not sure if it would make sense adding another dependency just for colour 
support in QEMU anyway, because rendering the right output sequence is not the 
big issue, nor auto detecting tty colour support, nor handling user configs. A 
large number of apps already do that in-tree / inline.

The challenge in QEMU though (in contrast to stand-alone apps) is integrating 
this meaningful for all the (quite different) output channels in QEMU, e.g. 
host logs, test case output, different modes, etc., while catching misusage 
and retaining a simple API.

I postpone the colour issue for that reason and drop colour from these patches 
for now. I'll probably rather come up with a dedicated series attempt just for 
colour at some later point.

Best regards,
Christian Schoenebeck



