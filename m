Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53A4D61C6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 13:51:36 +0100 (CET)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSek2-0003hf-SW
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 07:51:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nSeey-0001WG-4h
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 07:46:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nSeeu-0005Oc-JT
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 07:46:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647002775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=laKojkpIyQ0VHsN6aDdj17w9V67ADMCuESGn1QVTAgI=;
 b=IWidhDpjMmfdIo97qRwWTEU9QJ5hyY5acXQH+gGlfCA+UOckk1YjVvFIe6gaEy08A5OcvF
 F8gvohRh6am/OY1AQh/SLxq4PG0yPnN0LwLZP23I8F/LEiq2Mg0qBsXYKwyH3mELVpsLje
 sWdVDrsERdtSRpOuMMY1vTIVd/BlKQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-IXMIJ8yhP8-Z5BhKMpN0hQ-1; Fri, 11 Mar 2022 07:46:11 -0500
X-MC-Unique: IXMIJ8yhP8-Z5BhKMpN0hQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A28F11854E3D;
 Fri, 11 Mar 2022 12:46:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E77926DF0;
 Fri, 11 Mar 2022 12:46:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BEDE321E6A00; Fri, 11 Mar 2022 13:46:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] ui/cocoa: add option to disable left-command
 forwarding to guest
References: <20220102174153.70043-1-carwynellis@gmail.com>
 <20220102174153.70043-2-carwynellis@gmail.com>
 <CAFEAcA9VDAOJf22RkF5nkKKcvDXWoJ=YmEKY13N_GULkZAwb-Q@mail.gmail.com>
 <a32bb6e3-f7ea-b736-f5c5-95fbbd067a4d@amsat.org>
Date: Fri, 11 Mar 2022 13:46:08 +0100
In-Reply-To: <a32bb6e3-f7ea-b736-f5c5-95fbbd067a4d@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 18 Feb 2022 21:21:27
 +0100")
Message-ID: <87sfro7j3j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 18/2/22 19:55, Peter Maydell wrote:
>> On Sun, 2 Jan 2022 at 17:42, Carwyn Ellis <carwynellis@gmail.com> wrote:
>>>
>>> When switching between guest and host on a Mac using command-tab the
>>> command key is sent to the guest which can trigger functionality in the
>>> guest OS. Specifying left-command-key=3Doff disables forwarding this ke=
y
>>> to the guest. Defaults to enabled.
>>>
>>> Also updated the cocoa display documentation to reference the new
>>> left-command-key option along with the existing show-cursor option.
>>>
>>> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
>> Ccing the QAPI folks for review on the QAPI parts of this.
>> -- PMM
>>=20
>>> ---
>>>   qapi/ui.json    | 17 +++++++++++++++++
>>>   qemu-options.hx | 12 ++++++++++++
>>>   ui/cocoa.m      |  8 +++++++-
>>>   3 files changed, 36 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>> index 2b4371da37..764480e145 100644
>>> --- a/qapi/ui.json
>>> +++ b/qapi/ui.json
>>> @@ -1107,6 +1107,22 @@
>>>     'data'    : { '*grab-on-hover' : 'bool',
>>>                   '*zoom-to-fit'   : 'bool'  } }
>>>
>>> +##
>>> +# @DisplayCocoa:
>>> +#
>>> +# Cocoa display options.
>>> +#
>>> +# @left-command-key: Enable/disable forwarding of left command key to
>>> +#                    guest. Allows command-tab window switching on the
>>> +#                    host without sending this key to the guest when
>>> +#                    "off". Defaults to "on"
>>> +#
>>> +# Since: 6.2.50
>
> Not a QAPI folk, but LGTM using 7.0 here instead of 6.2.50 (this the
> number of the *released* QEMU version which contains this new type).

Yes.

>>> +#
>>> +##
>>> +{ 'struct'  : 'DisplayCocoa',
>>> +  'data'    : { '*left-command-key' : 'bool' } }
>>> +
>>>   ##
>>>   # @DisplayEGLHeadless:
>>>   #
>>> @@ -1254,6 +1270,7 @@
>>>     'discriminator' : 'type',
>>>     'data'    : {
>>>         'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
>>> +      'cocoa': { 'type': 'DisplayCocoa', 'if': 'CONFIG_COCOA' },
>>>         'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
>>>         'egl-headless': { 'type': 'DisplayEGLHeadless',
>>>                           'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'=
] } },
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index fd1f8135fb..6fa9c38c83 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -1912,6 +1912,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>>>   #if defined(CONFIG_DBUS_DISPLAY)
>>>       "-display dbus[,addr=3D<dbusaddr>]\n"
>>>       "             [,gl=3Don|core|es|off][,rendernode=3D<file>]\n"
>>> +#endif
>>> +#if defined(CONFIG_COCOA)
>>> +    "-display cocoa[,show-cursor=3Don|off][,left-command-key=3Don|off]=
\n"
>>>   #endif
>>>       "-display none\n"
>>>       "                select display backend type\n"
>>> @@ -1999,6 +2002,15 @@ SRST
>>>           ``charset=3DCP850`` for IBM CP850 encoding. The default is
>>>           ``CP437``.
>>>
>>> +    ``cocoa``
>>> +        Display video output in a Cocoa window. Mac only. This interfa=
ce
>>> +        provides drop-down menus and other UI elements to configure an=
d
>>> +        control the VM during runtime. Valid parameters are:
>>> +
>>> +        ``show-cursor=3Don|off`` :  Force showing the mouse cursor
>>> +
>>> +        ``left-command-key=3Don|off`` : Disable forwarding left comman=
d key to host
>>> +
>>>       ``egl-headless[,rendernode=3D<file>]``
>>>           Offload all OpenGL operations to a local DRI device. For any
>>>           graphical display, this display needs to be paired with eithe=
r

In the QAPI schema, @full-screen, @window-close and @show-cursor are
common to all display types.  Here, @full-screen is only documented with
gtk, @window-close with gtk and sdl, @show-cursor with gtk, sdl and now
cocoa.

What's going on here?

[...]


