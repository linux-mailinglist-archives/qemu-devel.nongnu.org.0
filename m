Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F645EB34D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:41:05 +0200 (CEST)
Received: from localhost ([::1]:48158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvqa-0001ty-33
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1ocvmz-0004bB-G2
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:37:21 -0400
Received: from outgoing-exchange-1.mit.edu ([18.9.28.15]:37066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1ocvmt-0005WX-4U
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:37:19 -0400
Received: from w92exedge4.exchange.mit.edu (W92EXEDGE4.EXCHANGE.MIT.EDU
 [18.7.73.16])
 by outgoing-exchange-1.mit.edu (8.14.7/8.12.4) with ESMTP id 28QLavgf023725;
 Mon, 26 Sep 2022 17:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1664228221; bh=71VXkaDm416HJL78llN1qBVk1lq/zcCRvFe8WoxW8+I=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=GPvy+3x86ns5ig2t6swnOeVlK/OB4+Kvfy2AODStksyB3qMv97dgxsSGnuRVxvvRY
 mxJA7w0YmLoEwTMqByjRHWvB2y03b6bBWLWt0+kK0PNeWnkBQ3zNhuOXVTxiWvx8fP
 lYNTbP8VhPCcA4AiNBWH0+6dvownzF6Jefn1hFXtIf3Cno3Jrxdx62kllbBtVWFzcB
 2Leh2cb979zaGV7r/nw9t6Cq6g/ErpS7Cl5fB1O5c0IiqpMZOgJ+r4K3CrIAoy1Bl0
 jzheLFUtlHvMjfE9bp6QwAGDsmOWgAa0/WGXvl8Bvz/Ge3J/Zs5oeVCxH0EeLtoLFF
 Gd0nN7nDUOF6g==
Received: from w92expo31.exchange.mit.edu (18.7.74.43) by
 w92exedge4.exchange.mit.edu (18.7.73.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.38; Mon, 26 Sep 2022 17:36:36 -0400
Received: from oc11expo31.exchange.mit.edu (18.9.4.104) by
 w92expo31.exchange.mit.edu (18.7.74.43) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 26 Sep 2022 17:36:58 -0400
Received: from oc11expo31.exchange.mit.edu ([18.9.4.104]) by
 oc11expo31.exchange.mit.edu ([18.9.4.104]) with mapi id 15.00.1497.023; Mon,
 26 Sep 2022 17:36:58 -0400
From: "Andrew S. Fasano" <fasano@mit.edu>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "erdnaxe@crans.org"
 <erdnaxe@crans.org>, "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: Re: [RFC 0/4] Support interactions between TCG plugins
Thread-Topic: [RFC 0/4] Support interactions between TCG plugins
Thread-Index: AQHYvjCnClHhn38j+UqgluqIUODjW63qLbEAgAg1sEQ=
Date: Mon, 26 Sep 2022 21:36:58 +0000
Message-ID: <1664228218201.45704@mit.edu>
References: <20220901182734.2987337-1-fasano@mit.edu>,
 <87illg7rvr.fsf@linaro.org>
In-Reply-To: <87illg7rvr.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [129.55.200.20]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=18.9.28.15; envelope-from=fasano@mit.edu;
 helo=outgoing-exchange-1.mit.edu
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Benn=E9e <alex.bennee@linaro.org>=0A=
> Andrew Fasano <fasano@mit.edu> writes:=0A=
> =0A=
> > Hello,=0A=
> >=0A=
> > I'm requesting comments on the following series of patches expanding th=
e=0A=
> > TCG plugin system to add the "QEMU Plugin-to-Plugin (QPP)" interface=0A=
> > that allows for interactions between TCG plugins. The goal of this=0A=
> > interface is to enable plugins to expand on other plugins and reduce=0A=
> > code duplication. This patch series includes documentation and=0A=
> > significant comments, but a high-level summary is below along with a=0A=
> > discussion of the current implementation as well as the benefits and=0A=
> > drawbacks of these changes.=0A=
> =0A=
> Thanks for a very detailed cover letter. My initial thoughts are if we=0A=
> are trying to reduce code duplication what about simply using a library=
=0A=
> and linking it to the final plugin. I guess it depends on how=0A=
> computational effort has been spent in calculating a particular piece of=
=0A=
> state and if that is avoided by having this IPC mechanism instead of=0A=
> just repeating the calculation.=0A=
=0A=
Thanks for the detailed feedback Alex, I think I understand and agree with =
the=0A=
changes you've suggested. I'll work on those over the next couple weeks and=
=0A=
send along patches (or another RFC, let me know what you prefer) when they'=
re=0A=
ready. And perhaps some follow up questions that come up along the way.=0A=
=0A=
> =0A=
> > **Summary**=0A=
> >=0A=
> > The QPP interface allows two types of interactions between plugins:=0A=
> >=0A=
> > 1) Exported functions: A plugin may wish to allow other plugins to call=
=0A=
> > one of the functions it has defined. To do this, the plugin must mark=
=0A=
> > the function definition as publicly visible with the QEMU_PLUGIN_EXPORT=
=0A=
> > macro and place a definition in an included header file using the=0A=
> > QPP_FUN_PROTOTYPE macro. Other plugins can then include this header and=
=0A=
> > call the exported function by combining the name of the target plugin=
=0A=
> > with the name of the exported function.=0A=
> >=0A=
> > For example, consider a hypothetical plugin that collects a list of=0A=
> > cache misses. This plugin could export two functions using the QPP=0A=
> > interface: one to allow another plugin to query this list and another=
=0A=
> > to empty the list. This would enable the development of another plugin=
=0A=
> > that examines guest CPU state to identify process changes and reports=
=0A=
> > the cache misses per process. With the QPP interface, this second plugi=
n=0A=
> > would not need to duplicate any logic from the first.=0A=
> =0A=
> Thinking of this concrete example I guess the process change detection=0A=
> is a fairly expensive operation that might be tuned to a particular=0A=
> architecture? Is this something Panda currently derives from plugins=0A=
> instead of the core QEMU code?=0A=
=0A=
Process change detection can be somewhat complex. PANDA has a callback in=
=0A=
the core emulation code named on_asid_changed that fires whenever the addre=
ss=0A=
space layout identifier (ASID) is changed in the CPUState. This fires on mo=
st=0A=
process changes for some architectures (x86), but this sort of event is too=
=0A=
low-level to always be correct and varies by architecture.=0A=
=0A=
To provide accurate detection of when processes change, we have a PANDA plu=
gin=0A=
for operating system introspection which, when given details of the guest O=
S,=0A=
can provide a callback on the process change as well as some APIs for query=
ing=0A=
details about running processes in the guest. This callback and these APIs=
=0A=
are exposed to other plugins through our inter-plugin interface.=0A=
=0A=
> =0A=
> > 2) Callbacks: Multiple plugins may wish to take some action when some=
=0A=
> > event of interest occurs inside a running guest. To support modularity=
=0A=
> > and reduce code duplication, the QPP callback system allows this logic=
=0A=
> > to be contained in single plugin that detects whenever a given event=0A=
> > occurs and exposes a callback with a given name. Another plugin can the=
n=0A=
> > request to have one of its own functions run whenever this event occurs=
.=0A=
> > Additional plugins could also use this same callback to run additional=
=0A=
> > logic whenever this event occurs.=0A=
> >=0A=
> > For example, consider (again) a hypothetical plugin that detects when=
=0A=
> > the current guest process changes by analyzing the guest CPU state. Thi=
s=0A=
> > plugin could define a callback named "on_process_change" and trigger=0A=
> > this callback event whenever it detects a process change. Other plugins=
=0A=
> > could then be developed that take various actions on process changes by=
=0A=
> > registering internal functions to run on this event.=0A=
> >=0A=
> > These patches and examples are inspired by the PANDA project=0A=
> > (https://panda.re and https://github.com/panda-re/panda), a fork of QEM=
U=0A=
> > modified to support dynamic program analysis and reverse engineering.=
=0A=
> > PANDA also includes a large plugin system with a similar interface for=
=0A=
> > interactions between plugins. I'm one of the maintainers of PANDA=0A=
> > and have seen how the ability for plugins to interact with=0A=
> > other plugins reduces code duplication and enables the creation of many=
=0A=
> > useful plugins.=0A=
> =0A=
> Would another use-case be to export the PANDA APIs so you could use the=
=0A=
> existing plugins on an upstream QEMU?=0A=
> =0A=
=0A=
PANDA was designed and built by a bunch of researchers who wanted to quickl=
y=0A=
get their research done (myself included). I think the design of its APIs=
=0A=
reflect this and aren't up to par with the code quality expected in QEMU. I=
n=0A=
particular, the PANDA APIs directly expose the CPUState to plugins=0A=
and allow them to read and write any fields in it. This means PANDA plugins=
=0A=
are only compatible with the version of the emulator they are designed and=
=0A=
built against.=0A=
=0A=
Although the QEMU plugin interface is smaller than the one provided by PAND=
A,=0A=
I think the QEMU design is much better. I'd be happy to help expand=0A=
the callbacks and APIs available to QEMU plugins to get to a point=0A=
where we can port some PANDA plugins to be in-tree QEMU plugins. I suspect=
=0A=
only a small subset (maybe about 15) of the ~45 PANDA plugins we have would=
 be=0A=
worth merging, but it would depend on the types of plugins you'd want in-tr=
ee,=0A=
if they needed to work for all QEMU-supported architectures, and if plugins=
=0A=
would be allowed to modify guest state.=0A=
=0A=
If anyone is interested, the full list of PANDA plugins and their source co=
de=0A=
can be found in our repository at=0A=
https://github.com/panda-re/panda/tree/dev/panda/plugins/.=0A=
If any of these seem particularly interesting, I'd be happy to figure out=
=0A=
what (if any) new APIs they'd require, help build those APIs in QEMU, and t=
hen=0A=
change the plugin and try to get it merged into QEMU. I will point out=0A=
that some of them are built atop non-trivial emulation changes that would=
=0A=
likely not be wanted here (such as using LLVM IR instead of TCG to support=
=0A=
dynamic taint analysis).=0A=
=0A=
> > **Implementation Overview**=0A=
[snip]=0A=
> While having an example plugin for debugging is useful I think having a=
=0A=
> more useful in-tree use-case is going to be important to justify the=0A=
> merging of a quite large API into the code base.=0A=
=0A=
This sounds good to me, but I worry that QEMU plugins aren't (yet) able to=
=0A=
access enough information to build analyses complex enough to really=0A=
demonstrate the value of this type of interface. If plugins were able=0A=
to read guest registers, I could easily throw together a more powerful exam=
ple=0A=
set of plugins such as the syscalls identification and logging plugins=0A=
described in my original message below.=0A=
=0A=
Perhaps this is an argument for holding off on finalizing the details of=0A=
inter-plugin interactions until the core QEMU plugin interface is a bit=0A=
larger? I'd be okay with that as your response here shows that you're open =
to=0A=
the idea of allowing plugins to interact with other plugins which I see=0A=
as a key feature for building complex analyses in this interface. Knowing=
=0A=
that this is coming in the future (i.e., that the analyses I'm interested i=
n=0A=
doing will eventually be possible with QEMU plugins) means I'd be willing t=
o=0A=
contribute to other parts of the plugin interface before then.=0A=
=0A=
> > **Request for Comments**=0A=
[snip]=0A=
=0A=
> I'm certainly keen to get more plugins merged into the tree. I'm aware=0A=
> there are some gaps in the plugin API at the moment. The most pressing=0A=
> one is getting access to register values which requires some=0A=
> re-factoring of the core code. I have very incomplete WIP branch while I=
=0A=
> consider the API (not wired to plugins yet):=0A=
> =0A=
>   https://gitlab.com/stsquad/qemu/-/tree/introspection/registers=0A=
> =0A=
=0A=
I'm really glad to see you're trying to expose that information to plugins,=
=0A=
it's definitely a blocker for many analyses! I had tried out a different=0A=
implementation of this using the gdb_read_register functions. I don't=0A=
particularly like the code I wrote and it was painful to use, but it=0A=
was quite short and didn't require changes outside of the plugin code.=0A=
On the off chance that there's something useful in it, you can see the code=
 at=0A=
    https://github.com/AndrewFasano/futurepanda/commit/1c46cc89bf3e825f559a=
70ccb84b4f034cd2490b=0A=
=0A=
=0A=
=0A=
> > I see a handful of potential issues that I'll highlight below:=0A=
> > 1) Unstable APIs: these inter-plugin interactions do not specify API=0A=
> >    versions. If the behavior of a callback or exported function=0A=
> >    changes without the type signature changing, it may lead to subtle=
=0A=
> >    errors in other (unchanged) plugins that were using these functions.=
=0A=
> >=0A=
> >    If the signature of a plugin's callback or exported function,=0A=
> >    changes, build time errors would be raised and necessary=0A=
> >    changes could be made to in-tree plugins. However, out-of-tree=0A=
> >    plugins would break.=0A=
> =0A=
> I'm not overly concerned about out-of-tree plugins for the time being as=
=0A=
> long as we keep the in-tree examples tested and working. That said we do=
=0A=
> implement an API versioning scheme for the core plugin API. Maybe=0A=
> something similar can be done for plugin APIs?=0A=
=0A=
Glad to hear that. I'll consider this as I think about the changes you've=
=0A=
suggested in the code.=0A=
=0A=
[snip]=0A=
> > 3) Decentralized interactions. This approach allows plugins to directly=
=0A=
> >    interact with other plugins. An alternative design could register=0A=
> >    exported functions and callbacks with the core plugin logic in=0A=
> >    the main QEMU object and have all the interactions go through there.=
=0A=
> >    Would a centralized design where plugins send requests through=0A=
> >    the core plugin logic in the QEMU binary be better that allowing=0A=
> >    direct interactions between the shared objects built for the=0A=
> >    plugins?=0A=
> =0A=
> I shall see when I read the code but it does make me wander if we are=0A=
> just implementing a dynamic linker by another name. Maybe something like=
=0A=
> the callback/event system would be better marshalled by QEMU itself? I=0A=
> wonder if the dlload mechanism could just automatically make all=0A=
> non-static plugin functions exportable and then just complain if we get=
=0A=
> a clash or missing symbol when it is loaded?=0A=
> =0A=
=0A=
I think I'm coming around to the idea that this is a better approach. I'll=
=0A=
go in more details in response to your feedback on the code.=0A=
=0A=
=0A=
> > Does it seem like an interface like this would be worth merging? If so,=
=0A=
> > I'd welcome any and all suggestions on how to improve these changes.=0A=
> =0A=
> I'm certainly open to it but I do think we will need some more concrete=
=0A=
> examples using such an API before we could consider merging it. I don't=
=0A=
> want to merge something that would only be used by out-of-tree plugins=0A=
> because it would impose a maintenance burden for no project gain.=0A=
=0A=
I'm more than happy to build some plugins that use these APIs. My goal here=
=0A=
is to move as much code as would be welcome into QEMU. Just wanted to figur=
e=0A=
out these APIs before writing plugins that use them. In the future when=0A=
we've figured out more details of this API, I'll be sure to include some=0A=
additional plugins with the patch.=0A=
=0A=
If there's any documentation or prior discussion about what types of plugin=
s=0A=
are wanted in QEMU, I'd appreciate it if someone could share that. I assume=
=0A=
you don't want a full platform for dynamic program analysis to live in tree=
=0A=
and require maintenance for obscure features that are rarely used. But if=
=0A=
you're interested in things that might be useful for a reasonable fraction =
of=0A=
the users who build QEMU with plugins enabled, I think there's a lot of=0A=
valuable capabilities that could be ported over from PANDA.=0A=
=0A=
Thanks so much for the reply and for your review of the code,=0A=
Andrew=0A=
=0A=
> =0A=
> >=0A=
> > Thank you,=0A=
> > Andrew Fasano=0A=
> >=0A=
> > Andrew Fasano (4):=0A=
> >   docs/tcg-plugins: describe QPP API=0A=
> >   tcg/plugins: Automatically define CURRENT_PLUGIN=0A=
> >   tcg/plugins: Support for inter-plugin interactions=0A=
> >   tcg/plugins: Add example pair of QPP plugins=0A=
> >=0A=
> >  contrib/plugins/Makefile     |   4 +-=0A=
> >  contrib/plugins/qpp_client.c |  42 ++++++=0A=
> >  contrib/plugins/qpp_client.h |   1 +=0A=
> >  contrib/plugins/qpp_srv.c    |  33 +++++=0A=
> >  contrib/plugins/qpp_srv.h    |  17 +++=0A=
> >  docs/devel/tcg-plugins.rst   |  76 +++++++++++=0A=
> >  include/qemu/plugin-qpp.h    | 252 +++++++++++++++++++++++++++++++++++=
=0A=
> >  plugins/core.c               |  11 ++=0A=
> >  plugins/loader.c             |  24 ++++=0A=
> >  plugins/plugin.h             |   5 +=0A=
> >  plugins/qemu-plugins.symbols |   1 +=0A=
> >  11 files changed, 465 insertions(+), 1 deletion(-)=0A=
> >  create mode 100644 contrib/plugins/qpp_client.c=0A=
> >  create mode 100644 contrib/plugins/qpp_client.h=0A=
> >  create mode 100644 contrib/plugins/qpp_srv.c=0A=
> >  create mode 100644 contrib/plugins/qpp_srv.h=0A=
> >  create mode 100644 include/qemu/plugin-qpp.h=0A=
> =0A=
> =0A=
> --=0A=
> Alex Benn=E9e=0A=
> =

