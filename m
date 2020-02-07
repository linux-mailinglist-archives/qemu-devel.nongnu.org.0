Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F12A1557F1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 13:44:07 +0100 (CET)
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j02zO-0004MD-Eu
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 07:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48691)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j02yb-0003nX-Mk
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:43:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j02yZ-0004SS-QG
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:43:17 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42001)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j02yZ-0004Pn-IA
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:43:15 -0500
Received: by mail-ot1-x342.google.com with SMTP id 66so1989836otd.9
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 04:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dT+1//t+1n3J4i4429sXYbdd+bGjv+rVyCphBDzuQrs=;
 b=kjmYjdRbK9jNDBRh440cc+AW/RMwqfHNW4JFQvPIbGIhstuKa6/voYsgw4BYaGpKyG
 rvhISuxLYpQ07Mo+/vCVbTtPFkP3k+rJj32c2JMofo56ASlbdRCOMLjsCZmzJe5sk01M
 KjIWCjXEfEk6sWPE6bZOM5KqiLzFasYK/6uBuQ9HZZeYz/uQKIWqt6t97pmqykMKrDX0
 JZoNewaD1xSrkrRb/Gz2DAjBq//BfXalPMgrC9j0ft5FWjqeM8HNYf2xizy/qUtjxkRP
 CnwQbmfoW5IKrthVorQwB2evXRYCUENHqyI4Szb/v0uZfKktTiPOrgDWUtOZN4Z3kTbi
 5HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dT+1//t+1n3J4i4429sXYbdd+bGjv+rVyCphBDzuQrs=;
 b=uQFFVYHhBj67kTTlsSDvM1jhP1J31RP8uHREVvBgEgg93JJ7AiO9IbYwsGp78pSJOt
 jsv6tg2pHPTpvOv0uX+kIH2qE+LQrO+ogds7WAdKirmgUYJBNR9IjQYjX1FbavQwsvPJ
 jPgYaJ1mjju7ws6PrHTlVibBuXVinXZa+EwGFcpmbEeDChuP+RVVt/XFAk50xkk1mmBU
 XRRjmHB3F/Luk75hrIo8nRpawWbm7I6WY/iFs952sj2hL8J649IqgC2Pku7QIP8dIvg8
 MyLevRfG8KMKliVVnrLLnXedSD6TUEopFBVnveHgWyLdTKDhx/SDq679LsGbBYTgIW2H
 1l6w==
X-Gm-Message-State: APjAAAWTsha8xg/Z/t/CadOqZuLgmBqzMtUupORzumERlFMQUDKgrzlL
 rZMmGSawoWY9NiRb/uj3I//vBRDQTQ1Slr/oL3WNsA==
X-Google-Smtp-Source: APXvYqy/EOvdNqNGUibG1La5Pt46RD46pTdRltUnj0NZsPxDimTiUb+lNTrkNMlgVU2W1AM/irOU6lk9ngxmMiQE4X0=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr2613753ota.232.1581079394464; 
 Fri, 07 Feb 2020 04:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20200128180142.15132-1-cohuck@redhat.com>
 <20200128180142.15132-3-cohuck@redhat.com>
In-Reply-To: <20200128180142.15132-3-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2020 12:43:03 +0000
Message-ID: <CAFEAcA9wM4r=OfLnREQOQAcqOEdSr3=bHsjoO9mvn4VogMhQLw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] docs: rstfy vfio-ap documentation
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>,
 "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Jan 2020 at 19:39, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Move to system/, as this is mostly about configuring vfio-ap.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

> diff --git a/docs/vfio-ap.txt b/docs/system/vfio-ap.rst
> similarity index 56%
> rename from docs/vfio-ap.txt
> rename to docs/system/vfio-ap.rst
> index b1eb2deeaf2f..c8c5728e0aaa 100644
> --- a/docs/vfio-ap.txt
> +++ b/docs/system/vfio-ap.rst
> @@ -1,17 +1,17 @@
>  Adjunct Processor (AP) Device
>  =============================
>
> -Contents:
> -=========
> -* Introduction
> -* AP Architectural Overview
> -* Start Interpretive Execution (SIE) Instruction
> -* AP Matrix Configuration on Linux Host
> -* Starting a Linux Guest Configured with an AP Matrix
> -* Example: Configure AP Matrices for Three Linux Guests
> -> -Introduction:
> -============
> +Contents
> +--------
> +* `Introduction`_
> +* `AP Architectural Overview`_
> +* `Start Interpretive Execution (SIE) Instruction`_
> +* `AP Matrix Configuration on Linux Host`_
> +* `Starting a Linux Guest Configured with an AP Matrix`_
> +* `Example: Configure AP Matrices for Three Linux Guests`_
> +

You don't need to manually write out a table of contents. You
can just have one line

.. contents::

and Sphinx will produce an autogenerated table of contents
(including a 'Contents' title) for you.

https://docutils.sourceforge.io/docs/ref/rst/directives.html#table-of-contents

An example where we already use this is
docs/interop/live-block-operations.rst:
https://www.qemu.org/docs/master/interop/live-block-operations.html


> +Introduction
> +------------

rST doesn't require it, but I'd recommend a blank line below
the ---- line; I think it makes the source more readable.

>  The IBM Adjunct Processor (AP) Cryptographic Facility is comprised
>  of three AP instructions and from 1 to 256 PCIe cryptographic adapter cards.
>  These AP devices provide cryptographic functions to all CPUs assigned to a
> @@ -21,8 +21,8 @@ On s390x, AP adapter cards are exposed via the AP bus. This document
>  describes how those cards may be made available to KVM guests using the
>  VFIO mediated device framework.
>
> -AP Architectural Overview:
> -=========================
> +AP Architectural Overview
> +-------------------------
>  In order understand the terminology used in the rest of this document, let's
>  start with some definitions:
>
> @@ -75,7 +75,7 @@ start with some definitions:
>    must be one of the control domains.
>
>  Start Interpretive Execution (SIE) Instruction
> -==============================================
> +----------------------------------------------
>  A KVM guest is started by executing the Start Interpretive Execution (SIE)
>  instruction. The SIE state description is a control block that contains the
>  state information for a KVM guest and is supplied as input to the SIE
> @@ -114,246 +114,254 @@ The APQNs can provide secure key functionality - i.e., a private key is stored
>  on the adapter card for each of its domains - so each APQN must be assigned to
>  at most one guest or the linux host.
>
> -   Example 1: Valid configuration:
> -   ------------------------------
> -   Guest1: adapters 1,2  domains 5,6
> -   Guest2: adapter  1,2  domain 7
> +Example 1: Valid configuration
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Guest1: adapters 1,2  domains 5,6
> +Guest2: adapter  1,2  domain 7

These don't render correctly -- rST thinks the "Example 1..." line
is a subsection heading because of the underlining, and then renders
the next two lines as runon-text:
"Guest1: adapters 1,2 domains 5,6 Guest2: adapter 1,2 domain 7"

Depending on what you want, you could try one of:
 * use a literal block (which gets you fixed-width font, preserved
   whitespace and linebreaks)
 * use a bulleted list
 * use one of rST's table formats

(is it deliberate that line 1 is "adapters" and line 2 is "adapter" ?)

> -   This is valid because both guests have a unique set of APQNs: Guest1 has
> -   APQNs (1,5), (1,6), (2,5) and (2,6); Guest2 has APQNs (1,7) and (2,7).
> +This is valid because both guests have a unique set of APQNs: Guest1 has
> +APQNs (1,5), (1,6), (2,5) and (2,6); Guest2 has APQNs (1,7) and (2,7).
>
> -   Example 2: Valid configuration:
> -   ------------------------------
> -   Guest1: adapters 1,2 domains 5,6
> -   Guest2: adapters 3,4 domains 5,6
> +Example 2: Valid configuration
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Guest1: adapters 1,2 domains 5,6
> +Guest2: adapters 3,4 domains 5,6
>
> -   This is also valid because both guests have a unique set of APQNs:
> -      Guest1 has APQNs (1,5), (1,6), (2,5), (2,6);
> -      Guest2 has APQNs (3,5), (3,6), (4,5), (4,6)
> +This is also valid because both guests have a unique set of APQNs:
> +   Guest1 has APQNs (1,5), (1,6), (2,5), (2,6);
> +   Guest2 has APQNs (3,5), (3,6), (4,5), (4,6)

This is differently rendered from the equivalent text in example 1,
because of the indent -- rST treats the 2 indented lines as a block
quote, and indents them in the output, but flows the text into
one long line.

I think personally I'd opt to render like this:

This is also valid because both guests have a unique set of APQNs:

* Guest1 has APQNs (1,5), (1,6), (2,5), (2,6)
* Guest2 has APQNs (3,5), (3,6), (4,5), (4,6)

(ie a bulleted list); but anyway consistency between the examples
would be good.

>
> -   Example 3: Invalid configuration:
> -   --------------------------------
> -   Guest1: adapters 1,2  domains 5,6
> -   Guest2: adapter  1    domains 6,7
> +Example 3: Invalid configuration
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Guest1: adapters 1,2  domains 5,6
> +Guest2: adapter  1    domains 6,7
>
> -   This is an invalid configuration because both guests have access to
> -   APQN (1,6).
> +This is an invalid configuration because both guests have access to
> +APQN (1,6).

> -      * Individual bits in the mask can be switched on and off by specifying
> -        each bit number to be switched in a comma separated list. Each bit
> -        number string must be prepended with a ('+') or minus ('-') to indicate
> -        the corresponding bit is to be switched on ('+') or off ('-'). Some
> -        valid values are:
> +    * Individual bits in the mask can be switched on and off by specifying
> +      each bit number to be switched in a comma separated list. Each bit
> +      number string must be prepended with a ('+') or minus ('-') to indicate
> +      the corresponding bit is to be switched on ('+') or off ('-'). Some
> +      valid values are::
>
>             "+0"    switches bit 0 on
>             "-13"   switches bit 13 off
>             "+0x41" switches bit 65 on
>             "-0xff" switches bit 255 off

Maybe use a definition list here rather than a literal block?

      valid values are:

      ``+0``
          switches bit 0 on
      ``-13``
          switches bit 13 off

etc. The literal block is fine if you think it looks better though.


>
>  assign_adapter

Since these are filenames, you can enclose them in ``  `` and they'll
render as fixed-width text, which I think makes them stand out a
bit better in the HTML. I'm pretty sure this works even in the
term part of a definition list.

Not in this diff, but should the 'No APQN...' para in the assign_domain
docs really be a 2nd para of the preceding bullet point rather than either
its own bullet point or a paragraph outside the bulleted list ?

(ditto for assign_domain)


> @@ -486,20 +494,22 @@ facilities:
>     The AP facilities feature indicates that AP facilities are installed on the
>     guest. This feature will be exposed for use only if the AP facilities
>     are installed on the host system. The feature is s390-specific and is
> -   represented as a parameter of the -cpu option on the QEMU command line:
> +   represented as a parameter of the -cpu option on the QEMU command line::
>
>        qemu-system-s390x -cpu $model,ap=on|off
>
> -      Where:
> +   Where:
>
> -         $model is the CPU model defined for the guest (defaults to the model of
> -                the host system if not specified).
> +      $model

Formatting $model and ap=on|off with `` `` would look nicer I think
(ditto below)

thanks
-- PMM

