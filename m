Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E794BD030
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 18:21:09 +0100 (CET)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLptU-0003VW-7O
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 12:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nLprC-0002nF-BW
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 12:18:48 -0500
Received: from [2001:41c9:1:41f::167] (port=39878
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nLpr4-0004Is-Tq
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 12:18:45 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nLpqV-0009kI-KP; Sun, 20 Feb 2022 17:18:04 +0000
Message-ID: <21104b5a-c895-337c-619d-e880836d5895@ilande.co.uk>
Date: Sun, 20 Feb 2022 17:18:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <YgJWPzFczlDBJV/I@redhat.com>
 <77884339-2f51-1ad0-7461-abd79bb36ef1@ilande.co.uk>
 <YgJmz6neLsF2n2u3@redhat.com>
 <f2114228-2243-2b4f-1869-a50d78a5a8d7@ilande.co.uk>
 <YgJrx2ygQmiF4TYx@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <YgJrx2ygQmiF4TYx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 13:10, Daniel P. Berrangé wrote:

> On Tue, Feb 08, 2022 at 01:06:59PM +0000, Mark Cave-Ayland wrote:
>> On 08/02/2022 12:49, Daniel P. Berrangé wrote:
>>
>>>> I was under the impression that monitor_register_hmp_info_hrt() does all the
>>>> magic here i.e. it declares the underlying QMP command with an x- prefix and
>>>> effectively encapsulates the text field in a way that says "this is an
>>>> unreliable text opaque for humans"?
>>>
>>> The monitor_register_hmp_info_hrt only does the HMP glue side, and
>>> that's only needed if you must dynamically register the HMP command.
>>> For statically registered commands set '.cmd_info_hrt' directly in
>>> the hml-commands-info.hx for the HMP side.
>>>
>>>> If a qapi/ schema is needed could you explain what it should look like for
>>>> this example and where it should go? Looking at the existing .json files I
>>>> can't immediately see one which is the right place for this to live.
>>>
>>> Take a look in qapi/machine.json for anyof the 'x-query-XXXX' commands
>>> there. The QAPI bit is fairly simple.
>>>
>>> if you want to see an illustration of what's different from a previous
>>> pure HMP impl, look at:
>>>
>>>     commit dd98234c059e6bdb05a52998270df6d3d990332e
>>>     Author: Daniel P. Berrangé <berrange@redhat.com>
>>>     Date:   Wed Sep 8 10:35:43 2021 +0100
>>>
>>>       qapi: introduce x-query-roms QMP command
>>
>> I see, thanks for the reference. So qapi/machine.json would be the right
>> place to declare the QMP part even for a specific device?
>>
>> Even this approach still wouldn't work in its current form though, since as
>> mentioned in my previous email it seems that only the target CONFIG_*
>> defines and not the device CONFIG_* defines are present when processing
>> hmp-commands-info.hx.
> 
> Yeah, that's where the pain comes in.  While QAPI schema can be made
> conditional on a few CONFIG_* parameters - basically those derived
> from global configure time options, it is impossible for this to be
> with with target specific options like the device CONFIG_* defines.
> 
> This is why I suggested in my othuer reply that it would need to be
> done with a generic 'info dev-debug' / 'x-query-dev-debug' command
> that can be registered unconditionally, and then individual devices
> plug into it.

After some more experiments this afternoon I still seem to be falling through the 
gaps on this one. This is based upon my understanding that all new HMP commands 
should use a QMP HumanReadableText implementation and the new command should be 
restricted according to target.

Currently I am working with this change to hmp-commands-info.hx and 
qapi/misc-target.json:


diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 7e6bd30395..aac86d5473 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -880,15 +880,15 @@ SRST
      Show intel SGX information.
  ERST

#if defined(TARGET_M68K) || defined(TARGET_PPC)
      {
          .name         = "via",
          .args_type    = "",
          .params       = "",
          .help         = "show guest mos6522 VIA devices",
          .cmd_info_hrt = qmp_x_query_via,
      },
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 4bc45d2474..72bf71888e 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -2,6 +2,8 @@
  # vim: filetype=python
  #

+{ 'include': 'common.json' }
+
  ##
  # @RTC_CHANGE:
  #
@@ -424,3 +426,19 @@
  #
  ##
  { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
+
+##
+# @x-query-via:
+#
+# Query information on the registered mos6522 VIAs
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: internal mos6522 information
+#
+# Since: 7.0
+##
+{ 'command': 'x-query-via',
+  'returns': 'HumanReadableText',
+  'features': [ 'unstable' ], 'if': { 'any': [ 'TARGET_M68K', 'TARGET_PPC' ] } }


The main problem with trying to restrict the new command to a target (or targets) is 
that the autogenerated qapi/qapi-commands-misc-target.h QAPI header cannot be 
included in a device header such as mos6522.h without getting poison errors like 
below (which does actually make sense):


In file included from ./qapi/qapi-commands-misc-target.h:17,
                  from /home/build/src/qemu/git/qemu/include/hw/misc/mos6522.h:35,
                  from ../hw/misc/mos6522.c:30:
./qapi/qapi-types-misc-target.h:19:13: error: attempt to use poisoned "TARGET_ALPHA"


I can work around that by declaring the prototype for qmp_x_query_via() manually i.e.:


diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index 9c21da2ddd..9677293ad0 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -30,7 +30,7 @@
  #include "exec/memory.h"
  #include "hw/sysbus.h"
  #include "hw/input/adb.h"
+#include "qapi/qapi-commands-common.h"
  #include "qom/object.h"

  /* Bits in ACR */
@@ -156,4 +156,6 @@ extern const VMStateDescription vmstate_mos6522;
  uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size);
  void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size);

+HumanReadableText *qmp_x_query_via(Error **errp);
+
  #endif /* MOS6522_H */


This works fine for targets where CONFIG_MOS6522 is defined, but if I try a target 
such as x86_64 where the device isn't used then I hit another compilation error:


qapi/qapi-commands-misc-target.c:598:13: error: 
‘qmp_marshal_output_HumanReadableText’ defined but not used [-Werror=unused-function]
  static void qmp_marshal_output_HumanReadableText(HumanReadableText *ret_in,
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors


Looking at the generated qapi/qapi-commands-misc-target.c file in question I see this:


static void qmp_marshal_output_HumanReadableText(HumanReadableText *ret_in,
                                 QObject **ret_out, Error **errp)
{
     Visitor *v;

     v = qobject_output_visitor_new_qmp(ret_out);
     if (visit_type_HumanReadableText(v, "unused", &ret_in, errp)) {
         visit_complete(v, ret_out);
     }
     visit_free(v);
     v = qapi_dealloc_visitor_new();
     visit_type_HumanReadableText(v, "unused", &ret_in, NULL);
     visit_free(v);
}

#if defined(TARGET_M68K) || defined(TARGET_PPC)
void qmp_marshal_x_query_via(QDict *args, QObject **ret, Error **errp)
{
     ...
     ...
}
#endif

i.e. qmp_marshal_output_HumanReadableText() isn't protected by the #if TARGET guards 
and since HumanReadableText is only used by the new qmp_x_query_via() functionality 
then the compiler complains and aborts the compilation.

Possibly this is an error in the QAPI generator for types hidden behind commands 
using "if"? Otherwise I'm not sure what is the best way to proceed, so I'd be 
grateful for some further pointers.


ATB,

Mark.

